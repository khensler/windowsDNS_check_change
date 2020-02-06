REM Install putty with pscp.  change to that dir (c:\program files\putty)
REM make a list of all the server ips in c:\temp\list.txt
REM make a resolv.conf file in c:\temp (make sure its unix formated)
REM make sure to set the right user and pass
REM run this from the command prompt.  not powershell.  do not run this as a bat file.  copy and paste it.  
REM make sure to set the DNS1 and DNS2 entries correctly.
REM if you want to run it as a bat file REM  the first line and un REM the next (i think...)

FOR /F %G IN (c:\temp\list.txt) DO echo Y | pscp -l root -pw passw0rd c:\temp\resolv.conf %G:/etc/resolv.conf
FOR /F %G IN (c:\temp\list.txt) DO echo Y | plink %G -l root -pw passw0rd find /etc/sysconfig/network-scripts/ -name "ifcfg-*" -exec sed -i.bak -r 's/DNS1=[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/DNS1=1.2.3.4/' {} \;
FOR /F %G IN (c:\temp\list.txt) DO echo Y | plink %G -l root -pw passw0rd find /etc/sysconfig/network-scripts/ -name "ifcfg-*" -exec sed -i.bak -r 's/DNS2=[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/DNS2=1.2.3.4/' {} \;
REM FOR /F %%G IN (c:\temp\list.txt) DO echo Y | pscp -l root -pw passw0rd c:\temp\resolv.conf %%G:/etc/resolv.conf
