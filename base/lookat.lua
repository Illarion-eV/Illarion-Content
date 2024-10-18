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
-- Default look-at script

local common = require("base.common")
local gems = require("base.gems")
local money = require("base.money")
local glyphs = require("magic.arcane.enchanting.core.shared")
local mining = require("craft.gathering.mining")
local silkcutting = require("craft.gathering.silkcutting")
local fishing = require("craft.gathering.fishing")
local egggathering = require("craft.gathering.egggathering")
local honeygathering = require("craft.gathering.honeygathering")

local M = {}

M.itemRangeTable = {
    {start = 4011, stop  = 4021, skill = "tailoring"},
    {start = 4022, stop  = 4032, skill = "blacksmithing"},
    {start = 4033, stop  = 4043, skill = "finesmithing"},
    {start = 4044, stop  = 4054, skill = "armourer"},
    {start = 4055, stop  = 4065, skill = "carpentry"}
}

local TitleCase
local AddWeaponOrArmourType
local AddTypeAndUsable
local GetGemLevel

-- init german descriptions
local GenericQualDe = {"perfekt", "exzellent", "sehr gut", "gut", "normal", "m��ig", "schlecht", "sehr schlecht","schrecklich", "furchtbar"}
local GenericDuraDe = {}
GenericDuraDe[1] = {"nagelneu", "neu", "fast neu", "gebraucht", "leicht abgenutzt", "abgenutzt", "sehr abgenutzt", "alt", "rostig", "klapprig", "sehr klapprig", "kaputt"}
GenericDuraDe[2] = {"nagelneu", "neu", "fast neu", "gebraucht", "leicht abgenutzt", "abgenutzt", "sehr abgenutzt", "alt", "morsch", "zerfallend", "sehr zerfallen", "kaputt"}
GenericDuraDe[3] = {"nagelneu", "neu", "fast neu", "gebraucht", "leicht abgenutzt", "abgenutzt", "sehr abgenutzt", "alt", "fadenscheinig", "zerfetzt", "komplett zerfetzt", "kaputt"}
GenericDuraDe[4] = {"funkelnd", "strahlend", "gl�nzend", "gebraucht", "angekratzt", "zerkratzt", "matt", "alt", "stumpf", "br�chig", "sehr br�chig", "kaputt"}

M.GenericQualDe = GenericQualDe

-- init english descriptions
local GenericQualEn = {"perfect", "excellent", "very good", "good", "normal", "average", "bad", "very bad", "awful", "horrible"}
local GenericDuraEn = {}
GenericDuraEn[1] = {"brand new", "new", "almost new", "used", "slightly scraped", "scraped", "highly scraped", "old", "rusty", "corroded", "highly corroded", "broken"}
GenericDuraEn[2] = {"brand new", "new", "almost new", "used", "slightly scratched", "scratched", "highly scratched", "old", "rotten", "nearly decayed", "decayed", "broken"}
GenericDuraEn[3] = {"brand new", "new", "almost new", "used", "slightly frayed", "frayed", "highly frayed", "old", "threadbare", "ragged", "highly ragged", "broken"}
GenericDuraEn[4] = {"sparkling", "shiny", "glittery", "used", "slightly scraped", "scraped", "highly scraped", "old", "tarnished", "fragile", "highly fragile", "broken"}

M.GenericQualEn = GenericQualEn

local GenericDuraLm = {99, 90, 80, 70, 60, 50, 40, 30, 20, 10, 1, 0}

M.fightingGemBonusDivisionValue = 2 --Changing this might break the gem lookat due to current server limitations

M.NONE = 0
M.METAL = 1
M.WOOD = 2
M.CLOTH = 3
M.JEWELLERY = 4

local WeaponType = {}
WeaponType[WeaponStruct.slashing] = {de = "Hiebwaffe", en = "Slashing Weapon", skill = Character.slashingWeapons}
WeaponType[WeaponStruct.concussion] = {de = "Schlagwaffe", en = "Blunt Weapon", skill = Character.concussionWeapons}
WeaponType[WeaponStruct.puncture] = {de = "Stichwaffe", en = "Stabbing Weapon", skill = Character.punctureWeapons}
WeaponType[WeaponStruct.slashingTwoHand] = WeaponType[WeaponStruct.slashing]
WeaponType[WeaponStruct.concussionTwoHand] = WeaponType[WeaponStruct.concussion]
WeaponType[WeaponStruct.punctureTwoHand] = WeaponType[WeaponStruct.puncture]
WeaponType[WeaponStruct.firearm] = {de = "Distanzwaffe", en = "Distance Weapon", skill = Character.distanceWeapons}
WeaponType[WeaponStruct.arrow] = {de = "Pfeil", en = "Arrow", skill = Character.distanceWeapons}
WeaponType[WeaponStruct.bolt] = {de = "Bolzen", en = "Bolt", skill = Character.distanceWeapons}
WeaponType[WeaponStruct.stone] = {de = "Munition", en = "Ammunition", skill = Character.distanceWeapons}
WeaponType[WeaponStruct.stave] = {de = "Zauberstab", en = "Wand"}
WeaponType[WeaponStruct.shield] = {de = "Schild", en = "Shield", skill = Character.parry}

local ArmourType = {}
ArmourType[ArmorStruct.clothing] = {de = "Kleidung", en = "Clothing"}
ArmourType[ArmorStruct.general] = {de = "Allgemeine R�stung", en = "General Armour"}
ArmourType[ArmorStruct.light] = {de = "Leichte R�stung", en = "Light Armour", skill = Character.lightArmour}
ArmourType[ArmorStruct.medium] = {de = "Mittlere R�stung", en = "Medium Armour", skill = Character.mediumArmour}
ArmourType[ArmorStruct.heavy] = {de = "Schwere R�stung", en = "Heavy Armour", skill = Character.heavyArmour}
ArmourType[ArmorStruct.juwellery] = {de = "Schmuck", en = "Jewellery"}

-- Here you can add items that are not part of the armourstruct or weaponstruct but should still show their item level in the lookAt
-- Input should be a table consisting of {id = theID, skill = theSkill} eg: {id = 3578, skill = "mining", type = {english = "Vein", german = "Ader"}}
local listOfItemsThatShouldShowLevel = {}

local gatheringLists = {
    {list = mining.oreList, skill = mining.skill, type = {english = "Vein", german = "Ader"}},
    {list = silkcutting.silkList, skill = silkcutting.skill, type = {english = "Butterflies", german = "Schmetterlinge"}},
    {list = fishing.fishList, skill = fishing.skill, type = {english = "Shoal", german = "Schwarm"}},
    {list = honeygathering.hiveList, skill = honeygathering.skill, type = {english = "Hive", german = "Bienenstock"}},
    {list = egggathering.nestList, skill = egggathering.skill, type = {english = "Nest", german = "Nest"}}
}

for _, gatheringList in pairs(gatheringLists) do
    for _, gatheringNode in pairs(gatheringList.list) do
        table.insert(listOfItemsThatShouldShowLevel, {id = gatheringNode.depletedId, skill = gatheringList.skill, type = gatheringList.type})
        table.insert(listOfItemsThatShouldShowLevel, {id = gatheringNode.id, skill = gatheringList.skill, type = gatheringList.type})
    end
end

local function showItemLevel(user, itemId, lookat , itemLevel)
    local showLevel = false
    local skillName
    local theTypes

    for _, theItem in pairs(listOfItemsThatShouldShowLevel) do
        if theItem.id == itemId then
            showLevel = true
            skillName = theItem.skill
            theTypes = theItem.type
        end
    end

    if showLevel then
        local skill = 100

        if skillName then
            skill = user:getSkill(Character[skillName])
        end

        local theType = common.GetNLS(user, theTypes.german, theTypes.english)

        lookat.type = theType

        lookat.usable = skill >= itemLevel

        return true, lookat
    end

    return false

end

local function isPortalBook(item)
    if item.id == 1061 then
        return true
    end
    return false
end

function M.GenerateLookAt(user, item, material)

    if user == nil then
        debug("Sanity check failed, no valid character supplied.")
        return
    end

    if item == nil then
        debug("Sanity check failed, no valid item supplied.")
        return
    end

    material = material or M.NONE

    if material < M.NONE or material > M.JEWELLERY then
        debug("Sanity check failed, no valid material supplied.")
    end

    local itemCommon = world:getItemStatsFromId(item.id)
    local lookAt = ItemLookAt()

    local isGerman = user:getPlayerLanguage() == Player.german

    local defaultName, usedName
    local brokenString
    if isGerman then
        defaultName = itemCommon.German
        usedName = item:getData("nameDe")
        brokenString = " (kaputt)"
    else
        defaultName = itemCommon.English
        usedName = item:getData("nameEn")
        brokenString = " (broken)"
    end
    if common.IsNilOrEmpty(usedName) then
        usedName = defaultName
    end

    lookAt.name = TitleCase(usedName)

    if common.isBroken(item) and item.wear ~= 255 and itemCommon.MaxStack == 1 then --static or stackable items are not shown as broken
        lookAt.name = lookAt.name..brokenString
    end

    local rarenessData = item:getData("rareness")
    if rarenessData == "" then
        lookAt.rareness = itemCommon.Rareness;
    else
        local value = tonumber(rarenessData)
        if value ~= nil then
            lookAt.rareness = value
        end
    end

    local defaultDescription, usedDescription
    local addDescription
    if isGerman then
        defaultDescription = itemCommon.GermanDescription
        usedDescription = item:getData("descriptionDe")
        addDescription = glyphs.lookatGlyphedItem(item, Player.german)
    else
        defaultDescription = itemCommon.EnglishDescription
        usedDescription = item:getData("descriptionEn")
        addDescription = glyphs.lookatGlyphedItem(item, Player.english)
    end

    if common.IsNilOrEmpty(usedDescription) then
        lookAt.description = defaultDescription .. addDescription
    else
        lookAt.description = usedDescription .. addDescription
    end

    local level = itemCommon.Level
    lookAt.level = level

    if itemCommon.AgeingSpeed < 255 and itemCommon.Weight < 30000 then
        local craftedByData = item:getData("craftedBy")

        if not common.IsNilOrEmpty(craftedByData) and not isPortalBook(item) then
            lookAt.craftedBy = craftedByData
        end

        if item:getData("lookatNoWeight") ~= "1" then
            lookAt.weight = item.number * itemCommon.Weight
        end

        if item:getData("lookatNoPrice") ~= "1" then
            if not money.IsCurrency(item.id) then
                lookAt.worth = 20*item.number * itemCommon.Worth
            end
        end

        if material > M.NONE and item:getData("lookatNoQuality") ~= "1" then
            local itemDura = math.fmod(item.quality, 100)
            local itemQual = (item.quality - itemDura) / 100

            local duraIndex
            for i, duraLimit in pairs(GenericDuraLm) do
                if itemDura >= duraLimit then
                    duraIndex = i
                    break
                end
            end

            local qualIndex = 10 - itemQual
            qualIndex=common.Limit(qualIndex, 1, 10)

            if (isGerman) then
                lookAt.qualityText = GenericQualDe[qualIndex]
                lookAt.durabilityText = GenericDuraDe[material][duraIndex]
            else
                lookAt.qualityText = GenericQualEn[qualIndex]
                lookAt.durabilityText = GenericDuraEn[material][duraIndex]
            end

            lookAt.durabilityValue = itemDura + 1
        end

        lookAt.diamondLevel = GetGemLevel(item, "magicalDiamond")
        lookAt.emeraldLevel = GetGemLevel(item, "magicalEmerald")
        lookAt.rubyLevel = GetGemLevel(item, "magicalRuby")
        lookAt.sapphireLevel = GetGemLevel(item, "magicalSapphire")
        lookAt.amethystLevel = GetGemLevel(item, "magicalAmethyst")
        lookAt.obsidianLevel = GetGemLevel(item, "magicalObsidian")
        lookAt.topazLevel = GetGemLevel(item, "magicalTopaz")
        lookAt.bonus = gems.getGemBonusLookAtValue(item)

        lookAt = AddWeaponOrArmourType(lookAt, user, item.id, level, item)
    end

    local otherItemFound, newLookAt = showItemLevel(user, item.id, lookAt , level)

    if otherItemFound then
        lookAt = newLookAt
    end

    return lookAt
end

function M.GenerateItemLookAtFromId(user, itemId, stackSize, data)
    local lookAt = ItemLookAt()
    local isGerman = user:getPlayerLanguage() == Player.german
    data = data or {}

    local usedName
    if isGerman then
        usedName = data["nameDe"]
    else
        usedName = data["nameEn"]
    end
    if common.IsNilOrEmpty(usedName) then
        usedName = world:getItemName(itemId, user:getPlayerLanguage())
    end
    lookAt.name = TitleCase(usedName)

    local rarenessData = data["rareness"]
    if rarenessData == nil then
        lookAt.rareness = ItemLookAt.commonItem
    else
        local value = tonumber(rarenessData)
        if value ~= nil then
            lookAt.rareness = value
        end
    end

    local usedDescription
    if isGerman then
        usedDescription = data["descriptionDe"]
    else
        usedDescription = data["descriptionEn"]
    end

    if not common.IsNilOrEmpty(usedDescription) then
        lookAt.description = usedDescription
    end

    local itemCommon = world:getItemStatsFromId(itemId)
    lookAt.weight = stackSize * itemCommon.Weight
    lookAt.worth = 20*stackSize * itemCommon.Worth

    local level = itemCommon.Level
    lookAt.level = level

    lookAt = AddWeaponOrArmourType(lookAt, user, itemId, level)

    return lookAt
end

function TitleCase(name)
    local function tchelper(first, rest)
        return first:upper()..rest:lower()
    end

    return name:gsub("([%a������])([%w�������_']*)", tchelper)
end

local function itemIsRepairKit(user, itemId, lookAt, itemLevel)

    local repairKit = false
    local skillName = false

    for _, itemRange in pairs(M.itemRangeTable) do
        if itemId >= itemRange.start and itemId <= itemRange.stop then
            skillName = itemRange.skill
            repairKit = true
        end
    end

    if repairKit then
        local skill = 100

        if skillName then
            skill = user:getSkill(Character[skillName])
        end

        if user:getPlayerLanguage() == Player.german then
            lookAt.type = ""
        else
            lookAt.type = "Repair Kit"
        end

        lookAt.usable = skill >= itemLevel

        return true, lookAt
    end

    return false
end

function AddWeaponOrArmourType(lookAt, user, itemId, itemLevel, item)
    local armourfound, armour = world:getArmorStruct(itemId)
    local weaponfound, weapon = world:getWeaponStruct(itemId)
    local repairKitFound, repairKitLookAt = itemIsRepairKit(user, itemId, lookAt, itemLevel)

    if weaponfound then
        lookAt = AddTypeAndUsable(lookAt, user, WeaponType, weapon.WeaponType, itemLevel)
    elseif armourfound then
        lookAt = AddTypeAndUsable(lookAt, user, ArmourType, armour.Type, itemLevel)
    elseif repairKitFound then
        lookAt = repairKitLookAt
    end

    if (weaponfound or armourfound) and item then --only applicable when not generated from ID
        local gemBonus = gems.getGemBonusLookAtValue(item)
        gemBonus = gemBonus/M.fightingGemBonusDivisionValue
        lookAt.bonus = gemBonus
    end

    return lookAt
end

function AddTypeAndUsable(lookAt, user, nameAndSkillTable, itemType, itemLevel)
    local nameAndSkill = nameAndSkillTable[itemType]
    local skill = 100

    if nameAndSkill.skill then
        skill = user:getSkill(nameAndSkill.skill)
    end

    if user:getPlayerLanguage() == Player.german then
        lookAt.type = nameAndSkill.de
    else
        lookAt.type = nameAndSkill.en
    end

    lookAt.usable = skill >= itemLevel

    return lookAt
end

function GetGemLevel(item, dataEntry)
    dataEntry = item:getData(dataEntry)
    if dataEntry == nil then
        return 0
    end

    local value = tonumber(dataEntry)
    if value == nil then
        return 0
    end

    if value < 0 or value > 10 then
        return 0
    else
        return value
    end
end

--- Apply a special name to a item. The name is stored in the data values.
--  This function does NOT call world:changeItem()! You have to do this yourself.
--
-- @param item the item that is supposed to receive the new values
-- @param german the german name this item is supposed to display
-- @param english the english name this item is supposed to display
function M.SetSpecialName(item, german, english)
    if item == nil then
        debug("Sanity check failed, no valid item supplied.")
        return
    end

    if german == nil or english == nil then
        debug("Sanity check failed, no valid item names supplied.")
        return
    end

    item:setData("nameDe", german)
    item:setData("nameEn", english)
end

--- Remove the special name from a item. This changes the data values of the item.
--  This function does NOT call world:changeItem()! You have to do this yourself.
--
-- @param item the item that is supposed to receive the new values
function M.UnsetSpecialName(item)
    if item == nil then
        debug("Sanity check failed, no valid item supplied.")
        return
    end

    item:setData("nameDe", "")
    item:setData("nameEn", "")
end

--- Apply a special description to the item. The description is stored in the data values.
--  This function does NOT call world:changeItem()! You have to do this yourself.
--
-- @param item the item that is supposed to receive the new values
-- @param german the german description this item is supposed to display
-- @param english the english description this item is supposed to display
function M.SetSpecialDescription(item, german, english)
    if item == nil then
        debug("Sanity check failed, no valid item supplied.")
        return
    end

    if german == nil or english == nil then
        debug("Sanity check failed, no valid item descriptions supplied.")
        return
    end

    item:setData("descriptionDe", german)
    item:setData("descriptionEn", english)
end

--- Remove the special description from a item. This changes the data values of the item.
--  This function does NOT call world:changeItem()! You have to do this yourself.
--
-- @param item the item that is supposed to receive the new values
function M.UnsetSpecialDescription(item)
    if item == nil then
        debug("Sanity check failed, no valid item supplied.")
        return
    end

    item:setData("descriptionDe", "")
    item:setData("descriptionEn", "")
end

--- Change the rareness of a item. The rareness value is stored in the data values.
--  This function does NOT call world:changeItem()! You have to do this yourself.
--
-- @param item the item that is supposed to receive the new values
-- @param rare the rareness value, valid values are: ItemLookAt.commonItem, ItemLookAt.uncommonItem, ItemLookAt.rareItem, ItemLookAt.epicItem
function M.SetItemRareness(item, rare)
    if item == nil then
        debug("Sanity check failed, no valid item supplied.")
        return
    end

    if rare ~= ItemLookAt.commonItem and rare ~= ItemLookAt.uncommonItem and rare ~= ItemLookAt.rareItem and rare ~= ItemLookAt.epicItem then
        debug("Sanity check failed, no valid item rareness supplied")
        return
    end

    item:setData("rareness", rare)
end

--- Set the item rareness back to its default value. This changes the data values of the item.
--  This function does NOT call world:changeItem()! You have to do this yourself.
--
-- @param item the item that is supposed to receive the new values
function M.UnsetItemRareness(item)
    if item == nil then
        debug("Sanity check failed, no valid item supplied.")
        return
    end

    item:setData("rareness", "")
end

--- Set or change the name of the crafter who created this item. The rareness value is stored in the data values.
--  This function does NOT call world:changeItem()! You have to do this yourself.
--
-- @param item the item that is supposed to receive the new values
-- @param name the name of the person who created this item
function M.SetItemCraftedBy(item, name)
    if item == nil then
        debug("Sanity check failed, no valid item supplied.")
        return
    end

    if name == nil then
        debug("Sanity check failed, no valid crafter name supplied.")
        return
    end

    item:setData("craftedBy", name)
end

--- Remove the name of the person who created this item from the item. This changes the data values of the item.
--  This function does NOT call world:changeItem()! You have to do this yourself.
--
-- @param item the item that is supposed to receive the new values
function M.UnsetItemCraftedBy(item)
    if (item == nil) then
        debug("Sanity check failed, no valid item supplied.")
        return
    end

    item:setData("craftedBy", "")
end

return M
