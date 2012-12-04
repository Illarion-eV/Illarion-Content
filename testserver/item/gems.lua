require("content.lookat.unique")
require("base.common")
require("base.lookat")
require("base.factions")
require("alchemy.base.analysis")

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

gemPrefixDE = {"latent", "bedingt", "leicht", "m‰ﬂig", "durchschnittlich", "bemerkenswert", "stark", "sehr stark", "unglaublich", "einzigartig"}
gemPrefixEN = {"latent", "limited", "slight", "moderate", "average", "notable", "strong", "very strong", "unbelievable", "unique"}

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
            lookAt.name = gemPrefixEN[gemLevel] .. " magical " .. lookAt.name
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
categoryId[EMERALD] = gemCraft:addCategory("emerald", "Smaragd")
categoryId[RUBY] = gemCraft:addCategory("ruby", "Rubin")
categoryId[OBSIDIAN] = gemCraft:addCategory("obsidian", "Obsidian")
categoryId[SAPPHIRE] = gemCraft:addCategory("sapphire", "Saphir")
categoryId[AMETHYST] = gemCraft:addCategory("amethyst", "Amethyst")
categoryId[TOPAZ] = gemCraft:addCategory("topaz", "Topas")

local gem, level
for gem=1,7 do
    local catId = categoryId[gem]
    if catId then
        for level=2,10 do
            local requirement = (level - 2) * 10
            local duration = level * 10
            local product = gemCraft:addProduct(catId, gemItem[gem], requirement, requirement+10, duration, duration*2, 1, {gemLevel = level})
            product:addIngredient(gemItem[gem], 3, {gemLevel = level-1})
        end
    end
end

function getMagicGemId(gem, level)
    return gemItem[gem]
end

function getMagicGemData(level)
    return {gemLevel = level}
end

function LookAtItem(user, item)
    local lookAt = base.lookat.GenerateLookAt(user, item)

    local data = {}
    data.gemLevel = tonumber(item:getData("gemLevel"))

    lookAt = lookAtFilter(user, lookAt, data)    

    world:itemInform(user, item, lookAt)
end

function UseItem(User, SourceItem, TargetItem, Counter, Param, ltstate)
    if SourceItem:getData("gemLevel") == "" then
	    alchemy.base.analysis.CauldronPotionCheck(User, SourceItem, TargetItem, Counter, Param, ltstate)
		return
	end    

    handleSocketing(User, SourceItem)
end

function handleSocketing(user, gem)
    local weaponPositions = getWeaponPositions(user)

	local callback = function(dialog)
        local success = dialog:getSuccess()
        if success and base.common.CheckItem(user, gem) then
            local selected = dialog:getSelectedIndex() + 1
            local slot = weaponPositions[selected]
            local item = user:getItemAt(slot)

            if world:getWeaponStruct(item.id) then
                local key = gemDataKey[gemId[gem.id]]
                local level = gem:getData("gemLevel")
                item:setData(key, level)
                world:erase(gem, 1)
                world:changeItem(item)
            end
        end
    end

    local language = user:getPlayerLanguage()
    local caption = base.common.GetNLS(user, "Sockeln", "Socketing")
    local description = base.common.GetNLS(user, "Bitte w‰hle eine Waffe die gesockelt werden soll:", "Please select a weapon to insert the gem into:")
    local dialog = SelectionDialog(caption, description, callback)
   
    for i=1,#weaponPositions do
        local slot = weaponPositions[i]
        local itemId = user:getItemAt(slot).id
        local name = world:getItemName(itemId, language)
        dialog:addOption(itemId, name)
    end

    user:requestSelectionDialog(dialog)
end

weaponSlots = {}
table.insert(weaponSlots, Character.left_tool)
table.insert(weaponSlots, Character.right_tool)
table.insert(weaponSlots, Character.belt_pos_1)
table.insert(weaponSlots, Character.belt_pos_2)
table.insert(weaponSlots, Character.belt_pos_3)
table.insert(weaponSlots, Character.belt_pos_4)
table.insert(weaponSlots, Character.belt_pos_5)
table.insert(weaponSlots, Character.belt_pos_6)

function getWeaponPositions(user)
    weaponTable = {}

    for i=1,#weaponSlots do
        local slot = weaponSlots[i]
        local itemId = user:getItemAt(slot).id
        
        if world:getWeaponStruct(itemId) then
            table.insert(weaponTable, slot)
        end
    end

    return weaponTable
end
