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
Title[GERMAN] = "Naturmagie: Blühweben"
Title[ENGLISH] = "Nature Magic: Bloomweaving"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do

local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}


Description[GERMAN][1] =  "Frage Fianna nach \"Blühen\", um mehr über Blühweben zu erfahren."
Description[ENGLISH][1] =  "Ask Fianna about \"bloom\" to learn more about bloomweaving."

Description[GERMAN][2] =  "Du hast von Fianna mehr über Blühweben gelernt. Sobald du nach den anderen Webarten gefragt und die Phrase \"Cor Valis Sindeim\" zu ihr gesprochen hast, kannst du sie erneut nach Blühweben fragen, um diesen Pfad fortzusetzen."
Description[ENGLISH][2] =  "You've learned more about bloomweaving from Fianna. Once you've inquired about the other weaves and spoken the phrase \"Cor Valis Sindeim\" to her, you can once more ask her about bloomweaving to continue down this path."

Description[GERMAN][3] =  "Fianna schickt dich erneut hinaus, um zu meditieren. Dieses Mal ist dein Ziel ein goldener Mevrannon-Baum in den Wäldern nördlich der Felder von Runewick. Deine Aufgabe ist es, diesen Baum zu finden und dich unter seine südlichen Äste zu setzen, um zu meditieren und in deiner Suche nach Antworten auf die Stimme der Natur zu hören. Hinweis: Der richtige Baum hat eine besondere Beschreibung, wenn du mit der Maus über ihn fährst."
Description[ENGLISH][3] =  "Fianna is sending you out to meditate once more, this time your destination is a golden Mevrannon tree in the woods just north of Runewick's fields. Your task is to locate this tree and sit beneath its southern branches to meditate and listen to the voice of nature in your quest for answers. Hint: The correct tree has a special description if you hover over it with your mouse."

Description[GERMAN][4] =  "Du hast erfolgreich meditiert und scheinst die benötigte Antwort gefunden zu haben. Sammle 10 vierblättrige Einbeeren und kehre dann zu Fianna zurück."
Description[ENGLISH][4] =  "You've successfully meditated and seem to have found the answer you need. Gather 10 fourleafed oneberries then return to Fianna."

Description[GERMAN][5] =  "Du hast nun die notwendigen Zutaten, um fortzufahren. Bringe die vierblättrigen Einbeeren, deinen Cor-Stab und ein leeres Siegel zum Weberstumpf in den Wäldern nördlich von Yewdale. Du solltest eventuell Schutz mitbringen, da bekannt ist, dass in der Gegend Wölfe umherstreifen."
Description[ENGLISH][5] =  "You now have the necessary reagents to proceed. Bring the fourleafed oneberries, your Cor Staff and a blank sigil to the Weaver's Stump in the woods just north of Yewdale. You may want to bring protection, as the area is known to have wolves roaming nearby."

Description[GERMAN][6] =  "Du hast ein Novizensiegel für Blühweben hergestellt. Kehre zu Fianna zurück, um weitere Anweisungen zu erhalten, was als Nächstes zu tun ist."
Description[ENGLISH][6] =  "You've crafted a novice sigil for bloomweaving. Return to Fianna to continue receiving guidance on what to do next."

Description[GERMAN][7] =  "Durch Fiannas Anleitung hast du die Grundlagen gelernt, um den Pfad des Blühwebens zu betreten, einschließlich des Standorts des Weberstumpfs für Blühweben in den Wäldern nördlich von Yewdale."
Description[ENGLISH][7] =  "Through Fianna's guidance you've learned the basics necessary to set you onto the path of bloomweaving, including the location of the bloomweave Weaver's Stump in the woods just north of Yewdale."

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
        QuestTarget[3] = {position(849, 769, 0)}
        QuestTarget[4] = {position(661, 301, 0)}
        QuestTarget[5] = {position(768, 769, 0)}
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
