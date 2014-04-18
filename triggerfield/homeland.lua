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
-- INSERT INTO triggerfields VALUES (216,647,0,'triggerfield.homeland');
-- INSERT INTO triggerfields VALUES (216,648,0,'triggerfield.homeland');

-- INSERT INTO triggerfields VALUES (478,249,0,'triggerfield.homeland');
-- INSERT INTO triggerfields VALUES (478,250,0,'triggerfield.homeland');

-- INSERT INTO triggerfields VALUES (888,646,0,'triggerfield.homeland');
-- INSERT INTO triggerfields VALUES (889,646,0,'triggerfield.homeland');

require("base.common")

module("triggerfield.homeland", package.seeall)

function MoveToField(Character)

	questvalue={};
    questvalue[1] = 166; --Cadomyr
    questvalue[2] = 167; --Galmair
    questvalue[3] = 168; --Runewick
	
	location={}
	location[1]=position(216,647,0); --Cadomyr
	location[2]=position(216,648,0); --Cadomyr
	location[3]=position(478,249,0); --Galmair
	location[4]=position(478,250,0); --Galmair
	location[5]=position(888,646,0); --Runewick
	location[6]=position(889,646,0); --Runewick
	
    if (Character:getQuestProgress(questvalue[1]) == 0) and (Character:getFaceTo() == 1 or Character:getFaceTo() == 2 or Character:getFaceTo() == 3) and (Character.pos == location[1] or Character.pos == location[2]) then --Didn't visit the triggerfield yet

		Character:setQuestProgress(questvalue[1],1); --player was here
		factionString="Cadomyr";
		
	elseif (Character:getQuestProgress(questvalue[2]) == 0) and (Character:getFaceTo() == 1 or Character:getFaceTo() == 2 or Character:getFaceTo() == 3) and (Character.pos == location[3] or Character.pos == location[4]) then --Didn't visit the triggerfield yet
		
		Character:setQuestProgress(questvalue[2],1); --player was here
		factionString="Galmair";
				
	elseif (Character:getQuestProgress(questvalue[3]) == 0) and (Character:getFaceTo() == 7 or Character:getFaceTo() == 0 or Character:getFaceTo() == 1) and (Character.pos == location[5] or Character.pos == location[6]) then --Didn't visit the triggerfield yet
	
		Character:setQuestProgress(questvalue[3],1); --player was here
		factionString="Runewick";
		
	else
		
		return; --bailing out
	
	end
	
		
	local callbackHomeland = function(dialogHomeland) end; --empty callback
			
	if Character:getPlayerLanguage() == 0 then
	    dialogHomeland = MessageDialog("Heimatland","Du verlässt nun das vergleichsweise sichere Heimatland von "..factionString..". Hinter diesem Punkt wirst du wahrscheinlich feindseligen Monstern begegnen. Sei auf der Hut!", callbackHomeland)
	else	
		    dialogHomeland = MessageDialog("Homeland", "You are leaving the comparable safe homeland of "..factionString..". Beyond this point, you will most likely encounter hostile monsters. Be on your guard!", callbackHomeland)
	end	
	        Character:requestMessageDialog(dialogHomeland)

end

