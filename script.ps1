install-module mdbc
import-module mdbc
connect-mdbc . ping ips
function addIP {
    param (
        [string]$ipPrompt, 
        [string]$namePrompt
    )

    $ip = Read-Host -Prompt $ipPrompt
    $checkIP = get-mdbcdata @{ip = $ip}
    if($checkIP.ip -eq $ip){
        write-host "Record already exists!"
        start-sleep 1
        return
    } else {
        $name = Read-Host -Prompt $namePrompt
        @{ip = $ip; name = $name; date = Get-Date} | add-mdbcdata
        write-host "$ip successfully added! Please type 'addIP' to add another IP address or 'showRecords' to see what IP addresses are already inputted"
    }
}

addIP "Please Add IP Address Here" "Please Add the name of the device here"