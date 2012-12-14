How to install the syntax check before the local commits:

1.	Copy the file "pre-commit" to ".git/hooks" in your git repository folder ("scripts", should be two folder level above of this)
2. 	For UNIX systems: make sure the 4. line in ".git/hooks/pre-commit" is uncommented, so it should be:
		UNIX_FLAG=0
	For Windows systems: make sure the 4. line in ".git/hooks/pre-commit" is commented (should be by default), so it should be:
		# UNIX_FLAG=0
3.	For UNIX systems: make sure the "pre-commit" in ".git/hooks" is executable. Type in console (being in the respective directory):
		chmod +x pre-commit
4.	Done!


For Windows:
How to check the Lua syntax using the "luac.bat":

- You can drag & drop a ".lua" file on the "luac.bat" in this folder. A CMD window should open and tell you the errors. (If there are no errors, there is no output.)
- You can also right-click on the file to check and choose "Open with" and then "Choose default program ..." and browse to the "luac.bat".
  Make sure to uncheck the box that tells to always use this program to open this file type.
  From now on, the "luac.bat" should be already in the list when choosing "Open with" on a ".lua" file.
  
Troubleshooting for UNIX systems:
If the hook does not work as expected, first check if the syntax check itself
works by manually checking a file:
<luac folder>/luac -p <lua file with errors>