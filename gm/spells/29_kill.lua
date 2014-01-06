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
-- GM Rune 29 - Instant kill

require("gm.base.log")

module("gm.spells.29_kill", package.seeall)

--[[
INSERT INTO spells VALUES (2^28,0,'gm.spells.29_kill');
INSERT INTO spells VALUES (2^28,1,'gm.spells.29_kill');
INSERT INTO spells VALUES (2^28,2,'gm.spells.29_kill');
INSERT INTO spells VALUES (2^28,3,'gm.spells.29_kill');
]]

function CastMagicOnCharacter(Caster, TargetCharacter)
	TargetCharacter:increaseAttrib("hitpoints",-32767);
	gm.base.log.Write(User, User.name .. "(" .. User.id .. ") killed " .. TargetCharacter.name .. "(" .. TargetCharacter.id .. ")");
end;
