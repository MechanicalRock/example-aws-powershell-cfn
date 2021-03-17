Feature: Deploy CloudFormation parameters using PowerShell

References: 
- https://github.com/maishsk/AWSPowerShell.NetCore
- https://devblogs.microsoft.com/scripting/powertip-convert-json-file-to-powershell-object/


Scenario: Deploy CFN parameters from a file using powershell
  Given the parameters file `parameters.json`:
"""
{
  "Param1": "Hello",
  "Param2": "World"
}
"""
  And the CFN template `template.yaml`:
"""
Parameters:
  Param1:
    Type: String
  Param2:
    Type: String
Resources:
    MySNSTopic:
      Type: AWS::SNS::Topic
Outputs:
  Greeting:
    Value: !Sub "${Param1} ${Param2}"
"""
  When I run deploy.ps1
  Then the output "Greeting" should contain "Hello World"