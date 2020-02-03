REM Install putty with pscp.  change to that dir (c:\program files\putty)
REM make a list of all the server ips in c:\temp\list.txt
REM make a resolv.conf file in c:\temp (make sure its unix formated)
REM make sure to set the right user and pass
REM run this from the command prompt.  not powershell.  do not run this as a bat file.  copy and paste it.  
REM if you want to run it as a bat file REM  the first line and un REM the next (i think...)

FOR /F %G IN (c:\temp\list.txt) DO echo Y | pscp -l root -pw passw0rd c:\temp\resolv.conf %G:/etc/resolv.conf
REM FOR /F %%G IN (c:\temp\list.txt) DO echo Y | pscp -l root -pw passw0rd c:\temp\resolv.conf %%G:/etc/resolv.conf
