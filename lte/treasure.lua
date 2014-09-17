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
local common = require("base.common")
local treasure = require("base.treasure")
module("lte.treasure", package.seeall)

function addEffect(trsEff, trsHunter)
    fnd, cat=trsEff:findValue("category");
    if not fnd then
        return false;       -- treasure lost!
    end
    treasure.SpawnMonsters( trsHunter, cat );
    return true;
end

function callEffect(trsEff, trsHunter)
    if (trsHunter:increaseAttrib("hitpoints",0) == 0) then
        common.InformNLS( trsHunter,
        "Der Schatz ist für immer verloren. Die Wächter haben gesiegt.",
        "The treasure is lost forever. The guardians defeated you.)");
        return false;
    end

    trsEff.nextCalled = 30;

    local fnd;
    local trsPosition;
    local cat;
    fndX, trsPositionX=trsEff:findValue("posX")
    fndY, trsPositionY=trsEff:findValue("posY")
	fndZ, trsPositionZ=trsEff:findValue("posZ")
	trsPosition = position(trsPositionX,trsPositionY,trsPositionZ)
	
    if not (fndX and fndY and fndZ) then
        return false;       -- treasure lost!
    end

    if not trsHunter:isInRangeToPosition( trsPosition, 40 ) then
        common.InformNLS( trsHunter,
        "Der Schatz ist für immer verloren. Die Wächter haben euch in die Flucht geschlagen.",
        "The treasure is lost forever. The guardians made you retreat.");
        return false;
    end

    fnd, cat=trsEff:findValue("category");
    if not fnd then
        return false;       -- treasure lost!
    end

    if treasure.CheckMonsters( trsHunter ) then
        common.InformNLS( trsHunter,
        "Die Wächter des Schatzes wurden besiegt. Gebt nicht alles auf einmal aus!",
        "The guardians of the treasure have been slain. Do not spend it all at once!");

        world:gfx(16,trsPosition);
        world:makeSound(13,trsPosition);
		treasure.SpawnTreasure(cat, trsPosition)
        return false;
    end

    if trsEff.numberCalled==300 then
        common.InformNLS( trsHunter,
        "Der Schatz ist für immer verloren. Ihr habt die Wächter nicht beizeiten besiegen können.",
        "The treasure is lost forever. You could not defeat the guardians in time.");
        return false;
    end

    return true;
end

function removeEffect(trsEff, trsHunter)
    treasure.KillMonsters( trsHunter );
    return false;
end

function loadEffect(trsEff, trsHunter)
    return false;
end
