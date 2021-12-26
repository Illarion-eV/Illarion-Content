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

local M = {}

M.tileDescriptions = {
    {id = 0, english = "Air", german = ""},
    {id = 1, english = "Rocky terrain", german = ""},
    {id = 2, english = "Rocky terrain", german = ""},
    {id = 3, english = "Sandy terrain", german = ""},
    {id = 4, english = "Muddy terrain", german = ""},
    {id = 5, english = "Lava", german = ""},
    {id = 6, english = "Water", german = ""},
    {id = 7, english = "Rocky terrain", german = ""},
    {id = 8, english = "Muddy terrain", german = ""},
    {id = 9, english = "Muddy terrain", german = ""},
    {id = 10, english = "Snowy terrain", german = ""},
    {id = 11, english = "Grassy terrain", german = ""},
    {id = 12, english = "Sandy terrain", german = ""},
    {id = 13, english = "Rocky terrain", german = ""},
    {id = 14, english = "Grassy terrain", german = ""},
    {id = 15, english = "Rocky terrain", german = ""},
    {id = 16, english = "Muddy terrain", german = ""},
    {id = 17, english = "Rocky terrain", german = ""},
    {id = 18, english = "Rocky terrain", german = ""},
    {id = 19, english = "Icy terrain", german = ""},
    {id = 20, english = "Icy terrain", german = ""},
    {id = 34, english = "Air", german = ""},
    {id = 40, english = "Wooden ground", german = ""},
    {id = 41, english = "Rocky terrain", german = ""},
    {id = 42, english = "Rocky terrain", german = ""},
    {id = 43, english = "Wooden ground", german = ""},
    {id = 45, english = "Carpet", german = ""},
    {id = 46, english = "Carpet", german = ""},
    {id = 47, english = "Carpet", german = ""},
    {id = 48, english = "Carpet", german = ""},
    {id = 49, english = "Carpet", german = ""},
    {id = 50, english = "Carpet", german = ""},
    {id = 51, english = "Carpet", german = ""},
    {id = 52, english = "Carpet", german = ""},
    {id = 53, english = "Carpet", german = ""},
    {id = 55, english = "Rocky terrain", german = ""},
    {id = 56, english = "Rocky terrain", german = ""},
    {id = 57, english = "Rocky terrain", german = ""},
    {id = 58, english = "Rocky terrain", german = ""},
    {id = 59, english = "Wooden ground", german = ""},
    {id = 60, english = "Layered bricks", german = ""},
    {id = 61, english = "Layered bricks", german = ""},
    {id = 62, english = "Wooden ground", german = ""},
    {id = 63, english = "Wooden ground", german = ""},
    {id = 64, english = "Wooden ground", german = ""},
    {id = 65, english = "Wooden ground", german = ""},
    {id = 66, english = "Rocky terrain", german = ""},
    {id = 67, english = "Carpet", german = ""},
    {id = 68, english = "Carpet", german = ""},
    {id = 69, english = "Carpet", german = ""},
    {id = 70, english = "Carpet", german = ""},
    {id = 71, english = "Carpet", german = ""},
    {id = 72, english = "Carpet", german = ""},
    {id = 73, english = "Carpet", german = ""},
    {id = 74, english = "Muddy terrain", german = ""},
    {id = 75, english = "Muddy terrain", german = ""}
    }

M.tilePrefix = {english = "Terrain: ", german = ""}

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
