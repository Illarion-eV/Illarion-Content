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

local texts = require("magic.arcane.base.texts")

local M = {}

M.genderTexts = texts.genderTexts

M.racePrefixText = texts.racePrefixText

M.raceList = texts.raceList


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
