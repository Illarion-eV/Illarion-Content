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
local shared = require("magic.arcane.enchanting.core.shared")
local lookat = require("base.lookat")
local magic = require("base.magic")
local gems = require("base.gems")
local enchantingRituals = require("magic.arcane.enchanting.core.rituals")
local pyr = require("magic.arcane.enchanting.effects.pyr")
local daear = require("magic.arcane.enchanting.effects.daear")
local ilyn = require("magic.arcane.enchanting.effects.ilyn")
local glyphTutorial = require("magic.arcane.enchanting.core.tutorial")

local M = {}

local function getCraftingTime(skill, glyph)

    local learnLimit = math.min(100, glyph.level + 20)

    local jewelleryId = shared.getCompatibleJewellery(glyph.id)[3]

    local jewellery = world:getItemStatsFromId(jewelleryId)

    local worth = jewellery.Worth

    --This function returns the crafting time, scaled by the price of the item.
    local learnProgress
    if (learnLimit  == glyph.level) then
        learnProgress = 50 --This is a temporary solution until we get "effective" skills beyond 100 as proposed by Bloodraven, see Ars Magica
    else
        learnProgress = (skill - glyph.level) / (learnLimit - glyph.level) * 100
    end

    local minimum = math.max (((30+((worth)-200)*(1500-30)/(133300-200))),30) --30: Minimum time; 200: Minimum price; 1500: maximum time; 133300: maximum price
    local craftingTime = common.Scale(minimum * 2, minimum, learnProgress)

    if craftingTime > 99 then
        craftingTime = 10 * math.floor(craftingTime/10 + 0.5) -- Round correctly to whole seconds
    end
    return craftingTime, learnLimit

end

local function getListOfGlyphs(skill)

    local retList = {}

    for _, definition in ipairs(shared.ringAndAmuletDefinitions) do

        if definition.skill.ring <= skill then
            table.insert(retList, {id = Item[definition.glyph.ring], level = definition.skill.ring, shards = shared.getListOfShardsForGlyph(definition.glyph.ring)})
        end

        if definition.skill.amulet <= skill then
            table.insert(retList, {id = Item[definition.glyph.amulet], level = definition.skill.amulet, shards = shared.getListOfShardsForGlyph(definition.glyph.amulet)})
        end
    end


    return retList

end

local function addGlyphs(user, dialog, listOfGlyphs, skill)

    for index, glyph in ipairs(listOfGlyphs) do

        local name = lookat.GenerateItemLookAtFromId(user, glyph.id, 1, {}).name

        local time = getCraftingTime(skill, glyph)

        dialog:addCraftable( index, 0 , glyph.id, name, time, 1)

        for _, shard in ipairs(glyph.shards) do
            dialog:addCraftableIngredient(shard, 1)
        end
    end
end

local function checkRequiredFood(user, craftingTime)

    local neededFood= craftingTime * 4 --One second of crafting takes 40 food points

    if common.FitForHardWork(user, math.ceil(neededFood + craftingTime * 0.1)) then --Each second, one spends one food point per default.
        return true, neededFood
    else
        return false, 0
    end

end

local function checkRequiredMana(user, craftingTime)

    local manaConsumption = craftingTime * 5 --One second crafting, 50 mana cost

    manaConsumption = magic.getValueWithGemBonus(user, manaConsumption)

    if magic.hasSufficientMana(user, manaConsumption) then
        return true, manaConsumption
    else
        user:inform("Du hast nicht genügend Mana, um die Scherben mit Magie zu füllen, um sie zu einer Glyphe zusammenzufügen.", "You do not have enough mana to imbue the shards with the required magic to turn them into a glyph.")
        return false, 0
    end

end

local function hasMaterials(user, shards)

    for _, shard in ipairs(shards) do

        local foundShards = user:countItemAt("all", shard)

        if foundShards == 0 then
            user:inform("Du hast nicht alle nötigen Scherben, um diese Glyphe herzustellen.", "You do not have all the required shards to create this glyph.")
            return false
        end
    end

    return true

end

local function passesChecks(user, wand)

    local isMage = user:getMagicType() == 0 and (user:getQuestProgress(37) ~= 0 or user:getMagicFlags(0) > 0)
    local wandInHand = common.IsItemInHands(wand)

    if not isMage then
        return false --should never even reach this point but just in case
    end

    if not wandInHand then
        user:inform("Dein Zauberstab muss intakt und in deiner Hand bleiben, um hier zu arbeiten.", "Your wand must remain intact and in your hands for you to work here.")
        return false
    end

    local forge = common.GetItemInArea(user.pos, 3498, 1, true)

    if not forge or not enchantingRituals.candleRitualExists(forge) then
        user:inform("Es muss ein funktionstüchtiger Glyphenritualschrein in der Nähe sein, mit dem du arbeiten kannst.", "There must be a functional glyph ritual shrine nearby for you to work with.")
        return false
    end

    common.TurnTo(user, forge.pos)

    return true
end

local function generateQuality(user, glyph, wand)

    local gemBonus = tonumber(gems.getGemBonus(wand))
    local leadAttribName = common.GetLeadAttributeName(Character.enchanting)
    local leadAttribValue = user:increaseAttrib(leadAttribName, 0)

    local meanQuality = 5
    meanQuality = meanQuality*(1+common.GetAttributeBonusHigh(leadAttribValue)+common.GetQualityBonusStandard(wand))+gemBonus/100 --Apply boni of lead attribute, tool quality and gems.
    meanQuality = common.Limit(meanQuality, 1, 8.5) --Limit to a reasonable maximum to avoid overflow ("everything quality 9"). The value here needs unnatural attributes.
    local rolls = 8 --There are eight chances to increase the quality by one. This results in a quality distribution 1-9.
    local quality = 1 + common.BinomialByMean((meanQuality-1), rolls)
    quality = common.Limit(quality, 1, common.ITEM_MAX_QUALITY)

    if quality < common.ITEM_MAX_QUALITY then
        if pyr.upQuality(user) then
            quality = quality + 1
        end
    end

    local durability = common.ITEM_MAX_DURABILITY

    return common.calculateItemQualityDurability(quality, durability)

end

local function createGlyph(user, glyph, wand)


    for _, shard in ipairs(glyph.shards) do

        local saveShard = daear.saveResource(user, glyph.level)

        if not saveShard then
            user:eraseItem(shard, 1)
        end

    end

    local quality = generateQuality(user, glyph, wand)

    common.CreateItem(user, glyph.id, 1, quality, {["craftedBy"] = user.name})

    glyphTutorial.update(user, 5)

    if ilyn.duplicateItem(user, world:getItemStatsFromId(glyph.id).Level) then
        common.CreateItem(user, glyph.id, 1, quality, {["craftedBy"] = user.name})
    end

end

local function craftGlyph(user, glyph, skill, wand)

    local skillGain = false

    if glyph.level > skill then --Shouldn't happen unless a GM messes with skill levels while the dialogue is open
        common.HighInformNLS(user,
        "Du bist nicht fähig genug um das zu tun.",
        "You are not skilled enough to do this.")
        return false
    end

    local craftingTime, learnLimit = getCraftingTime(skill, glyph)
    local foodOK, neededFood = checkRequiredFood(user, craftingTime)
    local manaOk, neededMana = checkRequiredMana(user, craftingTime)

    if not foodOK or not manaOk then
        return false
    end

    if hasMaterials(user, glyph.shards) then

        createGlyph(user, glyph, wand)

        shared.toolBreaks(user, wand, craftingTime)
        common.GetHungry(user, neededFood)
        user:increaseAttrib("mana", -neededMana)
        user:learn(Character.enchanting, craftingTime, learnLimit)
        local newSkill = user:getSkill(Character.enchanting)
        skillGain = (newSkill > skill)
    end

    return skillGain
end

local function loadDialog(user, dialog, listOfGlyphs, skill)
    dialog:addGroup(common.GetNLS(user, "Glyphen", "Glyphs"))
    addGlyphs(user, dialog, listOfGlyphs, skill)
end

local function refreshDialog(user, dialog, listOfGlyphs, skill)

    dialog:clearGroupsAndProducts()

    loadDialog(user, dialog, listOfGlyphs, skill)

end

function M.start(user, wand)

    if not passesChecks(user, wand) then
        return
    end

    local skill = user:getSkill(Character.enchanting)

    local listOfGlyphs = getListOfGlyphs(skill)

    local callback = function(dialog)
        local result = dialog:getResult()
        if result == CraftingDialog.playerCrafts then
            local glyphIndex = dialog:getCraftableId()
            local glyph = listOfGlyphs[glyphIndex]
            local shards = glyph.shards
            local craftingTime = getCraftingTime(skill, glyph)
            local foodOk = checkRequiredFood(user, craftingTime)
            local manaOk = checkRequiredMana(user, craftingTime)
            local canWork = passesChecks(user, wand) and hasMaterials(user, shards) and foodOk and manaOk

            return canWork

        elseif result == CraftingDialog.playerLooksAtItem then

            local glyphIndex = dialog:getCraftableId()
            local lookAt = lookat.GenerateItemLookAtFromId(user, listOfGlyphs[glyphIndex].id, 1, {})
            return lookAt

        elseif result == CraftingDialog.playerLooksAtIngredient then

            local glyphIndex = dialog:getCraftableId()

            local shardIndex = dialog:getIngredientIndex() + 1

            local lookAt = lookat.GenerateItemLookAtFromId(user, listOfGlyphs[glyphIndex].shards[shardIndex], 1, {})

            return lookAt

        elseif result == CraftingDialog.playerCraftingComplete then
            local glyphIndex = dialog:getCraftableId()
            local glyph = listOfGlyphs[glyphIndex]
            local skillGain = craftGlyph(user, glyph, skill, wand)
            if skillGain then
                refreshDialog(user, dialog, listOfGlyphs, skill)
            end
            return skillGain
        end
    end
    local dialog = CraftingDialog(user:getSkillName(Character.enchanting), 0, 0, callback)
    loadDialog(user, dialog, listOfGlyphs, skill)
    user:requestCraftingDialog(dialog)
end

return M
