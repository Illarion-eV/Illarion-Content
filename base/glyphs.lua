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
--- This script contains basics for glyph forging.
--
--  Author: Banduk

local common = require("base.common")

local M = {}

local shardNames =
{{"Anemo", "Pyr", "Hydor", "Chous", "Dendron", "Nomizo", "Hieros"},
{"gwynt", "tan", "ilyn", "daear", "coeden", "ysbryd", "dwyfol"}}
local shardItemId =
{3493, 3494, 3495,3496,3497}

M.GLYPH_SHRINE_ID = 3498

M.SKILL_GLYPHING = Character.enchantingOfJewels

M.SHARD_LEVEL_DATA_KEY = "shardLevel"
M.GLYPH_EFFEKT_REMAIN_DATA_KEY = "glyphEffNo"
M.GLYPH_EFFEKT_SHOW_MIN_DATA_KEY = "glyphEffNoMin"
M.GLYPH_EFFEKT_SHOW_MAX_DATA_KEY = "glyphEffNoMax"

M.RING = 1
M.AMULET = 2

M.COPPER = 1
M.SILVER = 2
M.GOLD = 3

M.orderOfGem = {
{"Amethyst","Amethyst"},
{"Rubin","Ruby"},
{"Saphir","Sappire"},
{"Obsidian","Obsidian"},
{"Smaragd","Emerald"},
{"Topas","Topaz"},
{"Diamant","Diamond"}}

M.ringAndAmuletDefinition={
--{itemID ring, itemID amulet, shard row/column, skill, working time}
                    {3527,3526,1,0,40}, --Copper Amethyst
                    {3540,3539,2,0,47}, --Copper Ruby
                    {3542,3559,3,5,54}, --Copper Sappire
                    {3537,3536,4,10,61}, --Copper Obsidian
                    {3547,3546,5,15,68}, --Copper Emerald
                    {3550,3549,6,20,75}, --Copper Topaz
                    {3531,3530,7,25,82}, --Copper Diamond
                    {3529,3528,1,30,89}, --Silver Amethyst
                    {3560,3541,2,35,96}, --Silver Ruby
                    {3544,3543,3,40,103}, --Silver Sappire
                    {3561,3538,4,45,110}, --Silver Obsidian
                    {3545,3548,5,50,117}, --Silver Emerald
                    {3552,3551,6,55,124}, --Silver Topaz
                    {3533,3532,7,60,131}, --Silver Diamond
                    {277,79,1,65,138}, --Gold Amethyst
                    {68,67,2,70,145}, --Gold Ruby
                    {279,71,3,75,152}, --Gold Sappire
                    {278,82,4,80,159}, --Gold Obsidian
                    {281,62,5,85,166}, --Gold Emerald
                    {282,83,6,90,173}, --Gold Topaz
                    {280,3534,7,95,180} --Gold Diamond
                    }

local ITEM_ID_CANDLES = 43
local ITEM_ID_CANDLEHOLDER = 399

M.glyphForgeFindTime = 4
M.glyphForgeFindMaxSkill = 20
M.glyphForgeErectionTime = 54
M.glyphForgeErectionMinSkill = 25
M.glyphRitualPrepareTime = 82
M.glyphRitualPrepareMinSkill = 5
M.glyphRitualPrepareExposureTime = 300
M.glyphRitualPrepareNecessaryItems = { {ITEM_ID_CANDLES, 2} , {ITEM_ID_CANDLEHOLDER, 2} }
M.glyphRitualBreakGlyphSkill = 20
M.glyphRitualBreakTimePortion = 0.5
M.glyphRitualBreakManaPortion = 0.5


M.EFFEKT_RING_AMETHYST = 1
M.EFFEKT_RING_RUBY = 2
M.EFFEKT_RING_SAPPIRE = 3
M.EFFEKT_RING_OBSIDIAN = 4
M.EFFEKT_RING_EMERALD = 5
M.EFFEKT_RING_TOPAZ = 6
M.EFFEKT_RING_DIAMOND = 7
M.EFFEKT_AMULET_AMETHYST = 8
M.EFFEKT_AMULET_RUBY = 9
M.EFFEKT_AMULET_SAPPIRE = 10
M.EFFEKT_AMULET_OBSIDIAN = 11
M.EFFEKT_AMULET_EMERALD = 12
M.EFFEKT_AMULET_TOPAZ = 13
M.EFFEKT_AMULET_DIAMOND = 14

M.glyphEffects ={}
--{charges, probability, copper, silver, gold}
--                                         {ch,prob ,cop ,silv,gold}
M.glyphEffects[M.EFFEKT_RING_AMETHYST]   = {20, 0.2 ,0.5 ,1   ,2   } --Amethyst ring
M.glyphEffects[M.EFFEKT_RING_RUBY]       = {10, 0.1 ,0.5 ,1   ,2   } --Ruby ring
M.glyphEffects[M.EFFEKT_RING_SAPPIRE]    = {15, 0.2 ,0.5 ,1   ,2   } --Sappire ring
M.glyphEffects[M.EFFEKT_RING_OBSIDIAN]   = {20, 0.2 ,0.5 ,1   ,2   } --Obsidian ring
M.glyphEffects[M.EFFEKT_RING_EMERALD]    = {10, 0.1 ,0.5 ,1   ,2   } --Emerald ring
M.glyphEffects[M.EFFEKT_RING_TOPAZ]      = {20, 0.2 ,0.5 ,1   ,2   } --Topaz ring
M.glyphEffects[M.EFFEKT_RING_DIAMOND]    = {20, 0.1 ,0.5 ,1   ,2   } --Diamond ring
M.glyphEffects[M.EFFEKT_AMULET_AMETHYST] = {20, 0.2 ,0.5 ,1   ,2   } --Amethyst amulet
M.glyphEffects[M.EFFEKT_AMULET_RUBY]     = {10, 0.1 ,0.5 ,1   ,2   } --Ruby amulet
M.glyphEffects[M.EFFEKT_AMULET_SAPPIRE]  = {15, 0.2 ,0.5 ,1   ,2   } --Sappire amulet
M.glyphEffects[M.EFFEKT_AMULET_OBSIDIAN] = {20, 0.3 ,0.5 ,1   ,2   } --Obsidian amulet
M.glyphEffects[M.EFFEKT_AMULET_EMERALD]  = {10, 0.1 ,0.5 ,1   ,2   } --Emerald amulet
M.glyphEffects[M.EFFEKT_AMULET_TOPAZ]    = {20, 0.2 ,0.5 ,1   ,2   } --Topaz amulet
M.glyphEffects[M.EFFEKT_AMULET_DIAMOND]  = {20, 0.1 ,0.5 ,1   ,2   } --Diamond amulet

local positionsOnChar = {5,6,12,13,14,15,16,17} --hands and belt

function M.getShardNameFromLevel(shardLevel)
    local textParts
    local textResult
    textParts = common.Split_number(shardLevel,2)
    if textParts[1] > 0 and textParts[1] < 8 and textParts[1] > 0 and textParts[1] < 8 then
        textResult = shardNames[1][textParts[1] ] .. shardNames[2][textParts[2] ] 
    else
        -- should not happen
        textResult = "Schadnix"
    end
    return textResult
end

function M.hasRing(user)
--returns a list of all rings
    local listOfRings = {}
    local listResult = {}
    local listResultId = 0
    local listId
    
    for i=1, #M.ringAndAmuletDefinition do
        listOfRings[i]=M.ringAndAmuletDefinition[i][1]
    end
    for i=1, #positionsOnChar do
        local itemAtUser = user:getItemAt( positionsOnChar[i] )
        listId = common.posInList(itemAtUser.id, listOfRings)
        if listId > 0 then
            listResultId = listResultId + 1
            listResult[listResultId] = itemAtUser
        end
    end
    return listResult
end

function M.hasAmulet(user)
--returns a list of all amulets
    local listOfAmulets = {}
    local listResult = {}
    local listResultId = 0
    local listId
    
    for i=1, #M.ringAndAmuletDefinition do
        listOfAmulets[i]=M.ringAndAmuletDefinition[i][2]
    end
    for i=1, #positionsOnChar do
        local itemAtUser = user:getItemAt( positionsOnChar[i] )
        listId = common.posInList(itemAtUser.id, listOfAmulets)
        if listId > 0 then
            listResultId = listResultId + 1
            listResult[listResultId] = itemAtUser
        end
    end
    return listResult
end

function M.getRandomShardLevel()
    return math.random(1, 7) * 10 + math.random(1, 7)
end

function M.getShardId(shardLevel)
    local shardParts
    local shardNumber
    local itemIdPos
    shardParts = common.Split_number(shardLevel,2)
    shardNumber = tonumber(shardParts[1])*7+tonumber(shardParts[2])
    itemIdPos = 1 + shardNumber - math.floor(shardNumber/#shardItemId) * #shardItemId
    return tonumber(shardItemId[itemIdPos])
end

function M.getShardName(item)
    local shardLevel = tonumber(item:getData(M.SHARD_LEVEL_DATA_KEY))
    if shardLevel ~= nil then
        return M.getShardNameFromLevel(shardLevel)
    else
        -- should not happen
        return "Schadnix"
    end
end

function M.getGlyphSkillLevel(item)
    local itemId = item.id
    for i = 1, #M.ringAndAmuletDefinition do
        if itemId == M.ringAndAmuletDefinition[i][1] or itemId == M.ringAndAmuletDefinition[i][2] then
            return M.ringAndAmuletDefinition[i][4]
        end
    end
    return 1000 --never reachable skill
end

function M.getGlyphWorkingTime(item)
    local itemId = item.id
    for i = 1, #M.ringAndAmuletDefinition do
        if itemId == M.ringAndAmuletDefinition[i][1] or itemId == M.ringAndAmuletDefinition[i][2] then
            return M.ringAndAmuletDefinition[i][5]
        end
    end
    return 0
end

function M.getGlyphLevel(item)
    local itemId = item.id
    for i = 1, #M.ringAndAmuletDefinition do
        if itemId == M.ringAndAmuletDefinition[i][1] or itemId == M.ringAndAmuletDefinition[i][2] then
            return M.ringAndAmuletDefinition[i][3]
        end
    end
    return 0
end

function M.getGlyphMaterial(item)
    local itemId = item.id
    for i = 1, #M.ringAndAmuletDefinition do
        if itemId == M.ringAndAmuletDefinition[i][1] or itemId == M.ringAndAmuletDefinition[i][2] then
            if i <= 7 then
                return M.COPPER
            elseif i <= 14 then
                return M.SILVER
            else
                return M.GOLD
            end
        end
    end
    return 0
end

function M.getGlyphRingOrAmulet(item)
    local itemId = item.id
    for i = 1, #M.ringAndAmuletDefinition do
        if itemId == M.ringAndAmuletDefinition[i][1] then
            return M.RING
        elseif itemId == M.ringAndAmuletDefinition[i][2] then
            return M.AMULET
        end
    end
    return 0
end

function M.setRemainingGlyphs(item,number)
    local usedNo = tonumber(number)
    if usedNo ~= nil and usedNo > 0 then
        item:setData(M.GLYPH_EFFEKT_REMAIN_DATA_KEY,usedNo)
        item:setData(M.GLYPH_EFFEKT_SHOW_MIN_DATA_KEY,math.max(1,usedNo-math.random(0,2)))
        item:setData(M.GLYPH_EFFEKT_SHOW_MAX_DATA_KEY,usedNo+math.random(0,2))
    else
        item:setData(M.GLYPH_EFFEKT_REMAIN_DATA_KEY,0)
        item:setData(M.GLYPH_EFFEKT_SHOW_MIN_DATA_KEY,0)
        item:setData(M.GLYPH_EFFEKT_SHOW_MAX_DATA_KEY,0)
    end
    world:changeItem(item)
end

function M.getWorkingTime(item)
    for i=1,#M.ringAndAmuletDefinition do
        if item.id == M.ringAndAmuletDefinition[i][1] or item.id == M.ringAndAmuletDefinition[i][2] then
            return M.ringAndAmuletDefinition[i][5]
        end
    end
    return 0
end

function M.getNominalCharges(item)
    for i=1,#M.ringAndAmuletDefinition do
        if item.id == M.ringAndAmuletDefinition[i][1] then
            return M.glyphEffects[i][1]
        elseif item.id == M.ringAndAmuletDefinition[i][2] then
            return M.glyphEffects[i+7][1]
        end
    end
    return 0
end

function M.getRemainingGlyphs(item)
    local number = tonumber(item:getData(M.GLYPH_EFFEKT_REMAIN_DATA_KEY))
    if number == nil then
        return 0
    end
    return number
end

function M.isGlyphed(item)
    if M.getRemainingGlyphs(item) == 0 then
        return false
    end
    return true
end

function M.lookatGlyph(item, lang)
    if M.isGlyphed(item) then
        local text = "\n " .. tostring(item:getData(M.GLYPH_EFFEKT_SHOW_MIN_DATA_KEY)) .. "-" .. tostring(item:getData(M.GLYPH_EFFEKT_SHOW_MAX_DATA_KEY))
        if lang == Player.german then
            text = text .. " verbleibende Glyphen Ladungen"
        else
            text = text .. " remaining glyph charges"
        end
        return text
    else
        return ""
    end
end

return M
