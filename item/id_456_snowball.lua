--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
-- UPDATE common SET com_script='item.id_456_snowball' WHERE com_itemid IN (456);
require("base.common")

module("item.id_456_snowball", package.seeall)

Round=1;

function MoveItemAfterMove(User, SourceItem, TargetItem)
	if Round==1 then
        User:talk(Character.say, "#me wirft einen Schneeball.", "#me throws a snowball.")
		Round=2;
	else
		Round=1;
	end
end

function UseItem(User,SourceItem)

	local callback = function (dialog)
		if not dialog:getSuccess() then
			User:inform("Abort selection")
		else
			local index = dialog:getSelectedIndex()+1;
			local multipleLines = false
			if index == 2 then
				multipleLines = true
			end
			openInputDialog(User,multipleLines)
		end
	end
	local dialog = SelectionDialog("Input Dialog", "Select an input dialog with one or multiple lines", callback);
	dialog:addOption(0,"Input dialog with ONE line");
	dialog:addOption(0,"Input dialog with MULTIPLE line");
	
	User:requestSelectionDialog(dialog)
end

function openInputDialog(User,multipleLines)

	-- input dialog
	local callback = function(dialog)
		if not dialog:getSuccess() then
			User:inform("Abort input dialog.")
		else
			openMessageDialog(User,dialog:getInput())			
		end
	end
	local dialog = InputDialog("Input dialog", "Write your text. Maximum is set to 250 characters.", multipleLines, 250, callback)
	User:requestInputDialog(dialog)
end

function openMessageDialog(User, userText)

	local callback = function(dialog)
		-- empty callback
	end
	local dialog = MessageDialog("Message Dialog",userText,callback)
	User:requestMessageDialog(dialog)

end