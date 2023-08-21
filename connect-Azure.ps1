# Importing Azure module. Installs the module if it's not installed
$installedAzModules = Get-InstalledModule | Where-Object {$_.Name -like "Az.*"}
if (!$installedAzModules) {
    Install-Module -Name Az -Repository PSGallery -Force 
}
Import-Module -Name Az

# Load envVars
$dotEnv = Join-Path -Path $PSScriptRoot -ChildPath ".env"
Get-Content -Path $dotEnv | ForEach-Object {
    $key, $value = $_.Split('=')
    Set-Item -Path "env:$key" -Value $value
}
# Create credentialSet and establish a connection to Azure
$securePassword = ConvertTo-SecureString -string $env:appSecret -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $env:appId, $securePassword
Connect-AzAccount -ServicePrincipal -TenantId $env:tenantId -Credential $Credential