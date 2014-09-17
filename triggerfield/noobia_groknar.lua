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
-- INSERT INTO triggerfields VALUES (37,40,100,'triggerfield.noobia_groknar');
-- INSERT INTO triggerfields VALUES (38,40,100,'triggerfield.noobia_groknar');
-- INSERT INTO triggerfields VALUES (39,40,100,'triggerfield.noobia_groknar');
-- INSERT INTO triggerfields VALUES (40,40,100,'triggerfield.noobia_groknar');
-- INSERT INTO triggerfields VALUES (41,40,100,'triggerfield.noobia_groknar');
-- INSERT INTO triggerfields VALUES (42,40,100,'triggerfield.noobia_groknar');


local common = require("base.common")

module("triggerfield.noobia_groknar", package.seeall)

function MoveToField(Character)

    -- for Noobia: the char has to walk to a field (this triggerfield); he gets a message and we change a queststatus so that we remember he was at the field
	
    find, myEffect = Character.effects:find(13); --Noob effect
	
	if find then --Is this even a noob?
        value = Character:getQuestProgress(311);
	
	    if (value == 0) then --Didn't visit the triggerfield yet

		    Character:setQuestProgress(311,1); --player passed the first station
			
	        local callbackNewbie = function(dialogNewbie) end; --empty callback
			
	        if Character:getPlayerLanguage() == 0 then
		        dialogNewbie = MessageDialog("Tutorial","Diese Station lehrt dich, wie man kämpft. Groknar, der Lehrmeister, ist ein stolzer und mächtiger Orkkrieger. Stell dich ihm vor - vorsichtig.\n\nMonster und auch andere Spielercharaktere (PvP) kannst du mit einem Rechtsklick angreifen.\n\nDrücke 'Q', um eine Liste deiner Aufgaben und ihren Status einzusehen.", callbackNewbie)
	        else	
		        dialogNewbie = MessageDialog("Tutorial", "At the next station, you will learn how to fight. Groknar, the instructor, is a proud and mighty Orc warrior. Just speak up to him - carefully.\n\nTo attack monsters and also other player characters (PvP), click on them once with the right mouse button.\n\nHit 'Q' to review your current quests and their status.", callbackNewbie)
	        end	
	        Character:requestMessageDialog(dialogNewbie)
		end
	end
end

