$Source = "C:\Users\Administrator\Pictures\Screenshots"
$Destination = "\\VBoxSvr\share" 

$KnownFiles = @{}

Get-ChildItem -Path $Source -Filter "*.png" | ForEach-Object {
    $KnownFiles[$_.FullName] = $true
}

while ($true) {

    Get-ChildItem -Path $Source -Filter "*.png" | ForEach-Object {

        if (-not $KnownFiles.ContainsKey($_.FullName)) {

            $DestinationFile = Join-Path $Destination $_.Name

            Copy-Item $_.FullName -Destination $DestinationFile -Force

            $KnownFiles[$_.FullName] = $true
        }
    }

    Start-Sleep -Seconds 3
}