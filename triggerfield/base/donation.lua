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
local money = require("base.money")
local townTreasure = require("base.townTreasure")
local gems = require("base.gems")

local M = {}

local containers = {Item.wickerBasket, Item.leatherBag}

local function isContainer(itemId) --Future proofing for when we have more than two portable containers
    for _, container in pairs(containers) do
        if itemId == container then
            return true
        end
    end
    return false
end

local function findBags(coordinates)

    local bags = {}

    for _, coordinate in pairs(coordinates) do
        if world:isItemOnField(coordinate) then
            local potentialBag = world:getItemOnField(coordinate)

            for _, container in pairs(containers) do
                if container == potentialBag.id then
                    table.insert(bags, potentialBag)
                end
            end
        end
    end

    return bags
end

local function donateContentsOfBags(bags, realm)

    local Treasury = "Treasure"..realm

    local LeaderName = realm == "Cadomyr" and "Rosaline Edwards" or realm == "Galmair" and "Valerio Guilianni" or realm == "Runewick" and "Elvaine Morgan"

    for _, bag in pairs(bags) do

        local itemType = bag:getType()

        if (itemType == scriptItem.field and bag:isContainer()) then
            local field = world:getField(bag.pos)
            local container = field:getContainer(bag.number)
            if container then

                local slots = container:getSlotCount()

                for i = 0, slots-1 do

                    local success, donatedItem = container:viewItemNr(i)

                    if success and donatedItem and donatedItem.id ~= 0 then
                        M.donate(donatedItem, false, realm, LeaderName, Treasury, container)
                    end
                end
            end
        end
    end
end

local coordinates = {
    Galmair = {position(339, 217, 0), position(339, 216, 0), position(340, 217, 0), position(340, 216, 0)},
    Cadomyr = {position(116, 520, 0), position(115, 520, 0), position(116, 521, 0), position(115, 521, 0)},
    Runewick = {position(943, 785, 1), position(942, 784, 1), position(942, 785, 1), position(943, 784, 1)}
}

local realms = {"Galmair", "Cadomyr", "Runewick"}

function M.scheduledBagDonationCheck()

    for _, realm in pairs(realms) do

        if _G[realm.."donationDirty"] then --It's been flagged as dirty, at least one bag should exist on there with items yet to be donated

            _G[realm.."donationDirty"] = false

            local bags = findBags(coordinates[realm])

            if #bags > 0 then
                donateContentsOfBags(bags, realm)
            end
        end

    end

end

function M.donate(donatedItem, user, FactionName, LeaderName, Treasury, container)

    -- This function donates 10% of the worth of an item to the faction

    local donated
    local ItemStats = world:getItemStats(donatedItem)

    if ItemStats.Worth == 0 then -- worthless item -> inform

        if user then
            common.InformNLS(user, "[Spende] Dieser Gegenstand ist wertlos.", "[Donation] This item is worthless.") -- Feedback!
        end
        donated = false -- no donation

    elseif isContainer(donatedItem.id) then

        -- The contents of a bag or basket can only be evaluated after it has been moved, as while it is moved it is not in existence to be checked
        -- As such, we flag it as dirty here so it can be picked up by a scheduled script to have its contents donated

        if not container then
            _G[FactionName.."donationDirty"] = true

            logPlayer("[Donation] Player "..user.name.."("..user.id..") has put a bag down for donations in "..FactionName)

            common.InformNLS(user,
                "[Spende] Du stellst eine Tasche für Spenden ab. Gib ihr etwas Zeit, und der Schatzmeister wird kommen, um deine Spenden einzusammeln.",
                "[Donation] You put a bag down for donations. Give it some time and the treasurer will come collect your donations.") -- Feedback!
        end

        donated = false -- donation delayed

    elseif gems.itemIsMagicGem (donatedItem) == true then --magic gems cannot be donated as the content of containers cannot be evaluated.

        if user then
            common.InformNLS(user, "[Spende] magische Edelsteine können nicht gespendet werden.", "[Donation] magic gems cannot be donated.") -- Feedback!
        end
        donated = false -- no donation

    else -- item with worth

        local payToFaction

        if donatedItem.id == 61 or donatedItem.id == 3076 or donatedItem.id == 3077 then -- coins

            payToFaction = donatedItem.number * ItemStats.Worth -- 100% of the worth are added for coins

        else

            local repairKitValue = donatedItem:getData("remainingValue")

            local itemWorth = ItemStats.Worth

            if not common.IsNilOrEmpty(repairKitValue) then --It is a repair kit that has been used before, lowering its value
                itemWorth = tonumber(repairKitValue)
            end

            payToFaction = donatedItem.number * itemWorth * 0.1 -- 10% of the worth are added for items

        end

        townTreasure.ChangeTownTreasure(FactionName, payToFaction)

        local gstring, estring = money.MoneyToString(payToFaction) --converting money to a string

        local userName = "unknown"
        local userId = "unknown"

        if user then
            userName = user.name
            userId = user.id
        end

        logPlayer("[Donation] Player "..userName.."("..userId..") has donated "..estring.." to "..FactionName.." in the form of "..donatedItem.number.." of item "..donatedItem.id)

        if user then
            common.InformNLS(user,
                "[Spende] Du spendest Gegenstände im Gegenwert von"..gstring.." in die Schatzkammer von "..FactionName..".",
                "[Donation] You donate items valued at"..estring.." to the treasury of "..FactionName..".") -- Feedback!
        end
        world:gfx(46, donatedItem.pos) -- nice GFX

        world:erase(donatedItem, donatedItem.number) -- delete the item

        donated = true -- donation worked

    end

    return donated -- returning whether the donation worked or not

end

return M
