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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (331, 'quest.nimbur_goldhand_331_noobia');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Tutorial II - Sammeln, Herstellen und Kämpfen"
Title[ENGLISH] = "Tutorial II - Gathering, Crafting and Fighting"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Pflücke sechs Äpfel in Obstgarten. Um Äpfel zu pflücken, musst du vor einem Apfelbaum stehen und ihn durch Doppelklick benutzen oder drücke die Leertaste. \n\nKehre mit den Äpfeln, die du gesammelt hast, zu Nimbur Goldbrew zurück."
Description[ENGLISH][1] = "Pick six apples from the orchard. To collect some apples stand in front of an apple tree and double click with your mouse or press the space bar. \n\nReturn to Nimbur Goldbrew with the apples you have collected."
Description[GERMAN][2] = "Stell dich vor das Weinfass zwischen den beiden Tischen. Du musst den Kochlöffel in einem der Handslots deines Inventars ausrüsten. Doppelklicke den Kochlöffel oder das Fass, um das Handwerksmenü zum Brauen zu öffnen. \n\nÖffne die Kategorie 'Leichter Alkohol', indem du den Pfeil davor anklickst, und klicke auf 'Flasche voll Cider', um sie auszuwählen. Für diese Bespiel brauchst du nur eine Flasche, aber du kannst die Anzahl entweder durch manuelle Eingabe oder durch klicken auf '+' oder '-' anpassen. Starte die Produktion, indem du auf ?Herstellen? klickst. Ein Fortschrittsbalken zeigt dir an, wie lange es dauert, bis die Flasche fertig ist und am Ende erscheint die volle Flasche in deinem Inventar. \n\nGehe mit der Flasche mit Cider, die du gebraut hast zurück zu Nimbur Goldbrew."
Description[ENGLISH][2] = "Stand in front of the wine barrel set between the two tables. You will need to equip the cooking spoon in one of the hand slots of your inventory. Double click on the spoon or barrel to bring up the crafting menu for brewing. \n\nOpen the 'Soft Liquors' category by clicking the prefixing arrow head and click 'Bottle of Cider' to select it. In this instance only one bottle of cider is required, but you can adjust the number of items to be produced using the '-' and '+' buttons. Start production by clicking the 'Produce' button. A progress bar will indicate how long until production is complete and your finished bottle of cider will appear in your bag once complete. \n\nReturn to Nimbur Goldbrew with the bottle of cider you have brewed."
Description[GERMAN][3] = "Du hast die Tutorial-Quests abgeschlossen. \n\nAllerdings kann Viola Baywillow dir viel mehr über Illarion und die Reiche erzählen."
Description[ENGLISH][3] = "You have completed the tutorial quests. \n\nViola Baywillow can tell you lots more about Illarion and the realms though."

-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {710, 297, 0}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}
QuestTarget[1] = {position(716, 292, 0), position(710, 297, 0)}
QuestTarget[2] = {position(717, 301, 0), position(710, 297, 0)}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 3


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
return M
