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

local seafaring = require("base.seafaring")

local M = {}

local harbours = seafaring.harborList

M.portals = { -- Don't change the order of these, the index is used to know whether or not a portal spot has been attuned to.
-- If you do want to rearrange them in spite of this, change the code to add an id to each of them accordingly based on their current oreder.
    { location = position(684, 307, 0),
        english = "Portal to the Hemp Necktie Inn",
        german = "Portal zum Gasthof zur Hanfschlinge",
        level = 0,
        nameEn = "Hemp Necktie Inn",
        nameDe = "Gasthof zur Hanfschlinge"
    },
    { location = position(126, 647, 0),
      english = "Portal to Cadomyr",
      german = "Portal nach Cadomyr",
      level = 0,
      nameEn = "Cadomyr",
      nameDe = "Cadomyr"
    },
    { location = position(423, 246, 0),
      english = "Portal to Galmair",
      german = "Portal nach Galmair",
      level = 0,
      nameEn = "Galmair",
      nameDe = "Galmair"
    },
    { location = position(835, 813, 0),
      english = "Portal to Runewick",
      german = "Portal nach Runewick",
      level = 0,
      nameEn = "Runewick",
      nameDe = "Runewick"
    },
    { location = position(-484,-455,-40),
      english = "Portal to the Prison Mine",
      german = "Portal nach zur Gefängnismine",
      level = 0,
      nameEn = "Prison Mine",
      nameDe = "Gefängnismine",
      entrance = position(633, 374, 0)
    },
    { location = position(914,657,0),
      english = "Portal to the Dewy Swamps",
      german = "Portal nach zur Morgentausümpfe",
      level = 10,
      nameEn = "Dewy Swamps",
      nameDe = "Morgentausümpfe",
      extraIngredients = {}
    },
    { location = position(522,129,0),
      english = "Portal to the Temple of the Five",
      german = "Portal nach zur Tempel der Fünf",
      level = 20,
      nameEn = "Temple of the Five",
      nameDe = "Tempel der Fünf",
      extraIngredients = {{id = Item.amethystPowder, amount = 1}}
    },
    { location = position(205,760,0),
      english = "Portal to the Mount Letma",
      german = "Portal nach zur Mount Letma",
      level = 30,
      nameEn = "Mount Letma",
      nameDe = "Mount Letma",
      extraIngredients = {{id = Item.amethystPowder, amount = 1}}
    },
    { location = position(802,439,0),
      english = "Portal to the Elstree Forest",
      german = "Portal nach zur Elsbaumwald",
      level = 40,
      nameEn = "Elstree Forest",
      nameDe = "Elsbaumwald",
      extraIngredients = {{id = Item.rubyPowder, amount = 1}}
    },
    { location = position(706,115,0),
      english = "Portal to the northern woods",
      german = "Portal nach zur Nördlichen Wäldern",
      level = 50,
      nameEn = "Northern Woods",
      nameDe = "Nördlichen Wäldern",
      extraIngredients = {{id = Item.obsidianPowder, amount = 1}}
    },
    { location = position(262,681,0),
      english = "Portal to the Blood Circle Arena",
      german = "Portal nach zur Blutkreisarena",
      level = 60,
      nameEn = "Blood Circle Arena",
      nameDe = "Blutkreisarena",
      statReq = 40,
      extraIngredients = {{id = Item.sapphirePowder, amount = 1}}
    },
    { location = position(281,491,0),
      english = "Portal to the Weary Inn",
      german = "Portal nach zur Matter Gasthof",
      level = 60,
      nameEn = "Weary Inn",
      nameDe = "Matter Gasthof",
      statReq = 40,
      extraIngredients = {{id = Item.sapphirePowder, amount = 1}}
    },
    { location = position(597,470,0),
      english = "Portal to the Snakehead Coast",
      german = "Portal nach zur Schlangenkopfküste",
      level = 70,
      nameEn = "Mount Snakehead",
      nameDe = "Schlangenkopfküste",
      statReq = 40,
      extraIngredients = {{id = Item.emeraldPowder, amount = 1}}
    },
    { location = position(811,110,0),
      english = "Portal to Raban's Grove",
      german = "Portal nach zur Rabans Hain",
      level = 70,
      nameEn = "Raban's Grove",
      nameDe = "Rabans Hain",
      extraIngredients = {{id = Item.emeraldPowder, amount = 1}}
    },
    { location = position(663,690,0),
      english = "Portal to the Sentry Forest",
      german = "Portal nach zur Wachtwald",
      level = 80,
      nameEn = "Sentry Forest",
      nameDe = "Wachtwald",
      statReq = 40,
      extraIngredients = {{id = Item.topazPowder, amount = 1}}
    },
    { location = position(469,796,0),
      english = "Portal to the Chapel of the Five",
      german = "Portal nach zur Kapelle der Fünf",
      level = 80,
      nameEn = "Chapel of the Five",
      nameDe = "Kapelle der Fünf",
      extraIngredients = {{id = Item.topazPowder, amount = 1}}
    },
    { location = position(495,523,0),
      english = "Portal to the Firelimes",
      german = "Portal nach zur Feuerlimes",
      level = 90,
      nameEn = "Firelimes",
      nameDe = "Feuerlimes",
      extraIngredients = {{id = Item.diamondPowder, amount = 1}}
    },
    { location = position(747,653,0),
      english = "Portal to the Dragon's Lair",
      german = "Portal nach zur Drachenhöhle",
      level = 90,
      nameEn = "Dragon's Lair",
      nameDe = "Drachenhöhle",
      statReq = 40,
      extraIngredients = {{id = Item.diamondPowder, amount = 1}}
    },
    { location = position(792,260,0),
      english = "Portal to the plains of silence",
      german = "Portal nach zur Ebene der Stille",
      level = 100,
      nameEn = "Plains of silence",
      nameDe = "Ebene der Stille",
      extraIngredients = {{id = Item.diamondPowder, amount = 2}}
    },
    { location = position(934,447,2),
      english = "Portal to the pauldron",
      german = "Portal nach zur Pauldron Insel",
      level = 100,
      nameEn = "The Pauldron",
      nameDe = "Pauldron Insel",
      statReq = 40,
      entrance = position(945, 454, 0),
      extraIngredients = {{id = Item.diamondPowder, amount = 2}}
    },
}



local portals = M.portals

local teleporters = {
    --Hemptie teleporter
    position(685, 307, 0),
    --Prison Mine Teleporter (destination and teleporter)
    position(-484, -455, -40), position(-474, -455, -40),
    --Runewick teleporter
    position(836, 813, 0),
    --Cadomyr Teleporter
    position(127, 647, 0),
    --Galmair Teleporter
    position(424, 246, 0),
}

local items = { "window", "door", "open door", "stairs", "ladder", "Trap Door", "gate", "open gate"}


local function increaseArea(targetPosition, positionTable)

    table.insert(positionTable, {position = position(targetPosition.x,targetPosition.y,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x+1,targetPosition.y,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x,targetPosition.y+1,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x-1,targetPosition.y,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x,targetPosition.y-1,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x+1,targetPosition.y-1,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x-1,targetPosition.y+1,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x+1,targetPosition.y+1,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x-1,targetPosition.y-1,targetPosition.z)})
    return positionTable
end

local function checkForIllegalItems(myPosition)

    if not world:getField(myPosition) then --Can't cast a portal where there's no field
        return true
    end

    local myItem = world:getItemOnField(myPosition)
    local myItemId = myItem.id
    local itemStats = world:getItemStatsFromId(myItemId)
    local nameEnglish = itemStats.English

    for _, item in pairs(items) do
        if item == nameEnglish then
            return true
        end
    end

    return false

end

local function checkForIllegalLocations(myPosition)

    local positionTable = {}

    for _, teleporter in pairs(teleporters) do
        positionTable = increaseArea(teleporter, positionTable)
    end

    for _, harbour in pairs(harbours) do
        positionTable = increaseArea(harbour.pos, positionTable)
    end

    for _, portal in pairs(portals) do
        positionTable = increaseArea(portal.location, positionTable)
    end

    for _, myPos in pairs(positionTable) do
        if myPos.position == myPosition then
            return true
        end
    end

    return false

end

local function checkForNearbyPortals(target)

    local portalsIds = {10, 798}

    for _, portal in pairs(portalsIds) do
        for x = -1, 1 do
            for y = -1, 1 do
                if world:getField(position(target.x+x, target.y+y, target.z)) then
                    local myItem = world:getItemOnField(position(target.x+x, target.y+y, target.z))

                    if myItem.id == portal then
                        return true
                    end
                end
            end
        end
    end

    return false
end


function M.passesAntiTrollCheck(target)

    local myPosition

    if target.pos then
        myPosition = target.pos
    else
        myPosition = target
    end

    if checkForIllegalItems(myPosition) or  checkForIllegalLocations(myPosition) or checkForNearbyPortals(myPosition) then
        return false
    end

    return true

end



return M
