$CfnOutputs = Get-CFNStack -StackName "powershell-param" -Region 'ap-southeast-2' -Select 'Stacks.Outputs'
if(-not ($CfnOutputs.OutputKey -eq "Greeting") -and -not ($CfnOutputs.OutputValue -eq "Hello World")) {
    # Write-Output $CfnOutputs
    # throw "Unexpected Outputs"
    Write-Output "TEST FAILED!"
  }else{
    Write-Output "TEST PASSED!"
  }