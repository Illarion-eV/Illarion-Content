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

-- The purpose of this tool is to provide a gm tool, that unlike the portable ones, can store information of events(This could also be done for the portable ones by using the database, but that causes lag)
-- The tool is positioned in the GM castle, and only admin characters can use it.

local common = require("base.common")

local M = {}

M.max_potions_logged = 100
M.pos = position(247, 97, 0)
local lecternId = 661

local function getLectern()

    if not world:isPersistentAt(M.pos) then
        world:makePersistentAt(M.pos)
    end

    local field = world:getField(M.pos)
    local count = field:countItems()

    for i = 0, count do
        local theItem = field:getStackItem(i)
        if theItem.id == lecternId then
            return theItem
        end
    end

    local newLectern = world:createItemFromId(lecternId, 1, M.pos, true, 999, {["titleEn"] = "GM Lectern", ["titleDe"] = "GM Lesepult"})
    newLectern.wear = 255
    world:changeItem(newLectern)

    return newLectern
end

local function getPotionInfo(potion)

    local creator = potion:getData("creator")
    local effect = potion:getData("potionEffectId")
    local typeOf = world:getItemStatsFromId(potion.id).English

    return creator, effect, typeOf

end

local function checkIfIdenticalEntryAlreadyLogged(user, potion, lectern)

    for i = 1, M.max_potions_logged do

        local consumer = lectern:getData("potionConsumer"..i)
        local creator = lectern:getData("potionCreator"..i)
        local typeOf = lectern:getData("potionType"..i)
        local effect = lectern:getData("potionEffect"..i)

        local pCreator, pEffect, pType = getPotionInfo(potion)

        if consumer == user.name and creator == pCreator and effect == pEffect and typeOf == pType then
            return true
        end
    end

    return false
end

function M.logConsumption(user, potion)

    local lectern = getLectern()

    if checkIfIdenticalEntryAlreadyLogged(user, potion, lectern) then
        return
    end

    local entryToUse
    local previousTime

    for i = 1, M.max_potions_logged do  --check for empty entries to use

        local time = lectern:getData("potionTimeStamp"..i)

        if common.IsNilOrEmpty(time) then
            entryToUse = i
            break
        end
    end

    if not entryToUse then  -- find the oldest entry to use
        for i = 1, M.max_potions_logged do
            local time = lectern:getData("potionTimeStamp"..i)
            if not previousTime or previousTime < time then
                entryToUse = i
                previousTime = time
            end
        end
    end

    local creator, effect, typeOf = getPotionInfo(potion)

    lectern:setData("potionConsumer"..entryToUse, user.name)
    lectern:setData("potionCreator"..entryToUse, creator)
    lectern:setData("potionEffect"..entryToUse, effect)
    lectern:setData("potionType"..entryToUse, typeOf)
    lectern:setData("potionTimeStamp"..entryToUse, world:getTime("unix"))

    world:changeItem(lectern)


end

local function checkPotionConsumptionLog(user, lectern)

    local results = {}

    for i = 1, M.max_potions_logged do

        local consumer = lectern:getData("potionConsumer"..i)

        if common.IsNilOrEmpty(consumer) then
            break
        end

        results[i] = {}
        results[i].consumer = consumer
        results[i].creator = lectern:getData("potionCreator"..i)
        results[i].type = lectern:getData("potionType"..i)
        results[i].effect = lectern:getData("potionEffect"..i)
        results[i].time = lectern:getData("potionTimeStamp"..i)
    end

    local displayTexts = {}

    local pageNumber = 1

    for _, result in ipairs(results) do
        if common.IsNilOrEmpty(displayTexts[pageNumber]) then
            displayTexts[pageNumber] = ""
        end
        if string.len(displayTexts[pageNumber]) > 900 then
            pageNumber = pageNumber + 1
        end

        displayTexts[pageNumber] = displayTexts[pageNumber].."A "..result.type.." potion made by "..result.creator.." was consumed by "..result.consumer.." at UNIX time "..result.time..". EffectId("..result.effect..")".."\n"
    end

    local title = "Potion Consumption Log"

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex() + 1

        for i = 1, pageNumber do
            if index == i then
                local callbackM = function(dialogM) end
                local dialogM = MessageDialog(title, displayTexts[i], callbackM)
                user:requestMessageDialog(dialogM)
            end
        end
    end

    local dialog = SelectionDialog(title, "Choose which page to view", callback)

    for i = 1, pageNumber do
        dialog:addOption(2745, "Page "..tostring(i))
    end

    dialog:setCloseOnMove()

    local messageCallback = function(messageDialog) end
    local messageDialog = MessageDialog(title, displayTexts[1], messageCallback)

    if pageNumber > 1 then
        user:requestSelectionDialog(dialog)
    else
        user:requestMessageDialog(messageDialog)
    end

end


function M.mainOverview(user, lectern)

    if not user:isAdmin() then
        return
    end

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local selected = dialog:getSelectedIndex() + 1
        if selected == 1 then
            checkPotionConsumptionLog(user, lectern)
        end
    end

    local dialog = SelectionDialog("GM Pedestal", "Choose which function you want to access", callback)

    dialog:addOption(59, "View Potion Consumption Log")

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)


end

return M
