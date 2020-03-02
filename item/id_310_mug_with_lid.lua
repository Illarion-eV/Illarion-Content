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

-- the mug on NPC Borgate's counter
local BORGATES_MUG_POS = position(709, 313, 0)

function M.getRandomMugId()
    return validMugIds[math.random(1, #validMugIds)]
end

function M.dropMugByChance(dropLocation,chance)
    chance = chance or 1

    if #validMugIds > 0 and chance >= math.random(1,100) then
        world:createItemFromId(310, 1, dropLocation, true, 999, {mugId = M.getRandomMugId()})
    end
end

local function addMug(mugId, titleDe, titleEn, pictureDe, pictureEn)
    mugs[mugId] = {titleDe = titleDe, titleEn = titleEn, pictureDe = pictureDe, pictureEn = pictureEn}
    table.insert(validMugIds, mugId)
end

function M.LookAtItem(User, Item)
    -- NPC Borgate uses a different mug each day
    if Item.pos == BORGATES_MUG_POS and Item.wear == 255 then
        local today = world:getTime("day")
        if tonumber(Item:getData("day")) ~= today then
            Item:setData("day", today)
            Item:setData("mugId", M.getRandomMugId())
            world:changeItem(Item)
        end
    end

    if Item:getData("mugId") == "random" then
        Item:setData("mugId", M.getRandomMugId())
        world:changeItem(Item)
    end

    local mugId = tonumber(Item:getData("mugId"))

    if mugId and mugs[mugId] then
        lookat.SetSpecialName(Item,"Verzierter Humpen","Decorated Mug")
        lookat.SetSpecialDescription(Item,"Der Humpen zeigt folgendes Bild: ".. mugs[mugId]["pictureDe"] .." Unter dem Bild befindet sich eine Gravur: ".. mugs[mugId]["titleDe"], "The mug shows the following picture: ".. mugs[mugId]["pictureEn"] .." There is an engraving beneath the picture: ".. mugs[mugId]["titleEn"])
        lookat.SetItemRareness(Item, ItemLookAt.uncommonItem)
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
"Backender Halbling V",
"Baking Halfling V",
"Ein Halbling sitzt mit einem breiten Grinsen vor einem Tisch, auf dem ein großer, dampfender Kuchen steht.",
"A hafling sits with a broad grin on his lips in front of a table with a big, steaming cake on it."
)

-- Series: Orcs Mating
addMug(16,
"Balzende Orks I",
"Orcs Mating I",
"Eine Orkfrau pult sich Fleischreste aus den Zähnen. Bewundernd sieht ihr ein Ork dabei zu.",
"An orcess is picking meat from her teeth while an orc admires her."
)

addMug(17,
"Balzende Orks II",
"Orcs Mating II",
"Eine Orkfrau schlägt einem begehrten Ork mit einer Keule auf den Schädel und beginnt ihn in ihre Höhle zu schleifen.",
"An orcess uses a club to hit an admired orc over the head while preparing to drag him to her cave."
)

addMug(18,
"Balzende Orks III",
"Orcs Mating III",
"Ein Ork läßt seine Muskeln spielen und knurrt gefährlich, um einer Orkfrau zu imponieren.",
"An orc flexes his muscles and growls dangerously to impress an orcess."
)

addMug(19,
"Balzende Orks IV",
"Orcs Mating IV",
"Ein Ork schlägt gegen seine Brust und lässt einen gewaltigen Brüller los. Weibliche Clanmitglieder beobachten ihn dabei mit Anerkennung.",
"An orc beats on his chest giving a mighty roar, while female clan members watch with approval."
)

addMug(20,
"Balzende Orks V",
"Orcs Mating V",
"Ein Ork glotzt eine Orkfrau lüstern an und schenkt ihr ein Zwinkern.",
"An orc stares lustfully at an orcess and gives her a wink."
)

--Series: Lizards Swimming
addMug(21,
"Schwimmende Echsenmenschen I",
"Lizards Swimming I",
"Ein Echsenjunges planscht in einem Becken und spuckt Wasserfontänen aus dem Maul.",
"A lizardling is splashing about in a pool and shooting arcs of water from his mouth."
)

addMug(22,
"Schwimmende Echsenmenschen II",
"Lizards Swimming II",
"Ein Echsenmann schnellt aus dem Wasser hoch in die Luft und zieht einen Schwall Wasser mit sich.",
"A lizard jumps high into the air out of a body of water and water follows her, reaching up after the lizard."
)

addMug(23,
"Schwimmende Echsenmenschen III",
"Lizards Swimming III",
"Eine Echsenfamilie schwimmt an Fischschwärmen und großen Wasserpflanzen im Meer vorbei.",
"A family of lizards swim through the water, passing fish and large, waving water plants in the ocean."
)

addMug(24,
"Schwimmende Echsenmenschen IV",
"Lizards Swimming IV",
"Im Ozean ist ein Echsenmensch zu sehen, welcher von einer kronentragenden Meerjungfrau mit leuchtendem Wasser gesalbt wird.",
"A lizardfolk, in the ocean, is seen being anointed with glowing water, by a mermaid with a crown."
)

addMug(25,
"Schwimmende Echsenmenschen V",
"Lizards Swimming V",
"Ein Echsemensch öffnet das Maul um einen leuchtend bunten Fisch zu verschlucken, der genau vors Maul geschwommen ist.",
"A lizard opens his mouth while swimming to swallow the brightly coloured fish just in front of him."
)

-- Series: Humans Fighting
addMug(26,
"Kämpfende Menschen I",
"Humans Fighting I",
"Ein großer Mann hält ein Schwert vor sich hoch als er in die Schlacht stürmt.",
"A large man holds a sword high before him as he charges into battle."
)

addMug(27,
"Kämpfende Menschen II",
"Humans Fighting II",
"Zwei Männer kämpfen inmitten einer Menge Zuschauer auf Leben und Tod, Blut spritzt überall hin.",
"Two men battle to the death amidst a crowd of onlookers as blood sprays all over."
)

addMug(28,
"Kämpfende Menschen III",
"Humans Fighting III",
"Zwei riesige Armeen verwickeln sich in eine Schlacht, ihre Landesflaggen sind deutlich sichtbar zur Schau gestellt.",
"Two large armies engage in battle, their country's flag prominently displayed."
)

addMug(29,
"Kämpfende Menschen IV",
"Humans Fighting IV",
"Ein gepanzerter Mann steht im Zentrum einer verlorenen Schlacht mit den Leichen seiner gefallenen Kameraden um ihn herum.",
"An armoured man stands in the middle of a lost battle, with the bodies of fallen comrades all around him."
)

addMug(30,
"Kämpfende Menschen V",
"Humans Fighting V",
"Ein Mann und eine Frau streiten vor einer kleinen Gruppe von Kindern und die Frau droht dem Mann mit dem Finger.",
"A man and woman argue before a small group of children and the woman points a finger at the man."
)

-- Series: Elder Gods
addMug(31,
"Alte Götter I",
"Elder Gods I",
"Die Göttin Ushara, eine schwarzhäutige, dunkelhaarige ältere Frau in einem Kleid in der Farbe der Erde.",
"The Goddess Ushara, a dark skinned, dark haired elderly woman in a dress the colour of the earth's soil."
)

addMug(32,
"Alte Götter II",
"Elder Gods II",
"Der Gott Bragon, ein dunkelhaariger Ritter mit einem feurig roten Bart und einer brennenden goldenen Rüstung.",
"The God Bragon, a dark haired knight with a fiery red beard and his golden armour ablaze."
)

addMug(33,
"Alte Götter III",
"Elder Gods III",
"Der Gott Eldan, ein untersetzter alter Mann, stützt sich mit einer Hand auf einen Stab und hält ein Buch in der anderen.",
"The God Eldan, a slim older man, looking almost frail as he clutches a staff in one hand and a book in another."
)

addMug(34,
"Alte Götter IV",
"Elder Gods IV",
"Die Göttin Findari, eine zeitlose Frau mit langem blonden Haar, die ein Kleid aus fließend hellblauer Seide trägt.",
"The Goddess Finadri, a timeless woman with long blonde hair and wearing a flowing light blue dress."
)

addMug(35,
"Alte Götter V",
"Elder Gods V",
"Die Göttin Tanora, eine alterslose Meerjungfrau, deren Schwanz und Schuppen in der Sonne schimmern.",
"The Goddess Tanora, an ageless mermaid with her tail and scales sparkling in the sun."
)
return M
