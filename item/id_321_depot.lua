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
-- Depots

-- UPDATE items SET itm_script='item.id_321_depot' WHERE itm_id=321;

local common = require("base.common")
local lookat = require("base.lookat")

local M = {}

-- A list for use in other scripts that access _all_ depots via user:getDepot() to check for items
M.depots = {
    -- Seems user:getDepot() uses an array starting at 0 but the itemdata uses one starting at 1, so user:getDepot() uses the id below while items the itemData
    {id = 100, itemData = 101, realm = {english = "Cadomyr", german = "Cadomyr"}, taxEvasion = false},
    {id = 101, itemData = 102, realm = {english = "Runewick", german = "Runewick"}, taxEvasion = false},
    {id = 102, itemData = 103, realm = {english = "Galmair", german = "Galmair"}, taxEvasion = false},
    {id = 103, itemData = 104, realm = {english = "Troll's Haven", german = "Trollshaven"}, taxEvasion = false},
    {id = 200, itemData = 201, realm = {english = "Cadomyr Treasury", german = "Staatsschatz von Cadomyr"}, taxEvasion = true}, -- The treasuries are used by town leaders
    {id = 201, itemData = 202, realm = {english = "Runewick Treasury", german = "Staatsschatz von Runewick"}, taxEvasion = true}, -- to keep public funds from being taxed
    {id = 202, itemData = 203, realm = {english = "Galmair Treasury", german = "Staatsschatz von Galmair"}, taxEvasion = true}, -- as if the were private funds.
    {id = 300, itemData = 301, realm = {english = "Villa Annabeth", german = "Villa Annabeth"}, taxEvasion = false},
    {id = 301, itemData = 302, realm = {english = "Villa Edward", german = "Villa Edward"}, taxEvasion = false},
    {id = 302, itemData = 303, realm = {english = "Villa Reginald", german = "Villa Reginald"}, taxEvasion = false},
    {id = 303, itemData = 304, realm = {english = "Flat Faith and Obedience", german = "Wohnung Glaube und Gehorsam"}, taxEvasion = false},
    {id = 304, itemData = 305, realm = {english = "Flat Truth and Justice", german = "Wohnung Ehrlichkeit und Gerechtigkeit"}, taxEvasion = false},
    {id = 305, itemData = 306, realm = {english = "Flat Patriarchy", german = "Wohnung Patriarchat"}, taxEvasion = false},
    {id = 306, itemData = 307, realm = {english = "First Fire Apartment", german = "Erstes Feuerapartment"}, taxEvasion = false},
    {id = 307, itemData = 308, realm = {english = "Second Fire Apartment", german = "Zweites Feuerapartment"}, taxEvasion = false},
    {id = 308, itemData = 309, realm = {english = "Third Fire Apartment", german = "Drittes Feuerapartment"}, taxEvasion = false},
    {id = 309, itemData = 310, realm = {english = "Fourth Fire Apartment", german = "Viertes Feuerapartment"}, taxEvasion = false},
    {id = 310, itemData = 311, realm = {english = "First Air Apartment", german = "Erstes Luftapartment"}, taxEvasion = false},
    {id = 311, itemData = 312, realm = {english = "Second Air Apartment", german = "Zweites Luftapartment"}, taxEvasion = false},
    {id = 312, itemData = 313, realm = {english = "First Earth Apartment", german = "Erstes Erdapartment"}, taxEvasion = false},
    {id = 313, itemData = 314, realm = {english = "Second Earth Apartment", german = "Zweites Erdapartment"}, taxEvasion = false},
    {id = 314, itemData = 315, realm = {english = "Third Earth Apartment", german = "Drittes Erdapartment"}, taxEvasion = false},
    {id = 315, itemData = 316, realm = {english = "Fourth Earth Apartment", german = "Viertes Erdapartment"}, taxEvasion = false},
    {id = 316, itemData = 317, realm = {english = "Fifth Earth Apartment", german = "Fünftes Erdapartment"}, taxEvasion = false},
    {id = 317, itemData = 318, realm = {english = "Sixth Earth Apartment", german = "Sechstes Erdapartment"}, taxEvasion = false},
    {id = 318, itemData = 319, realm = {english = "Cottage", german = "Landhaus"}, taxEvasion = false},
    {id = 319, itemData = 320, realm = {english = "Quadruped Red Bird", german = "Vierbeiniger Roter Vogel"}, taxEvasion = false},
    {id = 320, itemData = 321, realm = {english = "House of Malachite", german = "Malachithaus"}, taxEvasion = false},
    {id = 321, itemData = 322, realm = {english = "Villa Goldvein", german = "Villa Goldader"}, taxEvasion = false},
    {id = 322, itemData = 323, realm = {english = "Flat Irmorom", german = "Wohnung Irmorom"}, taxEvasion = false},
    {id = 323, itemData = 324, realm = {english = "Flat Elara", german = "Wohnung Elara"}, taxEvasion = false},
    {id = 324, itemData = 325, realm = {english = "Flat Adron", german = "Wohnung Adron"}, taxEvasion = false},
    {id = 325, itemData = 326, realm = {english = "Flat Malachin", german = "Wohnung Malachín"}, taxEvasion = false},
    {id = 326, itemData = 327, realm = {english = "Flat Oldra", german = "Wohnung Oldra"}, taxEvasion = false},
    {id = 327, itemData = 328, realm = {english = "Flat Nargun", german = "Wohnung Nargùn"}, taxEvasion = false},
    {id = 328, itemData = 329, realm = {english = "Flat Ronagan", german = "Wohnung Ronagan"}, taxEvasion = false},
    {id = 329, itemData = 330, realm = {english = "Flat Sirani", german = "Wohnung Sirani"}, taxEvasion = false},
    {id = 330, itemData = 331, realm = {english = "Flat Zhambra", german = "Wohnung Zhambra"}, taxEvasion = false},
    {id = 331, itemData = 332, realm = {english = "Lucky Copper", german = "Glückskupfer"}, taxEvasion = false},
    {id = 332, itemData = 333, realm = {english = "Silver Profit", german = "Silberner Verdienst"}, taxEvasion = false},
    {id = 333, itemData = 334, realm = {english = "Golden Deal", german = "Goldener Abschluss"}, taxEvasion = false},
    {id = 334, itemData = 335, realm = {english = "Flat Sapphire", german = "Wohnung Saphir"}, taxEvasion = false},
    {id = 335, itemData = 336, realm = {english = "Flat Diamond", german = "Wohnung Diamant"}, taxEvasion = false},
    {id = 336, itemData = 337, realm = {english = "Flat Obsidian", german = "Wohnung Obsidian"}, taxEvasion = false},
    {id = 337, itemData = 338, realm = {english = "Syrita Estate", german = "Grundstück Syrita"}, taxEvasion = false},
    {id = 338, itemData = 339, realm = {english = "Nargun Estate", german = "Grundstück Nargun"}, taxEvasion = false},
    {id = 339, itemData = 340, realm = {english = "Rumil Estate", german = "Grundstück Rumil"}, taxEvasion = false},
    {id = 340, itemData = 341, realm = {english = "Cadomyr Harbour Estate", german = "Hafengrundstück in Cadomyr"}, taxEvasion = false},
    {id = 341, itemData = 342, realm = {english = "Kantabi Estate", german = "Grundstück Kantabi"}, taxEvasion = false},
    {id = 342, itemData = 343, realm = {english = "Siba Estate", german = "Grundstück Siba"}, taxEvasion = false},
    {id = 343, itemData = 344, realm = {english = "Anthil Estate", german = "Grundstück Anthil"}, taxEvasion = false},
    {id = 344, itemData = 345, realm = {english = "Oldra Estate", german = "Grundstück Oldra"}, taxEvasion = false},
    {id = 345, itemData = 346, realm = {english = "Merryglade Estate", german = "Grundstück Merryglade"}, taxEvasion = false},
    {id = 346, itemData = 347, realm = {english = "Pauldron Estate", german = "Grundstück Schulterplatte"}, taxEvasion = false},
    {id = 347, itemData = 348, realm = {english = "Troll's Bane", german = "Troll's Bane"}, taxEvasion = false},
    {id = 348, itemData = 349, realm = {english = "Silverbrand", german = "Silverbrand"}, taxEvasion = false},
    {id = 349, itemData = 350, realm = {english = "Greenbriar", german = "Greenbriar"}, taxEvasion = false},
    {id = 350, itemData = 351, realm = {english = "Varshikar", german = "Varshikar"}, taxEvasion = false}

    }

function M.getDepotDescription(user, depotId)

    for _, depot in pairs(M.depots) do
        if depotId == depot.itemData then
            return common.GetNLS(user, depot.realm.german, depot.realm.english)
        end
    end

    return common.GetNLS(user, "Unbekanntes Depot", "Unknown depot")

end

function M.LookAtItem(user, Item)
    local lookAt = lookat.GenerateLookAt(user, Item)
    local depotId = tonumber(Item:getData("depot"))

    lookAt.description = M.getDepotDescription(user, depotId)

    return lookAt
end

return M

