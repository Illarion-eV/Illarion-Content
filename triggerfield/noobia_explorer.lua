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
-- INSERT INTO triggerfields VALUES (39,50,100,'triggerfield.noobia_explorer');
-- INSERT INTO triggerfields VALUES (40,50,100,'triggerfield.noobia_explorer');
-- INSERT INTO triggerfields VALUES (41,50,100,'triggerfield.noobia_explorer');
-- INSERT INTO triggerfields VALUES (42,49,100,'triggerfield.noobia_explorer');
-- INSERT INTO triggerfields VALUES (43,49,100,'triggerfield.noobia_explorer');
-- INSERT INTO triggerfields VALUES (36,50,100,'triggerfield.noobia_explorer');
-- INSERT INTO triggerfields VALUES (36,51,100,'triggerfield.noobia_explorer');
-- INSERT INTO triggerfields VALUES (35,51,100,'triggerfield.noobia_explorer');
-- INSERT INTO triggerfields VALUES (35,52,100,'triggerfield.noobia_explorer');
-- INSERT INTO triggerfields VALUES (34,52,100,'triggerfield.noobia_explorer');
-- INSERT INTO triggerfields VALUES (33,52,100,'triggerfield.noobia_explorer');
-- INSERT INTO triggerfields VALUES (32,52,100,'triggerfield.noobia_explorer');
-- INSERT INTO triggerfields VALUES (31,52,100,'triggerfield.noobia_explorer');
-- INSERT INTO triggerfields VALUES (30,52,100,'triggerfield.noobia_explorer');
-- INSERT INTO triggerfields VALUES (29,52,100,'triggerfield.noobia_explorer');
-- INSERT INTO triggerfields VALUES (28,52,100,'triggerfield.noobia_explorer');
-- INSERT INTO triggerfields VALUES (27,52,100,'triggerfield.noobia_explorer');
-- INSERT INTO triggerfields VALUES (26,52,100,'triggerfield.noobia_explorer');

local common = require("base.common")

local M = {}

function M.MoveToField(Character)
-- for Noobia: the char has to walk to a field (this triggerfield); he gets a message and we change a queststatus so that we remember he was at the field
	
    find, myEffect = Character.effects:find(13); --Noob effect
	
	if find then --Is this even a noob?
        value = Character:getQuestProgress(320);
	
	    if (value == 0) then --Didn't visit the triggerfield yet

		    Character:setQuestProgress(320,1); --player passed the first station
			
	        local callbackNewbie = function(dialogNewbie) end; --empty callback
			
	        if Character:getPlayerLanguage() == 0 then
		        dialogNewbie = MessageDialog("Tutorial","Auf das gesamte Spiel verteilt, kannst du Markierungssteine finden. Wenn du diese Steine doppelt anklickst und somit sammelst, bekommst du Punkte. Wenn du eine bestimmte Anzahl von Punkten gesammelt hast, bekommst du eine Belohnung.\n\n Versuche es einmal und klicke doppelt auf den Markierungsstein.", callbackNewbie)
	        else	
		        dialogNewbie = MessageDialog("Tutorial", "Throughout the game you can find marker stones. If you double click a stone, and therefore collect it, you will get points for it. When you collect a specific number of stones you will get a reward.\n\n Try it now and double click the marker stone.", callbackNewbie)
	        end	
	        Character:requestMessageDialog(dialogNewbie)
		end
	end
end
return M

