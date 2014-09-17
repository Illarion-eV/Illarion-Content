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
-- TÜREN AUF UND ZU KLAPPEN
-- RUNEN 1 & 23 KEL ANTH
--INSERT INTO spells VALUES (2^0+2^22,0,'m_01_23.lua');
--SPEZIALZAUBER
--ITEMZAUBER

local doors = require("base.doors")
local common = require("base.common")
module("magic.spell_01_23_open-close-door", package.seeall)

function OpenCloseTarget(Caster,Item)
    if not common.IsLookingAt(Caster,Item.pos) then
		common.TurnTo(Caster, Item.pos);
	end
    local Mana=Caster:increaseAttrib("mana",0);
    if (Mana>=100) then
        local Language=Caster.activeLanguage;
        Caster.activeLanguage=10;
        Caster:talk(Character.say,"KEL ANTH");
        Caster.activeLanguage=Language;
        if doors.CloseDoor(Item) then
            Succeed(Caster)
            common.InformNLS(Caster,"Von dem Windstoß getroffen klappt die Tür zu.","A mysterious breeze pushes the door close.");
        else
            local OpenDoor,OpenOK=doors.OpenDoor(Item);
            if OpenOK then
                Succeed(Caster)
                common.InformNLS(Caster,"Vom Wind geführt schwingt die Tür auf.","A mysterious breeze pushes the door open.");
            elseif OpenDoor then
                Succeed(Caster)
                common.InformNLS(Caster,"Der Wind rüttelt an der Tür, doch sie öffnet sich nicht.","The wind tries to open the door, but the door doesn't open.");
            else
                common.InformNLS(Caster,"Der Spruch zeigt keine Wirkung.","Nothing happens.");
            end
        end
    else
        common.InformNLS(Caster,"Nicht genug Mana.","Not enough mana.");
    end
end

function Succeed(Caster)
    if (LuaAnd(Caster:getQuestProgress(24),1) == 0 ) then
        --Caster:learn(3,"transformo",1,20);
		--Replace with new learn function, see learn.lua 
    end
    Caster:increaseAttrib("mana",-100);
    world:makeSound(13,Caster.pos);
end

function CastMagic(Caster)
    common.InformNLS(Caster,"Der Spruch zeigt keine Wirkung.","Nothing happens.");
end

function CastMagicOnCharacter(Caster,TargetCharacter)
    common.InformNLS(Caster,"Der Spruch zeigt keine Wirkung.","Nothing happens.");
end

function CastMagicOnField(Caster,Targetpos)
    informNLS(Caster,"Der Spruch zeigt keine Wirkung.","Nothing happens.");
end

function CastMagicOnItem(Caster,TargetItem, ltstate)
    if ( ltstate == nil or ltstate == Action.success ) then
        OpenCloseTarget(Caster,TargetItem)
    elseif ( ltstate == Action.none ) then
        Caster:startAction( 15, 21, 10, 0, 0);
        Caster:talk(Character.say, "#me beginnt mit einer mystischen Formel.", "#me starts with a mystical formula.")
    elseif ( ltstate == Action.abort ) then
        Caster:talk(Character.say, "#me stoppt apprupt mit dem Zaubern.", "me stopps appruptly with the casting.")
    end
end
