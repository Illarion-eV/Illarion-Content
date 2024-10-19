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
Description[GERMAN][1] = "Der umherziehende Magier Terry Ogg hat dich gebeten, dich mit dem Raumknoten des Teleporters des Gasthauses 'Hemp Necktie' abzustimmen. Verwende dazu deinen Zauberstab und wähle vor Ort die Option 'Mit Ort abstimmen'. Bist du nicht am richtigen Ort, wirst du stattdessen zum nächstgelegenen Raumknoten geleitet, mit dem du dich abstimmen kannst. Du kannst auch den Zauberspruch 'Locus Memento' laut aussprechen." -- ChatGPT GERMAN TRANSLATION check needed
Description[ENGLISH][1] = "The wandering mage Terry Ogg has requested that you attune yourself to the spatial node belonging to the Hemp Necktie Inn teleporter. To do this use your wand and select 'Attune to Location' once at the location. If you're not at the location, this will instead direct you to the nearest spatial node you can attune to. You can also speak the incantation aloud 'Locus Memento'."
Description[GERMAN][2] = "Kehrt zu Terry Ogg auf der magischen Insel in Troll's Haven zurück."
Description[ENGLISH][2] = "Return to Terry Ogg at the magic island in Troll's Haven."
Description[GERMAN][3] = "Der umherziehende Magier Terry Ogg hat dich gebeten, ihm zu zeigen, dass du erfolgreich an deinen neu abgestimmten Ort teleportieren kannst. Dafür gibt es zwei Optionen: Du kannst deinen Zauberstab verwenden, Raum-Magie auswählen, Teleportation auswählen und dann den gewünschten Ort auswählen; oder sprich den Zauberspruch 'Locus Itinerantur' laut aus, während du vor ihm stehst." -- ChatGPT GERMAN TRANSLATION check needed
Description[ENGLISH][3] = "The wandering mage Terry Ogg has requested that you show him that you can successfully teleport to your newly attuned location. To do this, there are two options. You can use your wand, select spatial magic, select teleportation and then select the wanted location; or speak the incantation aloud 'Locus Itinerantur' while in front of him."
Description[GERMAN][4] = "Kehrt zu Terry Ogg auf der magischen Insel in Troll's Haven zurück."
Description[ENGLISH][4] = "Return to Terry Ogg at the magic island in Troll's Haven."
Description[GERMAN][5] = "Nachdem du ihm gezeigt hast, dass du teleportieren kannst, möchte der umherziehende Magier Terry Ogg nun auch sehen, dass du ein Portal zu deinem neu abgestimmten Ort erschaffen kannst. Dafür kannst du entweder wie zuvor vorgehen, aber diesmal 'Portal erschaffen' auswählen und dann den gewünschten Ort bestimmen; oder sprich den Zauberspruch 'Locus Ianua' laut aus, während du vor ihm stehst." -- ChatGPT GERMAN TRANSLATION check needed
Description[ENGLISH][5] = "Now that you've shown him you can teleport, the wandering mage Terry Ogg also wants you to show that you can create a portal to your newly attuned location. To do this, either do the same as before but select create portal and then select the wanted location; or speak the incantation aloud 'Locus Ianua' while in front of him."
Description[GERMAN][6] = "Kehrt zu Terry Ogg auf der magischen Insel in Troll's Haven zurück."
Description[ENGLISH][6] = "Return to Terry Ogg at the magic island in Troll's Haven."
Description[GERMAN][7] = "Schließlich, nachdem du dem umherziehenden Magier gezeigt hast, dass du sowohl teleportieren als auch Portale erschaffen kannst, besteht deine letzte Aufgabe darin, ein Portalbuch zu erstellen, um es ihm zu zeigen. Dafür benötigst du ein leeres Portalbuch, das du bei einem Schneider erhältst, Tinte von einem Färber und eine Feder von einem Tischler. Sobald du alle drei Gegenstände hast, kannst du am nahegelegenen Zaubertisch dein Portalbuch erstellen. Außerdem kannst du, wenn du möchtest, die Qualität des fertigen Portalbuchs überprüfen, indem du es in deinen Gürtel legst, deinen Zauberstab benutzt und 'Portalbuch bewerten' auswählst." -- ChatGPT GERMAN TRANSLATION check needed
Description[ENGLISH][7] = "Finally, after having shown the wandering mage that you can both teleport and create portals, your final task is to create a portal book to show him. For this, you'll need an empty portal book which can be obtained from a tailor, ink which can be obtained from a dye-maker and a quill which can be obtained from a carpenter. Once you have all three, you can go to the nearby magic desk to create your portal book. Additonally, if you want to, you can check the quality of the resulting portal book by placing it in your belt, using your wand and selecting 'Portal Book Evaluation'."
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
