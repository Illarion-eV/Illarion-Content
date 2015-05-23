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
local lookat = require("base.lookat")
local factions = require("base.factions")
local analysis = require("alchemy.base.analysis")
local money = require("base.money")
local crafts = require("item.base.crafts")
local vision = require("content.vision")

-- UPDATE items SET itm_script='item.gems' WHERE itm_id IN (45, 46, 197, 198, 283, 284, 285);

local M = {}

M.DIAMOND  = 1
M.EMERALD  = 2
M.RUBY     = 3
M.OBSIDIAN = 4
M.SAPPHIRE = 5
M.AMETHYST = 6
M.TOPAZ    = 7

local gemItem = {}
gemItem[M.DIAMOND] = 285
gemItem[M.EMERALD] = 45
gemItem[M.RUBY] = 46
gemItem[M.OBSIDIAN] = 283
gemItem[M.SAPPHIRE] = 284
gemItem[M.AMETHYST] = 197
gemItem[M.TOPAZ] = 198

local gemId = {}
gemId[285] = M.DIAMOND
gemId[45] = M.EMERALD
gemId[46] = M.RUBY
gemId[283] = M.OBSIDIAN
gemId[284] = M.SAPPHIRE
gemId[197] = M.AMETHYST
gemId[198] = M.TOPAZ

local gemDataKey = {}
gemDataKey[M.DIAMOND] = "magicalDiamond"
gemDataKey[M.EMERALD] = "magicalEmerald"
gemDataKey[M.RUBY] = "magicalRuby"
gemDataKey[M.OBSIDIAN] = "magicalObsidian"
gemDataKey[M.SAPPHIRE] = "magicalSapphire"
gemDataKey[M.AMETHYST] = "magicalAmethyst"
gemDataKey[M.TOPAZ] = "magicalTopaz"

local levelDataKey = "gemLevel"

M.gemPrefixDE = {"Latent", "Bedingt", "Leicht", "Mäßig", "Durchschnittlich", "Bemerkenswert", "Stark", "Sehr stark", "Unglaublich", "Einzigartig"}
M.gemPrefixEN = {"Latent", "Limited", "Slight", "Moderate", "Average", "Notable", "Strong", "Very Strong", "Unbelievable", "Unique"}

local gemLevelRareness = {}
gemLevelRareness[1] = ItemLookAt.uncommonItem
gemLevelRareness[2] = ItemLookAt.uncommonItem
gemLevelRareness[3] = ItemLookAt.uncommonItem
gemLevelRareness[4] = ItemLookAt.rareItem
gemLevelRareness[5] = ItemLookAt.rareItem
gemLevelRareness[6] = ItemLookAt.rareItem
gemLevelRareness[7] = ItemLookAt.epicItem
gemLevelRareness[8] = ItemLookAt.epicItem
gemLevelRareness[9] = ItemLookAt.epicItem
gemLevelRareness[10] = ItemLookAt.epicItem

function lookAtFilter(user, lookAt, data)
    local gemLevel = data.gemLevel

    if gemLevel then
        if user:getPlayerLanguage() == 0 then
            lookAt.name = M.gemPrefixDE[gemLevel] .. " magischer " .. lookAt.name
        else
            lookAt.name = M.gemPrefixEN[gemLevel] .. " Magical " .. lookAt.name
        end

        lookAt.rareness = gemLevelRareness[gemLevel]
    end

    return lookAt
end


gemCraft = crafts.Craft:new{
    craftEN = "Magic Blacksmith",
    craftDE = "Magieschmied",
    npcCraft = true,
    lookAtFilter = lookAtFilter,
}

local categoryId = {}
categoryId[M.EMERALD] = gemCraft:addCategory("Emerald", "Smaragd")
categoryId[M.RUBY] = gemCraft:addCategory("Ruby", "Rubin")
categoryId[M.OBSIDIAN] = gemCraft:addCategory("Obsidian", "Obsidian")
categoryId[M.SAPPHIRE] = gemCraft:addCategory("Sapphire", "Saphir")
categoryId[M.AMETHYST] = gemCraft:addCategory("Amethyst", "Amethyst")
categoryId[M.TOPAZ] = gemCraft:addCategory("Topaz", "Topas")

local gem, level, product
for gem=1,7 do
    local catId = categoryId[gem]
    if catId then
        for level=2,10 do
            local duration = level * 10
            product = gemCraft:addProduct(catId, gemItem[gem], 0, 0, duration, duration*2, 1, {gemLevel = level})
            product:addIngredient(gemItem[gem], 3, {gemLevel = level-1})
        end
    end
end

function M.getMagicGemId(gem, level)
    local level = level or 1
    return gemItem[gem]
end

function M.getMagicGemData(level)
    local level = level or 1
    return {gemLevel = level}
end

function M.LookAtItem(user, item)
    local lookAt = lookat.GenerateLookAt(user, item)

    local data = {}
    data.gemLevel = tonumber(item:getData(levelDataKey))

    lookAt = lookAtFilter(user, lookAt, data)

    return lookAt
end

function M.UseItem(User, SourceItem, ltstate)
    if SourceItem:getData(levelDataKey) == "" then
        analysis.AnalysisMain(User,SourceItem)
        return
    end

    local TargetItemEvilRock = common.GetItemInArea(User.pos, 2805);
    local AmountDarkColumnEvilrock = #vision.darkColumnEvilrock
    if TargetItemEvilRock ~= nil then
        for i = 1,AmountDarkColumnEvilrock do
            if TargetItemEvilRock.pos == vision.darkColumnEvilrock[i] then
                common.TurnTo(User,TargetItemEvilRock.pos); -- turn if necessary
                vision.UseDarkColumns(User,TargetItemEvilRock,ltstate)
                return
            end
        end
    end

    handleSocketing(User, SourceItem)
end

function handleSocketing(user, gem)
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
                local key = gemDataKey[gemId[gem.id]]
                local level = item:getData(key)

                if level == "" then
                    local newLevel = gem:getData(levelDataKey)
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
    local description = common.GetNLS(user, "Bitte wähle einen Gegenstand der gesockelt werden soll:", "Please select an item to insert the gem into:")
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

function getSocketablePositions(user, filter)
    local socketableTable = {}

    for i=1,#slots do
        local slot = slots[i]
        local item = user:getItemAt(slot)

        if not filter or filter(item) then
            local itemId = item.id

            if isSocketable(itemId) then
                table.insert(socketableTable, slot)
            end
        end
    end

    return socketableTable
end

function getUnsocketablePositions(user, filter)
    local socketableTable = {}

    for i=1,#slots do
        local slot = slots[i]
        local item = user:getItemAt(slot)

        if not filter or filter(item) then
            local itemId = item.id

            if isUnsocketable(itemId) then
                table.insert(socketableTable, slot)
            end
        end
    end

    return socketableTable
end

function isSocketable(itemId)
    -- weapons can be socketed
    local weaponfound, weaponitem = world:getWeaponStruct(itemId)
    if weaponfound then
        local weapontype=weaponitem.WeaponType
        if weapontype== WeaponStruct.firearm or weapontype==WeaponStruct.arrow or weapontype==WeaponStruct.bolt
                or weapontype==WeaponStruct.stone or weapontype==WeaponStruct.shield then
            return false  -- Throwing weapon, ammo or shield. Not socketable
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

    return false
end

function isUnsocketable(itemId)
    -- currently only weapons and armours can be socketed
    return world:getWeaponStruct(itemId) or world:getArmorStruct(itemId)
end

function M.magicSmith(npc, player)
    local callback = function(dialog)
        local success = dialog:getSuccess()

        if success then
            local selected = dialog:getSelectedIndex()

            if selected == 0 then
                gemCraft:showDialog(player, npc)
            elseif selected == 1 then
                unsocketGems(player)
            end
        end
    end

    local title = common.GetNLS(player, "Magieschmied", "Magic Blacksmith")
    local text = common.GetNLS(player, "Wie kann ich behilflich sein?", "How may I be of assistance?")
    local dialog = SelectionDialog(title, text, callback)
    dialog:setCloseOnMove()

    local hammer = 122
    local tongs = 2140

    dialog:addOption(hammer, common.GetNLS(player, "Edelsteine vereinigen", "Combine gems"))
    dialog:addOption(tongs, common.GetNLS(player, "Edelsteine herauslösen", "Unsocket gems"))

    player:requestSelectionDialog(dialog)
end

function unsocketGems(user)
    local unsocketPositions = getUnsocketablePositions(user, itemHasGems)

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
            if isUnsocketable(item.id) and itemHasGems(item) then
                if money.CharHasMoney(user, price) then
                    for i = 1, #gemDataKey do
                        local itemKey = gemDataKey[i]
                        local level = tonumber(item:getData(itemKey))

                        if level and level > 0 then
                            local notCreated = user:createItem(gemItem[i], 1, 999, {[levelDataKey] = level})
                            if notCreated > 0 then
                                world:createItemFromId(gemItem[i], 1, user.pos, true, 999, {[levelDataKey] = level})
                            end

                            item:setData(itemKey, "")
                        end
                    end

                    money.TakeMoneyFromChar(user, price)
                    world:changeItem(item)

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

function itemHasGems(item)
    return gems.getGemBonus(item) > 0
end

return M

