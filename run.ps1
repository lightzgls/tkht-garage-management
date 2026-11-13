$ErrorActionPreference = 'Stop'
Push-Location -LiteralPath $PSScriptRoot
try {
    docker compose up -d --build
    if ($LASTEXITCODE -ne 0) { throw 'Không thể khởi động. Kiểm tra Docker Desktop đang chạy.' }
    & ./sample-data.ps1
    $port = if ($env:APP_PORT) { $env:APP_PORT } else { '8081' }
    Write-Output "Ứng dụng: http://localhost:$port"
    Write-Output 'Tài khoản demo: xxx / 123456'
} finally {
    Pop-Location
}
