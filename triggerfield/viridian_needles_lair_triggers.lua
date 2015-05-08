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
-- INSERT INTO triggerfields VALUES (605, 205, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (605, 204, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (605, 206, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (605, 207, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (525, 206, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (525, 207, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (525, 208, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (525, 209, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (620, 190, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (533, 207, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (542, 205, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (548, 207, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (550, 200, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (558, 200, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (565, 206, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (567, 201, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (571, 194, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (577, 194, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (579, 185, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (567, 183, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (558, 186, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (548, 193, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (542, 188, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (548, 183, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (543, 179, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (530, 195, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (528, 185, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (588, 183, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (601, 194, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (597, 206, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (605, 183, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (607, 205, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (617, 201, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (583, 183, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (590, 187, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (594, 178, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (575, 184, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (585, 195, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (585, 186, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (608, 188, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (600, 189, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (603, 201, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (595, 199, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (594, 191, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (606, 196, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (610, 185, -3,'triggerfield.viridian_needles_lair_triggers');
-- INSERT INTO triggerfields VALUES (576, 188, -3,'triggerfield.viridian_needles_lair_triggers');

local common = require("base.common")

local M = {}

--This script handles scripted events on "Viridian Needles Lair" map
--Various events and fields are handled here for a better overview

local ratmanTrigger = {} --a list with positions of the event triggers
ratmanTrigger[1] = position(605, 205, -3) -- Laughter triggers
ratmanTrigger[2] = position(605, 204, -3)
ratmanTrigger[3] = position(605, 206, -3)
ratmanTrigger[4] = position(605, 207, -3)
ratmanTrigger[5] = position(525, 206, -3)
ratmanTrigger[6] = position(525, 207, -3)
ratmanTrigger[7] = position(525, 208, -3)
ratmanTrigger[8] = position(525, 209, -3)
ratmanTrigger[9] = position(620, 190, -3) --  Wind Locations
ratmanTrigger[10] = position(533, 207, -3)
ratmanTrigger[11] = position(542, 205, -3)
ratmanTrigger[12] = position(548, 207, -3)
ratmanTrigger[13] = position(550, 200, -3)
ratmanTrigger[14] = position(558, 200, -3)
ratmanTrigger[15] = position(565, 206, -3)
ratmanTrigger[16] = position(567, 201, -3)
ratmanTrigger[17] = position(571, 194, -3)
ratmanTrigger[18] = position(577, 194, -3)
ratmanTrigger[19] = position(579, 185, -3)
ratmanTrigger[20] = position(567, 183, -3)
ratmanTrigger[21] = position(558, 186, -3)
ratmanTrigger[22] = position(548, 193, -3)
ratmanTrigger[23] = position(542, 188, -3)
ratmanTrigger[24] = position(548, 183, -3)
ratmanTrigger[25] = position(543, 179, -3)
ratmanTrigger[26] = position(530, 195, -3)
ratmanTrigger[27] = position(528, 185, -3)
ratmanTrigger[28] = position(588, 183, -3)
ratmanTrigger[29] = position(601, 194, -3)
ratmanTrigger[30] = position(597, 206, -3)
ratmanTrigger[31] = position(605, 183, -3)
ratmanTrigger[32] = position(607, 205, -3)
ratmanTrigger[33] = position(617, 201, -3)
ratmanTrigger[34] = position(583, 183, -3) -- shelves trigger locations
ratmanTrigger[35] = position(590, 187, -3)
ratmanTrigger[36] = position(594, 178, -3)
ratmanTrigger[37] = position(575, 184, -3)
ratmanTrigger[38] = position(585, 195, -3)
ratmanTrigger[39] = position(585, 186, -3)
ratmanTrigger[40] = position(608, 188, -3)
ratmanTrigger[41] = position(600, 189, -3)
ratmanTrigger[42] = position(603, 201, -3)
ratmanTrigger[43] = position(595, 199, -3)
ratmanTrigger[44] = position(594, 191, -3)
ratmanTrigger[45] = position(606, 196, -3)
ratmanTrigger[46] = position(610, 185, -3)
ratmanTrigger[47] = position(576, 188, -3)

local smellEng = {
    "puss",
    "puke",
    "copper",
    "rain weed",
    "sunshine",
    "a hearty rabbit stew",
    "desert berries",
    "water lillies",
    "mushrooms",
    "carrots",
    "fresh turned soil after a spring rain",
    "tobacco",
    "oranges",
    "powerful onions",
    "an eviscertated decomposing body",
    "raw sewage",
    "rotten eggs",
    "rotten fish",
    "freshly minted coins",
}

local smellDe = {
    "Eiter",
    "Erbrochenes",
    "Kupfer",
    "Regenkraut",
    "Sonnenschein",
    "ein herzhafter Kanincheneintopf",
    "Wüstenbeeren",
    "Seerosen",
    "Pilze",
    "Karotten",
    "frisch gegrabene Erde nach einem Frühlingsregen",
    "Tabak",
    "Orangen",
    "mächtige Zwiebeln",
    "ein ausgeweideter verwesender Körper",
    "ungekochtes Abwasser",
    "faulige Eier",
    "vergammelter Fisch",
    "frisch geprägte Münzen",
}

function M.MoveToField(User)
    if User:getType() ~= Character.player then
        return
    end

    if Random.uniform(1, 4) == 1 then --only player characters trigger the triggerfield at a chance of 20%
        local theRatmantrigger
        for i = 1, #ratmanTrigger do
            if User.pos == ratmanTrigger[i] then
                theRatmantrigger = i
                break
            end
        end

        if theRatmantrigger >= 1 and theRatmantrigger <= 8 then -- simple inform
            common.InformNLS(User,
                "Du hörst lautes Gelächter als du um die Ecke biegst. Vorsicht, Nargun wandelt heute.",
                "You hear loud laughter as you round the corner. Be wary, Nargun is about today.")
            world:makeSound(25, User.pos) --a laughter
        elseif theRatmantrigger >= 9 and theRatmantrigger <= 33 then -- random inform
            common.InformNLS(User,
                "Als du hindurch gehst, weht dir aus dem Nichts Luft entgegen, die nach " .. smellDe[math.random(1, #smellDe)] .. " riecht, während Nargun dir Streiche spielt.",
                "As you walk through, air blows through out of nowhere, which smells like " .. smellEng[math.random(1, #smellEng)] .. ", as Nargun plays tricks on you.")
            world:makeSound(27, User.pos) --a wind
        elseif theRatmantrigger >= 34 and theRatmantrigger <= 47 then -- simple inform
            common.InformNLS(User,
                "Eine Flasche fliegt plötzlich von einem der Regale in der Nähe in die Luft und landet auf deinem Kopf. Nargun muss hier wohl heute Streiche spielen.",
                "A bottle suddenly takes off from the nearby shelves and lands on top of your head. Nargun must be playing tricks in here today.")
        end --all events handled
    end --triggerfield
end

return M
