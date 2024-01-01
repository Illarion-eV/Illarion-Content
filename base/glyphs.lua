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

local M = {}

local positionsOnChar = {5,6,12,13,14,15,16,17} --hands and belt
local shardFirst = {"anemo", "pyr", "hydor", "chous", "dendron", "nomizo", "hieros"}
local shardLast =  {"gwynt", "tan", "ilyn", "daear", "coeden", "ysbryd", "dwyfol"}
local shardItems = {}
local shardItemNames = {}

for _, first in pairs(shardFirst) do
    for _, last in pairs(shardLast) do
        table.insert(shardItems, Item[first..last])
        table.insert(shardItemNames, first..last)
    end
end

local ringAndAmuletDefinitions = {
    {   -- Amethyst
        jewellery = {
            {ring = Item.copperAmethystRing, amulet = Item.copperAmethystAmulet, skill = 0, time = 40, power = {amulet = 0.5, ring = 0.5}},
            {ring = Item.silverAmethystRing, amulet = Item.silverAmethystAmulet, skill = 30, time = 89, power = {amulet = 1, ring = 1}},
            {ring = Item.goldenAmethystRing, amulet = Item.goldenAmethystAmulet, skill = 65, time = 138, power = {amulet = 2, ring = 2}}
        },
        shard = { amulet = "gwynt", ring = "anemo"},
        effect = { amulet = 8, ring = 1},
        charges = { amulet = 20, ring = 20},
        probability = {amulet = 0.2, ring = 0.2}
    },
    {   -- Ruby
        jewellery = {
            {ring = Item.copperRubyRing, amulet = Item.copperRubyAmulet, skill = 0, time = 47, power = {amulet = 0.5, ring = 0.5}},
            {ring = Item.silverRubyRing, amulet = Item.silverRubyAmulet, skill = 35, time = 96, power = {amulet = 1, ring = 1}},
            {ring = Item.goldenRubyRing, amulet = Item.goldenRubyAmulet, skill = 70, time = 145, power = {amulet = 2, ring = 2}}
        },
        shard = { amulet = "tan", ring = "pyr"},
        effect = { amulet = 9, ring = 2},
        charges = { amulet = 10, ring = 10},
        probability = {amulet = 0.1, ring = 0.1}
    },
    { -- Sapphire
        jewellery = {
            {ring = Item.copperSapphireRing, amulet = Item.copperSapphireAmulet, skill = 5, time = 54, power = {amulet = 0.5, ring = 0.5}},
            {ring = Item.silverSapphireRing, amulet = Item.silverSapphireAmulet, skill = 40, time = 103, power = {amulet = 1, ring = 1}},
            {ring = Item.goldenSapphireRing, amulet = Item.goldenSapphireAmulet, skill = 75, time = 152, power = {amulet = 2, ring = 2}}
        },
        shard = { amulet = "ilyn", ring = "hydor"},
        effect = { amulet = 10, ring = 3},
        charges = { amulet = 15, ring = 15},
        probability = {amulet = 0.2, ring = 0.2}
    },
    { -- Obsidian
        jewellery = {
            {ring = Item.copperObsidianRing, amulet = Item.copperObsidianAmulet, skill = 10, time = 61, power = {amulet = 0.5, ring = 0.5}},
            {ring = Item.silverObsidianRing , amulet = Item.silverObsidianAmulet, skill = 45, time = 110, power = {amulet = 1, ring = 1}},
            {ring = Item.goldenObsidianRing, amulet = Item.goldenObsidianAmulet, skill = 80, time = 159, power = {amulet = 2, ring = 2}}
        },
        shard = { amulet = "daear", ring = "chous"},
        effect = { amulet = 11, ring = 4},
        charges = { amulet = 20, ring = 20},
        probability = {amulet = 0.3, ring = 0.2}
    },
    { -- Emerald
        jewellery = {
            {ring = Item.copperEmeraldRing, amulet = Item.copperEmeraldAmulet, skill = 15, time = 68, power = {amulet = 0.5, ring = 0.5}},
            {ring = Item.silverEmeraldRing, amulet = Item.silverEmeraldAmulet, skill = 50, time = 117, power = {amulet = 1, ring = 1}},
            {ring = Item.goldenEmeraldRing, amulet = Item.goldenEmeraldAmulet, skill = 85, time = 166, power = {amulet = 2, ring = 2}}
        },
        shard = { amulet = "coeden", ring = "dendron"},
        effect = { amulet = 12, ring = 5},
        charges = { amulet = 10, ring = 10},
        probability = {amulet = 0.1, ring = 0.1}
    },
    { -- Topaz
        jewellery = {
            {ring = Item.copperTopazRing , amulet = Item.copperTopazAmulet, skill = 20, time = 75, power = {amulet = 0.5, ring = 0.5}},
            {ring = Item.silverTopazRing, amulet = Item.silverTopazAmulet, skill = 55, time = 124, power = {amulet = 1, ring = 1}},
            {ring = Item.goldenTopazRing, amulet = Item.goldenTopazAmulet, skill = 90, time = 173, power = {amulet = 2, ring = 2}}
        },
        shard = { amulet = "ysbryd", ring = "nomizo"},
        effect = { amulet = 13, ring = 6},
        charges = { amulet = 20, ring = 20},
        probability = {amulet = 0.2, ring = 0.2}
    },
    { -- Diamond
        jewellery = {
            {ring = Item.copperDiamondRing, amulet = Item.copperDiamondAmulet, skill = 25, time = 82, power = {amulet = 0.5, ring = 0.5}},
            {ring = Item.silverDiamondRing, amulet = Item.silverDiamondAmulet, skill = 60, time = 131, power = {amulet = 1, ring = 1}},
            {ring = Item.goldenDiamondRing, amulet = Item.goldenDiamondAmulet, skill = 95, time = 180, power = {amulet = 2, ring = 2}}
        },
        shard = { amulet = "dwyfol", ring = "hieros"},
        effect = { amulet = 14, ring = 7},
        charges = { amulet = 20, ring = 20},
        probability = {amulet = 0.1, ring = 0.1}
    }
}

function M.getRandomShard()

    local rand = math.random(1, #shardItems)

    return shardItems[rand]

end

function M.getProbability(effectId)

    for _, gemType in pairs(ringAndAmuletDefinitions) do
        if gemType.effect.amulet == effectId then
            return gemType.probability.amulet
        elseif gemType.effect.ring == effectId then
            return gemType.probability.ring
        end
    end
end

function M.checkFingerNeck(user, effectId)

    local finger1 = user:getItemAt(7)

    local finger2 = user:getItemAt(8)

    local neck = user:getItemAt(2)

    for _, gemType in pairs(ringAndAmuletDefinitions) do
        for _, jewellery in pairs(gemType.jewellery) do
            if jewellery.amulet == neck.id and M.isGlyphed(neck) then
                if effectId == gemType.effect.amulet then
                    return true, neck, jewellery.power.amulet
                end
            end
            if jewellery.ring == finger1.id and M.isGlyphed(finger1) then
                if effectId == gemType.effect.ring then
                    return true, finger1, jewellery.power.ring
                end
            end

            if jewellery.ring == finger2.id and M.isGlyphed(finger2) then
                if effectId == gemType.effect.ring then
                    return true, finger2, jewellery.power.ring
                end
            end
        end
    end

    return false, nil, nil
end

function M.consumeShardsUsedToGlyphItem(user, jewellery)
    local shardsNeeded = M.getListOfShardsRequiredToGlyphTheItem(jewellery.id)

    if not M.playerHasRequiredShardsToGlyphTheItem(user, jewellery) then
        return false
    end

    for _, shardId in pairs(shardsNeeded) do
        user:eraseItem(shardId,1)
    end

    return true
end

function M.getGemTypeNumberFromJewelleryId(jewelleryId)

    for gemTypeNumber, gemType in pairs(ringAndAmuletDefinitions) do
        if gemType.jewellery.ring == jewelleryId or gemType.jewellery.amulet == jewelleryId then
            return gemTypeNumber
        end
    end

    return nil
end

function M.playerHasRequiredShardsToGlyphTheItem(player, itemId)

    local listOfItemsRequired = M.getListOfShardsRequiredToGlyphTheItem(itemId)

    local totalFound = 0

    for _, itemRequired in pairs(listOfItemsRequired) do

        local userHasItem = player:countItemAt("all", itemRequired)

        if userHasItem > 0 then
            totalFound = totalFound + 1
        end
    end

    if totalFound < 7 then
        return false, totalFound
    elseif totalFound == 7 then
        return true, totalFound
    end

    return nil

end


function M.getListOfShardsRequiredToGlyphTheItem(itemId)

    for _, gemType in pairs(ringAndAmuletDefinitions) do
        for _, jewellery in pairs(gemType.jewellery) do

            local word

            if jewellery.ring == itemId then
                word = gemType.shard.ring
            elseif jewellery.amulet == itemId then
                word = gemType.shard.amulet
            end

            local listOfItemsRequired = {}

            if word then
                for _, itemName in pairs(shardItemNames) do
                    if string.find(itemName, word) then
                        table.insert(listOfItemsRequired, Item[itemName])
                    end
                end

                return listOfItemsRequired
            end
        end
    end
end

function M.getJewelledItemBasedOnGemTypeNumber(ringOrAmulet, gemTypeId)

    return ringAndAmuletDefinitions[gemTypeId].jewellery[1][ringOrAmulet]   --Always returns the copper version of the jewellery

end

function M.getListOfShardsRequiredToGlyphItemViaGemTypeNumber(ringOrAmulet, gemTypeId)

    local itemId = M.getJewelledItemBasedOnGemTypeNumber(ringOrAmulet, gemTypeId)

    return M.getListOfShardsRequiredToGlyphTheItem(itemId)

end

function M.hasRingOrAmulet(user)

    local listOfRings = {}
    local listOfAmulets = {}
    local retRings = {}
    local retAmulets = {}

    -- Get a list of all eligible jewellery from the main list
    for _, gemType in pairs (ringAndAmuletDefinitions) do
        for _, jewellery in pairs(gemType.jewellery) do
            table.insert(listOfRings, jewellery.ring)
            table.insert(listOfAmulets, jewellery.amulet)
        end
    end

    -- Find any such jewellery that the character has in their hands or belt
    for _, positionOnChar in pairs(positionsOnChar) do
        local itemAtUser = user:getItemAt(positionOnChar)
        local listIdRing = common.posInList(itemAtUser.id, listOfRings)
        local listIdAmulet = common.posInList(itemAtUser.id, listOfAmulets)

        if listIdRing > 0 then
            table.insert(retRings, itemAtUser)
        elseif listIdAmulet > 0 then
            table.insert(retAmulets, itemAtUser)
        end
    end

    return retRings, retAmulets
end

function M.getSkillRequiredToGlyphTheItem(itemId)

    for _, gemType in pairs (ringAndAmuletDefinitions) do
        for _, jewellery in pairs(gemType.jewellery) do
            if jewellery.ring == itemId or jewellery.amulet == itemId then
                return jewellery.skill
            end
        end
    end

    return 1000 --never reachable skill
end

function M.getGlyphWorkingTime(itemId)

    for _, gemType in pairs (ringAndAmuletDefinitions) do
        for _, jewellery in pairs(gemType.jewellery) do
            if jewellery.ring == itemId or jewellery.amulet == itemId then
                return jewellery.time
            end
        end
    end

    return 0
end

function M.getGlyphMaterial(itemId)

    for _, gemType in pairs (ringAndAmuletDefinitions) do
        for index, jewellery in ipairs(gemType.jewellery) do
            if jewellery.ring == itemId or jewellery.amulet == itemId then
                return index
            end
        end
    end

    return 0
end

function M.getGlyphRingOrAmulet(itemId)

    for _, gemType in pairs(ringAndAmuletDefinitions) do
        for _, jewellery in pairs(gemType.jewellery) do
            if jewellery.ring == itemId then
                return "ring"
            elseif jewellery.amulet == itemId then
                return "amulet"
            end
        end
    end

    return nil
end

function M.setRemainingGlyphs(glyphedItem, amount)

    amount = tonumber(amount)

    if amount and amount > 0 then
        glyphedItem:setData("glyphEffNo", amount)
    else
        glyphedItem:setData("glyphEffNo",0)
    end

    world:changeItem(glyphedItem)
end

function M.getNominalCharges(itemId)

    for _, gemType in pairs (ringAndAmuletDefinitions) do
        for _, jewellery in pairs(gemType.jewellery) do
            if jewellery.ring == itemId then
                return gemType.charges.ring
            elseif jewellery.amulet == itemId then
                return gemType.charges.amulet
            end
        end
    end
    return 0
end

function M.getRemainingGlyphs(glyphedItem)

    local amount = glyphedItem:getData("glyphEffNo")

    if not common.IsNilOrEmpty(amount) then
        return tonumber(amount)
    end

    return 0

end

function M.isGlyphed(glyphedItem)

    if M.getRemainingGlyphs(glyphedItem) == 0 then
        return false
    end

    return true
end

function M.lookatText(amount, lang)

    local texts = {
        {identifier = 3, german = "sehr wenige", english = "very little"},
        {identifier = 6, german = "wenige", english = "a few"},
        {identifier = 10, german = "einige", "some"},
        {identifier = 14, german = "viele", "many"},
        {identifier = 99999, german = "sehr viele", english = "a lot of"}
        }

    for _, text in ipairs(texts) do
        if tonumber(amount) < text.identifier then
            return lang == Player.german and text.german or text.english
        end
    end

    return lang == Player.german and "unbekannte Zahl an" or "unknown amount of"
end

function M.lookatGlyph(glyphedItem, lang)

    if M.isGlyphed(glyphedItem) then

        local number = tonumber(glyphedItem:getData("glyphEffNo"))
        local text = "\n "

        if lang == Player.german then
            text = text .. common.firstToUpper(M.lookatText(number, Player.german)) .. " verbleibende Glyphen Ladungen"
        else
            text = text .. common.firstToUpper(M.lookatText(number, Player.english)) .. " remaining glyph charges"
        end

        return text
    end

    return ""
end

function M.createGlyphedItemOnPosition(pos, jewelry, charges)

    jewelry = tonumber(jewelry)
    local glyphedItem = world:createItemFromId(jewelry, 1, pos, false, 333, nil)
    M.setRemainingGlyphs(glyphedItem, charges)

end

function M.dropGlyphedItemByChance(treasureLocation, treasureLevel)
    if treasureLevel > 5 then
        local jewelryMaterial = math.random(1,3)
        local jewelryGem = math.random(1,7)
        local jewelryLevel = jewelryGem*jewelryMaterial
        local jewelryType = math.random(1,2)
        local jewelryOptions = {"amulet", "ring"}
        local ringOrAmulet = jewelryOptions[jewelryType]
        local jewelryCharges = math.random (1, treasureLevel - 3)
        local probLimit = ((25.1 - tonumber(jewelryLevel)) + (treasureLevel - 5) * 5 )/100.0
        if math.random() < probLimit then
            M.createGlyphedItemOnPosition(treasureLocation, ringAndAmuletDefinitions[jewelryGem].jewellery[jewelryMaterial][ringOrAmulet], jewelryCharges)
        end
    end
end

return M
