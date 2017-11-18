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


local MAGE_MIN_ATTRIBUTE_SUM = 30

local M = {}

M.mageSkills = {
                Character.enchantingOfJewels,
                Character.wandMagic,
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
M.wandIds = {323,2782,2783,2784,2785,3608}

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
        return gems.getGemBonus(leftTool)
    elseif common.isInList(rightTool.id, M.wandIds) then
        return gems.getGemBonus(rightTool)
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
                "Deine Waffe '"..nameText.."' zerbricht. Du vergießt eine bitter Träne und sagst lebe wohl, als sie in das nächste Leben übergeht.",
                "Your weapon '"..nameText.."' shatters. You shed a single tear and bid it farewell as it moves on to its next life.")
            gems.returnGemsToUser(user, wand)
            world:erase(wand, 1)
            return
        end

        common.setItemDurability(wand, durability)

        if (durability < 10) then
            common.InformNLS(user,
                "Deine Waffe '"..nameText.."' hat schon bessere Zeiten gesehen. Vielleicht solltest du sie reparieren lassen.",
                "Your weapon '"..nameText.."' has seen better days. You may want to get it repaired.")
        end
    end

end

return M
