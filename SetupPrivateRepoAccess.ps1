Write-Host ''
Write-Host ''

function Remove-RepositoryConfiguration
{
    param (
        [Object]$RepoDetails
    )
    Write-Host "Remove configuration" -ForegroundColor Magenta
    poetry config ("http-basic." + $RepoDetails.priv_repo_name) --unset
    poetry source remove $RepoDetails.priv_repo_name
    poetry remove $RepoDetails.priv_repo_name
}

function Remove-AddConfiguration
{
    param (
        [Object]$RepoDetails
    )
    Write-Host "Add configuration" -ForegroundColor Magenta
    poetry config ("http-basic." + $RepoDetails.priv_repo_name) ($RepoDetails.priv_repo_user) ($RepoDetails.priv_repo_pwd)
    poetry source add --priority=explicit $RepoDetails.priv_repo_name ("https://github.com/" + $RepoDetails.priv_repo_org + "/" + $RepoDetails.priv_repo_name + ".git")
    poetry add ("git+https://github.com/" + $RepoDetails.priv_repo_org + "/" + $RepoDetails.priv_repo_name + ".git")
}

$dateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Write-Host "=[ START $dateTime ]==========================[ add_private_repo.ps1 ]=" -ForegroundColor Blue

$RepoDetails = [PSCustomObject]@{
    priv_repo_name = "PoetryPrivate"
    priv_repo_user = "__token__"
    priv_repo_pwd = $env:GH_REPO_ACCESS_CURR_USER
    priv_repo_org = "BrightEdgeeServices"
}
Remove-RepositoryConfiguration -RepoDetails $RepoDetails
Remove-AddConfiguration -RepoDetails $RepoDetails

Write-Host '-[ END ]------------------------------------------------------------------------' -ForegroundColor Cyan
Write-Host ''
Write-Host ''
