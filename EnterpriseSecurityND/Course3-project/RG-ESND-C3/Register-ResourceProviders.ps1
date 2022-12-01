# PowerShell script to register resource providers

# Needed only if running the current file from a local Powershell terminal
# Install's and import's the Az Module
# Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
# Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
# Set-PSRepository -Name "PSGallery" -Installationpolicy Trusted
# Install-Module -Name Az -AllowClobber -Scope AllUsers -Force
# Import-Module -Name Az

# Connect-AzAccount

# ToDo for the Student: Enter the subscription ID you want to use
Select-AzSubscription -SubscriptionId "xxxxxxxx-xxxxxxxx-xxxxxxxx-xxxxxxxx"

$rps = Get-AzResourceProvider -ListAvailable | Where-Object { $_.ProviderNamespace -like "microsoft*"}

foreach($rp in $rps)
{
Register-AzResourceProvider -ProviderNamespace $rp.ProviderNamespace
}
