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

local spells = require("magic.nature.spells")
local common = require("base.common")
local magic = require("base.magic")
local gems = require("base.gems")

local M = {}

function M.isDruid(user)

    local isDruid = user:getMagicType() == 3

    local hasAttribs = (user:increaseAttrib("perception",0) + user:increaseAttrib("essence",0) + user:increaseAttrib("intelligence",0)) >= 30

    if not isDruid or not hasAttribs then
        user:inform("Du musst ein Druide sein und den Verstand, gute Augen sowie ein ausreichendes Gespür für die Welt der feinen Materie besitzen, um dies zu nutzen.", "You must be a druid and have the mind, good eyes and a a sufficient feeling for the world of fine matter to use this.")
        return false
    end

    return true
end

local corStaffs = {
    {id = Item.noviceCorStaff, bonus = -0.3, weave = false, weaveBonus = 0},
    {id = Item.corStaff, bonus = 0, weave = false, weaveBonus = 0},
    {id = Item.bloomCorStaff, bonus = 0.1, weave = Character.bloomweave, weaveBonus = 0.2},
    {id = Item.deepCorStaff, bonus = 0.1, weave = Character.deepweave, weaveBonus = 0.2},
    {id = Item.wildCorStaff, bonus = 0.1, weave = Character.wildweave, weaveBonus = 0.2},
    {id = Item.witherCorStaff, bonus = 0.1, weave = Character.witherweave, weaveBonus = 0.2},
    {id = Item.stoneCorStaff, bonus = 0.1, weave = Character.stoneweave, weaveBonus = 0.2}
}

local function getStaffBonus(user, spellName)
    local spellValues = spells.getSpellValuesFromName(spellName)

    for _, staff in pairs(corStaffs) do
        local corStaffFound = common.getItemInHand(user, staff.id)
        if corStaffFound then
            local bonus = staff.bonus
            if spellValues.skill == staff.weave then
                bonus = bonus + staff.weaveBonus
            end

            return corStaffFound, bonus, common.GetQualityBonusStandard(corStaffFound)
        end
    end

    return false, -0.5, 0 --No staff means less effect
end

local function attributeImpactResistance(user)

    local willpower = user:increaseAttrib("willpower", 0)
    local constitution = user:increaseAttrib("constitution", 0)

    return common.GetAttributeBonusHigh((willpower+constitution)/2)
    --[[
        While equipment-wise nature resistance is magic, attribute-wise
        I made the choice of splitting it between magic and physical.
        It makes sense that constitution is important when defending
        against poisons or beast claws, on top of the willpower to
        resist the magical elements. This is also meant to address
        the imbalance of no defensive attrib being part of a druids
        default build, by not making mages have too big of an advantage
        with their default high willpower.
    ]]
end

local function getNatureResistance(target)

    local skill = Character["natureResistance"]

    local skillValue = target:getSkill(skill)

    if target:getType() == Character.monster then
        skillValue = target:getSkill(Character.wrestling)
    end

    if common.IsNilOrEmpty(skillValue) then
        skillValue = 0
    end

    local skillImpact = 0.01*skillValue

    local attribBonus = attributeImpactResistance(target)

    local equipmentBonus = magic.getMagicBonus(target) -- caps out at 0.2. Best possible jewellery and clothing caps out at 0.2596, so this gives some leeway in terms of fashion by capping it at 0.2

    return tonumber(attribBonus+equipmentBonus+skillImpact)

end

M.getNatureResistance = getNatureResistance

local function attributeImpactPenetration(user)

    local intelligence = user:increaseAttrib("intelligence", 0)

    return common.GetAttributeBonusHigh(intelligence)

end

local function getNaturePenetration(user, spellName)

    local equipmentBonus = magic.getMagicBonus(user) -- caps out at 0.2. Best possible jewellery and clothing caps out at 0.2596, so this gives some leeway in terms of fashion by capping it at 0.2

    local level

    if spellName then --It's a player
        local spellValues = spells.getSpellValuesFromName(spellName)
        level = user:getSkill(spellValues.skill)
    else -- It's a monster
        level =  user:getSkill(Character.wrestling) -- a little hack to avoid having to add magic skills to monsters since they use the same level for everything anyways
    end

    local attribBonus = attributeImpactPenetration(user)

    local skillImpact = 0.01*level

    local magicPenetration = attribBonus+equipmentBonus+skillImpact

    return magicPenetration

end

M.getNaturePenetration = getNaturePenetration

local function attributeImpactPerception(user) --Perception influences the base value of a spell in druid magic as its primary attribute

    local perception = user:increaseAttrib("perception", 0)

    return common.GetAttributeBonusHigh(perception)

end


function M.scaleEffect(user, spellName, value, target)
    local corStaff, staffBonus, qualityBonus = false, 0, 0
    if spellName then
       corStaff, staffBonus, qualityBonus = getStaffBonus(user, spellName)
    end
    local naturePenetration = getNaturePenetration(user, spellName)
    local corStaffGemBonus = 0
    if corStaff then
        corStaffGemBonus = gems.getGemBonus(corStaff)/100
    end
    local cloakGemBonus = 0
    local natureResistance = 0
    local perceptionImpact = attributeImpactPerception(user)

    if target and isValidChar(target) then
        natureResistance = getNatureResistance(target)
        cloakGemBonus = magic.getGemBonusCloak(target)/100
    end

    value = value*(1+perceptionImpact+ staffBonus + qualityBonus - natureResistance + naturePenetration + corStaffGemBonus-cloakGemBonus)

    return math.max(0, value) --No negative values
end

return M
