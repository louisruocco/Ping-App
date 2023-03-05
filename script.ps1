install-module mdbc
import-module mdbc
connect-mdbc . ping ips

function addIP {
    $ip = Read-Host -Prompt "Please Type IP Address here"
}