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

-- lte ID = 120

local common = require("base.common")


local M = {}

local huntMonster = {}

function M.addEffect(theEffect, User)

    -- spawn hellhound at library
    local monPos = common.getFreePos(position(468, 839, -9), 5)
    local monster = world:createMonster(862, monPos, 20)
    huntMonster[User.id] =  monster
end

function M.callEffect(theEffect, User)
    if (User:increaseAttrib("hitpoints",0) == 0) then
        common.InformNLS( User,
        "Ihr habt den Kampf verloren. Das Monster ist entwischt.",
        "You lost the fight. The Monster escaped.")
        return false
    end

    theEffect.nextCalled = 50;

    if not isValidChar(huntMonster[User.id]) then
       common.InformNLS( User,
        "Jemand hat das Monster getötet!",
        "Someone killed the monster!")
        return false
    end

	if theEffect.numberCalled == 600 then
        common.InformNLS( User,
        "Ihr habt zulange gebraucht, um das Monster zu finden, es ist entwischt.",
        "It took you too long to find the monster, it escaped.")
        if isValidChar(huntMonster[User.id]) then
			if huntMonster[User.id]:increaseAttrib("hitpoints",0) > 0 then
				huntMonster[User.id]:increaseAttrib("hitpoints",-10000);
			end
        end
        huntMonster[User.id] = nil
        return false
    end

    -- lure to pit sucessful
    if huntMonster[User.id]:isInRangeToPosition(position(436, 836, -9), 2) then
        common.InformNLS( User,
        "[Quest gelöst] Kehre zu Defensor Infirmo zurück, um deine Belohnung zu erhalten.",
        "[Quest solved] Return to Defensor Informo to claim your reward.")
        if isValidChar(huntMonster[User.id]) then

				huntMonster[User.id]:warp(position(441, 844, -10)); -- send it to the pit

        end
        User:setQuestProgress(529, 4)
        huntMonster[User.id] = nil
        return false
    end

    return true;
end

function M.removeEffect(theEffect, User)
    return false
end

function M.loadEffect(theEffect, User)
    return false
end

return M

