require("content.lookat.unique")
require("base.common")
require("base.factions")
require("alchemy.base.analyse")

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
	    alchemy.base.analyse.CauldronCheck(User, SourceItem, TargetItem, Counter, Param, ltstate)
		return
	end    
	
	local callback = function(dialog)
        success = dialog:getSuccess()
        if success then
            selected = dialog:getSelectedIndex()
        end
    end

    local dialog = SelectionDialog("Socketing", "Please select a weapon to insert the gem into:", callback)
    local weaponTable = getWeaponTable(User)
    local language = User:getPlayerLanguage()
   
    for i=1,#weaponTable do
        local item = weaponTable[i].id
        local name = world:getItemName(item, language)
        dialog:addOption(item, name)
    end

    User:requestSelectionDialog(dialog)
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

function getWeaponTable(user)
    weaponTable = {}

    for i=1,#weaponSlots do
        local slot = weaponSlots[i]
        local item = user:getItemAt(slot)
        
        if world:getWeaponStruct(item.id) then
            table.insert(weaponTable, item)
        end
    end

    return weaponTable
end
