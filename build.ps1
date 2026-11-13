param([switch]$SkipTests, [string]$MavenHome, [string]$JdkHome)
$ErrorActionPreference = 'Stop'

if (-not $JdkHome) { $JdkHome = $env:JAVA_HOME }
if (-not $JdkHome -and (Test-Path -LiteralPath 'C:/Program Files/Java')) {
    $JdkHome = Get-ChildItem -LiteralPath 'C:/Program Files/Java' -Directory -Filter 'jdk-*' |
        Sort-Object Name -Descending | Select-Object -First 1 -ExpandProperty FullName
}
if (-not $JdkHome -or -not (Test-Path -LiteralPath (Join-Path $JdkHome 'bin/javac.exe'))) {
    throw 'Cần JDK 17+; đặt JAVA_HOME hoặc truyền -JdkHome.'
}
if (-not $MavenHome) { $MavenHome = $env:MAVEN_HOME }
if (-not $MavenHome) {
    $mavenCommand = Get-Command mvn.cmd -ErrorAction SilentlyContinue
    if ($mavenCommand) { $MavenHome = Split-Path (Split-Path $mavenCommand.Source -Parent) -Parent }
}
if (-not $MavenHome) {
    $netbeansPath = Join-Path $env:USERPROFILE 'Downloads/App'
    if (Test-Path -LiteralPath $netbeansPath) {
        $netbeans = Get-ChildItem -LiteralPath $netbeansPath -Directory -Filter 'netbeans-*' |
            Sort-Object Name -Descending | Select-Object -First 1
        if ($netbeans) { $MavenHome = Join-Path $netbeans.FullName 'netbeans/java/maven' }
    }
}
if (-not $MavenHome -or -not (Test-Path -LiteralPath (Join-Path $MavenHome 'bin/m2.conf'))) {
    throw 'Cần Maven 3.9+; đặt MAVEN_HOME hoặc truyền -MavenHome.'
}

Push-Location -LiteralPath $PSScriptRoot
try {
    $repository = Join-Path $PSScriptRoot 'target/cached-repository'
    $arguments = @('-B', '-ntp', "-Dmaven.repo.local=$repository", 'package')
    if ($SkipTests) { $arguments += '-DskipTests' }
    & (Join-Path $JdkHome 'bin/java.exe') "-Dmaven.home=$MavenHome" `
        "-Dclassworlds.conf=$MavenHome/bin/m2.conf" "-Dmaven.multiModuleProjectDirectory=$PSScriptRoot" `
        -cp "$MavenHome/boot/*" org.codehaus.plexus.classworlds.launcher.Launcher @arguments
    if ($LASTEXITCODE -ne 0) { throw 'Build hoặc kiểm thử thất bại.' }
} finally {
    Pop-Location
}
