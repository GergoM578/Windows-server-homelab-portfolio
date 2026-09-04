$OutputFile = "C:\Scripts\gMSA-SystemReport.txt"

"gMSA Automated System Report" | Out-File $OutputFile
"Generated: $(Get-Date)" | Out-File $OutputFile -Append
"Computer: $env:COMPUTERNAME" | Out-File $OutputFile -Append
"Running as: $([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)" | Out-File $OutputFile -Append

Get-Service |
    Where-Object Status -eq "Running" |
    Select-Object -First 10 Name, Status |
    Out-File $OutputFile -Append