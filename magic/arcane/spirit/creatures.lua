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

M.genderTexts = {
    {english = "male", german = "männlich", value = 0},
    {english = "female", german = "weiblich", value = 1},
    {english = "Gender: ", german = "Geschlecht: ", value = 2}
    }

M.racePrefixText = {
        english = "Race: ",
        german = "Rasse: "
    }

M.raceList = {
    {name = {english = "human", german = "Mensch"}, id = 0},
    {name = {english = "dwarf", german = "Zwerg"}, id = 1},
    {name = {english = "halfling", german = "Halbling"}, id = 2},
    {name = {english = "elf", german = "Elf"}, id = 3},
    {name = {english = "orc", german = "Ork"}, id = 4},
    {name = {english = "lizardman", german = "Echsenmensch"}, id = 5},
    {name = {english = "forest troll", german = "Waldtroll"},  id = 9},
    {name = {english = "mummy", german = "Mumie"},  id = 10},
    {name = {english = "skeleton", german = "Skelett"},  id = 11},
    {name = {english = "beholder", german = "Beholder"},  id = 12},
    {name = {english = "sheep", german = "Schaf"},  id = 18},
    {name = {english = "spider", german = "Spinne"},  id = 19},
    {name = {english = "pig", german = "Schwein"},  id = 24},
    {name = {english = "wasp", german = "Wespe"},  id = 27},
    {name = {english = "stone golem", german = "Steingolem"},  id = 30},
    {name = {english = "cow", german = "Kuh"},  id = 37},
    {name = {english = "wolf", german = "Wold"},  id =39},
    {name = {english = "bear", german = "Bär"},  id = 51},
    {name = {english = "raptor", german = "Schnapper"},  id = 52},
    {name = {english = "zombie", german = "Zombie"},  id = 53},
    {name = {english = "hellhound", german = "Höllenhund"},  id = 54},
    {name = {english = "imp", german = "Kobold"},  id = 55},
    {name = {english = "iron golem", german = "Eisengolem"},  id = 56},
    {name = {english = "ratman", german = "Rattenmensch"},  id = 57},
    {name = {english = "dog", german = "Hund"},  id = 58},
    {name = {english = "beetle", german = "Käfer"},  id = 59},
    {name = {english = "fox", german = "Fuchs"},  id = 60},
    {name = {english = "slime", german = "Schleim"},  id = 61},
    {name = {english = "chicken", german = "Huhn"},  id = 62},
    {name = {english = "bone dragon", german = "Knochendrache"},  id = 63},
    {name = {english = "rat", german = "Ratte"},  id = 111},
    {name = {english = "dragon", german = "Drache"},  id = 112},
    {name = {english = "rabbit", german = "Hase"},  id = 113},
    {name = {english = "demon", german = "Dämon"},  id = 114},
    {name = {english = "fairy", german = "Fee"},  id = 115},
    {name = {english = "deer", german = "Reh"},  id = 116},
    {name = {english = "ettin", german = "Ettin"},  id = 117}
}


local function getGenderText(target)
    local genderNumber = target:getBaseAttribute("sex")
    local english
    local german
    local prefixEnglish
    local prefixGerman

    for _, gender in pairs(M.genderTexts) do

        if gender.value == genderNumber then
            english = gender.english
            german = gender.german
        end

        if gender.value == 2 then
            prefixEnglish = gender.english
            prefixGerman = gender.german
        end
    end

    local germanText = prefixGerman..german
    local englishText = prefixEnglish..english

    return englishText, germanText
end

local function getRaceText(target)
    local raceNumber = target:getRace()
    local raceEnglish
    local raceGerman
        for _, race in pairs(M.raceList) do
            if race.id == raceNumber then
                raceEnglish = race.name.english
                raceGerman = race.name.german
            end
        end

    local englishText = M.racePrefixText.english..raceEnglish
    local germanText = M.racePrefixText.german..raceGerman

    return englishText, germanText
end

function M.getCharacterText(information, spell)

    for _, target in pairs(information) do
        if target.type == "player" or target.type == "creature" then
            local raceEnglish, raceGerman = getRaceText(target.target)
            local genderEnglish, genderGerman = getGenderText(target.target)
            local englishText = raceEnglish.."\n"..genderEnglish
            local germanText = raceGerman.."\n"..genderGerman
            target.genderRace = {}
            target.genderRace.english = englishText
            target.genderRace.german = germanText
        end
    end
return information
end

return M
