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
    {id = 0, english = "Air", german = "Luft"},
    {id = 1, english = "Rocky terrain", german = "Felsen"},
    {id = 2, english = "Rocky terrain", german = "Natürlicher Fels"},
    {id = 3, english = "Sandy terrain", german = "Feiner Sand"},
    {id = 4, english = "Muddy terrain", german = "Schlamm"},
    {id = 5, english = "Lava", german = "Lava"},
    {id = 6, english = "Water", german = "Wasser"},
    {id = 7, english = "Rocky terrain", german = "Bearbeiteter Stein"},
    {id = 8, english = "Muddy terrain", german = "Schlamm"},
    {id = 9, english = "Muddy terrain", german = "Schlamm"},
    {id = 10, english = "Snowy terrain", german = "Schnee"},
    {id = 11, english = "Grassy terrain", german = "Wiese"},
    {id = 12, english = "Sandy terrain", german = "Grober Sand"},
    {id = 13, english = "Rocky terrain", german = "Bearbeiteter Stein"},
    {id = 14, english = "Grassy terrain", german = "Gras"},
    {id = 15, english = "Rocky terrain", german = "Fels"},
    {id = 16, english = "Muddy terrain", german = "Schlamm"},
    {id = 17, english = "Rocky terrain", german = "Bearbeiteter Stein"},
    {id = 18, english = "Rocky terrain", german = "Bearbeiteter Stein"},
    {id = 19, english = "Icy terrain", german = "Eis"},
    {id = 20, english = "Icy terrain", german = "Eis"},
    {id = 34, english = "Air", german = "Luft"},
    {id = 40, english = "Wooden ground", german = "Holzdielen"},
    {id = 41, english = "Rocky terrain", german = "Stein"},
    {id = 42, english = "Rocky terrain", german = "Stein"},
    {id = 43, english = "Wooden ground", german = "Holz"},
    {id = 45, english = "Carpet", german = "Teppich"},
    {id = 46, english = "Carpet", german = "Teppich"},
    {id = 47, english = "Carpet", german = "Teppich"},
    {id = 48, english = "Carpet", german = "Teppich"},
    {id = 49, english = "Carpet", german = "Teppich"},
    {id = 50, english = "Carpet", german = "Teppich"},
    {id = 51, english = "Carpet", german = "Teppich"},
    {id = 52, english = "Carpet", german = "Teppich"},
    {id = 53, english = "Carpet", german = "Teppich"},
    {id = 55, english = "Rocky terrain", german = "Glatter Stein"},
    {id = 56, english = "Rocky terrain", german = "Stein"},
    {id = 57, english = "Rocky terrain", german = "Bearbeiteter Stein"},
    {id = 58, english = "Rocky terrain", german = "Grober Stein"},
    {id = 59, english = "Wooden ground", german = "Holz"},
    {id = 60, english = "Layered bricks", german = "Ziegel"},
    {id = 61, english = "Layered bricks", german = "Ziegel"},
    {id = 62, english = "Wooden ground", german = "Holzdielen"},
    {id = 63, english = "Wooden ground", german = "Holzdielen"},
    {id = 64, english = "Wooden ground", german = "Holzdielen"},
    {id = 65, english = "Wooden ground", german = "Holzdielen"},
    {id = 66, english = "Rocky terrain", german = "Holzdielen"},
    {id = 67, english = "Carpet", german = "Teppich"},
    {id = 68, english = "Carpet", german = "Teppich"},
    {id = 69, english = "Carpet", german = "Teppich"},
    {id = 70, english = "Carpet", german = "Teppich"},
    {id = 71, english = "Carpet", german = "Teppich"},
    {id = 72, english = "Carpet", german = "Teppich"},
    {id = 73, english = "Carpet", german = "Teppich"},
    {id = 74, english = "Muddy terrain", german = "Schlamm"},
    {id = 75, english = "Muddy terrain", german = "Schlamm"}
    }


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
        local englishText = "Terrain: ".."\n"..tileEn
        local germanText = "Terrain: ".."\n"..tileDe
        target.terrain = {}
        target.terrain.german = germanText
        target.terrain.english = englishText
    end

    return information
end

return M
