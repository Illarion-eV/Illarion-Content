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

M.DIAMOND  = 1
M.EMERALD  = 2
M.RUBY     = 3
M.OBSIDIAN = 4
M.SAPPHIRE = 5
M.AMETHYST = 6
M.TOPAZ    = 7

M.gemItemId = {}
M.gemItemId[M.DIAMOND] = 3520
M.gemItemId[M.EMERALD] = 3523
M.gemItemId[M.RUBY] = 3521
M.gemItemId[M.OBSIDIAN] = 3524
M.gemItemId[M.SAPPHIRE] = 3522
M.gemItemId[M.AMETHYST] = 3519
M.gemItemId[M.TOPAZ] = 3525

local gemDataKey = {}
gemDataKey[M.DIAMOND] = "magicalDiamond"
gemDataKey[M.EMERALD] = "magicalEmerald"
gemDataKey[M.RUBY] = "magicalRuby"
gemDataKey[M.OBSIDIAN] = "magicalObsidian"
gemDataKey[M.SAPPHIRE] = "magicalSapphire"
gemDataKey[M.AMETHYST] = "magicalAmethyst"
gemDataKey[M.TOPAZ] = "magicalTopaz"

M.levelDataKey = "gemLevel"

local gemPrefixDE = {"Latent", "Bedingt", "Leicht", "Mäßig", "Durchschnittlich", "Bemerkenswert", "Stark", "Sehr stark", "Unglaublich", "Einzigartig"}
local gemPrefixEN = {"Latent", "Limited", "Slight", "Moderate", "Average", "Notable", "Strong", "Very Strong", "Unbelievable", "Unique"}

local gemLevelRareness = {}
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

local function extractNum(text)
    if text=="" then
        return 0
    end
    return tonumber(text)
end

-- calculates the gem bonus and returns it in %
function M.getGemBonus(item)
    local gemStrength = {}
    gemStrength[1]=extractNum(item:getData("magicalEmerald"))
    gemStrength[2]=extractNum(item:getData("magicalRuby"))
    gemStrength[3]=extractNum(item:getData("magicalTopaz"))
    gemStrength[4]=extractNum(item:getData("magicalAmethyst"))
    gemStrength[5]=extractNum(item:getData("magicalSapphire"))
    gemStrength[6]=extractNum(item:getData("magicalObsidian"))

    local gemSum=0
    local gemMin=1000   -- arbitrarily high number

    for _, gStrength in pairs(gemStrength) do
        gemSum=gemSum+gStrength
        if gStrength<gemMin then gemMin=gStrength end
    end

    local diamond = extractNum(item:getData("magicalDiamond"))

    local retVal = gemSum+gemMin*6

    local diamondBonus = 0

    if diamond > 0 then
        diamondBonus = math.max( 1, math.floor(retVal*(0.1*diamond)))
    end

    -- Each tier of diamonds add a simple 10% bonus to the existing bonus
    -- If it is socketed on its own it will return a minimum of 1
    -- This means a tier 1 set goes from 12 to 13.2 that gets rounded down to 13 and so on.

    return retVal + diamondBonus

end

function M.getGemBonusLookAtValue(item)
    local retVal = M.getGemBonus(item)*2
    return retVal
end

function M.lookAtFilter(user, lookAt, data)
    local gemLevel = data.gemLevel

    if gemLevel then
        if user:getPlayerLanguage() == 0 then
            lookAt.name = gemPrefixDE[gemLevel] .. " " .. lookAt.name
        else
            lookAt.name = gemPrefixEN[gemLevel] .. " " .. lookAt.name
        end
        lookAt.rareness = gemLevelRareness[gemLevel]
    end

    return lookAt
end

function M.itemIsMagicGem(item)
    if item ~= nil then
        for _, gemId in pairs(M.gemItemId) do
            if (item.id == gemId) then
                return true
            end
        end
    end

    return false
end

function M.getGemLevel(gem)
    local level = tonumber(gem:getData(M.levelDataKey))
    if not level then
        level = 1
    end
    return level
end

function M.getMagicGemId(gem, level)
    return M.gemItemId[gem]
end

function M.getMagicGemData(level, name)
    level = level or 1
    if name then
        return {gemLevel = level, owner = name}
    end
    return {gemLevel = level}
end

function M.itemHasGems(item)
    return M.getGemBonus(item) > 0
end

function M.returnGemsToUser(user, item, isMessage)
    local showMessage = isMessage or true
    if ( M.itemHasGems(item) == true ) then
        for i = 1, #gemDataKey do
            local itemKey = gemDataKey[i]
            local level = tonumber(item:getData(itemKey))

            local owner = item:getData(itemKey.."owner")

            if level and level > 0 then

                if owner ~= user.name and owner ~= "" then --For some reason when creating the new gems, it refuses to report the owner even if you add it to the data table when creating it below, and instead merges the gems with existing gems with different owner names. As such we report this incident individually here.
                    log(user.name..
                    " unsocketed a "..
                    world:getItemName(item.id, 1)..
                    " with a level "..level.." "..
                    world:getItemName(M.gemItemId[i], 1)..
                    " that previously belonged to "..owner..
                    ".")
                end

                common.CreateItem(user, M.gemItemId[i], 1, 999, {[M.levelDataKey] = level})
                item:setData(itemKey, "")
                item:setData(itemKey.."owner", "")
            end
        end
        world:changeItem(item)
        if showMessage then
            user:inform("Alle Edelsteine wurden aus dem Gegenstand " .. world:getItemName( item.id, 0 ) .. " entfernt und dir zurückgegeben.",
                        "All gems were removed from the item " .. world:getItemName( item.id, 1 ) .. " and returned to your inventory.")
        end
    end
end

function M.getDataKey(itemId)
    for i, gemId in pairs(M.gemItemId) do
        if itemId == gemId then
            return gemDataKey[i]
        end
    end
    return "nokey"
end

return M
