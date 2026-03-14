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
Title[GERMAN] = "Naturmagie: Der natur Pfad"
Title[ENGLISH] = "Nature Magic: The nature path"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do

local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}


Description[GERMAN][1] =  "Fianna hat dir die Aufgabe gegeben, die Zwillingsinseln zu finden, die Teil der Runewick-Halbinsel sind. Dort angekommen sollst du meditieren, um deine Antworten zu finden."
Description[ENGLISH][1] =  "Fianna has set you on the task to find the Twin Islands, part of the Runewick Peninsula. Once there, you are to meditate to seek your answers."
Description[GERMAN][2] =  "Du hast die Zwillingsinseln gefunden und meditiert, wobei du die Worte \"Cor Valis\" von der umgebenden Natur zu dir rufen gehört hast. Du solltest zu Fianna zurückkehren und sie danach fragen."
Description[ENGLISH][2] =  "You found the Twin Islands and you meditated, hearing the phrase \"Cor Valis\" called out to you by the surrounding nature. You should return to Fianna to ask her about it."
Description[GERMAN][3] =  "Du hast die Aufgabe erhalten, ein leeres hölzernes Sigil zu beschaffen, das für den nächsten Teil deiner Reise in die Naturmagie benötigt wird. Du kannst eines als Zimmermann herstellen, eines von Fianna kaufen oder es von anderen Spielern erhalten."
Description[ENGLISH][3] =  "You've been tasked with obtaining a blank wooden sigil, required for the next part of your journey into nature magic. You can craft one as a carpenter, buy one from Fianna or obtain one from other players."
Description[GERMAN][4] =  "Nachdem du ein leeres hölzernes Siegel erhalten hast, ist Fianna bereit, dir mehr über die verschiedenen Geflechte zu erzählen. Frage nach den Geflechten Welken, Blühen, Wildnis, Stein und Tiefe. Wenn du über jedes von ihnen gelernt hast, sage: \"Cor Valis Sindeim.\", um fortzufahren."
Description[ENGLISH][4] =  "Having obtained a blank wooden sigil, Fianna is ready to tell you more about the different weaves. Ask about the Wither, Bloom, Wild, Stone, and Deep Weaves. When you have learned about each, say: \"Cor Valis Sindeim.\" to continue."
Description[GERMAN][5] =  "Du hast über jedes Geflecht gelernt und hast dein Siegel zur Hand. Nun ist die Zeit gekommen zu wählen, in welches Geflecht du tiefer eintauchen möchtest, und Fianna danach zu fragen."
Description[ENGLISH][5] =  "You've learned about each weave and have you sigil at hand. Now is the time to choose which weave you wish to delve deeper into and ask Fianna about it."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {661, 301, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}


-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 5

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

    if ((user:increaseAttrib("perception",0) + user:increaseAttrib("essence",0) + user:increaseAttrib("intelligence",0) ) < 30) or user:getQuestProgress(691) < 5 then
        return {}
    else
        QuestTarget[1] = {position(914, 933, 0)}
        QuestTarget[2] = {position(661, 301, 0)}
        QuestTarget[3] = {position(661, 301, 0)}
        QuestTarget[4] = {position(661, 301, 0)}
        QuestTarget[5] = {position(661, 301, 0)}
    end

    return QuestTarget[status]
end

function M.QuestFinalStatus()
    return FINAL_QUEST_STATUS
end

function M.QuestAvailability(user, status)
    if user:getQuestProgress(691) >= 5 and status == 0 and (user:increaseAttrib("perception",0) + user:increaseAttrib("essence",0) + user:increaseAttrib("intelligence",0) ) > 29 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M
