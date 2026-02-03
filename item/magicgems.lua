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
local gems = require("base.gems")
local magicsmith = require("base.magicsmith")
local common = require("base.common")
local lookat = require("base.lookat")
local vision = require("content.vision")
local depotScript = require("item.id_321_depot")

-- UPDATE items SET itm_script='item.magicgems' WHERE itm_id IN (3520, 3523, 3521, 3524, 3522, 3519, 3525);

local M = {}

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

local function insideInventory(gem)

    if not gem.inside and gem.itempos > 0 then
        return true
    end

    return false
end

local function getExistingGemNumber(user, gem)

    if gem:getType() == scriptItem.field then
        if world:isItemOnField(gem.pos) and world:getItemOnField(gem.pos).id == gem.id then
            return world:getItemOnField(gem.pos).number
        end
    elseif gem:getType() == scriptItem.container then

        if user:getBackPack() and gem.inside == user:getBackPack() then

            local found, itemInBackpack = user:getBackPack():viewItemNr(gem.itempos)

            if found and itemInBackpack.id == gem.id then
                return itemInBackpack.number
            end
        else
            local found, itemInBag = gem.inside:viewItemNr(gem.itempos)
            if found and itemInBag.id == gem.id then
                return itemInBag.number
            end
        end

    else
        local theItem = user:getItemAt(gem.itempos)
        if theItem and theItem.id == gem.id then
            return theItem.number
        end
    end

    return 0
end

function M.MoveItemAfterMove(user, source, target)

    local preExistingGemsAtTarget = getExistingGemNumber(user, target)

    target:setData("owner", user.name)
    target.number = preExistingGemsAtTarget --Otherwise gems get deleted when we set the owner name
    world:changeItem(target)

end

function M.MoveItemBeforeMove(user, source, target)
    local owner = source:getData("owner")
    local amount = tostring(target.number)
    local level = tostring(target:getData("gemLevel")) or 1

    if common.IsNilOrEmpty(owner) then
        owner = "Treasure Map or unknown"
    end

    if owner == user.name then
        return true
    end

    local itemStats = world:getItemStatsFromId(target.id)
    local nameEnglish = itemStats.English

    local text = tostring(amount).." "..nameEnglish.."s("..source.id..") of rank "..tostring(level)..", previously belonging to "..owner.." was moved by "..user.name.."("..user.id..") at position ("..tostring(user.pos).."). It was moved from "

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

    if not common.IsNilOrEmpty(user.lastSpokenText) then
        text = text.." Their last spoken words were: "..user.lastSpokenText
    else
        text = text.." They have not spoken a single word this session."
    end

    log(text)

    return true
end

function M.LookAtItem(user, item)

    if common.IsNilOrEmpty(item:getData("owner")) then
        item:setData("owner", user.name)
        world:changeItem(item)
    end

    local lookAt = lookat.GenerateLookAt(user, item)

    local data = {}
    data.gemLevel = tonumber(item:getData(gems.levelDataKey)) or 1 --If the gem has no level set, it's 1 by default.

    lookAt = gems.lookAtFilter(user, lookAt, data)

    return lookAt
end

function M.UseItem(User, SourceItem, ltstate)

    local TargetItemEvilRock = common.GetItemInArea(User.pos, 2805)

    local AmountDarkColumnEvilrock = #vision.darkColumnEvilrock

    if TargetItemEvilRock ~= nil then
        for i = 1,AmountDarkColumnEvilrock do
            if TargetItemEvilRock.pos == vision.darkColumnEvilrock[i] then
                common.TurnTo(User,TargetItemEvilRock.pos) -- turn if necessary
                vision.UseDarkColumns(User,TargetItemEvilRock,ltstate)
                return
            end
        end
    end

    magicsmith.handleSocketing(User, SourceItem)
end

return M

