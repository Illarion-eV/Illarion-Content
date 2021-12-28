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

local texts = require("magic.arcane.base.texts.lua")

local M = {}

M.tileDescriptions = texts.tileDescriptions

M.tilePrefix = texts.tilePrefix

function M.getTerrainText(information, spell)

    for _, target in pairs(information) do
        local field
        if target.type == "position" then
            field = world:getField(target.target)
        else
            field = world:getField(target.target.pos)
        end
        local tileID = field:tile()
        local tileEn
        local tileDe
        for _, tile in pairs(M.tileDescriptions) do
            if tile.id == tileID then
                tileEn = tile.english
                tileDe = tile.german
                break
            end
        end
        local englishText = M.tilePrefix.english.."\n"..tileEn
        local germanText = M.tilePrefix.german.."\n"..tileDe
        target.terrain = {}
        target.terrain.german = germanText
        target.terrain.english = englishText
    end

    return information
end

return M
