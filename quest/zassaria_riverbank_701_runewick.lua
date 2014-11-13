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
-- INSERT INTO quests SET qst_script = 'quest.zassaria_riverbank_701_runewick' WHERE qst_id = 701;

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Frag für mich"
Title[ENGLISH] = "Ask for me"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Zassaria Riverbank bat dich eine Nachricht an Nizar zu überbringen, einem Händler der auf dem Marktplatz in Runewick zu finden ist."
Description[ENGLISH][1] = "Zassaria Riverbank asked you to take a message Nizar, a merchant who can be found on Runewick's marketplace."
Description[GERMAN][2] = "Du solltest zu Zassaria Riverbank gehen und dir deine Belohnung für deinen Dienst abholen."
Description[ENGLISH][2] = "You should talk to Zassaria Riverbank again to collect the reward for your service."
Description[GERMAN][3] = "Rede erneut mit Zassaria Riverbank. Sie hat sicher noch eine Aufgabe für dich."
Description[ENGLISH][3] = "Talk to Zassaria Riverbank again, she probably has another task for you to do."
Description[GERMAN][4] = "Argentus Almsbag, ein Händler auf dem Marktplatz von Runewick, hat Fisch bei Zassaria Riverbank bestellt. Frag ihn, ob er die Bestellung noch haben möchte."
Description[ENGLISH][4] = "Argentus Almsbag, a merchant on Runewick's marketplace, ordered fish from Zassaria Riverbank. Ask him if he still wants his order."
Description[GERMAN][5] = "Du solltest zu Zassaria Riverbank gehen und dir deine Belohnung für deinen Dienst abholen."
Description[ENGLISH][5] = "You should talk to Zassaria Riverbank again to collect the reward for your service."
Description[GERMAN][6] = "Rede erneut mit Zassaria Riverbank. Sie hat sicher noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Talk to Zassaria Riverbank again, she probably has another task for you to do."
Description[GERMAN][7] = "Neiran el Nyarale hat vielleicht die Öllampensammlung von Zassaria Riverbank entsorgt. Frag ihn danach."
Description[ENGLISH][7] = "Neiran el Nyarale might have thrown away Zassaria Riverbank's collection of oil lamps. Ask him about it."
Description[GERMAN][8] = "Du solltest zu Zassaria Riverbank gehen und dir deine Belohnung für deinen Dienst abholen."
Description[ENGLISH][8] = "You should talk to Zassaria Riverbank again to collect the reward for your service."
Description[GERMAN][9] = "Rede erneut mit Zassaria Riverbank. Sie hat sicher noch eine Aufgabe für dich."
Description[ENGLISH][9] = "Talk to Zassaria Riverbank again, she probably has another task for you to do."
Description[GERMAN][10] = "Zassaria Riverbank bat dich, den großen Fisch zu nehmen und ihn Marianne Forgeron aus Galmair zu zeigen, um ihre Ehre zu verteidigen."
Description[ENGLISH][10] = "Zassaria Riverbank asked you to show the big fish to Marianne Forgeron of Galmair to restore her honour."
Description[GERMAN][11] = "Du solltest zu Zassaria Riverbank gehen und dir deine Belohnung für deinen Dienst abholen."
Description[ENGLISH][11] = "You should talk to Zassaria Riverbank again to collect the reward for your service."
Description[GERMAN][12] = "Rede erneut mit Zassaria Riverbank. Sie hat sicher noch eine Aufgabe für dich."
Description[ENGLISH][12] = "Talk to Zassaria Riverbank again, she probably has another task for you to do."
Description[GERMAN][13] = "Bringe Rosaline Edwards, der Königin von Cadomyr, die Krone zurück, die Zassaria Riverbank gefunden hat."
Description[ENGLISH][13] = "Take the crown Zassaria Riverbank found back to Rosaline Edwards, the leader of Cadomyr."
Description[GERMAN][14] = "Du solltest zu Zassaria Riverbank gehen und dir deine Belohnung für deinen Dienst abholen."
Description[ENGLISH][14] = "You should talk to Zassaria Riverbank again to collect the reward for your service."
Description[GERMAN][15] = "Du hast alle Aufgaben von Zassaria Riverbank erfüllt."
Description[ENGLISH][15] = "You have fulfilled all tasks of Zassaria Riverbank."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {900, 800, 1}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(910, 801, 1)} -- Nizar
QuestTarget[2] = {position(900, 800, 1)}
QuestTarget[3] = {position(900, 800, 1)}
QuestTarget[4] = {position(908, 812, 1)} -- Argentus Almsbag
QuestTarget[5] = {position(900, 800, 1)}
QuestTarget[6] = {position(900, 800, 1)}
QuestTarget[7] = {position(897, 781, 2)} -- Neiran el Nyarale
QuestTarget[8] = {position(900, 800, 1)}
QuestTarget[9] = {position(900, 800, 1)}
QuestTarget[10] = {position(382, 249, 0)} -- Marianne Forgeron
QuestTarget[11] = {position(900, 800, 1)}
QuestTarget[12] = {position(900, 800, 1)}
QuestTarget[13] = {position(122, 521, 0)} -- Rosaline Edwards
QuestTarget[14] = {position(900, 800, 1)}
QuestTarget[15] = {position(900, 800, 1)}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 15


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
    return QuestTarget[status]
end

function M.QuestFinalStatus()
    return FINAL_QUEST_STATUS
end

function M.QuestAvailability(user, status)
    if factions.getMembership(user) == factions.runewick and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M
