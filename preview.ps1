param([int]$Port = 8091, [switch]$SkipBuild, [string]$JdkHome)
$ErrorActionPreference = 'Stop'
Push-Location -LiteralPath $PSScriptRoot
try {
    if (-not $SkipBuild) {
        if ($JdkHome) { & ./build.ps1 -JdkHome $JdkHome } else { & ./build.ps1 }
    }
    $reportPath = 'target/surefire-reports/TEST-vn.edu.garage.GarageWebTest.xml'
    if (-not (Test-Path -LiteralPath $reportPath)) { throw 'Chạy build.ps1 trước khi xem thử.' }
    [xml]$report = Get-Content -LiteralPath $reportPath -Raw
    $classpath = ($report.testsuite.properties.property | Where-Object { $_.name -eq 'java.class.path' }).value
    if (-not $JdkHome) { $JdkHome = $env:JAVA_HOME }
    if (-not $JdkHome) {
        $JdkHome = Get-ChildItem -LiteralPath 'C:/Program Files/Java' -Directory -Filter 'jdk-*' |
            Sort-Object Name -Descending | Select-Object -First 1 -ExpandProperty FullName
    }
    if (-not $JdkHome) { throw 'Cần JDK 17+; đặt JAVA_HOME hoặc truyền -JdkHome.' }
    Write-Output "Xem thử: http://127.0.0.1:$Port/garage/MainUI2.jsp"
    Write-Output 'Dữ liệu H2 tạm thời; tài khoản demo xxx / 123456. Ctrl+C để dừng.'
    & (Join-Path $JdkHome 'bin/java.exe') "-Dpreview.port=$Port" -cp $classpath vn.edu.garage.PreviewServer
    if ($LASTEXITCODE -ne 0) { throw 'Không thể mở bản xem thử.' }
} finally {
    Pop-Location
}
