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
local lookat = require("base.lookat")
local blueprintsBase = require("base.blueprints")

local M = {}

M.startQuest = 901 --Goes from 901-930



M.blueprints = blueprintsBase.blueprints

local function getBlueprintInfo(blueprint)

    local id = tonumber(blueprint:getData("blueprint"))

    for _, theBlueprint in pairs(M.blueprints) do
        if id == theBlueprint.id then
            return theBlueprint.id, theBlueprint.name, theBlueprint.craft, theBlueprint.level
        end
    end
end

local function checkIfPlayerKnowsBlueprint(user, blueprintId)

    local creator

    for _, blueprint in pairs(M.blueprints) do
        if blueprint.id == blueprintId then
            creator = blueprint.creator
        end
    end

    if creator == user.name or common.readBitwise(user, blueprintId, M.startQuest) then
        return true
    end

    return false

end

function M.playerKnowsBlueprint(user, itemId)
    for _, blueprint in pairs(M.blueprints) do
        if blueprint.item == itemId then
            return checkIfPlayerKnowsBlueprint(user, blueprint.id)
        end
    end
end

local function playerMeetsLevelReq(user, craft, level)

    local skilllevel = user:getSkill(Character[craft])

    if skilllevel >= level then
        return true
    end

    return false

end

local function learnBlueprint(user, blueprint, actionState)

    local blueprintId, blueprintName, craft, level = getBlueprintInfo(blueprint)

    if checkIfPlayerKnowsBlueprint(user, blueprintId) then
        user:inform("Das Wissen über den Herstellungsprozess von "..blueprintName.german.." ist dir bereits bekannt.", "The knowledge pertaining to the process of making "..blueprintName.english.." is something you already know.")
        return
    end

    if not playerMeetsLevelReq(user, craft, level) then
        local skillName = user:getSkillName(Character[craft])
        user:inform("Du musst Stufe "..level.." in "..skillName.." sein, um das Wissen in dieser Schriftrolle zu erlernen.", "You need to be level "..level.." in "..skillName.." to learn the knowledge in this scroll.")
        return
    end

    if actionState == Action.none then
        user:startAction(50, 21, 10, 0, 0)
    elseif actionState == Action.success then
        world:erase(blueprint, 1)

        common.writeBitwise(user, blueprintId, M.startQuest)

        user:inform("Durch die Magie der Schriftrolle spürst du, wie ein Strom von Wissen über den Herstellungsprozess von "..blueprintName.german.." in deinen Geist eindringt. Leider scheint die Magie der Schriftrolle dadurch aufgebraucht zu sein, denn sie zerfällt zu Staub in deinen Händen.", "By the magic of the scroll, you feel an influx of knowledge enter your mind pertaining to the process of making "..blueprintName.english..". However, unfortunately the magic of the scroll appears to be used up by this, as it dissolves into dust in your hands.")
    end

end

function M.UseItem(user, blueprint, actionState)

    if common.IsNilOrEmpty(blueprint:getData("blueprint")) then
        return
    end

    learnBlueprint(user, blueprint, actionState)

end

function M.LookAtItem(user, blueprint)

    if common.IsNilOrEmpty(blueprint:getData("blueprint")) then
        return lookat.GenerateLookAt(user, blueprint, lookat.NONE)
    end

    local _, blueprintName, craft, level = getBlueprintInfo(blueprint)

    local skillName = user:getSkillName(Character[craft])

    local lookAt = lookat.GenerateLookAt(user, blueprint, lookat.NONE, level, craft, {english = skillName, german = skillName})

    lookAt.name = common.GetNLS(user, "Versiegelte Pergamentrolle: "..blueprintName.german, "Sealed Pell: "..blueprintName.english)
    lookAt.description = common.GetNLS(user, "Eine Schriftrolle mit verlorenem Wissen über "..skillName..". Die Magie, die schwach über den Seiten schimmert, lässt vermuten, dass nur noch genug Kraft vorhanden ist, damit eine einzige Person daraus lernen kann.", "A scroll containing lost "..skillName.." knowledge. Though the magic shimmering over its page seems weak, as if there is only enough left for one person to learn from it.")

    return lookAt
end




return M
