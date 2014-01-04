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
require("base.common")
module("lte.spookey", package.seeall)

---------------------------
---- Spook starts --
-----------------------------
function addEffect(spookeyEffect, Character)         -- Smell starts
    --base.common.InformNLS(Character,
    --"Du fühlst dich etwas unwohl.",
    --"You feel a little sickish.");
	CharRace=Character:getRace()
    spookeyEffect:addValue("OriginalRace",CharRace);
end


-----------------------------------------------
---- Character is affected by the smell he got. --
-------------------------------------------------
function callEffect(spookeyEffect, Character)    -- Effect wird ausgeführt
    spookeyEffect.nextCalled =math.random(3000,6000);       -- call it again in 300-600 seconds

    return true;
end


function removeEffect( Effect, Character )
    --base.common.InformNLS(Character,
    --"Du fühlst dich endlich wieder besser.",
    --"You finally feel better now.");
end

function loadEffect(Effect, Character)

end

