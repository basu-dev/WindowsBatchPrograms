@echo off
Rem set/p programName= Name of Program to run

Rem echo %programName%

Rem set /p today= "%date:~0,3%"
Rem echo %today%
Rem if (%today%=="Thu") (
Rem echo Today is Thursday
Rem )

:day1
Set  task=Study Physics

:day2
Set  task=Study Math

:day3
Set  task=Study Nep
:day4
Set  task=Study Nep
:day5
Set  task=Study What ,Set /p day=Sun
:day6
Set  task=Study The
:day7
Set  task=Its Saturday


@For /F "tokens=2,3,4 delims=/ " %%A in ('Date /t') do @( 
    Set Month=%%A 
    Set Day=%%B
    Set Year=%%C
   
)

if %Day%==01 goto day1
if %Day%==02 goto day2
if %Day%==03 goto day3
if %Day%==04 goto day4
if %Day%==05 (goto day5)
if %Day%==06 goto day6
if %Day%==07 goto day7 

CALL :DisplayName %task% %day%
:DisplayName %task% %day%
echo Today is %2 so %1


pause