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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (691, 'quest.druid_tutorial_691');

local common = require("base.common")

local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Naturmagie: Der alte Pfad"
Title[ENGLISH] = "Nature Magic: The Old Path"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do

local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}

Description[GERMAN][1] =  "Suche einen von Fiannas Kontakten auf, um weitere Hinweise zu erhalten, wie du ein Druide werden kannst, und kehre anschließend zu ihr zurück, sobald du einer geworden bist. Du findest Joseph Quatrilla in Cadomyr, Grator Bottlebreak in Galmair oder Vallaria Medrota in Runewick."
Description[ENGLISH][1] = "Seek out one of Fianna's contacts for more hints on how to become a druid, then return to her once you have become one. You can find Joseph Quatrilla in Cadomyr, Grator Bottlebreak in Galmair, or Vallaria Medrota in Runewick."
Description[GERMAN][2] =  "Congratulations, you are now a druid capable of harnessing the powers of nature. Return to Fianna in Troll's Haven to learn more."
Description[ENGLISH][2] = "Glückwunsch, du bist nun ein Druide, der die Kräfte der Natur nutzen kann. Kehre zu Fianna in Troll's Haven zurück, um mehr zu erfahren."
Description[GERMAN][3] =  "Nun, da du ein Druide bist, der die Kräfte der Natur nutzen kann, kannst du Fianna sowohl nach Alchemie als auch nach den Geflechten der Naturmagie fragen, um mehr darüber zu erfahren und zu lernen, wie du deine neu gewonnenen Kräfte einsetzen kannst."
Description[ENGLISH][3] = "Now that you are a druid capable of harnessing the powers of nature, you can ask Fianna about both alchemy or the weaves of nature magic to learn more about them and how to make use of your newfound powers."
Description[GERMAN][4] =  "Du hast die Einführung in den alten Pfad der Naturmagie erfolgreich abgeschlossen und bist bereit, zum nächsten Schritt überzugehen. In diesem Schritt hast du dich auf die Kräfte der Natur eingestimmt und bist zu einem Druiden geworden, der ihre Macht nutzen kann."
Description[ENGLISH][4] = "You successfully completed the introduction to the old path of nature magic, and are ready to move onto the next step. In this step you attuned to the powers of nature and became a druid capable of harnessing its power."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {661, 301, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}


-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 4

function M.QuestTitle(user)
    return common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function M.QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return common.GetNLS(user, german, english)
end

function M.QuestStart()
    return Start
end

function M.QuestTargets(user, status)

    if (user:increaseAttrib("perception",0) + user:increaseAttrib("essence",0) + user:increaseAttrib("intelligence",0) ) < 30 then
        for i = 1, 3 do
            QuestTarget[i] = {}
        end
    else
        QuestTarget[1] = {position(661, 301, 0)}
        QuestTarget[2] = {position(661, 301, 0)}
        QuestTarget[3] = {position(661, 301, 0)}
    end

    return QuestTarget[status]
end

function M.QuestFinalStatus()
    return FINAL_QUEST_STATUS
end

function M.QuestAvailability(user, status)
    if status == 0 and (user:increaseAttrib("perception",0) + user:increaseAttrib("essence",0) + user:increaseAttrib("intelligence",0) ) > 29 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M
