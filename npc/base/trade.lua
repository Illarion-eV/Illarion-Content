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
--- Base NPC script for trader NPCs
--
-- This script offers the functions that are required to turn an NPC into a trader
--
-- Author: Martin Karing

local class = require("base.class")
local common = require("base.common")
local lookat = require("base.lookat")
local messages = require("base.messages")
local money = require("base.money")
local baseNPC = require("npc.base.basic")

local isFittingItem
local tradeNPCItem
local PRIMARY_PRICE = 0.15
local SECONDARY_FRACTION = 2/3

local tradeNPC = class(function(self, rootNPC)
    if rootNPC == nil or not rootNPC:is_a(baseNPC) then
        return
    end
    self["_parent"] = rootNPC

    self["_sellItems"] = {}

    self["_buyPrimaryItems"] = {}
    self["_buySecondaryItems"] = {}

    self["_wrongItemMsg"] = messages.Messages()
    self["_notEnoughMoneyMsg"] = messages.Messages()
    self["_dialogClosedMsg"] = messages.Messages()
    self["_dialogClosedNoTradeMsg"] = messages.Messages()
end)

function tradeNPC:addItem(item)
    if (item == nil or not item:is_a(tradeNPCItem)) then
        return
    end

    if (item._type == "sell") then
        table.insert(self._sellItems, item)
    else
        if (item._itemId == 97 or item._itemId == 320 or item._itemId == 321
            or item._itemId == 799 or item._itemId == 1367 or item._itemId == 2830) then
            debug("NPC can't buy item " .. item._itemId .. " because its blacklisted (container).")
        else
            if item._type == "buyPrimary" then
                table.insert(self._buyPrimaryItems, item)
            elseif item._type == "buySecondary" then
                table.insert(self._buySecondaryItems, item)
            end
        end
    end
end

function tradeNPC:addWrongItemMsg(msgGerman, msgEnglish)
    self._wrongItemMsg:addMessage(msgGerman, msgEnglish)
end

function tradeNPC:addNotEnoughMoneyMsg(msgGerman, msgEnglish)
    self._notEnoughMoneyMsg:addMessage(msgGerman, msgEnglish)
end

function tradeNPC:addDialogClosedMsg(msgGerman, msgEnglish)
    self._dialogClosedMsg:addMessage(msgGerman, msgEnglish)
end

function tradeNPC:addDialogClosedNoTradeMsg(msgGerman, msgEnglish)
    self._dialogClosedNoTradeMsg:addMessage(msgGerman, msgEnglish)
end

function tradeNPC:showDialog(npcChar, player)
    local anyTradeAction = false

    local callback = function(dialog)
        local result = dialog:getResult()
        if result == MerchantDialog.playerSells then
            self:buyItemFromPlayer(npcChar, player, dialog:getSaleItem())
            anyTradeAction = true
        elseif result == MerchantDialog.playerBuys then
            self:sellItemToPlayer(npcChar, player, dialog:getPurchaseIndex(), dialog:getPurchaseAmount())
            anyTradeAction = true
        elseif result == MerchantDialog.playerLooksAt then
            return self:playerLooksAtItem(player, dialog:getLookAtList(), dialog:getPurchaseIndex())
        elseif (not anyTradeAction and self._dialogClosedNoTradeMsg:hasMessages()) then
            local msgGerman, msgEnglish = self._dialogClosedNoTradeMsg:getRandomMessage()
            npcChar:talk(Character.say, msgGerman, msgEnglish)
        elseif (self._dialogClosedMsg:hasMessages()) then
            local msgGerman, msgEnglish = self._dialogClosedMsg:getRandomMessage()
            npcChar:talk(Character.say, msgGerman, msgEnglish)
        end
    end

    local dialog = MerchantDialog(common.GetNLS(player, "Handel", "Trade"), callback)

    for _, item in pairs(self._sellItems) do
        item:addToDialog(player, dialog)
    end
    for _, item in pairs(self._buyPrimaryItems) do
        item:addToDialog(player, dialog)
    end
    for _, item in pairs(self._buySecondaryItems) do
        item:addToDialog(player, dialog)
    end

    player:requestMerchantDialog(dialog)
end

function isFittingItem(tradeItem, boughtItem)
    if (tradeItem._itemId ~= boughtItem.id) then
        return false
    end

    if (tradeItem._data ~= nil and tradeItem._data ~= boughtItem.data) then
        return false
    end

    return true
end

function tradeNPC:buyItemFromPlayer(npcChar, player, boughtItem)
    -- Buying at special price
    local item

    for _, listItem in pairs(self._buyPrimaryItems) do
        if isFittingItem(listItem, boughtItem) then
            item = listItem
            break
        end
    end

    if item == nil then
        for _, listItem in pairs(self._buySecondaryItems) do
            if isFittingItem(listItem, boughtItem) then
                item = listItem
                break
            end
        end
    end

    if item then
        local price = item._price * boughtItem.number
        local priceStringGerman, priceStringEnglish = money.MoneyToString(price)
        local itemName = common.GetNLS(player, world:getItemName(boughtItem.id,0), world:getItemName(boughtItem.id,1))
        if world:erase(boughtItem, boughtItem.number) then
            if (money.GiveMoneyToChar(player, price) == false) then
                money.GiveMoneyToPosition(player.pos, price)
            end

            common.InformNLS(player, "Du hast "..boughtItem.number.." "..itemName.." zu einem Preis von "..priceStringGerman.." verkauft.", "You sold "..boughtItem.number.." "..itemName.." at a price of "..priceStringEnglish..".")
            world:makeSound(24, player.pos)
            log("[Sold] "..player.name.." sold "..boughtItem.number.." "..itemName.." at a price of "..priceStringEnglish.." to "..npcChar.name..".") --Log
        end

        return
    end

    -- Reject item
    if (self._wrongItemMsg:hasMessages()) then
        local msgGerman, msgEnglish = self._wrongItemMsg:getRandomMessage()
        npcChar:talk(Character.say, msgGerman, msgEnglish)
    end
end

function tradeNPC:sellItemToPlayer(npcChar, player, itemIndex, amount)
    local item = self._sellItems[itemIndex + 1]
    if (item == nil) then
        common.InformNLS(player, "Ein Fehler ist beim Kauf des Items aufgetreten.", "An error occurred while buying the item.")
        return
    end

    if (money.CharHasMoney(player, item._price * amount)) then
        money.TakeMoneyFromChar(player, item._price * amount)
        local priceStringGerman, priceStringEnglish = money.MoneyToString(item._price * amount)

        common.CreateItem(player, item._itemId, amount, item._quality, item._data)
        local itemName = common.GetNLS(player, world:getItemName(item._itemId, 0), world:getItemName(item._itemId, 1))
        common.InformNLS(player, "Du hast "..amount.." "..itemName.." zu einem Preis von"..priceStringGerman.." gekauft.", "You bought "..amount.." "..itemName.." at a price of"..priceStringEnglish..".")
        world:makeSound(24, player.pos)
        log("[Bought] "..player.name.." bought "..amount.." "..itemName.." at a price of"..priceStringEnglish.." from "..npcChar.name..".") --Log

    elseif (self._notEnoughMoneyMsg:hasMessages()) then
        local msgGerman, msgEnglish = self._notEnoughMoneyMsg:getRandomMessage()
        npcChar:talk(Character.say, msgGerman, msgEnglish)
    end
end

function tradeNPC:playerLooksAtItem(player, list, index)
   local item

   if list == MerchantDialog.listSell then
       item = self._sellItems[index + 1]
   elseif list == MerchantDialog.listBuyPrimary then
       item = self._buyPrimaryItems[index + 1]
   elseif list == MerchantDialog.listBuySecondary then
          item = self._buySecondaryItems[index + 1]
   end

   return lookat.GenerateItemLookAtFromId(player, item._itemId, item._stack, item._data)
end

tradeNPCItem = class(function(self, id, itemType, nameDe, nameEn, price, stack, quality, data)
    if (id == nil or id <= 0) then
        error("Invalid ItemID for trade item")
    end

    if (itemType ~= "sell" and itemType ~= "buyPrimary" and itemType ~= "buySecondary") then
        error("Invalid type for trade item")
    end

    self["_itemId"] = id
    self["_type"] = itemType

    if (nameDe == nil or nameEn == nil) then
        self["_nameDe"] = world:getItemName(id, Player.german)
        self["_nameEn"] = world:getItemName(id, Player.english)
    else
        self["_nameDe"] = nameDe
        self["_nameEn"] = nameEn
    end

    if (price == nil) then
        if (itemType == "sell") then
            self["_price"] = world:getItemStatsFromId(id).Worth
        elseif (itemType == "buyPrimary") then
            self["_price"] = world:getItemStatsFromId(id).Worth * PRIMARY_PRICE
        elseif (itemType == "buySecondary") then
            self["_price"] = world:getItemStatsFromId(id).Worth * PRIMARY_PRICE * SECONDARY_FRACTION
        end
    else
        self["_price"] = price
    end

    if (itemType == "sell" and stack ~= nil) then
        self["_stack"] = stack
    else
        self["_stack"] = world:getItemStatsFromId(id).BuyStack
        if (self["_stack"] == nil) then
            debug("_stack is NIL, the server failed! Hard.")
            self["_stack"] = 1
        end
    end

    if (itemType == "sell" and quality ~= nil) then
        self["_quality"] = quality
    else
        self["_quality"] = 580
    end

    if (itemType == "sell") then
        self["_data"] = data
    else
        self["_data"] = nil
    end
end)

function tradeNPCItem:addToDialog(player, dialog)
    local name = common.GetNLS(player, self._nameDe, self._nameEn)
    if (self._type == "sell") then
        dialog:addOffer(self._itemId, name, self._price * self._stack, self._stack)
    elseif (self._type == "buyPrimary") then
        dialog:addPrimaryRequest(self._itemId, name, self._price)
    else
        dialog:addSecondaryRequest(self._itemId, name, self._price)
    end
end

tradeNPC["tradeNPCItem"] = tradeNPCItem
return tradeNPC
