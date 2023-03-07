import-module mdbc
connect-mdbc . ping ips

if(get-module mdbc){
    Write-Host "Type 'addIP to add an IP address or 'showRecords to show all existing IPs"
} else {
    install-module mdbc
    write-host "Installing mdbc module..."
    Write-Host "Type 'addIP to add an IP address or 'showRecords to show all existing IPs"
}
function addIP {
    $ip = Read-Host -Prompt "Please Add IP Address Here"
    $checkIP = get-mdbcdata @{ip = $ip}
    if($checkIP.ip -eq $ip){
        write-host "Record already exists!"
        start-sleep 1
        return
    } else {
        $name = Read-Host -Prompt "Please Add the name of the device here"
        @{ip = $ip; name = $name; date = Get-Date} | add-mdbcdata
        write-host "$ip successfully added!"
        start-sleep 1
        write-host "Please type 'addIP' to add another IP address or 'showRecords' to see what IP addresses are already inputted"
    }
}

function showRecords {
    $getIPs = get-mdbcdata -As PS
    write-host "Here is a list of all the existing IPs inputted and pingable:"
    if($getIPs -eq $null){
        start-sleep 1s
        return write-host "No IPs added! please type 'addIP' to add an IP address"
    } else {
        foreach($ip in $getIPs){
            write-host $ip.name ":" $ip.ip
        }
    }
}

function logs {
    connect-mdbc . ping logs
    $devices = Get-MdbcData -As PS
    foreach($name in $devices){
        write-host $name.name "-" $name.ip "-" $name.status "-" $name.date
    }
}

function log {
    param (
        [Parameter(Mandatory)]
        [string]$device,

        [string]$deviceName
    )
    connect-mdbc . ping logs
    $device = get-mdbcdata @{name = $deviceName}
    write-host $device
}