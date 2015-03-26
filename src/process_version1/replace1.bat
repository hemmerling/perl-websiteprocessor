@echo off
cd %1
rem * MSDOS command
cd
rem * UNIX command
rem pwd
echo %1 %2

set pl=v:\users\public\bat
rem for %%LV_ii IN (*.*) DO echo %1\%LV_ii %2\%LV_ii
for %%LV_ii IN (*.*) DO perl %pl%\replace1.pl -w <%1\%LV_ii >%2\%LV_ii

rem *
rem * END
rem *
