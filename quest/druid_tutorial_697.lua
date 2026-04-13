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

local common = require("base.common")

local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Naturmagie: Steinweben"
Title[ENGLISH] = "Nature Magic: Stoneweaving"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do

local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}


Description[GERMAN][1] =  "Frage Fianna nach \"Stein\", um mehr über Steinweben zu erfahren."
Description[ENGLISH][1] =  "Ask Fianna about \"stone\" to learn more about stoneweaving."

Description[GERMAN][2] =  "Du hast von Fianna mehr über Steinweben gelernt. Sobald du nach den anderen Webarten gefragt und die Phrase \"Cor Valis Sindeim\" zu ihr gesprochen hast, kannst du sie erneut nach Steinweben fragen, um diesen Pfad fortzusetzen."
Description[ENGLISH][2] =  "You've learned more about stoneweaving from Fianna. Once you've inquired about the other weaves and spoken the phrase \"Cor Valis Sindeim\" to her, you can once more ask her about stoneweaving to continue down this path."

Description[GERMAN][3] =  "Fianna schickt dich erneut hinaus, um zu meditieren. Dieses Mal ist dein Ziel der Steinbruch der Freiheit in Cadomyr. Finde deinen Weg hinein und suche dir einen ruhigen Ort, um zu meditieren."
Description[ENGLISH][3] =  "Fianna is sending you out to meditate once more, this time your destination is the Liberty Quarry in Cadomyr. Find your way into it and seek a quiet place to meditate."

Description[GERMAN][4] =  "Du hast erfolgreich meditiert und scheinst die benötigte Antwort gefunden zu haben. Sammle 10 Faulbaumrinde und kehre dann zu Fianna zurück."
Description[ENGLISH][4] =  "You've successfully meditated and seem to have found the answer you need. Gather 10 Rotten Tree Bark then return to Fianna."

Description[GERMAN][5] =  "Du hast nun die notwendigen Zutaten, um fortzufahren. Bringe die faulige Baumrinde, deinen Cor-Stab und ein leeres Siegel zum Weberstumpf im Südosten des Ecksteins der Aufrichtigkeit."
Description[ENGLISH][5] =  "You now have the necessary reagents to proceed. Bring the rotten tree bark, your Cor Staff and a blank sigil to the Weaver's Stump in the southeast of the Cornerstone of Candour."

Description[GERMAN][6] =  "Du hast ein Leeres Siegel für Steinweben hergestellt. Kehre zu Fianna zurück, um weitere Anweisungen zu erhalten, was als Nächstes zu tun ist."
Description[ENGLISH][6] =  "You've crafted a basic sigil for stoneweaving. Return to Fianna to continue receiving guidance on what to do next."

Description[GERMAN][7] =  "Durch Fiannas Anleitung hast du die Grundlagen gelernt, um den Pfad des Steinwebens zu betreten, einschließlich des Standorts des Weberstumpfs im Südosten des Ecksteins der Aufrichtigkeit."
Description[ENGLISH][7] =  "Through Fianna's guidance you've learned the basics necessary to set you onto the path of stoneweaving, including the location of the Weaver's Stump in the southeast of the Cornerstone of Candour."

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
        QuestTarget[1] = {position(661, 301, 0)}
        QuestTarget[2] = {position(661, 301, 0)}
        QuestTarget[3] = {position(169, 616, 0)}
        QuestTarget[4] = {position(661, 301, 0)}
        QuestTarget[5] = {position(154, 695, 0)}
        QuestTarget[6] = {position(661, 301, 0)}
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
