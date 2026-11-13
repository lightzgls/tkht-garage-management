$ErrorActionPreference = 'Stop'
Push-Location -LiteralPath $PSScriptRoot
try {
    docker compose cp ./src/main/resources/db/sample-data.sql db:/tmp/garage-sample-data.sql
    if ($LASTEXITCODE -ne 0) { throw 'Could not copy sample data. Start Docker and the db service first.' }
    docker compose exec -T db sh -c 'MYSQL_PWD="$MYSQL_PASSWORD" mysql -u"$MYSQL_USER" "$MYSQL_DATABASE" --default-character-set=utf8mb4 < /tmp/garage-sample-data.sql'
    if ($LASTEXITCODE -ne 0) { throw 'Could not load sample data.' }
    Write-Output 'Sample data is ready. Existing records are preserved; repeated runs skip existing codes.'
    Write-Output 'Statistics period: 01/08/2026 - 01/11/2026.'
} finally {
    Pop-Location
}
