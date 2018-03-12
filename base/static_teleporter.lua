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
local globalvar = require("base.globalvar")
local money = require("base.money")

local M = {}

local teleporterList = {}
    teleporterList[1] = {nameDe="Cadomyr", nameEn="Cadomyr", targetDe="nach Cadomyr" ,posItem=position(127,647,0), posWarp=position(126,647,0), pict=2701}
    teleporterList[2] = {nameDe="Galmair", nameEn="Galmair", targetDe="nach Galmair", posItem=position(424,246,0), posWarp=position(423,246,0), pict=61}
    teleporterList[3] = {nameDe="Runewick", nameEn="Runewick", targetDe="nach Runewick", posItem=position(836,813,0), posWarp=position(835,813,0), pict=105}
    teleporterList[4] = {nameDe="Gasthof zur Hanfschlinge", nameEn="Hemp Necktie Inn", targetDe="zum Gasthof zur Hanfschlinge", posItem=position(685,307,0), posWarp=position(684,307,0), pict=1909}
    teleporterList[5] = {nameDe="Gefängnismine", nameEn="Prison Mine", targetDe="zur Gefängnismine", posItem=position(-474,-455,-40), posWarp=position(-484,-455,-40), pict=466}

local PRICE_TELEPORT = 500
local PRICE_NEWCHAR = 200

local function getSettingsForTeleporter(teleporterId)
    local blockedOut = false
    local blockedIn = false
    local foundValue, blockedTeleporters = ScriptVars:find("teleporterBlockOutgoing")
    if not foundValue then
        blockedTeleporters = 0
    end
    if common.isBitSet(blockedTeleporters, teleporterId) then
        blockedOut = true
    end
    local foundValue, blockedTeleporters = ScriptVars:find("teleporterBlockIncoming")
    if not foundValue then
        blockedTeleporters = 0
    end
    if common.isBitSet(blockedTeleporters, teleporterId) then
        blockedIn = true
    end
    return blockedOut, blockedIn
end

local function blockText(user,blockedOut, blockedIn)
    local text
    if blockedOut and blockedIn then
        text = common.GetNLS(user,"gesperrt","blocked")
    elseif blockedOut then
        text = common.GetNLS(user,"nur ankommende Reisende","incoming travellers only")
    elseif blockedIn then
        text = common.GetNLS(user,"nur abreisende Reisende","outgoing travellers only")
    else
        text = common.GetNLS(user,"in Betrieb","operational")
    end
    return text
end

local function setInOut(teleporterId, state, variable)
    local foundValue, blockedTeleporters = ScriptVars:find(variable)
    if not foundValue then
        blockedTeleporters = 0
    end
    if state then
        blockedTeleporters = common.addBit(blockedTeleporters,teleporterId)
    else
        blockedTeleporters = common.removeBit(blockedTeleporters,teleporterId)
    end
    ScriptVars:set(variable, blockedTeleporters)
end

local function setOutgoing(teleporterId, state)
    setInOut(teleporterId, state, "teleporterBlockOutgoing")
end

local function setIncoming(teleporterId, state)
    setInOut(teleporterId, state, "teleporterBlockIncoming")
end

local function getTeleporterPriceNormal()
    local foundValue, price = ScriptVars:find("teleporterPriceNormal")
    if foundValue then
        return math.max(1, tonumber(price))
    end
    return PRICE_TELEPORT
end

local function setTeleporterPriceNormal(price)
    ScriptVars:set("teleporterPriceNormal", price)
end

local function getTeleporterPriceNewbe()
    local foundValue, price = ScriptVars:find("teleporterPriceNewbe")
    if foundValue then
        return math.max(1, tonumber(price))
    end
    return PRICE_NEWCHAR
end

local function setTeleporterPriceNewbe(price)
    ScriptVars:set("teleporterPriceNewbe", price)
end

local function travelToTarget(user,targetId)
    world:gfx(46,user.pos)
    world:makeSound(13,user.pos);

    user:warp(teleporterList[targetId].posWarp)
    world:gfx(46,user.pos)
    world:makeSound(13,user.pos);
    user:inform("Du hast dich dazu entschlossen, " ..teleporterList[targetId].targetDe.. " zu reisen.", "You have chosen to travel to " ..teleporterList[targetId].nameEn..".")
end

local function startTeleport(user, sourceItem)
    local dialogTitle
    local dialogAddText
    local dialogOption

    local priceTeleporter
    if user:isNewPlayer() then
        priceTeleporter = getTeleporterPriceNewbe()
    else
        priceTeleporter = getTeleporterPriceNormal()
    end
    local germanMoney, englishMoney = money.MoneyToString(priceTeleporter)

    common.TurnTo(user,sourceItem.pos)

    local callback = function(dialog)

        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()
            if dialogOption[selected+1][2] then
                if  money.CharHasMoney(user,priceTeleporter) then
                    money.TakeMoneyFromChar(user,priceTeleporter)
                   travelToTarget(user, dialogOption[selected+1][1])
                else
                    common.InformNLS(user,"Du hast nicht genug Geld für diese Reise. Die Reise kostet" .. germanMoney .." für eine Überfahrt.",
                                           "You don't have enough money for this journey. The journey costs" .. englishMoney .." for one passage.")
                end
            else
                common.InformNLS(user,"Es passiert überhaupt nichts. Dieses Ziel kann wohl gerade nicht erreicht werden.",
                                      "Nothing happens. It seems as though this destination cannot be reached for the moment.")
            end
        end
    end

    dialogTitle = common.GetNLS(user,"Teleporter","Teleporter")
    dialogAddText = common.GetNLS(user,"Eine Reise kostet" .. germanMoney ..". Wähle eine Ziel aus.",
                                       "A journey costs" .. englishMoney ..". Choose a destination.")
    local dialog = SelectionDialog(dialogTitle, dialogAddText, callback)
    dialog:setCloseOnMove()

    dialogOption = {}
    for i, teleporter in pairs(teleporterList) do
        local blockedOut, blockedIn = getSettingsForTeleporter(i)
        if not blockedIn and sourceItem.pos ~= teleporter.posItem then
            dialog:addOption(teleporter.pict, common.GetNLS(user,teleporter.nameDe,teleporter.nameEn))
            table.insert(dialogOption,{i,true})
        elseif sourceItem.pos ~= teleporter.posItem then
            dialog:addOption(teleporter.pict, common.GetNLS(user,teleporter.nameDe .. " (keine Verbindung)",
                                                                 teleporter.nameEn .. " (no connection)"))
            table.insert(dialogOption,{i,false})
        end
    end
    user:requestSelectionDialog(dialog)
end

function M.teleporterLookAt(user, sourceItem, lookAt)
    for i, teleporter in pairs(teleporterList) do
        if sourceItem.pos == teleporter.posItem then
            local blockedOut, blockedIn = getSettingsForTeleporter(i)
            lookAt.name = common.GetNLS(user,"Teleporter","Teleporter")
            if blockedOut then
                lookAt.description = common.GetNLS(user,"Die magische Aura des Teleporters scheint verschwunden.",
                                                        "The magic aura of the teleporter is missing.")
            else
                lookAt.description = common.GetNLS(user,teleporter.nameDe,teleporter.nameEn)
            end
            return true, lookAt
        end
    end
    return false
end

local function gmManageCostTeleporterNormal(user)
    local dialogTitle
    local dialogAddText
    local priceTeleporter = getTeleporterPriceNormal()
    local germanMoney, englishMoney = money.MoneyToString(priceTeleporter)
    local thisInputDialog = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local input = dialog:getInput()

        if not common.IsNilOrEmpty(input) then
            local newPrice = tonumber(input)
            if newPrice ~= nil then
                if newPrice > 0 and newPrice <= 1000000 then --100 gold
                    setTeleporterPriceNormal(newPrice)
                    germanMoney, englishMoney = money.MoneyToString(newPrice)
                    user:inform("The new standard teleporter price is"..englishMoney.." .")
                    user:logAdmin("[Teleporter] Standard teleporter price changed to"..englishMoney.." .")
                    return
                end
                user:inform("The price for the teleporter must be in between 1 Copper and 100 Gold")
            end
        end

    end
    dialogTitle = common.GetNLS(user,"Teleporter - Einstellungen","Teleporter - Settings")
    dialogAddText = common.GetNLS(user,"Standardpreis eines Teleports:"..englishMoney.." ("..tostring(priceTeleporter).." Kupfer)\nBitte neuen Preis in Kupferstücken angeben.",
                                       "Standard price of one teleport:"..englishMoney.." ("..tostring(priceTeleporter).." copper)\nPlease enter new price in amount of copper.")

    user:requestInputDialog(InputDialog(dialogTitle, dialogAddText ,false, 255, thisInputDialog))
end

local function gmManageCostTeleporterNewbe(user)
    local dialogTitle
    local dialogAddText
    local priceTeleporter = getTeleporterPriceNewbe()
    local germanMoney, englishMoney = money.MoneyToString(priceTeleporter)
    local thisInputDialog = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local input = dialog:getInput()

        if not common.IsNilOrEmpty(input) then
            local newPrice = tonumber(input)
            if newPrice ~= nil then
                if newPrice > 0 and newPrice <= 1000000 then --100 gold
                    setTeleporterPriceNewbe(newPrice)
                    germanMoney, englishMoney = money.MoneyToString(newPrice)
                    user:inform("The new teleporter price for new player is"..englishMoney.." .")
                    user:logAdmin("[Teleporter] Teleporter price for new player changed to"..englishMoney.." .")
                    return
                end
                user:inform("The price for the teleporter must be in between 1 Copper and 100 Gold")
            end
        end

    end
    dialogTitle = common.GetNLS(user,"Teleporter - Einstellungen","Teleporter - Settings")
    dialogAddText = common.GetNLS(user,"Preis eins Teleports für neue Spieler:"..englishMoney.." ("..tostring(priceTeleporter).." Kupfer)\nBitte neuen Preis in Kupferstücken angeben.",
                                       "Price of one teleport for new player:"..englishMoney.." ("..tostring(priceTeleporter).." copper)\nPlease enter new price in amount of copper.")

    user:requestInputDialog(InputDialog(dialogTitle, dialogAddText ,false, 255, thisInputDialog))
end

local function gmManageBlockTeleporter(user,teleporterId)
    local dialogTitle
    local dialogAddText
    local blockedOut
    local blockedIn

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if (not dialog:getSuccess()) then
            return
        end
        local selected = dialog:getSelectedIndex()
        if (selected == 0 or selected == 2) and blockedOut then
            setOutgoing(teleporterId, false)
        elseif (selected == 1 or selected == 3) and not blockedOut then
            setOutgoing(teleporterId, true)
        end
        if (selected == 0 or selected == 1) and blockedIn then
            setIncoming(teleporterId, false)
        elseif (selected == 2 or selected == 3) and not blockedIn then
            setIncoming(teleporterId, true)
        end
    end
    blockedOut, blockedIn = getSettingsForTeleporter(teleporterId)
    dialogTitle = common.GetNLS(user,"Teleporter - Einstellungen","Teleporter - Settings")
    dialogAddText = common.GetNLS(user,teleporterList[teleporterId].nameDe,teleporterList[teleporterId].nameEn) .. "\n" ..blockText(user,blockedOut, blockedIn)

    local dialog = SelectionDialog(dialogTitle, dialogAddText, callback)
    dialog:addOption(0, common.GetNLS(user,"Voll in Betrieb","Fully operational"))
    dialog:addOption(0, common.GetNLS(user,"Nur ankommende Reisende","Incoming travellers only"))
    dialog:addOption(0, common.GetNLS(user,"Nur abreisede Reisende","Outgoing travellers only"))
    dialog:addOption(0, common.GetNLS(user,"Außer Betrieb","Out of operation"))
    user:requestSelectionDialog(dialog)
end

function M.gmManageTeleporter(user)
    local optionList = {}
    local dialogTitle
    local dialogAddText
    local blockedOut
    local blockedIn
    local germanMoney
    local englishMoney
    local SELECT_COST_NORMAL = 10001
    local SELECT_COST_NEWBE = 10002

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if (not dialog:getSuccess()) then
            return
        end
        local selected = dialog:getSelectedIndex()
        local selectedOption = optionList[selected+1]
        if selectedOption == SELECT_COST_NORMAL then
            gmManageCostTeleporterNormal(user)
        elseif selectedOption == SELECT_COST_NEWBE then
            gmManageCostTeleporterNewbe(user)
        else
            gmManageBlockTeleporter(user,selectedOption)
        end
    end
    dialogTitle = common.GetNLS(user,"Teleporter - Einstellungen","Teleporter - Settings")
    dialogAddText = common.GetNLS(user,"Wähle die gewünsche Einstellung aus oder den Teleporter aus",
                                       "Select the property or the teleporter.")
    local dialog = SelectionDialog(dialogTitle, dialogAddText, callback)
    germanMoney, englishMoney = money.MoneyToString(getTeleporterPriceNormal())
    dialog:addOption(61, common.GetNLS(user,"Standardkosten Teleporter ("..germanMoney..")","Standard costs teleport ("..englishMoney..")"))
    table.insert(optionList, SELECT_COST_NORMAL)
    germanMoney, englishMoney = money.MoneyToString(getTeleporterPriceNewbe())
    dialog:addOption(3077, common.GetNLS(user,"Kosten für neue Spieler ("..germanMoney..")","Cost for new player ("..englishMoney..")"))
    table.insert(optionList, SELECT_COST_NEWBE)
    for i, teleporter in pairs (teleporterList) do
        if not common.IsNilOrEmpty(teleporter.nameDe) and not common.IsNilOrEmpty(teleporter.nameEn) then
            blockedOut, blockedIn = getSettingsForTeleporter(i)
            dialog:addOption(teleporter.pict, common.GetNLS(user,teleporter.nameDe,teleporter.nameEn).." ("..blockText(user,blockedOut, blockedIn)..")")
            table.insert(optionList, i)
        end
    end
    user:requestSelectionDialog(dialog)
end

function M.isBlocked(targetPos)
    for i, teleporter in pairs(teleporterList) do
        if targetPos == teleporter.posWarp then
            local blockedOut, blockedIn = getSettingsForTeleporter(i)
            if  blockedIn then
                return true
            end
            return false
        end
    end
    return false
end

function M.useTeleporter(user, sourceItem)
    for i, teleporter in pairs(teleporterList) do
        if sourceItem.pos == teleporter.posItem then
            local blockedOut, blockedIn = getSettingsForTeleporter(i)
            if not blockedOut then
                startTeleport(user, sourceItem)
            end
            return true
        end
    end
    return false
end

return M
