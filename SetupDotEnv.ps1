Write-Host ''
Write-Host ''
$dateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Write-Host "=[ START $dateTime ]============================[ SetupDotEnv.ps1 ]=" -ForegroundColor Blue
$filePath = "./.env"

# Define the contents of the file
$fileContent = @"
INSTALLER_USER_ID=$env:INSTALLER_USER_ID
INSTALLER_USER_PWD=$env:INSTALLER_USER_PWD
MYSQL_DATABASE=$env:MYSQL_DATABASE
MYSQL_HOST=$env:MYSQL_HOST
MYSQL_TCP_PORT=$env:MYSQL_TCP_PORT
PROJECT_DIR=$env:PROJECT_DIR

# SQLALCHEMY_SILENCE_UBER_WARNING=1
# PYTHONUNBUFFERED=1
"@

# Write the contents to the file
Set-Content -Path $filePath -Value $fileContent

# Output a confirmation message
Write-Host "File '$filePath' has been created with the specified contents."
Write-Host '-[ END ]------------------------------------------------------------------------' -ForegroundColor Cyan
Write-Host ''
Write-Host ''
