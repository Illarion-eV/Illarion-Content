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

local equipped = require("magic.arcane.enchanting.core.handling_of_glyph_equipment")
local common = require("base.common")

local M = {}

local shardNames = { first = {"anemo", "pyr", "hydor", "chous", "dendron", "nomizo", "hieros"}, last = {"gwynt", "tan", "ilyn", "daear", "coeden", "ysbryd", "dwyfol"}}

M.ringAndAmuletDefinitions = {
    {
        gem = "amethyst",
        skill = {ring = 0, amulet = 10},
        rings = {Item.copperAmethystRing, Item.silverAmethystRing, Item.goldenAmethystRing},
        amulets = {Item.copperAmethystAmulet, Item.silverAmethystAmulet, Item.goldenAmethystAmulet},
        glyph = { amulet = "gwynt", ring = "anemo"},
        effect = {
            amulet =
                {english = "Has a chance to duplicate a resource when you are gathering.",
                german = "Beim Sammeln von Ressourcen besteht eine Chance, die gesammelte Ressource zu verdoppeln."},
            ring =
                {english = "Repels hostile lifeforms that may appear to guard resources that you are gathering.",
                german = "Bietet Schutz vor feindlichen Lebensformen, die dich möglicherweise angreifen könnten, um ihren Lebensraum zu verteidigen."}},
    },
    {
        gem = "ruby",
        skill = {ring = 20, amulet = 25},
        rings = {Item.copperRubyRing, Item.silverRubyRing, Item.goldenRubyRing},
        amulets = {Item.copperRubyAmulet, Item.silverRubyAmulet, Item.goldenRubyAmulet},
        glyph = { amulet = "daear", ring = "pyr"},
        effect = {
            amulet =
                {english = "Has the chance to replicate a resource used when creating a product, saving yours from being used.",
                german = "Beim Herstellen eines Produkts besteht eine Chance, dass eine Ressource ersetzt wird. Du behälst die entsprechende Ressource."},
            ring =
                {english = "Has a chance to increase the quality of a product you create.",
                german = "Bei der Herstellung eines Produkts besteht die Chance, dass die Qualität verbessert wird."}}
    },
    {
        gem = "obsidian",
        skill = {ring = 30, amulet = 40},
        rings = {Item.copperObsidianRing, Item.silverObsidianRing, Item.goldenObsidianRing},
        amulets = {Item.copperObsidianAmulet, Item.silverObsidianAmulet, Item.goldenObsidianAmulet},
        glyph = { amulet = "coeden", ring = "chous"},
        effect = {
            amulet =
                {english = "Has the chance to teleport you away from your attacker upon being hit by someones attack.",
                german = "Erfolgreiche Angriffe gegen dich haben eine Chance, dich von dem Angreifer weg zu teleportieren."},
            ring =
                {english = "Has the chance to teleport your target away from you upon hitting it with an attack.",
                german = "Erfolgreiche Angriffe von dir haben eine Chance, dein Ziel von dir weg zu teleportieren."}}
    },
    {
        gem = "sapphire",
        skill = {ring = 50, amulet = 60},
        rings = {Item.copperSapphireRing, Item.silverSapphireRing, Item.goldenSapphireRing},
        amulets = {Item.copperSapphireAmulet, Item.silverSapphireAmulet, Item.goldenSapphireAmulet},
        glyph = { amulet = "tan", ring = "hydor"},
        effect = {
            amulet =
                {english = "Has the chance to reduce the cast time required for your next spellcast.",
                german = "Dein nächster Zauber hat eine Chance, schneller ausgeführt zu werden."},
            ring =
                {english = "Has the chance to reduce the amount of mana required for your next spellcast.",
                german = "Bei deinem nächsten Zauber besteht die Chance, dass die Manakosten reduziert werden."}}
    },
    {
        gem = "emerald",
        skill = {ring = 70, amulet = 75},
        rings = {Item.copperEmeraldRing, Item.silverEmeraldRing, Item.goldenEmeraldRing},
        amulets = {Item.copperEmeraldAmulet, Item.silverEmeraldAmulet, Item.goldenEmeraldAmulet},
        glyph = { amulet = "ysbryd", ring = "dendron"},
        effect = {
            amulet =
                {english = "Has the chance to activate upon being hit by an attack, healing you for a small amount.",
                german = "Erfolgreiche Anrgiffe gegen dich haben eine Chance, dich ein wenig zu heilen."},
            ring =
                {english = "Has the chance to activate upon hitting someone with an attack, healing you for a small amount.",
                german = "Erfolgreiche Angriffe von dir haben die Chance, dich ein wenig zu heilen."}}
    },
    {
        gem = "topaz",
        skill = {ring = 80, amulet = 90},
        rings = {Item.copperTopazRing, Item.silverTopazRing, Item.goldenTopazRing},
        amulets = {Item.copperTopazAmulet, Item.silverTopazAmulet, Item.goldenTopazAmulet},
        glyph = { amulet = "ilyn", ring = "nomizo"},
        effect = {
            amulet =
                {english = "Has the chance to produce a duplicate when you create a new product.",
                german = "Wenn du ein neues Produkt herstellst, besteht eine Chance, dass es sich verdoppelt."},
            ring =
                {english = "Has the chance to allow you to find additional treasure when gathering materials.",
                german = "Beim Sammeln von Materialien besteht eine Chance, einen zusätzlichen Schatz zu finden."}}
    },
    {
        gem = "diamond",
        skill = {ring = 95, amulet = 100},
        rings = {Item.copperDiamondRing, Item.silverDiamondRing,Item.goldenDiamondRing},
        amulets = {Item.copperDiamondAmulet, Item.silverDiamondAmulet, Item.goldenDiamondAmulet},
        glyph = { amulet = "dwyfol", ring = "hieros"},
        effect = {
            amulet = {
                english = "Upon being attacked by someone, there is a chance for the glyph to activate, absorbing the force of the attack and using it to strike the attacker with lightning.",
                german = "Wenn du von jemandem angegriffen wirst besteht die Chance, dass die Glyphe aktiviert wird, die Kraft des Angriffs absorbiert wird und in einem Blitz auf den Angreifer zurückgeworfen wird."},
            ring =
                {english = "Upon attacking someone, there is a chance for the glyph to activate and engulf the target in fire.",
                german = "Wenn du jemanden angreifst besteht die Chance, dass die Glyphe aktiviert wird und das Ziel in Brand steckt."}}
    }
}

M.qualityTexts = {
    german = {"fürchterliche","schlechte","schwache","leicht schwache","durchschnittliche","gute","sehr gute","großartige","hervorragende"},
    english = {"awful","bad","weak","slightly weak","average","good","very good","great","outstanding"}
}

local ringAndAmuletDefinitions = M.ringAndAmuletDefinitions

function M.procGlyph(chance)

    if math.random() <= chance then
        return true
    end

    return false

end

local function getQuality(glyphedItem)
    return common.getItemQuality(glyphedItem) + tonumber(glyphedItem:getData("glyphQuality"))
end

function M.getGlyphedJewellery(user, glyphName, requiredCharges)

    local ring_left, ring_right = M.getRings(user)

    local amulet = M.getAmulet(user)

    local jewelleryToCheck = {ring_left, ring_right, amulet}

    local matchingJewellery = M.getJewelleryBasedOnGlyphName(glyphName)

    for _, jewellery in pairs(matchingJewellery) do
        for index, ringOrAmuletToCheck in pairs(jewelleryToCheck) do
            local matches = jewellery == ringOrAmuletToCheck.id
            local charges = tonumber(ringOrAmuletToCheck:getData("glyphCharges"))
            local equippedRecently = not equipped.checkIfLongEnoughTimePassedSinceEquip(user, ringOrAmuletToCheck.itempos)
            local isGlyphed = not common.IsNilOrEmpty(charges) and charges > 0

            if matches and isGlyphed and not equippedRecently then
                local hasCharges = charges >= 1
                if hasCharges then
                    return ringOrAmuletToCheck, charges, index
                end
            end
        end
    end

    return false
end

function M.activateGlyph(user, glyphName, chances, chargesRequired)

    local jewellery, charges, index = M.getGlyphedJewellery(user, glyphName, chargesRequired)

    if not jewellery and charges == nil then -- No eligible glyphed jewellery
        return
    end

    local quality = getQuality(jewellery)

    local chance = chances.min + (chances.bonus/18*quality)

    local procGlyph = M.procGlyph(chance)

    if not procGlyph then
        return false
    end

    local newCharges = charges - chargesRequired

    if newCharges <= 0 then
        jewellery:setData("glyphCharges", "")
        jewellery:setData("glyphQuality", "")

        local dur = common.getItemDurability(jewellery)
        common.setItemDurability(jewellery, math.max(0, dur - 30)) --Loses up to three grades of durability upon full consumption of glyph

        local ringOrAmulet
        if index == 3 then -- It is an amulet
            ringOrAmulet = {german = "Amulett", english = "amulet"}
        else
            ringOrAmulet = {german = "Ring", english = "ring"}
        end
        user:inform(
            "Die Glyphe in deinem "..ringOrAmulet.german.." leuchtet hell auf, als sie ein letztes Mal aktiviert wird. Dann erlischt sie und löst sich ins Nichts auf.",
            "The glyph in your "..ringOrAmulet.english.." glows brightly as it activates for one last time, before fading away into nothingness."
        )
    else
        jewellery:setData("glyphCharges", newCharges)
    end
    world:changeItem(jewellery)

    return true
end

function M.getJewelleryBasedOnGlyphName(glyphName)

    for _, definition in pairs(ringAndAmuletDefinitions) do
        if definition.glyph.amulet == glyphName then
            return definition.amulets
        elseif definition.glyph.ring == glyphName then
            return definition.rings
        end
    end
end

local function lookatText(lang, jewellery, detailed)

    local charges = tonumber(jewellery:getData("glyphCharges"))

    if common.IsNilOrEmpty(charges) then
        return false
    end

    local maxCharges = M.getAmountOfCharges(jewellery, jewellery, true)

    local texts = {
        {identifier = math.floor(maxCharges*0.1), german = "kaum", english = "barely"},
        {identifier = math.floor(maxCharges*0.5), german = "weniger als die Hälfte", english = "below half-way"},
        {identifier = math.floor(maxCharges*0.9), german = "mehr als die Hälfte", english = "above half-way"},
        {identifier = math.floor(maxCharges), german = "vollständig", english = "fully"}
        }

    local retVal
    local lastIdentifier = maxCharges+1

    for _, text in pairs(texts) do
        if text.identifier < lastIdentifier and tonumber(charges) <= text.identifier then --Get the smallest amount that the amount of charges is below
            lastIdentifier= text.identifier
            retVal = lang == Player.german and "Die eingefügte Glyphe scheint "..text.german.." geladen zu sein." or "The attached glyph seems to be ".. text.english .. " charged."
        end
    end

    if retVal then
        return retVal
    end

    return lang == Player.german and "unbekannte Zahl an".. " verbleibende Glyphen Ladungen" or "unknown amount of".. " remaining glyph charges"
end

function M.getRemainingChargePercentage(jewellery)

    local maxCharges = M.getAmountOfCharges(jewellery, jewellery, true)

    local charges = tonumber(jewellery:getData("glyphCharges"))

    if common.IsNilOrEmpty(charges) then
        return "0 %"
    end

    local retVal = math.floor(charges/maxCharges*100)

    return retVal.." %"
end

function M.lookatGlyphedItem(jewellery, language)

    local german = lookatText(Player.german, jewellery)
    local english = lookatText(Player.english, jewellery)

    if not german or not english then
        return ""
    end

    local text = "\n "

    if language == Player.german then
        text = text .. german
    else
        text = text .. english
    end

    return text
end

function M.getGlyphEffectText(glyph)

    local effect

    for _, definition in pairs(ringAndAmuletDefinitions) do
        if Item[definition.glyph.amulet] == glyph.id then
            effect = definition.effect.amulet
        elseif Item[definition.glyph.ring] == glyph.id then
            effect = definition.effect.ring
        end
    end

    return effect.english, effect.german

end

function M.getJewelleryEffectText(jewellery)

    local effect

    for _, definition in pairs(ringAndAmuletDefinitions) do
        for _, ring in pairs(definition.rings) do
            if ring == jewellery.id then
                effect = definition.effect.ring
            end
        end

        for _, amulet in pairs(definition.amulets) do
            if amulet == jewellery.id then
                effect = definition.effect.amulet
            end
        end
    end


    return effect.english, effect.german

end

function M.getListOfShardsForGlyph(glyphName)

    local retList = {}

    for _, name in pairs(shardNames.first) do
        if name == glyphName then
            for _, lastname in pairs(shardNames.last) do
                local shardName = glyphName..lastname
                table.insert(retList, Item[shardName])
            end
            return retList
        end
    end


    for _, name in pairs(shardNames.last) do
        if name == glyphName then
            for _, firstname in pairs(shardNames.first) do
                local shardName = firstname..glyphName
                table.insert(retList, Item[shardName])
            end
            return retList
        end
    end

    return nil

end

local belt = {Character.belt_pos_1, Character.belt_pos_2, Character.belt_pos_3, Character.belt_pos_4, Character.belt_pos_5, Character.belt_pos_6}

function M.listGlyphsAtBelt(user)

    local retList = {}

    for _, beltSlot in pairs(belt) do
        local beltItem = user:getItemAt(beltSlot)

        for _, definition in pairs(ringAndAmuletDefinitions) do
            if Item[definition.glyph.amulet] == beltItem.id or Item[definition.glyph.ring] == beltItem.id then --is a glyph
                table.insert(retList, beltItem)
            end
        end
    end

    return retList

end

function M.listGlyphedJewelleryAtBelt(user, inspection)

    local retList = {}

    for _, beltSlot in pairs(belt) do
        local beltItem = user:getItemAt(beltSlot)
        local glyphCharges = beltItem:getData("glyphCharges")

        if not common.IsNilOrEmpty(glyphCharges) and (M.userSkillMatchesItem(user, beltItem) or inspection) then --The item is glyphed and user is high enough level or just inspecting
            table.insert(retList, beltItem)
        end
    end

    return retList
end

function M.userSkillMatchesItem(user, beltItem)

    local requiredSkill

    for _, definition in pairs(ringAndAmuletDefinitions) do
        for _, ring in pairs(definition.rings) do
            if ring == beltItem.id then
                requiredSkill = definition.skill.ring
            end
        end

        for _, amulet in pairs(definition.amulets) do
            if amulet == beltItem.id then
                requiredSkill = definition.skill.amulet
            end
        end
    end

    local userSkill = user:getSkill(Character["enchanting"])

    if requiredSkill and userSkill >= requiredSkill then
        return true
    end

    return false
end

function M.getJewelleryGlyphName(jewellery)

    for _, definition in pairs(ringAndAmuletDefinitions) do
        for _, amulet in pairs(definition.amulets) do
            if amulet == jewellery.id then
                return definition.glyph.amulet
            end
        end
        for _, ring in pairs(definition.rings) do
            if ring == jewellery.id then
                return definition.glyph.ring
            end
        end
    end

    return nil
end

function M.getCompatibleJewellery(glyphId)

    for _, definition in pairs(ringAndAmuletDefinitions) do
        if Item[definition.glyph.amulet] == glyphId then
            return definition.amulets
        elseif Item[definition.glyph.ring] == glyphId then
            return definition.rings
        end
    end

    return nil

end

local shardItems = {}
local shardItemNames = {}

for _, first in pairs(shardNames.first) do
    for _, last in pairs(shardNames.last) do
        table.insert(shardItems, Item[first..last])
        table.insert(shardItemNames, first..last)
    end
end

local function getRandomShard()

    local rand = math.random(1, #shardItems)

    return shardItems[rand]

end

function M.createShardOnPosition(pos)

    local shardId = getRandomShard()

    world:createItemFromId(shardId, 1, pos, false, 999, nil)

end

function M.createShardOnUser(user)

    local shardId = getRandomShard()

    common.CreateItem(user, shardId, 1, 999)

end

local function jewelleryTypeGemTypeMetalType(jewellery)

    for _, definition in pairs(ringAndAmuletDefinitions) do
        for metal, amulet in pairs(definition.amulets) do
            if amulet == jewellery.id then
                return "amulet", definition.gem, metal
            end
        end

        for metal, ring in pairs(definition.rings) do
            if ring == jewellery.id then
                return "ring", definition.gem, metal
            end
        end
    end

    return false

end

function M.getAmountOfCharges(jewellery, glyph, max)

    local quality = common.getItemQuality(glyph) + common.getItemQuality(jewellery)

    if max then
        quality = 18
    end

    local jewelleryType, gem, metal = jewelleryTypeGemTypeMetalType(jewellery)

    if metal == 1 then
        metal = "copper"
    elseif metal == 2 then
        metal = "silver"
    elseif metal == 3 then
        metal = "gold"
    end

    local charges = {
        ruby = {
            amulet = {copper = 2 + quality, silver = 3 + (quality*1.5), gold = 4 + (quality*2) }, -- Up to 20, 30, 40 charges based on metal type and scaled by quality
            ring = {copper = 2 + quality, silver = 3 + (quality*1.5), gold = 4 + (quality*2) } -- 20, 30, 40
        },
        amethyst = {
            amulet = {copper = 1 + (quality/9), silver = 2 + (quality/4.5), gold = 3 + (quality/3)}, -- 3, 6, 9
            ring = {copper = 0.5 + (quality/4), silver = 1 + (quality/2), gold = 3 + (quality/1.5)} -- 5, 10, 15
        },
        obsidian = {
            amulet = {copper = 2 + quality, silver = 3 + (quality*1.5), gold = 4 + (quality*2) }, -- 20, 30, 40
            ring = {copper = 0.5 + (quality/4), silver = 1 + (quality/2), gold = 3 + (quality/1.5)} -- 5, 10, 15
        },
        sapphire = {
            amulet = {copper = 1 + (quality/2), silver = 3 + (quality/1.5), gold = 4 + (quality/1.125)}, -- 10, 15, 20
            ring = {copper = 3 + (quality*1.5), silver = 4 + (quality*2), gold = 5 + (quality*2.5)} -- 30, 40, 50
        },
        emerald = {
            amulet = {copper = 1 + (quality/2), silver = 3 + (quality/1.5), gold = 4 + (quality/1.125)}, -- 10, 15, 20
            ring = {copper = 1 + (quality/2), silver = 3 + (quality/1.5), gold = 4 + (quality/1.125)} -- 10, 15, 20
        },
        topaz = {
            amulet = {copper = 1 + (quality/2), silver = 3 + (quality/1.5), gold = 4 + (quality/1.125)}, -- 10, 15, 20
            ring = {copper = quality/3, silver = quality/2, gold = quality/1.5} -- 6, 9, 12
        },
        diamond = {
            amulet = {copper = quality/0.6, silver = quality/0.3, gold = quality*5}, -- 30, 60, 90
            ring = {copper = 1 + (quality/2), silver = 3 + (quality/1.5), gold = 4 + (quality/1.125)} -- 10, 15, 20
        },
    }

    return math.max(math.floor(charges[gem][jewelleryType][metal]), 1)

end

function M.isValidItemForGlyphs(itemId)

    for _, definition in pairs(ringAndAmuletDefinitions) do
        for _, amulet in pairs(definition.amulets) do
            if itemId == amulet then
                return true
            end
        end

        for _, ring in pairs(definition.rings) do
            if itemId == ring then
                return true
            end
        end
    end

    return false
end

function M.setCharges(jewellery, amount)

    jewellery:setData("glyphCharges", tonumber(amount))
    world:changeItem(jewellery)

end

function M.getAmulet(user)

    local amulet = user:getItemAt(Character.neck)

    return amulet

end

function M.getRings(user)

    local ring_left = user:getItemAt(Character.finger_left_hand)
    local ring_right = user:getItemAt(Character.finger_right_hand)

    return ring_left, ring_right

end

return M
