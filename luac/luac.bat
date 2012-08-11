@ECHO OFF
echo Checking %~n1%~x1
"%~d0%~p0luac.exe" -p "%1"
pause