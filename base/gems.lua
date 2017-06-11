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

local gemItem = {}
gemItem[M.DIAMOND] = 285
gemItem[M.EMERALD] = 45
gemItem[M.RUBY] = 46
gemItem[M.OBSIDIAN] = 283
gemItem[M.SAPPHIRE] = 284
gemItem[M.AMETHYST] = 197
gemItem[M.TOPAZ] = 198

local gemId = {}
gemId[285] = M.DIAMOND
gemId[45] = M.EMERALD
gemId[46] = M.RUBY
gemId[283] = M.OBSIDIAN
gemId[284] = M.SAPPHIRE
gemId[197] = M.AMETHYST
gemId[198] = M.TOPAZ

local gemDataKey = {}
gemDataKey[M.DIAMOND] = "magicalDiamond"
gemDataKey[M.EMERALD] = "magicalEmerald"
gemDataKey[M.RUBY] = "magicalRuby"
gemDataKey[M.OBSIDIAN] = "magicalObsidian"
gemDataKey[M.SAPPHIRE] = "magicalSapphire"
gemDataKey[M.AMETHYST] = "magicalAmethyst"
gemDataKey[M.TOPAZ] = "magicalTopaz"

local levelDataKey = "gemLevel"

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

    return gemSum+gemMin*6

end

function M.itemIsMagicGem(item)
    local gemList = { 45, 46, 197, 198, 283, 284, 285}
    -- 45:emerald;46:ruby;197:amethyst;198:topaz;283:obsidian;284:sappire;285:diamant
--   if item ~= nil then
    for i in pairs(gemList) do
        if (item.id == gemList[i]) then
            local level = tonumber(item:getData(levelDataKey))
            if level and level > 0 then
                return true
            end
        end
    end
--    end
    
    return false
end

function M.getMagicGemId(gem, level)
    local level = level or 1
    return gemItem[gem]
end

function M.itemHasGems(item)
    return getGemBonus(item) > 0
end

function M.returnGemsToUser(user, item)
    if ( itemHasGems(item) == true ) then
        for i = 1, #gemDataKey do
            local itemKey = gemDataKey[i]
            local level = tonumber(item:getData(itemKey))

            if level and level > 0 then
                common.CreateItem(user, gemItem[i], 1, 999, {[levelDataKey] = level})
            end
        end    
        user:inform("Alle Edelsteine wurden aus dem Gegenstand " .. world:getItemName( item.id, 0 ) .. " entfernt und dir zurückgegeben.",
                    "All gems were removed from the item " .. world:getItemName( item.id, 1 ) .. " and returned to your inventory.")
    end
end
return M
