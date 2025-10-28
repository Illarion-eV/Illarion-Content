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
local depotScript = require("item.id_321_depot")

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

local function insideInventory(blueprint)

    if not blueprint.inside and blueprint.itempos > 0 then
        return true
    end

    return false
end

local function depotChecker(user, targetContainer)

    if not targetContainer then
        return false
    end

    local depots = depotScript.depots

    for _, depot in pairs(depots) do
        if targetContainer == user:getDepot(depot.id) then
            return true, depotScript.getDepotDescription(user, depot.itemData)
        end
    end

    return false

end

local function getExistingBlueprintNumber(user, blueprint)

    if blueprint:getType() == scriptItem.field then
        if world:isItemOnField(blueprint.pos) and world:getItemOnField(blueprint.pos).id == blueprint.id then
            return world:getItemOnField(blueprint.pos).number
        end
    elseif blueprint:getType() == scriptItem.container then

        if user:getBackPack() and blueprint.inside == user:getBackPack() then

            local found, itemInBackpack = user:getBackPack():viewItemNr(blueprint.itempos)

            if found and itemInBackpack.id == blueprint.id then
                return itemInBackpack.number
            end
        else
            local found, itemInBag = blueprint.inside:viewItemNr(blueprint.itempos)
            if found and itemInBag.id == blueprint.id then
                return itemInBag.number
            end
        end

    else
        local theItem = user:getItemAt(blueprint.itempos)
        if theItem and theItem.id == blueprint.id then
            return theItem.number
        end
    end

    return 0
end

function M.MoveItemAfterMove(user, source, target)

    local preExistingBlueprintsAtTarget = getExistingBlueprintNumber(user, target)

    target:setData("owner", user.name)
    target.number = preExistingBlueprintsAtTarget --Otherwise stacked blueprints get deleted when we set the owner name. Currently not possible as blueprints do not stack, this is just future-proofing it if that changes.
    world:changeItem(target)

end

function M.MoveItemBeforeMove(user, source, target)

    if common.IsNilOrEmpty(source:getData("blueprint")) then
        return true
    end

    local owner = source:getData("owner")
    local amount = tostring(target.number)
    local _, name = getBlueprintInfo(source)


    if common.IsNilOrEmpty(owner) then
        owner = "Treasure Map or unknown"
    end

    if owner == user.name then
        return true
    end

    local text = tostring(amount).." blueprints for "..tostring(name.english)..", previously belonging to "..owner.." was moved by "..user.name.."("..user.id..") at position ("..tostring(user.pos).."). It was moved from "

    local backpack = user:getBackPack()

    local isDepotSource, depotNameSource = depotChecker(user, source.inside)
    local isDepotTarget, depotNameTarget = depotChecker(user, target.inside)

    local inPlayerPosession = (not source.inside and insideInventory(source)) or (source.inside and (source.inside == backpack or isDepotSource))

    local toPlayerPosession = (not target.inside and insideInventory(target)) or (target.inside and (target.inside == backpack or isDepotTarget))

    if inPlayerPosession and toPlayerPosession then
        return true -- No point logging since it is going from and to player posession
    end

    if source.inside and source.inside == backpack then
        text = text.."their backpack to "
    elseif source.inside and isDepotSource then
        text = text.."their "..depotNameSource.." depot to "
    elseif source.inside then
        text = text.."a container that is either in their depot or on the ground near the users position to "
    elseif not source.inside and insideInventory(source) then
        text = text.."their inventory to "
    elseif not source.inside then
        text = text.. "a tile at position("..tostring(source.pos)..") to "
    end

    if target.inside and target.inside == backpack then
        text = text.."their backpack."
    elseif target.inside and isDepotTarget then
        text = text.."their "..depotNameTarget.." depot."
    elseif target.inside then
        text = text.."a container that is either in their depot or on the ground near the users position."
    elseif not target.inside and insideInventory(target) then
        text = text.."their inventory."
    elseif not target.inside then
        if target.pos == user.pos and not source.inside and not insideInventory(source) then
            text = text.."their backpack." -- They dragged it onto themself, which puts it into their backpack instead of the tile if the source is another tile.
        else
            text = text.."a tile at position("..tostring(target.pos)..")."
        end
    end

    log(text)

    return true
end

function M.UseItem(user, blueprint, actionState)

    if blueprint.wear == 255 then
        return
    end

    if common.IsNilOrEmpty(blueprint:getData("blueprint")) then
        return
    end

    learnBlueprint(user, blueprint, actionState)

end

function M.LookAtItem(user, blueprint)

    if common.IsNilOrEmpty(blueprint:getData("owner")) then
        blueprint:setData("owner", user.name)
        world:changeItem(blueprint)
    end

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
