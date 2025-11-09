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
local runes = require("magic.arcane.runes")
local monsterLevels = require("monster.base.levels")

local M = {}

M.threatTexts = {
    {value = 0, english = "Novice", german = "Anfänger"},
    {value = 1, english = "Apprentice", german = "Lehrling"},
    {value = 2, english = "Initiate", german = "Initiat"},
    {value = 3, english = "Journeyman", german = "Geselle"},
    {value = 4, english = "Specialist", german = "Spezialist"},
    {value = 5, english = "Expert", german = "Experte"},
    {value = 6, english = "Adept", german = "Adept"},
    {value = 7, english = "Artisan", german = "Artisane"},
    {value = 8, english = "Master", german = "Meister"},
    {value = 9, english = "Grandmaster", german = "Großmeister"}
  }

local function getLevelText(level)
    for _, text in pairs(M.threatTexts) do
        if level == text.value then
            return text.english, text.german
        end
    end
    return false
end

local function getPlayerLevel(player)

    --A simplistic approach of just taking the highest combat skill and using that to determine level. Could be improved on.

    local defensiveCombatSkills = {Character.magicResistance, Character.heavyArmour, Character.mediumArmour, Character.lightArmour, Character.parry}

    local offensiveCombatSkills = {Character.distanceWeapons, Character.slashingWeapons, Character.wrestling, Character.concussionWeapons, Character.punctureWeapons, Character.fireMagic, Character.windMagic, Character.earthMagic, Character.waterMagic}

    local highestValueOffense = 10
    local highestValueDefense = 10 --Defaulting at 10 as we have no stage below novice for monsters


    for _, skill in pairs(defensiveCombatSkills) do

        local skillValue = player:getSkill(skill)

        if skillValue > highestValueDefense then
            highestValueDefense = skillValue
        end
    end

    for _, skill in pairs(offensiveCombatSkills) do

        local skillValue = player:getSkill(skill)

        if skillValue > highestValueOffense then
            highestValueOffense = skillValue
        end
    end

    local highestValue = (highestValueOffense + highestValueDefense) / 2

    return math.floor(highestValue/10)-1 --This way we get a result between 0 and 9

end

function M.threatIntoText(information, spell)
    local FHEN = runes.checkSpellForRuneByName("FHEN", spell)

    if not FHEN then
        return information
    end

    for _, target in pairs(information) do

        local player = target.type == "player"
        local creature = target.type == "creature"
        local level = 0

        if creature then
            level = monsterLevels.getLevel(target.target)
        end

        if player then
            level = getPlayerLevel(target.target)
        end

        local english, german = getLevelText(level)

        if not english then --something went wrong
            return information
        end

        local englishText ="Threat level: "..english
        local germanText = "Bedrohungsstufe: "..german

        target.threat = {}
        target.threat.english = englishText
        target.threat.german = germanText

    end
    return information
end

return M
