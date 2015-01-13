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

local lookat = require("base.lookat")

local M = {}

local mugs = {}
local validMugIds = {}

function M.getRandomMugId()
    return validMugIds[Random.uniform(1, #validMugIds)]
end

function M.dropMugByChance(dropLocation,chance)
    chance = chance or 1
    
    if #validMugIds > 0 and chance >= Random.uniform(1,100) then
        world:createItemFromId(310, 1, dropLocation, true, 999, {mugId = M.getRandomMugId()})
    end
end

local function addMug(mugId, titleDe, titleEn, pictureDe, pictureEn)
    mugs[mugId] = {titleDe = titleDe, titleEn = titleEn, pictureDe = pictureDe, pictureEn = pictureEn}
    table.insert(validMugIds, mugId)
end

function M.LookAtItem(User, Item)
    if Item:getData("mugId") == "random" then
        Item:setData("mugId", M.getRandomMugId())
        world:changeItem(Item)
    end
    
    local mugId = tonumber(Item:getData("mugId"))
    
    if mugId and mugs[mugId] then
        lookat.SetSpecialName(Item,"Verzierter Humpen","Decorated Mug")
		lookat.SetSpecialDescription(Item,"Der Humpen zeigt folgendes Bild: ".. mugs[mugId]["pictureDe"] .." Unter dem Bild befindet eine Gravur: ".. mugs[mugId]["titleDe"], "The mug shows the following picture: ".. mugs[mugId]["pictureEn"] .." There is an engraving beneath the picture: ".. mugs[mugId]["titleEn"])
    end
    
    return lookat.GenerateLookAt(User, Item, lookat.NONE)
end

-- Series: Sleeping Dwarf
addMug(1,
"Schlafender Zwerg I",
"Sleeping Dwarf I",
"Ein schlafender Zwerg liegt vor einem Bierfass.",
"A sleeping dwarf is lying infront of a beer barrel."
)

addMug(2,
"Schlafender Zwerg II",
"Sleeping Dwarf II",
"Ein schlafender Zwerg liegt mit einer Spitzhacke in der Hand in einer Miene.",
"Holding a pick-axe in his hands, a sleeping dwarf is lying in a mine."
)

addMug(3,
"Schlafender Zwerg III",
"Sleeping Dwarf III",
"Ein schlafender Zwerg liegt unter einem Tisch in einer Taverne.",
"A sleeping dwarf is lying under a table in a tavern."
)

addMug(4,
"Schlafender Zwerg IV",
"Sleeping Dwarf IV",
"Ein schlafender Zwerg liegt in einem Haufen von Würstchen und Schinken.",
"A sleeping dwarf is lying on a pile of sausages and hams."
)

addMug(5,
"Schlafender Zwerg V",
"Sleeping Dwarf V",
"Ein schlafender Zwerg liegt mit zufriedenem Lächeln in einem Bett. Er ist umrundet von Unmengen an Gold und Bierflaschen.",
"Surrounded by a huge pile of gold and beer bottles, a dwarf is sleeping with a content smile on his lips in a bed."
)

-- Series: Elf Playing Music
addMug(6,
"Musizierender Elf I",
"Elf Playing Music I",
"Ein Elf sitzt auf einem Ast einer majestätischen Eiche und spielt Flöte.",
"An elf sits on a branch of a majestic oak and plays the flute."
)

addMug(7,
"Musizierender Elf II",
"Elf Playing Music II",
"Ein Elf sitzt an einem Feuer und schlägt auf eine Trommel.",
"An elf sits in front of a fire and plays the drums."
)

addMug(8,
"Musizierender Elf III",
"Elf Playing Music III",
"Ein Elf steht in einer Horde grölender und feiernder Zwerg und spielt seelenruhig auf einer Laute.",
"An elf is playing unperterbed on his lute while being in the middle of a bunch of rambunctious, celebrating dwarves."
)

addMug(9,
"Musizierender Elf IV",
"Elf Playing Music IV",
"Ein Elf sitzt auf einer blumigen Wiese und spielt auf einer Harfe.",
"An elf is sitting on a flowery green field and plays the harp."
)

addMug(10,
"Musizierender Elf V",
"Elf Playing Music V",
"Ein Elf bläst auf der Spitze eines Berges in ein Horn.",
"An elf blows into a horn on the top of a mountain."
)

-- Series: Baking Halfling
addMug(11,
"Backender Halbling I",
"Baking Halfling I",
"Ein Halbling schüttet Mehl in eine Schüssel. Auf dem Tisch neben ihm stehen allerlei Zutaten.",
"A halfling puts flour into a bowl. On the table next to him, one can see all kinds of ingredients."
)

addMug(12,
"Backender Halbling II",
"Baking Halfling II",
"Ein Halbling rührt energisch mit einem großen Löffel in einer Schüssel.",
"A halfling energetically stirs with a big spoon in a bowl."
)

addMug(13,
"Backender Halbling III",
"Baking Halfling III",
"Ein Halbling füllt eine Menge Teig aus einer Schüssel in eine große Backform.",
"A halfling pours a lot of dough from a bowl into a big cake pan."
)

addMug(14,
"Backender Halbling IV",
"Baking Halfling IV",
"Ein Halbling schiebt eine große Backform in einen kleinen, zierlichen Backofen.",
"A halfling puts a big cake pan into a small, diminutive baking oven."
)

addMug(15,
"Backender Halbling IV",
"Baking Halfling IV",
"Ein Halbling sitzt mit einem breiten Grinsen vor einem Tisch, auf dem ein großer, dampfender Kuchen steht.",
"A hafling sits with a broad grin on his lips in front of a table with a big, steaming cake on it."
)

return M