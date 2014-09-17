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

require("base.common")


module("lte.monsterhunter_timer", package.seeall)

huntMonster = {}

function addEffect(theEffect, User)

    local monPos = base.common.getFreePos(position(448, 771, -9), 5)
    local monster = world:createMonster(862, monPos, 20)
    huntMonster[User.id] =  monster
end

function callEffect(theEffect, User)
    if (User:increaseAttrib("hitpoints",0) == 0) then
        base.common.InformNLS( User,
        "Ihr habt den Kampf verloren. Das Monster ist entwischt.",
        "You lost the fight. The Monster escaped.")
        return false
    end

    theEffect.nextCalled = 50;

    if not isValidChar(huntMonster[User.id]) then
       base.common.InformNLS( User,
        "Jemand hat das Monster getötet!",
        "Someone killed the monster!")
        return false
    end

	if theEffect.numberCalled == 600 then
        base.common.InformNLS( User,
        "Ihr habt zulange gebraucht, um das Monster zu finden, es ist entwischt.",
        "It took you too long to find the monster, it escaped.")
        return false
    end

    if huntMonster[User.id]:isInRangeToPosition(position(436, 836, -9), 2) then
        base.common.InformNLS( User,
        "[Quest gelöst] Kehre zu Defensor Infirmo zurück, um deine Belohnung zu erhalten.",
        "[Quest solved] Return to Defensor Informo to claim your reward.")
        User:setQuestProgress(529, 4)
        huntMonster[User.id] = nil
        return false
    end

    return true;
end

function removeEffect(theEffect, User)
    return false
end

function loadEffect(theEffect, User)
    return false
end
