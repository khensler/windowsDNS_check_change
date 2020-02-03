#-------------------------------------------------
#This will get DNS on the interfaces it finds ignoring the loopback interfaces
#change $list parameter to be correct.  Run on machine that has admin access.  Must be domain joined.  Will only work on domain joined machines
#i don't know how long this will take
#-------------------------------------------------


$list = "server1.fqdn","server2.fqdn",....

$Session = New-CimSession -ComputerName $list
Get-DnsClientServerAddress -CimSession $Session -addressfamily ipv4 | where-object {$_.InterfaceAlias -notlike "Loopback*"}


#-------------------------------------------------
#This will set DNS on the interfaces it finds ignoring the loopback interfaces
#change the $newDNS and $list parameters to be correct.  Run on machine that has admin access.  Must be domain joined.  Will only work on domain joined machines
#i don't know how long this will take
#-------------------------------------------------
$newDNS = ("dnsip2","dnsip1")

$list = "server1.fqdn","server2.fqdn",....

$Session = New-CimSession -ComputerName $list
$results = Get-DnsClientServerAddress -CimSession $Session -addressfamily ipv4 | where-object {$_.InterfaceAlias -notlike "Loopback*"}
foreach ($result in $results){
	write-host "Server:      "$result.PSComputerName.toString()
	Write-host "Current DNS: "$result.ServerAddresses
	Write-Host "Interface:   "$result.InterfaceIndex.toString()
	write-host "Setting To:  "$newDNS
	Set-DnsClientServerAddress -interfaceindex $results.InterfaceIndex -serveraddresses $newDNS -CimSession (new-cimsession -computername $result.PSComputerName)
	write-host "--------------------------------"
}


#-------------------------------------------------
#This will set DNS on the interfaces it finds ignoring the loopback interfaces
#change the $newDNS parameter to be correct.  Run as admin on machine
#-------------------------------------------------

$newDNS = ("dnsip2","dnsip1")

$results = Get-DnsClientServerAddress -addressfamily ipv4 | where-object {$_.InterfaceAlias -notlike "Loopback*"}
foreach ($result in $results){
	Write-host "Current DNS: "$result.ServerAddresses
	Write-Host "Interface:   "$result.InterfaceIndex.toString()
	write-host "Setting To:  "$newDNS
	Set-DnsClientServerAddress -interfaceindex $results.InterfaceIndex -serveraddresses $newDNS
	write-host "--------------------------------"
}
