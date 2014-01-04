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
-- GM Rune 31 /1073741824 /
require("gm.base.log")

module("gm.spells.31_runes", package.seeall)

--[[
INSERT INTO spells VALUES (2^30,0,'gm.spells.31_runes');
INSERT INTO spells VALUES (2^30,1,'gm.spells.31_runes');
INSERT INTO spells VALUES (2^30,2,'gm.spells.31_runes');
INSERT INTO spells VALUES (2^30,3,'gm.spells.31_runes');
]]

function CastMagic(User)
    local magictype = User:getMagicType()
    for i = 1,32 do
        User:teachMagic(magictype,i-1)
    end;
    gm.base.log.Write(User, User.name .. "(" .. User.id .. ") gave himself all runes.");
end;
