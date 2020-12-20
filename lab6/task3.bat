chcp 65001
net start > C:\lab6\services.txt
net stop dnscache
timeout /T 10
net start > C:\lab6\servicesUpdate.txt
fc C:\lab6\services.txt C:\lab6\servicesUpdate.txt > C:\lab6\servicesDiff.txt
net start dnscache
