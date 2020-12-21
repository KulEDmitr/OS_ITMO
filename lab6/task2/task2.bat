mkdir C:\temp
echo %computername%

net share
net share temp=C:\temp /grant:Все,full /unlimited /remark:"for os lab6"
net share
net use * \\%computername%\temp

xcopy /z /y C:\Windows\winsxs\msil_ehshell_31bf3856ad364e35_6.1.7601.23403_none_8e30f8ebb8f4b8f0\ehshell.dll \\%computername%\temp

schtasks /create /sc minute /tn task2 /tr C:\scripts\task2_2.exe /et 11:50

::tasklist /fi "imagename eq task2_2.exe" /fi "status eq running"
taskkill /fi "imagename eq task2_2.exe" /fi  "status eq running" /im *

comp C:\Windows\winsxs\msil_ehshell_31bf3856ad364e35_6.1.7601.23403_none_8e30f8ebb8f4b8f0\ehshell.dll \\%computername%\temp\ehshell.dll

xcopy /z /y C:\Windows\winsxs\msil_ehshell_31bf3856ad364e35_6.1.7601.23403_none_8e30f8ebb8f4b8f0\ehshell.dll \\%computername%\temp
comp C:\Windows\winsxs\msil_ehshell_31bf3856ad364e35_6.1.7601.23403_none_8e30f8ebb8f4b8f0\ehshell.dll \\%computername%\temp\ehshell.dll

