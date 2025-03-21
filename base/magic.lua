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
local gems = require("base.gems")
local globalvar = require("base.globalvar")


local MAGE_MIN_ATTRIBUTE_SUM = 30

local M = {}

M.mageSkills = {
                Character.enchanting,
                Character.spatialMagic,
                Character.earthMagic,
                Character.windMagic,
                Character.fireMagic,
                Character.spiritMagic,
                Character.waterMagic
                }
M.druidSkills = {
                Character.alchemy,
                Character.potionLore,
                Character.summoning,
                Character.natureLore,
                Character.poisoning,
                Character.cauldronLore,
                Character.animalTaming
                }
M.priestSkills = {
                Character.blessing,
                Character.praying,
                Character.vowing,
                Character.confessing,
                Character.ceremony,
                Character.consecrateWeapons,
                Character.consecrateArmours
                }

M.wandIds = {323,2782,2783,2784,2785,3608,4820}

local wandList = {
    {id = 323, element = "Neutral"},
    {id = 2782, element = "Earth"},
    {id = 2783, element = "Fire"},
    {id = 2784, element = "Water"},
    {id = 2785, element = "Air"},
    {id = 3608, element = "Spirit"},
    {id = 4820, element = "Novice"}
    }

function M.getWand(user)

    local left = user:getItemAt(5)
    local right = user:getItemAt(6)

    for _, wand in pairs(wandList) do
        if left.id == wand.id then
            return left
        elseif right.id == wand.id then
            return right
        end
    end

    return false
end

function M.getWandElement(user)

    local left = user:getItemAt(5)
    local right = user:getItemAt(6)

    for _, wand in pairs(wandList) do
        if left.id == wand.id then
            return wand.element
        elseif right.id == wand.id then
            return wand.element
        end
    end

    return false
end

function M.checkElementBonus(user, element) --Return a number between 0.025 and 0.1 if there is a wand

    local wandElement = M.getWandElement(user)

    if not wandElement then
        return 0
    end

    if wandElement == element then
        return 0.1
    elseif wandElement == "Neutral" then
        return 0.05
    elseif wandElement == "Novice" then
        return 0
    else
        return 0.025
    end
end


-- Best skill values
local function bestSkillFromSkillList(user, skillList)
    local bestValue = 0
    local thisValue
    for _, skill in pairs (skillList) do
        thisValue = user:getSkill(skill)
        if thisValue > bestValue then
            bestValue = thisValue
        end
    end
    return tonumber(bestValue)
end

function M.getBestMageSkill(user)
    return bestSkillFromSkillList(user, M.mageSkills)
end

function M.getBestDruidSkill(user)
    return bestSkillFromSkillList(user, M.mageSkills)
end
function M.getBestPriestSkill(user)
    return bestSkillFromSkillList(user, M.mageSkills)
end

function M.getBestSkill(user)
    local bestValue
    bestValue = math.max(M.getBestMageSkill(user), M.getBestDruidSkill(user), M.getBestPriestSkill(user))
    return bestValue
end

M.mageAttributes = {
                    "intelligence",
                    "essence",
                    "willpower"
                    }

-- Best magic attribute
function M.getBestMageAttribute(user)
    local bestValue = 0
    local thisValue
    for _, attribute in pairs (M.mageAttributes) do
        thisValue = user:increaseAttrib(attribute, 0)
        if thisValue > bestValue then
            bestValue = thisValue
        end
    end
    return bestValue
end

-- play a random magic related GFX at location, with a preference for sprinkle
function M.pickAndPlayRandomGfx(location)

    local gfxList = {globalvar.gfxRAIN, globalvar.gfxSCOTTY, globalvar.gfxSPRINKLE, globalvar.gfxSPRINKLE, globalvar.gfxSPRINKLE}

    local selectedGfx = gfxList[math.random(1,#gfxList)]

    world:gfx(selectedGfx, location)

end

--[[canBeMage
mage attributes must be >= 30
returns true or false and attribute sum ]]--
function M.hasMageAttributes(user)
    local attributeSum = 0
    for _, attribute in pairs (M.mageAttributes) do
        attributeSum = attributeSum + user:increaseAttrib(attribute, 0)
    end
    if attributeSum < MAGE_MIN_ATTRIBUTE_SUM then
        return false, attributeSum
    else
        return true, attributeSum
    end
end

function M.characterIsAMage(user)

    if M.hasMageAttributes(user) and user:getMagicType() == 0 and user:getQuestProgress(37) ~= 0 then
        return true
    end

    return false

end

--[[neededFood
1st try 40 foodpoints / s magic
return foodpoints]]--
function M.neededFood(user, spellTime)
    return spellTime * 40
end

--[[mana check
return: true if sufficient mana]]--
function M.hasSufficientMana(user,mana)
    if user:increaseAttrib("mana", 0) > mana then
        return true
    end
    return false
end

--[[gemBonus for user
get the gem bonus of the currently equipped wand
return gemBonus]]--
function M.getGemBonusWand(user)
    local leftTool = user:getItemAt(Character.left_tool)
    local rightTool = user:getItemAt(Character.right_tool)
    if common.isInList(leftTool.id, M.wandIds) then
        return gems.getGemBonus(leftTool)/2
    elseif common.isInList(rightTool.id, M.wandIds) then
        return gems.getGemBonus(rightTool)/2
    end
    return 0
end

function M.getGemBonusCloak(user) -- Used for magic defense purposes

    if not isValidChar(user) then
        return 0
    end

    local cloak = user:getItemAt(Character.coat)

    if cloak and cloak.id ~= 0 then
        return gems.getGemBonus(cloak)/2
    end

    return 0
end

function M.getQualityBonusWand(user)
    local leftTool = user:getItemAt(Character.left_tool)
    local rightTool = user:getItemAt(Character.right_tool)
    if common.isInList(leftTool.id, M.wandIds) then
        return common.GetQualityBonusStandard(leftTool)
    elseif common.isInList(rightTool.id, M.wandIds) then
        return common.GetQualityBonusStandard(rightTool)
    end
    return 0
end

function M.getQualityBonusCloak(user)

    local cloak = user:getItemAt(Character.coat)

    if cloak and cloak.id ~= 0 then
        return gems.GetQualityBonusStandard(cloak)
    end

    return 0
end


--[[getValueWithGemBonus
calculates a mana consumption, damage or time taking the gem bonus into consideration
level 1 = 94 %
level 3 = 82 %
level 5 = 70 %
return: mana consumption]]--
function M.getValueWithGemBonus(user, inputValue)
    local newValue = inputValue * (1 - 0.005 * M.getGemBonusWand(user))
    return math.floor(newValue)
end

--[[wandDegrade
reduced the wand durability by 1 with a given chance
1 out of chance
wand default the wand in hand beginning left hand
chance default = 20
return: nothing]]--
function M.wandDegrade(user, wand, chance)
    local degradeChance = chance or 20
    if user:isNewPlayer() then
        degradeChance = degradeChance * 2
    end
    degradeChance = math.max(1,math.floor(degradeChance))

    if wand == nil then
        local leftTool = user:getItemAt(Character.left_tool)
        local rightTool = user:getItemAt(Character.right_tool)
        if common.isInList(leftTool.id, M.wandIds) then
            wand = leftTool
        elseif common.isInList(rightTool.id, M.wandIds) then
            wand = rightTool
        else
            return
        end
    end

    if (common.Chance(1, degradeChance)) then
        local durability = common.getItemDurability(wand)
        local nameText = common.getItemName(wand, user:getPlayerLanguage())

        durability = durability - 1
        if (durability == 0) then
            common.InformNLS(user,
                "Deine Waffe '"..nameText.."' zerbricht.",
                "Your weapon '"..nameText.."' shatters.")
        end

        common.setItemDurability(wand, durability)

        --[[if (durability < 10) then
            common.InformNLS(user,
                "Deine Waffe '"..nameText.."' hat schon bessere Zeiten gesehen. Vielleicht solltest du sie reparieren lassen.",
                "Your weapon '"..nameText.."' has seen better days. You may want to get it repaired.")
        end]]
    end

end

local function getBonus(character, max, bodyPositions)

    local itemsWithMagicBonus = {}

    local magicBonus = 0

    local quality = 0

    for _, bodyPosition in pairs(bodyPositions) do

        local checkItem = character:getItemAt(bodyPosition)

        local itemExists = checkItem ~= nil and checkItem.id > 0

        if itemExists then

            local _, armorStruct =  world:getArmorStruct(checkItem.id)
            local itemBonus = armorStruct.MagicDisturbance

            if itemBonus > 0 then
                magicBonus = magicBonus + itemBonus
                quality = quality + math.floor(checkItem.quality/100)
                table.insert(itemsWithMagicBonus, checkItem)
            end
        end
    end

    local qualityBonus = 1
    if #itemsWithMagicBonus >= 1 then
        qualityBonus = qualityBonus+(quality/#itemsWithMagicBonus - 5)*2.5/100 -- quality 5 has no influence; above 5, each point grants 2.5%. under 5, each point takes 2.5%
    end

    return math.min(max, magicBonus*qualityBonus/500)

end



--Returns the total magic bonus and a list containing the items which add to the magic bonus
function M.getMagicBonus(character)

    -- Best jewellery of perfect archmage rings + icebird amulet provide a bonus of 0.1386
    local jewelleryBonus = getBonus(character, 0.1386, {Character.neck, Character.finger_left_hand, Character.finger_right_hand})

    -- Best clothing combination is a bonus of 0.121
    local clothingBonus = getBonus(character, 0.0614, {Character.head, Character.breast, Character.hands, Character.legs, Character.feet, Character.coat})
    -- We set it to 0.0614. This way clothing is more about wearing clothes instead of armour, and you are able to more freely mix how your paperdolling looks
    -- There is still a small impact, wearing low quality clothes or wearing only low level clothing will not reach the max sum
    -- Technically caps out at 0.2596, but lowering that to 0.2 allows more flexibility in fashion choices
    -- As jewellery and clothing are calculated separately, we avoid a scenario where someone minmaxes to get the best glyphed jewellery and wears the same brown cloak blue clothes "best" gear all the time as a mage
    -- As the purpose of this leeway is to allow more expression in paperdolling without feeling punished, NOT to allow you to ignore the choice between best jewellery (archmage, icebird) and glyph bonuses

    return math.min(0.2, (jewelleryBonus+clothingBonus))
    -- All in all, jewellery has a 13.86% max magic resistance/penetration impact and clothing 6.14%.
    -- not counting how gems in your cloak/wand increase magic damage reduced/dealt
    -- You have 30% by default, which was needed to balance out numbers and not be too top heavy
    -- Meanwhile the remaining 50% is all willpower as the biggest impact

end

return M
