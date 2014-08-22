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
-- UPDATE items SET itm_script='item.id_348_wallcorner' WHERE itm_id = 348;

module("item.id_348_wallcorner", package.seeall)

function UseItem(User, Item)
    --The stuff below belongs to the quest of NPC Sylvester. This is old Gobaith stuff. But this quest should be converted to NewIllarion - so I don't delete it ~Estralis
	--[[
    if (Item.pos == position(-106,-147,0)) then 
        local lang=User:getPlayerLanguage();
        if ( (User:getQuestProgress(5) == 1) or (User:isAdmin()) ) then
                if lang==0 then
                    User:inform("Als du die Wand abtastet bemerkst du einen losen Ziegel. Im Inneren der Mauer findest du einige Münzen.");
                else
                    User:inform("As you feel the wall you notice a loose brick. In the interior of the wall you find some coins.");
                end
            if (User:createItem( 3077, 10, 333, 0 ) ~= 0 ) then --Changed to silver coins to reflect inflation with the VBU ~Estralis
                if lang==0 then
                    User:inform("Du kannst jedoch nicht mehr tragen.");
                else
                    User:inform("But you cannot carry more.");
                end;
            else
                User:setQuestProgress(5,2);
            end;
        elseif (User:getQuestProgress(5) == 2) then
                if lang==0 then
                    User:inform("Als deine Hand noch tiefer hineinfährt findest du einen kleinen Ring.");
                else
                    User:inform("As you reach deeper into the hole you find a tiny ring.");
                end
            if (User:createItem( 235, 1, 999, 0 ) ~= 0 ) then
                if lang==0 then
                    User:inform("Du kannst jedoch nicht mehr tragen.");
                else
                    User:inform("But you cannot carry more.");
                end;
            else
                User:setQuestProgress(5,3);
            end;
        else
            
                if lang==0 then
                    User:inform("Das Loch ist anscheinend leer.");
                else
                    User:inform("The hole seems to be empty.");
                end;
            
        end
    end]]
end
