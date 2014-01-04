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
-- GM Rune 30 / 536870912 / Vollst&auml;ndige Heilung eines Characters

require("gm.base.log")

module("gm.spells.30_heal", package.seeall)

--[[
INSERT INTO spells VALUES (2^29,0,'gm.spells.30_heal');
INSERT INTO spells VALUES (2^29,1,'gm.spells.30_heal');
INSERT INTO spells VALUES (2^29,2,'gm.spells.30_heal');
INSERT INTO spells VALUES (2^29,3,'gm.spells.30_heal');
]]
function CastMagicOnCharacter(Caster,TargetCharacter)
    while (TargetCharacter:increaseAttrib("hitpoints", 0) < 10000) do
        TargetCharacter:increaseAttrib("hitpoints", 10000);
    end;
    
    while (TargetCharacter:increaseAttrib("mana", 0) < 10000) do
        TargetCharacter:increaseAttrib("mana", 10000);
    end;
    
    while (TargetCharacter:increaseAttrib("foodlevel", 0) < 60000) do
        TargetCharacter:increaseAttrib("foodlevel", 10000);
    end;
    
    while (TargetCharacter:getPoisonValue() > 0) do
        TargetCharacter:increasePoisonValue(-10000);
    end;
    
    gm.base.log.Write(User, User.name .. "(" .. User.id .. ") healed " .. TargetCharacter.name .. "(" .. TargetCharacter.id .. ")");
end
