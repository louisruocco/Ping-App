install-module mdbc
import-module mdbc
connect-mdbc . ping ips
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
        write-host "$ip successfully added! Please type 'addIP' to add another IP address or 'showRecords' to see what IP addresses are already inputted"
    }
}

function showRecord {
    write-host "Here is a list of all the existing IPs inputted and pingable:"
    Get-MdbcData
}

addIP