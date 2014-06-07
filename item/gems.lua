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
require("base.gems")
require("content.lookat.unique")
require("base.common")
require("base.lookat")
require("base.factions")
require("alchemy.base.analysis")
require("base.money")
require("item.base.crafts")
require("content.vision")

-- UPDATE common SET com_script='item.gems' WHERE com_itemid IN (45, 46, 197, 198, 283, 284, 285);

module("item.gems", package.seeall)

DIAMOND  = 1
EMERALD  = 2
RUBY     = 3
OBSIDIAN = 4
SAPPHIRE = 5
AMETHYST = 6
TOPAZ    = 7

gemItem = {}
gemItem[DIAMOND] = 285
gemItem[EMERALD] = 45
gemItem[RUBY] = 46
gemItem[OBSIDIAN] = 283
gemItem[SAPPHIRE] = 284
gemItem[AMETHYST] = 197
gemItem[TOPAZ] = 198

gemId = {}
gemId[285] = DIAMOND
gemId[45] = EMERALD
gemId[46] = RUBY
gemId[283] = OBSIDIAN
gemId[284] = SAPPHIRE
gemId[197] = AMETHYST
gemId[198] = TOPAZ

gemDataKey = {}
gemDataKey[DIAMOND] = "magicalDiamond"
gemDataKey[EMERALD] = "magicalEmerald"
gemDataKey[RUBY] = "magicalRuby"
gemDataKey[OBSIDIAN] = "magicalObsidian"
gemDataKey[SAPPHIRE] = "magicalSapphire"
gemDataKey[AMETHYST] = "magicalAmethyst"
gemDataKey[TOPAZ] = "magicalTopaz"

levelDataKey = "gemLevel"

gemPrefixDE = {"Latent", "Bedingt", "Leicht", "Mäßig", "Durchschnittlich", "Bemerkenswert", "Stark", "Sehr stark", "Unglaublich", "Einzigartig"}
gemPrefixEN = {"Latent", "Limited", "Slight", "Moderate", "Average", "Notable", "Strong", "Very Strong", "Unbelievable", "Unique"}

gemLevelRareness = {}
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
            lookAt.name = gemPrefixDE[gemLevel] .. " magischer " .. lookAt.name
        else
            lookAt.name = gemPrefixEN[gemLevel] .. " Magical " .. lookAt.name
        end

        lookAt.rareness = gemLevelRareness[gemLevel]
    end

    return lookAt
end


gemCraft = item.base.crafts.Craft:new{
    craftEN = "Magic Blacksmith",
    craftDE = "Magieschmied",
    leadSkill = base.factions.getRankpoints,
    npcCraft = true,
    lookAtFilter = lookAtFilter,
}

local categoryId = {}
categoryId[EMERALD] = gemCraft:addCategory("Emerald", "Smaragd")
categoryId[RUBY] = gemCraft:addCategory("Ruby", "Rubin")
categoryId[OBSIDIAN] = gemCraft:addCategory("Obsidian", "Obsidian")
categoryId[SAPPHIRE] = gemCraft:addCategory("Sapphire", "Saphir")
categoryId[AMETHYST] = gemCraft:addCategory("Amethyst", "Amethyst")
categoryId[TOPAZ] = gemCraft:addCategory("Topaz", "Topas")

local gem, level, product
for gem=1,7 do
    local catId = categoryId[gem]
    if catId then
        for level=2,10 do
            local requirement = (level - 2) * 10
            local duration = level * 10
            product = gemCraft:addProduct(catId, gemItem[gem], requirement, requirement+10, duration, duration*2, 1, {gemLevel = level})
            product:addIngredient(gemItem[gem], 3, {gemLevel = level-1})
        end
    end
end

function getMagicGemId(gem, level)
    local level = level or 1
    return gemItem[gem]
end

function getMagicGemData(level)
    local level = level or 1
    return {gemLevel = level}
end

function LookAtItem(user, item)
    local lookAt = base.lookat.GenerateLookAt(user, item)

    local data = {}
    data.gemLevel = tonumber(item:getData(levelDataKey))

    lookAt = lookAtFilter(user, lookAt, data)

    world:itemInform(user, item, lookAt)
end

function UseItem(User, SourceItem, ltstate)
    if SourceItem:getData(levelDataKey) == "" then
	    alchemy.base.analysis.CauldronPotionCheck(User, SourceItem, TargetItem, ltstate)
		return
	end

	local TargetItemEvilRock = base.common.GetItemInArea(User.pos, 2805);
	local AmountDarkColumnEvilrock = table.getn(content.vision.darkColumnEvilrock)
	if TargetItemEvilRock ~= nil then
		for i = 1,AmountDarkColumnEvilrock do
			if TargetItemEvilRock.pos == content.vision.darkColumnEvilrock[i] then
				base.common.TurnTo(User,TargetItemEvilRock.pos); -- turn if necessary
				content.vision.UseDarkColumns(User,TargetItemEvilRock,ltstate)
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
        if success and base.common.CheckItem(user, gem) then
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
    local caption = base.common.GetNLS(user, "Sockeln", "Socketing")
    local description = base.common.GetNLS(user, "Bitte wähle eine Waffe die gesockelt werden soll:", "Please select a weapon to insert the gem into:")
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

slots = {}
table.insert(slots, Character.left_tool)
table.insert(slots, Character.right_tool)
table.insert(slots, Character.belt_pos_1)
table.insert(slots, Character.belt_pos_2)
table.insert(slots, Character.belt_pos_3)
table.insert(slots, Character.belt_pos_4)
table.insert(slots, Character.belt_pos_5)
table.insert(slots, Character.belt_pos_6)

function getSocketablePositions(user, filter)
    socketableTable = {}

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
    socketableTable = {}

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
    -- currently only weapons can be socketed
	local weaponfound, weaponitem = world:getWeaponStruct(itemId);

	if weaponfound then
		local weapontype=weaponitem.WeaponType;
		if weapontype==10 or weapontype==11 or weapontype==14 then -- Ammo or shield. Not socketable
			return false;
		else
			return true;
		end
	end

    return false;
end

function isUnsocketable(itemId)
    -- currently only weapons can be socketed
    return world:getWeaponStruct(itemId);
end

function magicSmith(npc, player)
    local callback = function(dialog)
        success = dialog:getSuccess()

        if success then
            selected = dialog:getSelectedIndex()

            if selected == 0 then
                gemCraft:showDialog(player, npc)
            elseif selected == 1 then
                unsocketGems(player)
            end
        end
    end

    local title = base.common.GetNLS(player, "Magieschmied", "Magic Blacksmith")
    local text = base.common.GetNLS(player, "Wie kann ich behilflich sein?", "How may I be of assistance?")
    local dialog = SelectionDialog(title, text, callback)
    dialog:setCloseOnMove()

    local hammer = 122
    local tongs = 2140

    dialog:addOption(hammer, base.common.GetNLS(player, "Edelsteine vereinigen", "Combine gems"))
    dialog:addOption(tongs, base.common.GetNLS(player, "Edelsteine herauslösen", "Unsocket gems"))

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

            if isUnsocketable(item.id) and itemHasGems(item) then
                if base.money.CharHasMoney(user, 100000) then
                    for i = 1, #gemDataKey do
                        local itemKey = gemDataKey[i]
                        local level = tonumber(item:getData(itemKey))

                        if level and level > 0 then
                            notCreated = user:createItem(gemItem[i], 1, 999, {[levelDataKey] = level})
                            if notCreated > 0 then
                                world:createItemFromId(gemItem[i], 1, user.pos, true, 999, {[levelDataKey] = level})
                            end

                            item:setData(itemKey, "")
                        end
                    end

                    base.money.TakeMoneyFromChar(user, 100000)
                    world:changeItem(item)

                    user:inform("Alle Edelsteine wurden aus dem Gegenstand entfernt und dir zurückgegeben.",
                                "All gems were removed from the item and returned to you.")
                else
                    user:inform("Du hast keine zehn Goldmünzen!", "You do not have ten gold coins!", Character.highPriority)
                end
            end
        end
    end

    local language = user:getPlayerLanguage()
    local caption = base.common.GetNLS(user, "Entsockeln", "Unsocketing")
    local description = base.common.GetNLS(user, "Bitte wähle einen Gegenstand der entsockelt werden soll. Kosten: Zehn Goldmünzen",
                                                 "Please select an item to remove all gems from. Cost: ten gold coins")
    local dialog = SelectionDialog(caption, description, callback)
    dialog:setCloseOnMove()

    for i=1,#unsocketPositions do
        local slot = unsocketPositions[i]
        local itemId = user:getItemAt(slot).id
        local name = world:getItemName(itemId, language)
        dialog:addOption(itemId, name)
    end

    user:requestSelectionDialog(dialog)
end

function itemHasGems(item)
    return base.gems.getGemBonus(item) > 0
end
