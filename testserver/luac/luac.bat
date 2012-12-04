@ECHO OFF
set executable="%~d0%~p0luac.exe"

:beforeCheck
IF "%1" == "" goto end
echo Checking %~n1%~x1
%executable% -p "%1"
shift /1
goto beforeCheck
:end
pause