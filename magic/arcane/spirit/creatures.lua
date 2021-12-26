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
    {english = "male", german = "", value = 0},
    {english = "female", german = "", value = 1},
    {english = "Gender: ", german = "", value = 2}
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

M.raceList = {
    {name = {english = "human", german = ""}, id = 0},
    {name = {english = "dwarf", german = ""}, id = 1},
    {name = {english = "halfling", german = ""}, id = 2},
    {name = {english = "elf", german = ""}, id = 3},
    {name = {english = "orc", german = ""}, id = 4},
    {name = {english = "lizardman", german = ""}, id = 5},
    {name = {english = "forest troll", german = ""},  id = 9},
    {name = {english = "mummy", german = ""},  id = 10},
    {name = {english = "skeleton", german = ""},  id = 11},
    {name = {english = "beholder", german = ""},  id = 12},
    {name = {english = "sheep", german = ""},  id = 18},
    {name = {english = "spider", german = ""},  id = 19},
    {name = {english = "pig", german = ""},  id = 24},
    {name = {english = "wasp", german = ""},  id = 27},
    {name = {english = "stone golem", german = ""},  id = 30},
    {name = {english = "cow", german = ""},  id = 37},
    {name = {english = "wolf", german = ""},  id =39},
    {name = {english = "bear", german = ""},  id = 51},
    {name = {english = "raptor", german = ""},  id = 52},
    {name = {english = "zombie", german = ""},  id = 53},
    {name = {english = "hellhound", german = ""},  id = 54},
    {name = {english = "imp", german = ""},  id = 55},
    {name = {english = "iron golem", german = ""},  id = 56},
    {name = {english = "ratman", german = ""},  id = 57},
    {name = {english = "dog", german = ""},  id = 58},
    {name = {english = "beetle", german = ""},  id = 59},
    {name = {english = "fox", german = ""},  id = 60},
    {name = {english = "slime", german = ""},  id = 61},
    {name = {english = "chicken", german = ""},  id = 62},
    {name = {english = "bone dragon", german = ""},  id = 63},
    {name = {english = "rat", german = ""},  id = 111},
    {name = {english = "dragon", german = ""},  id = 112},
    {name = {english = "rabbit", german = ""},  id = 113},
    {name = {english = "demon", german = ""},  id = 114},
    {name = {english = "fairy", german = ""},  id = 115},
    {name = {english = "deer", german = ""},  id = 116},
    {name = {english = "ettin", german = ""},  id = 117}
}

M.racePrefixText = {
    english = "Race: ",
    german = ""
}

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
