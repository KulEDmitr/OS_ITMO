mkdir C:\lab6
systeminfo > C:\lab6\systeminfo.txt
wmic os get Caption, FreePhysicalMemory, TotalVisibleMemorySize > C:\lab6\wmicos.txt
wmic logicaldisk get description, name > C:\lab6\wmiclogicaldisk.txt
mkdir C:\lab6\TEST
copy C:\lab6 C:\lab6\TEST
cd C:\lab6\TEST
copy *.* copyfiles.txt
for /f "skip=1 delims=" %%f in ('dir /b /o-d /tc') do del /q %%f