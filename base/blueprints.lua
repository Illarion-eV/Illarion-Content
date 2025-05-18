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

M.itemIdBlueprint = Item.sealedPell

local function getLevel(itemId)

    local itemCommon = world:getItemStatsFromId(itemId)

    return itemCommon.Level
end

--[[

    id: Used to identify and store whether someone knows the recipe.
    name: Used for the item description and informs.
    creator: If this is something invented by a player. Teaching system not yet implemented.
    craft: What craft does the item belong to.
    level: What is the level requirement to learn and craft this item.
    item: the item id of the crafted item you can make with this blueprint
    treasure: the type of map the blueprint can drop from; small, average, big or giant
    rareness: purely for aesthetics, the colour of the name of the scroll
    ingredients: What ingredients are necessary to craft the item
    tool: If it needs to be specified, the item id of the tool to use EG plane vs carving tools for carpentry
]]

M.blueprints = {
    {id = 1, name = {english = "fancy iron tray", german = "Verziertes Eisentablett"}, creator = "NA", craft = "finesmithing", --45
    level = getLevel(Item.fancyIronTray), item = Item.fancyIronTray, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.ironIngot, amount = 4},
        {id = Item.amethyst, amount = 3}
    }},

    {id = 2, name = {english = "fancy copper tray", german = "Verziertes Kupfertablett"}, creator = "NA", craft = "finesmithing", --50
    level = getLevel(Item.fancyCopperTray), item = Item.fancyCopperTray, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.copperIngot, amount = 3},
        {id = Item.obsidian, amount = 2},
        {id = Item.amethystPowder, amount = 1}
    }},

    {id = 3, name = {english = "fancy silver tray", german = "Verziertes Silbertablett"}, creator = "NA", craft = "finesmithing", --55
    level = getLevel(Item.fancySilverTray), item = Item.fancySilverTray, treasure = "big", rareness = 2,
    ingredients = {
        {id = Item.silverIngot, amount = 3},
        {id = Item.sapphire, amount = 2},
        {id = Item.rubyPowder, amount = 1}
    }},

    {id = 4, name = {english = "fancy gold tray", german = "Verziertes Goldtablett"}, creator = "NA", craft = "finesmithing",--60
    level = getLevel(Item.fancyGoldTray), item = Item.fancyGoldTray, treasure = "big", rareness = 2,
    ingredients = {
        {id = Item.goldIngot, amount = 2},
        {id = Item.emerald, amount = 2},
        {id = Item.obsidianPowder, amount = 1}
    }},

    {id = 5, name = {english = "blue-green stained glass tray", german = "Blau-grünes Bleiglastablett"}, creator = "NA", craft = "glassblowing", --60
    level = getLevel(Item.stainedGlassTrayBlueGreen), item = Item.stainedGlassTrayBlueGreen, treasure = "big", rareness = 2,
    ingredients = {
        {id = Item.glassIngot, amount = 5},
        {id = Item.emeraldPowder, amount = 1},
        {id = Item.sapphirePowder, amount = 1}
    }},

    {id = 6, name = {english = "green-yellow stained glass tray", german = "Grün-gelbes Bleiglastablett"}, creator = "NA", craft = "glassblowing", --80
    level = getLevel(Item.stainedGlassTrayGreenYellow), item = Item.stainedGlassTrayGreenYellow, treasure = "giant", rareness = 2,
    ingredients = {
        {id = Item.glassIngot, amount = 10},
        {id = Item.emeraldPowder, amount = 1},
        {id = Item.topazPowder, amount = 1}
    }},

    {id = 7, name = {english = "red-black stained glass tray", german = "Rot-schwarzes Bleiglastablett"}, creator = "NA", craft = "glassblowing", --40
    level = getLevel(Item.stainedGlassTrayRedBlack), item = Item.stainedGlassTrayRedBlack, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.glassIngot, amount = 1},
        {id = Item.rubyPowder, amount = 1},
        {id = Item.obsidianPowder, amount = 1}
    }},

    {id = 8, name = {english = "violet-red stained glass tray", german = "Violett-rotes Bleiglastablett"}, creator = "NA", craft = "glassblowing", --20
    level = getLevel(Item.stainedGlassTrayVioletRed), item = Item.stainedGlassTrayVioletRed, treasure = "small", rareness = 2,
    ingredients = {
        {id = Item.glassIngot, amount = 1},
        {id = Item.ruby, amount = 1},
        {id = Item.amethyst, amount = 1}
    }},

    {id = 9, name = {english = "iron tray", german = "Eisentablett"}, creator = "NA", craft = "finesmithing", --35
    level = getLevel(Item.ironTraySouth), item = Item.ironTraySouth, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.ironIngot, amount = 9}
    }},

    {id = 10, name = {english = "copper tray", german = "Kupfertablett"}, creator = "NA", craft = "finesmithing", --40
    level = getLevel(Item.copperTraySouth), item = Item.copperTraySouth, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.copperIngot, amount = 5}
    }},

    {id = 11, name = {english = "silver tray", german = "Silbertablett"}, creator = "NA", craft = "finesmithing", --45
    level = getLevel(Item.silverTraySouth), item = Item.silverTraySouth, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.silverIngot, amount = 5}
    }},

    {id = 12, name = {english = "gold tray", german = "Goldtablett"}, creator = "NA", craft = "finesmithing", --50
    level = getLevel(Item.goldTraySouth), item = Item.goldTraySouth, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.goldIngot, amount = 6}
    }},

    {id = 13, name = {english = "naldor tray", german = "Naldortablett"}, creator = "NA", craft = "carpentry", --20
    level = getLevel(Item.naldorTraySouth), item = Item.naldorTraySouth, treasure = "small", rareness = 2,
    ingredients = {
        {id = Item.naldorWoodBoards, amount = 4},
        {id = Item.wax, amount = 2}
    }, tool = Item.plane},

    {id = 14, name = {english = "conifer tray", german = "Konifertablett"}, creator = "NA", craft = "carpentry", --40
    level = getLevel(Item.coniferTraySouth), item = Item.coniferTraySouth, treasure = "average", rareness = 2,
    ingredients = {
        {id = Item.coniferWoodBoards, amount = 10},
        {id = Item.wax, amount = 5}
    }, tool = Item.plane}
}

return M
