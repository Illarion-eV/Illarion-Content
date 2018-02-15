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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (155, 'quest.Boumaug Firesmash_firesmash_155_galmair');

local common = require("base.common")
local factions = require("base.factions")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Als Wache Galmairs"
Title[ENGLISH] = "As a Galmair Guard"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Lies die Regeln auf den Statuen des Dons, die vor Galmairs Krone stehen."
Description[ENGLISH][1] = "Read the rules on the Don's statues in front of the Crest of Galmair."
Description[GERMAN][2] = "Kehre zu Boumaug Firesmash zurück."
Description[ENGLISH][2] = "Return to Boumaug Firesmash."
Description[GERMAN][3] = "Gehe zu Boumaug Firesmash am Osttor Galmairs. Er hat bestimmt noch eine weitere Aufgabe für Dich."
Description[ENGLISH][3] = "Go back to Boumaug Firesmash by the East Gate of Galmair, he will certainly have another task for you."
Description[GERMAN][4] = "Geh zum Notarbüro, der Guilliani Residenz in der Krone und dem Südtor."
Description[ENGLISH][4] = "Go to the Census Office, the Guilliani Residence in the Crest, and the South Gate."
Description[GERMAN][5] = "Kehre zu Boumaug Firesmash zurück."
Description[ENGLISH][5] = "Return to Boumaug Firesmash."
Description[GERMAN][6] = "Gehe zu Boumaug Firesmash am Osttor Galmairs. Er hat bestimmt noch eine weitere Aufgabe für Dich."
Description[ENGLISH][6] = "Go back to Boumaug Firesmash by the East Gate of Galmair, he will certainly have another task for you."
Description[GERMAN][7] = "Besorge zwanzig Steinblöcke und bringe sie zu Boumaug Firesmash. Du kannst sie von einem Händler kaufen oder mit einem Meißel in der Hand aus unbehauenen Steinen herstellen."
Description[ENGLISH][7] = "Produce twenty stone blocks and bring them to Boumaug Firesmash. You can buy them from a merchant, or produce them by using a chisel while holding raw stone."
Description[GERMAN][8] = "Gehe zu Boumaug Firesmash am Osttor Galmairs. Er hat bestimmt noch eine weitere Aufgabe für Dich."
Description[ENGLISH][8] = "Go back to Boumaug Firesmash by the East Gate of Galmair, he will certainly have another task for you."
Description[GERMAN][9] = "Gehe zur Dunkellochlochmine, zum Hafen von Galmair, zur Schwarzbrücke und den Bienenstöcken in Narguns Ebene fern im Osten von Galmair."
Description[ENGLISH][9] = "Go through the tunnel to the Dark Hole Mine, Galmair Harbour to the north, the Black Bridge, and the bridge and beehives to the far east of Nargún's Plain."
Description[GERMAN][10] = "Kehre zu Boumaug Firesmash zurück."
Description[ENGLISH][10] = "Return to Boumaug Firesmash."
Description[GERMAN][11] = "Gehe zu Boumaug Firesmash am Osttor Galmairs. Er hat bestimmt noch eine weitere Aufgabe für Dich."
Description[ENGLISH][11] = "Go back to Boumaug Firesmash by the East Gate of Galmair, he will certainly have another task for you."
Description[GERMAN][12] = "Besuche das Hemp Necktie Inn, den Königinnenpalast in Cadomyr und die Kammer des Erzmagiers in Runewick."
Description[ENGLISH][12] = "Go to the Hemp Necktie Inn, the Queen's palace in Cadomyr, and the Archmage's chamber in Runewick."
Description[GERMAN][13] = "Kehre zu Boumaug Firesmash zurück."
Description[ENGLISH][13] = "Return to Boumaug Firesmash."
Description[GERMAN][14] = "Gehe zu Boumaug Firesmash am Osttor Galmairs. Er hat bestimmt noch eine weitere Aufgabe für Dich."
Description[ENGLISH][14] = "Go back to Boumaug Firesmash by the East Gate of Galmair, he will certainly have another task for you."
Description[GERMAN][15] = "Besorge zwanzig Ballen grauen Stoff und bringe sie zu Boumaug Firesmash. Du kannst sie von einem Händler kaufen oder mit einer Nadel in der Hand aus Wolle auf einem Webstuhl weben, wenn du vor ihm stehst. Du kannst Webstühle in Runewick oder Cadomyr finden."
Description[ENGLISH][15] = "Obtain twenty grey cloth and bring them to Boumaug Firesmash. You can buy them from a merchant or weave wool into cloth by using needle in your hand while standing in front of a loom. You can find a loom in Runewick or Cadomyr."
Description[GERMAN][16] = "Gehe zu Boumaug Firesmash am Osttor Galmairs. Er hat bestimmt noch eine weitere Aufgabe für Dich."
Description[ENGLISH][16] = "Go back to Boumaug Firesmash by the East Gate of Galmair, he will certainly have another task for you."
Description[GERMAN][17] = "Besorge einen Degen sowie eine Flasche Elfenwein und bring sie zu Boumaug Firesmash. Du kannst sie von einem Händler kaufen oder als Schmied und ein Brauer elber herstellen. Um einen Degen zu schmieden nutze einen Hammer am Amboss. Eine Flasche Elfenwein stellst du her indem du einen Kochlöffel vor einem Weinfass verwendest."
Description[ENGLISH][17] = "Obtain a rapier and a bottle of elven wine and bring them to Boumaug Firesmash. You can buy them from a merchant or produce them as blacksmith and cook respectively. To produce a rapier, use a hammer in your hand while standing in front of an anvil. To produce a bottle of elven wine use a cooking spoon in your hand while standing in front of a brewing barrel."
Description[GERMAN][18] = "Du hast alle Aufgaben von Boumaug Firesmash erledigt."
Description[ENGLISH][18] = "You have fulfilled all the tasks for Boumaug Firesmash."


-- These all need to change.

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {404, 248, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(404, 248, 0), position(368, 255, 0)} -- statues
QuestTarget[2] = {position(404, 248, 0)}
QuestTarget[3] = {position(404, 248, 0)}
QuestTarget[4] = {position(404, 248, 0), position(404, 269, 1), position(385, 333, 0), position(348, 229, 0)} -- notary's office, the Don and the south gate
QuestTarget[5] = {position(404, 248, 0)}
QuestTarget[6] = {position(404, 248, 0)}
QuestTarget[7] = {position(404, 248, 0)}
QuestTarget[8] = {position(404, 248, 0)}
QuestTarget[9] = {position(404, 248, 0), position(418, 187, 0), position(447, 121, 0), position(497, 205, 0), position(628, 270, 0)} --Black hole mine, north harbour, black bridge, and Lake of life area
QuestTarget[10] = {position(404, 248, 0)}
QuestTarget[11] = {position(404, 248, 0)}
QuestTarget[12] = {position(404, 248, 0), position(696, 314, 0), position(122, 530, 0), position(995, 816, 0)} -- Hanfschlinge,Cadomyr,Runewick
QuestTarget[13] = {position(404, 248, 0)}
QuestTarget[14] = {position(404, 248, 0)}
QuestTarget[15] = {position(404, 248, 0), position(952, 835, 0), position(953, 815, 0), position(113, 611, 0), position(141, 575, 0)} --händler,werkbank
QuestTarget[16] = {position(404, 248, 0)}
QuestTarget[17] = {position(404, 248, 0), position(120, 599, 0), position(273, 275, 0), position(378, 311, -6)} --händler
QuestTarget[18] = {position(404, 248, 0)}


-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 18


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
