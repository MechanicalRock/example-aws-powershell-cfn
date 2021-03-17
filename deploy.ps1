Import-Module AWSPowerShell.NetCore

$Parameters = Get-Content -Raw -Path params.json | ConvertFrom-Json

Write-Output $Parameters

$TemplateBody = Get-Content -Raw template.yaml

# Create
New-CFNStack -StackName "powershell-param" -Parameter $Parameters -Region "ap-southeast-2" -TemplateBody $TemplateBody