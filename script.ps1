install-module mdbc
import-module mdbc
connect-mdbc . ping ips

function addRecord($ip, $name) {
    $ip = Read-Host -Prompt "Please Type IP Address here"
    $name = Read-Host -Prompt "Please Type the name of the device this IP address relates to"
    action
}

function action {
    $getIP = get-mdbcdata @{ip = $ip}
    if($getIP.ip -eq $ip){
        return write-output "Device Already Exists! Please type 'addRecord' to try again"
    } else {
        @{ip = $ip; name = $name} | add-mdbcdata
        write-output "Device: $name with $ip added Successfully!"
        start-sleep 1
        write-output "Please type 'addRecord' to add another IP Address"
    }
}   

addRecord -ip (action)