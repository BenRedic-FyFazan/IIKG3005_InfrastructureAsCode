$dotEnv = Join-Path -Path $PSScriptRoot -ChildPath ".env"
Get-Content -Path $dotEnv | ForEach-Object {
    $key, $value = $_.Split('=')
    Set-Item -Path "env:$key" -Value $value
}
$securePassword = ConvertTo-SecureString -string $env:appSecret -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $env:appId, $securePassword
Connect-AzAccount -ServicePrincipal -TenantId $env:tenantId -Credential $Credential