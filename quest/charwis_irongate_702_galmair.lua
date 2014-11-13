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
-- INSERT INTO quests SET qst_script = 'quest.charwis_irongate_702_galmair' WHERE qst_id = 702;

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Nachrichten Überbringen"
Title[ENGLISH] = "Message Delivery"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Charwis Irongate bat dich eine Nachricht an Nik Nilo zu überbringen, einem Händler in Galmair der seine Waren auf dem Marktplatz in Galmair verkauft."
Description[ENGLISH][1] = "Charwis Irongate asked you to take a message to Nik Nilo, a merchant in Galmair who sells his goods on Galmair's marketplace."
Description[GERMAN][2] = "Du solltest zu Charwis Irongate gehen und dir deine Belohnung für deinen Dienst abholen."
Description[ENGLISH][2] = "You should talk to Charwis Irongate again to collect the reward for your service."
Description[GERMAN][3] = "Rede erneut mit Charwis Irongate. Er hat sicher noch eine Aufgabe für dich."
Description[ENGLISH][3] = "Talk to Charwis Irongate again, he probably has another task for you to do."
Description[GERMAN][4] = "Morri, ein Händler auf dem Marktplatz von Galmair, hat Nägel bei Charwis Irongate bestellt. Frag ihn, ob er die Bestellung noch haben möchte."
Description[ENGLISH][4] = "Morri, a merchant on Galmair's marketplace, ordered pins from Charwis Irongate. Ask him if he still wants his order."
Description[GERMAN][5] = "Du solltest zu Charwis Irongate gehen und dir deine Belohnung für deinen Dienst abholen."
Description[ENGLISH][5] = "You should talk to Charwis Irongate again to collect the reward for your service."
Description[GERMAN][6] = "Rede erneut mit Charwis Irongate. Er hat sicher noch eine Aufgabe für dich."
Description[ENGLISH][6] = "Talk to Charwis Irongate again, he probably has another task for you to do."
Description[GERMAN][7] = "Gretel Goldhair hat vielleicht die Hammersammlung von Charwis Irongate entsorgt. Frag sie danach. Du kannst sie in der Residenz des Dons finden."
Description[ENGLISH][7] = "Gretel Goldhair might have thrown away Charwis Irongate's collection of hammers. Ask her about it. You can find her in the Don's residence."
Description[GERMAN][8] = "Du solltest zu Charwis Irongate gehen und dir deine Belohnung für deinen Dienst abholen."
Description[ENGLISH][8] = "You should talk to Charwis Irongate again to collect the reward for your service."
Description[GERMAN][9] = "Rede erneut mit Charwis Irongate. Er hat sicher noch eine Aufgabe für dich."
Description[ENGLISH][9] = "Talk to Charwis Irongate again, he probably has another task for you to do."
Description[GERMAN][10] = "Charwis Irongate bat dich, den großen Goldnugget zu nehmen und ihn Pheritaleth aus Cadomyr zu zeigen, um seine Ehre zu verteidigen."
Description[ENGLISH][10] = "Charwis Irongate asked you to show the big gold nugget to Pheritaleth of Cadomyr to restore his honor."
Description[GERMAN][11] = "Du solltest zu Charwis Irongate gehen und dir deine Belohnung für deinen Dienst abholen."
Description[ENGLISH][11] = "You should talk to Charwis Irongate again to collect the reward for your service."
Description[GERMAN][12] = "Rede erneut mit Charwis Irongate. Er hat sicher noch eine Aufgabe für dich."
Description[ENGLISH][12] = "Talk to Charwis Irongate again, he probably has another task for you to do."
Description[GERMAN][13] = "Bringe Elvaine Morgan, dem Anführer von Runewick, den Stab der Luft zurück, den Charwis Irongate gefunden hat."
Description[ENGLISH][13] = "Take the wand of air Charwis Irongate found back to Elvaine Morgan, the leader of Runewick."
Description[GERMAN][14] = "Du solltest zu Charwis Irongate gehen und dir deine Belohnung für deinen Dienst abholen."
Description[ENGLISH][14] = "You should talk to Charwis Irongate again to collect the reward for your service."
Description[GERMAN][15] = "Du hast alle Aufgaben von Charwis Irongate erfüllt."
Description[ENGLISH][15] = "You have fulfilled all tasks of Charwis Irongate."


-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {360, 281, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(366, 275, 0)} -- Nik Nilo
QuestTarget[2] = {position(360, 281, 0)}
QuestTarget[3] = {position(360, 281, 0)}
QuestTarget[4] = {position(353, 266, 0)} -- Morri
QuestTarget[5] = {position(360, 281, 0)}
QuestTarget[6] = {position(360, 281, 0)}
QuestTarget[7] = {position(341, 218, 0)} -- Gretel Goldhair
QuestTarget[8] = {position(360, 281, 0)}
QuestTarget[9] = {position(360, 281, 0)}
QuestTarget[10] = {position(111, 599, 0)} -- Pheritaleth
QuestTarget[11] = {position(360, 281, 0)}
QuestTarget[12] = {position(360, 281, 0)}
QuestTarget[13] = {position(898, 775, 2)} -- Elvaine Morgan
QuestTarget[14] = {position(360, 281, 0)}
QuestTarget[15] = {position(360, 281, 0)}

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
    if factions.isGalmairCitizen(user) and status == 0 then
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M
