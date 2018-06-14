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
local common = require("base.common")
local money = require("base.money")
local magicgemming = require("craft.final.magicgemming")

local M = {}

local slots = {}
    table.insert(slots, Character.left_tool)
    table.insert(slots, Character.right_tool)
    table.insert(slots, Character.head)
    table.insert(slots, Character.breast)
    table.insert(slots, Character.hands)
    table.insert(slots, Character.legs)
    table.insert(slots, Character.feet)
    table.insert(slots, Character.belt_pos_1)
    table.insert(slots, Character.belt_pos_2)
    table.insert(slots, Character.belt_pos_3)
    table.insert(slots, Character.belt_pos_4)
    table.insert(slots, Character.belt_pos_5)
    table.insert(slots, Character.belt_pos_6)


local function isSocketable(itemId)
    -- weapons can be socketed
    local weaponfound, weaponitem = world:getWeaponStruct(itemId)
    if weaponfound then
        local weapontype=weaponitem.WeaponType
        if weapontype == WeaponStruct.arrow or weapontype == WeaponStruct.bolt or weapontype == WeaponStruct.stone or weapontype == WeaponStruct.shield then
            return false  -- Ammo or shield. Not socketable
        elseif weapontype == WeaponStruct.firearm and weaponitem.AmmunitionType == 255 then
            return false -- Throwing weapons. Not socketable. (Bows and Crossbows allowed)
        else
            return true
        end
    end

    -- armours can also be socketed
    local armorfound, armorItem = world:getArmorStruct(itemId)
    if armorfound then
        local armortype = armorItem.Type
        if armortype ==  ArmorStruct.clothing or armortype == ArmorStruct.general or armortype == ArmorStruct.juwellery then
            return false
        else
            return true
        end
    end

    -- tools can also be socketed
    local toolList = {72,74,121,2781,2697,122,311,2710,23,2709,227,737,47,2495,9,24,6,271,126,2763,2751,2140,2752,2715}
    -- 72:fishing rod;74:hatchet;121:peel;2781:dyeing rod;2697:rasp;122:finesmithing hammer;311:glass blow pipe;2710:mould;23:hammer;2709:armourer's hammer;227:cooking spoon;737:chisel;47:needle;2495:pan;9:saw;24:shovel;6:scissors;271:scythe;126:sickle;2763:pick-axe;2751:crucible-pincers;2140:tongs;2752:carving tools;2715:plane
    for i in pairs(toolList) do
        if itemId == toolList[i] then
            return true
        end
    end

    return false
end

local function getSocketablePositions(user)
    local socketableTable = {}

    for i=1,#slots do
        local slot = slots[i]
        local item = user:getItemAt(slot)
        if item ~= nil then
            if isSocketable(item.id) then
                    table.insert(socketableTable, slot)
            end
        end
    end

    return socketableTable
end

local function getUnsocketablePositions(user)
    local socketableTable = {}

    for i=1,#slots do
        local slot = slots[i]
        local item = user:getItemAt(slot)
        if gems.itemHasGems(item) then
            local itemId = item.id
            if isSocketable(itemId) then
                table.insert(socketableTable, slot)
            end
        end
    end

    return socketableTable
end

function M.handleSocketing(user, gem)
    local socketablePositions = getSocketablePositions(user)
    if #socketablePositions == 0 then
        user:inform("Es ist kein sockelbarer Gegenstand in deinem Inventar!",
                    "There is no socketable item in your inventory!", Character.highPriority)
        return
    end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success and common.CheckItem(user, gem) then
            local selected = dialog:getSelectedIndex() + 1
            local slot = socketablePositions[selected]
            local item = user:getItemAt(slot)

            if isSocketable(item.id) then
                local key = gems.getDataKey(gem.id)
                local level = item:getData(key)

                if level == "" then
                    local newLevel = tonumber(gem:getData(gems.levelDataKey)) or 1 --If the gem has no level set, it's 1 by default.
                    item:setData(key, newLevel)
                    world:erase(gem, 1)
                    world:changeItem(item)
                    user:inform("Der gewählte Gegenstand wurde gesockelt.",
                                "The selected item has been socketed.")
                else
                    user:inform("Dieser Gegenstand beinhaltet bereits einen Edelstein dieser Art!",
                                "This item contains a gem of this kind already!", Character.highPriority)
                end
            end
        end
    end

    local language = user:getPlayerLanguage()
    local caption = common.GetNLS(user, "Sockeln", "Socketing")
    local description = common.GetNLS(user, "Bitte wähle einen Gegenstand der gesockelt werden soll:",
                                            "Please select an item to insert the gem into:")
    local dialog = SelectionDialog(caption, description, callback)
    dialog:setCloseOnMove()

    for i=1,#socketablePositions do
        local slot = socketablePositions[i]
        local itemId = user:getItemAt(slot).id
        local name = world:getItemName(itemId, language)
        dialog:addOption(itemId, name)
    end

    user:requestSelectionDialog(dialog)
end

local function unsocketGems(user)
    local unsocketPositions = getUnsocketablePositions(user)

    if #unsocketPositions == 0 then
        user:inform("Es ist kein entsockelbarer Gegenstand in deinem Inventar!",
                    "There is no unsocketable item in your inventory!", Character.highPriority)
        return
    end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex() + 1
            local slot = unsocketPositions[selected]
            local item = user:getItemAt(slot)
            local price = world:getItemStats(item).Worth
            if isSocketable(item.id) and gems.itemHasGems(item) then
                if money.CharHasMoney(user, price) then
                    gems.returnGemsToUser(user, item)
                    money.TakeMoneyFromChar(user, price, false)

                    local gstring, estring = money.MoneyToString(price)
                    user:inform("Alle Edelsteine wurden aus dem Gegenstand entfernt und dir zurückgegeben für den Preis von " .. gstring ..".",
                                "All gems were removed from the item and returned to you for the cost of " .. estring ..".")
                else
                    user:inform("Du hast nicht genug Münzen!", "You do not have enough coins!", Character.highPriority)
                end
            end
        end
    end

    local language = user:getPlayerLanguage()
    local caption = common.GetNLS(user, "Entsockeln", "Unsocketing")
    local description = common.GetNLS(user, "Bitte wähle einen Gegenstand der entsockelt werden soll. Kosten sind abhängig vom Wert des Gegenstands",
                                                 "Please select an item to remove all gems from. Cost depends on worth of the item")
    local dialog = SelectionDialog(caption, description, callback)
    dialog:setCloseOnMove()

    for i=1,#unsocketPositions do
        local slot = unsocketPositions[i]
        local item = user:getItemAt(slot)
        local price = world:getItemStats(item).Worth
        local gstring, estring = money.MoneyToString(price)
        local name = world:getItemName(item.id, language) .. " (" .. common.GetNLS(user, gstring, estring) .. ")"
        dialog:addOption(item.id, name)
    end

    user:requestSelectionDialog(dialog)
end

function M.magicSmith(npc, player)
    local callback = function(dialog)
        local success = dialog:getSuccess()

        if success then
            local selected = dialog:getSelectedIndex()

            if selected == 0 then
                magicgemming.magicgemming:showDialog(player, npc)
            elseif selected == 1 then
                unsocketGems(player)
            end
        end
    end

    local title = common.GetNLS(player, "Magieschmied", "Magic Blacksmith")
    local text = common.GetNLS(player, "Wie kann ich behilflich sein?", "How may I be of assistance?")
    local dialog = SelectionDialog(title, text, callback)
    dialog:setCloseOnMove()

    local ITEM_ID_HAMMER = 122
    local ITEM_ID_TONGS = 2140

    dialog:addOption(ITEM_ID_HAMMER, common.GetNLS(player, "Edelsteine vereinigen", "Combine gems"))
    dialog:addOption(ITEM_ID_TONGS, common.GetNLS(player, "Edelsteine herauslösen", "Unsocket gems"))

    player:requestSelectionDialog(dialog)
end

return M

