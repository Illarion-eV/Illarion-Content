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
Title[GERMAN] = "Naturmagie: Tiefenweben"
Title[ENGLISH] = "Nature Magic: Deepweaving"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do

local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}



Description[GERMAN][1] =  "Frage Fianna nach \"Tief\", um mehr über Tiefenweben zu erfahren."
Description[ENGLISH][1] =  "Ask Fianna about \"Deep\" to learn more about deepweaving."

Description[GERMAN][2] =  "Du hast von Fianna mehr über Tiefenweben gelernt. Sobald du nach den anderen Webarten gefragt und die Phrase \"Cor Valis Sindeim\" zu ihr gesprochen hast, kannst du sie erneut nach Tiefenweben fragen, um diesen Pfad fortzusetzen."
Description[ENGLISH][2] =  "You've learned more about deepweaving from Fianna. Once you've inquired about the other weaves and spoken the phrase \"Cor Valis Sindeim\" to her, you can once more ask her about deepweaving to continue down this path."

Description[GERMAN][3] =  "Fianna schickt dich erneut hinaus, um zu meditieren. Dieses Mal ist dein Ziel das unterirdische Paradies namens Usharas Garten. Sobald du es gefunden hast, musst du dich nur noch zur Meditation niederlassen. Hinweis: Du solltest vielleicht die Hilfe einer anderen Person in Anspruch nehmen, um dich dorthin begleiten zu lassen."
Description[ENGLISH][3] =  "Fianna is sending you out to meditate once more, this time your destination is the underground paradise by the name of Ushara's Garden. Once you find it, all you need to do is meditate. Hint: You may want to seek assistance from someone else to escort you there."

Description[GERMAN][4] =  "Du hast erfolgreich meditiert und scheinst die benötigte Antwort gefunden zu haben. Sammle 10 Knollenschwammpilz und kehre dann zu Fianna zurück."
Description[ENGLISH][4] =  "You've successfully meditated and seem to have found the answer you need. Gather 10 Bulbsponge Mushrooms then return to Fianna."

Description[GERMAN][5] =  "Du hast nun die notwendigen Zutaten, um fortzufahren. Bringe die Knollenschwammpilz, deinen Cor-Stab und ein leeres Siegel zum Weberstumpf in der Fuchshöhle im Norden von Elstree. Du solltest eventuell Schutz mitbringen, da der Weg dorthin möglicherweise nicht ganz sicher ist."
Description[ENGLISH][5] =  "You now have the necessary reagents to proceed. Bring the Bulbsponge Mushrooms, your Cor Staff and a blank sigil to the Weaver's Stump in the fox den in the north of Elstree. You may want to bring protection, as the path there may not be all that safe."

Description[GERMAN][6] =  "Du hast ein Leeres Siegel für Tiefenweben hergestellt. Kehre zu Fianna zurück, um weitere Anweisungen zu erhalten, was als Nächstes zu tun ist."
Description[ENGLISH][6] =  "You've crafted a basic sigil for deepweaving. Return to Fianna to continue receiving guidance on what to do next."

Description[GERMAN][7] =  "Durch Fiannas Führung hast du die Grundlagen gelernt, die dich auf den Pfad des Deepweaving bringen. Dazu gehört auch der Ort des Deepweave-Weberstumpfs in der Fuchshöhle im Norden von Elstree."
Description[ENGLISH][7] =  "Through Fianna's guidance you've learned the basics necessary to set you onto the path of deepweaving, including the location of the deepweave Weaver's Stump in the fox den in the north of Elstree"

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
        QuestTarget[3] = {position(777, 288, -3)}
        QuestTarget[4] = {position(661, 301, 0)}
        QuestTarget[5] = {position(823, 394, -3)}
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
