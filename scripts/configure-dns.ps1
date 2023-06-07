param 
( 
    [Parameter(Mandatory=$True)][string]$dns_client_dns_server_ip,
    [Parameter(Mandatory=$True)][string]$dns_client_adapter
)

$IP = (Get-NetIPConfiguration -InterfaceAlias $dns_client_adapter).IPv4Address.IPAddress
$Subnet = $IP.split(".")[0] + "." + $IP.split(".")[1] + "." + $IP.split(".")[2]+ "."
$DNSServer = $Subnet + $dns_client_dns_server_ip

netsh interface ipv4 set dnsservers "Ethernet" static $DNSServer