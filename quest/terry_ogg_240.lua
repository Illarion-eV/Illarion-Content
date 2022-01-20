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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (525, 'quest.Akaltuts_Chamber_525_dungeon');

local common = require("base.common")
local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Raummagie"
Title[ENGLISH] = "Spatial Magic"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Der wandernde Magier Terry Ogg hat dich gebeten, dich auf den Raumknoten des nahe gelegenen Teleporters einzustellen. Benutze dazu dein Grimoire und stimme deinen Zauberstab auf Raummagie ein. Benutze dann deinen Zauberstab und wähle 'Auf den Ort abstimmen', sobald du dich an dem Ort befindest. Wenn du dich nicht an dem Ort befindest, wirst du stattdessen zum nÃ¤chstgelegenen Raumknoten geleitet, auf den du dich abstimmen kannst."
Description[ENGLISH][1] = "The wandering mage Terry Ogg has requested that you attune yourself to the nearby teleporter's spatial node. To do this, use your grimoire and attune your wand to spatial magic. Then use your wand and select 'Attune to Location' once at the location. If you're not at the location, this will instead direct you to the nearest spatial node you can attune to."
Description[GERMAN][2] = "Kehrt zu Terry Ogg auf der magischen Insel in Troll's Haven zurück."
Description[ENGLISH][2] = "Return to Terry Ogg at the magic island in Troll's Haven."
Description[GERMAN][3] = "Der wandernde Magier Terry Ogg möchte, dass du ihm zeigst, dass du dich erfolgreich zu deinem neu eingestellten Ort teleportieren kannst. Dazu musst du entweder deinen Zauberstab auf Raummagie einstimmen, Teleportation wählen und dann den gewünschten Ort auswählen oder vor ihm laut die Beschwörungsformel 'Locus Itinerantur' sprechen."
Description[ENGLISH][3] = "The wandering mage Terry Ogg has requested that you show him that you can successfully teleport to your newly attuned location. To do this, either attune you wand to spatial magic, select teleportation and then select the wanted location; or speak the incantation aloud 'Locus Itinerantur' while in front of him."
Description[GERMAN][4] = "Kehrt zu Terry Ogg auf der magischen Insel in Troll's Haven zurück."
Description[ENGLISH][4] = "Return to Terry Ogg at the magic island in Troll's Haven."
Description[GERMAN][5] = "Nachdem du ihm nun gezeigt hast, dass du dich teleportieren kannst, möchte der wandernde Magier Terry Ogg, dass du ihm auch zeigst, dass du ein Portal zu deinem neu eingestimmten Ort erstellen kannst. Dazu musst du entweder deinen Zauberstab auf Raummagie einstimmen, 'Portal erschaffen' und dann den gewünschten Ort auswählen oder du sprichst die Beschwörungsformel 'Locus Ianua' laut aus, während du vor ihm stehst."
Description[ENGLISH][5] = "Now that you've shown him you can teleport, the wandering mage Terry Ogg also wants you to show that you can create a portal to your newly attuned location. To do this, either attune you wand to spatial magic, select create portal and then select the wanted location; or speak the incantation aloud 'Locus Ianua' while in front of him."
Description[GERMAN][6] = "Kehrt zu Terry Ogg auf der magischen Insel in Troll's Haven zurück."
Description[ENGLISH][6] = "Return to Terry Ogg at the magic island in Troll's Haven."
Description[GERMAN][7] = "Schließlich, nachdem du dem wandernden Magier gezeigt hast, dass du sowohl teleportieren als auch Portale erschaffen kannst, besteht deine letzte Aufgabe darin, ein Portalbuch zu erstellen. Dafür brauchst du Pergament, Tinte und eine Schreibfeder. Sobald du alle drei Dinge hast, kannst du zum nahe gelegenen magischen Schreibtisch gehen um dein Portalbuch zu erstellen. Du kannst sie vom Half Hung Bryan im Hemp Necktie Gasthaus kaufen oder von Schneidern und Zimmerleuten herstellen lassen. Außerdem kannst du, wenn du willst, die Qualität deines Portalbuchs überprüfen. Dazu halte es in der einen Hand und das Grimoire in der anderen. Dann benutze das Grimoire und wähle 'Portalbuchbewertung'."
Description[ENGLISH][7] = "Finally, after having shown the wandering mage that you can both teleport and create portals, your final task is to create a portal book to show him. For this, you'll need parchments, ink and a quill. Once you have all three, which can be obtained from half-hung Bryan by the Hemp Necktie Inn who sells stationery, or crafted by tailors and carpenters, you can go to the nearby magic desk to create your portal book. Additonally, if you want to, you can check the quality of the resulting portal book by holding it in one hand a grimoire in the other, then using the grimoire and selecting 'Portal Book Evaluation'."
-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {position(656, 316, 0)}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 8

function M.QuestTitle(user)

    local german = Title[GERMAN] or ""
    local english = Title[ENGLISH] or ""
    return common.GetNLS(user, german, english)

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
    return Player.questAvailable
end

return M
