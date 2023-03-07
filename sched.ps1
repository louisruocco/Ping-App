connect-mdbc . ping ips

function runPing {
    $ips = Get-MdbcData
    foreach($ip in $ips.ip){
        Connect-Mdbc . ping logs
        $ping = Test-Connection $ip -count 1 -quiet
        @{ip = $ip; date = Get-Date ; status = $ping} | Add-MdbcData
    }
}

while (1 -eq 1){
    runPing
    start-sleep -seconds 300
}