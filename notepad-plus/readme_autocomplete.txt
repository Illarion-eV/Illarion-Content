*********************************************************************************************
* INSTALLATION STEPS																		*
*																							*
* 1. copy the lua.xml to your Notepad++ subdirectory: /Notepad++/plugins/APIs				*
* 2. restart Notepad++																		*
* 3. Go to Settings -> Preferences, and switch to the Backup/Auto-completion tab.			*
*    At the bottom you can enable the auto-completion and showing the function parameters.	*
*																							*
*********************************************************************************************

In the editor you can manually access the auto-completion by "CTRL + SPACE".

For entry points, the return value says "[entry point]".

If a function is bound to a struct, then the description shows what struct is necessary.
Example:
the function "talk" needs a character struct:
	User:talk(CCharacter.say,"Hello world!")
so the description shows:
	{character}:
whereas the function "addEffect" has to be applied to the effects of a character:
	User.effects:addEffect(myEffect)
so the description shows:
	{character}.effects: