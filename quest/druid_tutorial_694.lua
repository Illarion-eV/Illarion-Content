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
Title[GERMAN] = "Naturmagie: Welkenweben"
Title[ENGLISH] = "Nature Magic: Witherweaving"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do

local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}


Description[GERMAN][1] =  "Frage Fianna nach \"Verfall\", um mehr über Verfallweben zu erfahren."
Description[ENGLISH][1] =  "Ask Fianna about \"wither\" to learn more about witherweaving."

Description[GERMAN][2] =  "Du hast von Fianna mehr über Verfallweben gelernt. Sobald du nach den anderen Webarten gefragt und die Phrase \"Cor Valis Sindeim\" zu ihr gesprochen hast, kannst du sie erneut nach Verfallweben fragen, um diesen Pfad fortzusetzen."
Description[ENGLISH][2] =  "You've learned more about witherweaving from Fianna. Once you've inquired about the other weaves and spoken the phrase \"Cor Valis Sindeim\" to her, you can once more ask her about witherweaving to continue down this path."

Description[GERMAN][3] =  "Fianna schickt dich erneut zum Meditieren los, diesmal ist dein Ziel die Taufeuchten Sümpfe nördlich von Runewick. Deine Aufgabe ist es, einen Ort zu finden, an dem sich schattenverhangene Pilze nahe eines abgestandenen Baches sammeln, und dich ruhig zwischen ihnen niederzulassen. \n Tipp: Wenn du einem freundlichen Magier begegnest, könnte er deine Reise deutlich verkürzen."
Description[ENGLISH][3] =  "Fianna is sending you out to meditate once more, this time your destination is the Dewy Swamps just outside of Runewick to the north. Your task is to find where shadowed mushrooms cluster near a stale stream and sit quietly among them. \n Tip: If you come across a friendly mage, they might just make the trip a lot shorter for you."

Description[GERMAN][4] =  "Du hast erfolgreich meditiert und scheinst die benötigte Antwort gefunden zu haben. Sammle 10 Sumpfblumen und kehre dann zu Fianna zurück."
Description[ENGLISH][4] =  "You've successfully meditated and seem to have found the answer you need. Gather 10 marsh flowers then return to Fianna."

Description[GERMAN][5] =  "Du hast nun die notwendigen Reagenzien, um fortzufahren. Bringe die Sumpfblumen, deinen Cor-Stab und ein leeres Siegel zum Weberstumpf in Totensumpf, gleich hinter der Brücke. Du solltest Schutz mitbringen, da das Gebiet tödlich sein kann."
Description[ENGLISH][5] =  "You now have the necessary reagents to proceed. Bring the marsh flowers, your Cor Staff and a blank sigil to the Weaver's Stump in Deadmarsh, just past the bridge. You may want to bring protection, as the area can prove lethal."

Description[GERMAN][6] =  "Du hast ein einfaches Sigil für Verfallweben hergestellt. Kehre zu Fianna zurück, um weitere Anweisungen zu erhalten, was als Nächstes zu tun ist."
Description[ENGLISH][6] =  "You've crafted a basic sigil for witherweaving. Return to Fianna to continue receiving guidance on what to do next."

Description[GERMAN][7] =  "Durch Fiannas Anleitung hast du die Grundlagen gelernt, um den Pfad des Verfallwebens zu betreten, einschließlich des Standorts des Weberstumpfs für Verfallweben in Totensumpf, gleich hinter der Brücke südlich von Troll's Haven."
Description[ENGLISH][7] =  "Through Fianna's guidance you've learned the basics necessary to set you onto the path of witherweaving, including the location of the witherweave Weaver's Stump in Deadmarsh just past the bridge south of Troll's Haven."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {661, 301, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}


-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 7

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
        QuestTarget[3] = {position(923, 667, 0)}
        QuestTarget[4] = {position(661, 301, 0)}
        QuestTarget[5] = {position(655, 366, 0)}
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
