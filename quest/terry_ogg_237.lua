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
local runes = require("magic.arcane.runes")

local M = {}

local GERMAN = Player.german
local ENGLISH = Player.english

-- Insert the quest title here, in both languages
local Title = {}
Title[GERMAN] = "Runenmagie"
Title[ENGLISH] = "Rune Magic"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Der wandernde Magier Terry Ogg hat dich mit der Aufgabe betraut, die Rune RA zu finden und sie zu lernen. Einen Hinweis darauf, wo sie zu finden ist, findest du in dem Buch auf dem Tisch neben ihm auf der magischen Insel in Troll's Haven. Sei gewarnt, dass du nur alle zwei Wochen zwei Runen lernen kannst. Wenn du also zwei andere Runen lernst, musst du zwei Wochen warten, bevor du dieses Tutorial abschließen kannst."
Description[ENGLISH][1] = "The wandering mage Terry Ogg has sent you on the task to find the rune RA and learn it. There's a hint as to its location in the book on the table next to him on the magic island in Troll's Haven. Beware that you may only learn two runes every other week, so if you go learn two other runes you will have to wait two weeks before being able to complete this tutorial."
Description[GERMAN][2] = "Kehrt zu Terry Ogg auf der magischen Insel in Troll's Haven zurück."
Description[ENGLISH][2] = "Return to Terry Ogg at the magic island in Troll's Haven for your next task."
Description[GERMAN][3] = "Der wandernde Magier Terry Ogg hat dir die Aufgabe gegeben, dein eigenes Grimoire zu beschaffen. Du kannst eines direkt bei ihm kaufen oder ein leeres Buch deiner Wahl von einem Schneider erwerben. Letzteres ermöglicht es dir auch, ein Grimoire in deiner Wunschfarbe zu besitzen."
Description[ENGLISH][3] = "The wandering mage Terry Ogg has tasked you with obtaining your very own Grimoire. You can purchase one from him directly, or obtain a blank book of your choice from a tailor. Choosing the latter would also allow you to have a grimoire of your own colour of choice."
Description[GERMAN][4] = "Der wandernde Magier Terry Ogg hat dir gesagt, du sollst deine neu erlernte Rune als Zauberspruch in deinem Grimoire schreiben. Gehe dazu mit einem Grimoire und einer Schreibfeder ausgerüstet zu einem magischen Schreibtisch. Schreibfedern werden von Half-hung Bryan im Hemp Necktie Inn verkauft, können aber auch von Schreiner sie auch herstellen können."
Description[ENGLISH][4] = "The wandering mage Terry Ogg has told you to store your newly learned rune as a spell in your grimoire. Go to a magic desk while equipped with a grimoire and quill to do so. Quills are sold by Half-hung Bryan by the Hemp Necktie Inn, while carpenters can also craft them."
Description[GERMAN][5] = "Kehrt zu Terry Ogg auf der magischen Insel in Troll's Haven zurück."
Description[ENGLISH][5] = "Return to Terry Ogg at the magic island in Troll's Haven for your next task."
Description[GERMAN][6] = "Der wandernde Magier Terry Ogg möchte sehen wie du den Zauberspruch RA sprichst. Dazu musst du entweder die Rune 'RA' sprechen oder dein Grimoire benutzen, um den neu gelernten Zauber auf deinen Zauberstab einzustimmen, und ihn dann mit einem Doppelklick anwenden."
Description[ENGLISH][6] = "The wandering mage Terry Ogg wants you to see you cast the spell RA. This can be done by either speaking the rune 'RA' or using your grimoire to attune your newly stored spell to your wand, then double clicking the wand to use it."
Description[GERMAN][7] = "Kehrt zu Terry Ogg auf der magischen Insel in Troll's Haven zurück."
Description[ENGLISH][7] = "Return to Terry Ogg at the magic island in Troll's Haven."

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

    if status == 1 and runes.checkIfLearnedRune(user, false, 4, "isQuest") then
        -- The user is on the step to learn RA, but has already learned it independently
        german = "Der wandernde Magier Terry Ogg hat dich auf die Aufgabe geschickt, die Rune RA zu lernen, aber er ahnt nicht, dass du sie bereits kennst! Nimm dir etwas Zeit, um das geheimnisvolle Buch auf dem Tisch neben ihm zu studieren, und er wird sicher seinen Irrtum erkennen."
        english = "The wandering mage Terry Ogg has sent you on the task to learn the rune RA, but little does he know you already know it! Take some time to peruse the mysterious book on the table next to him, and he will surely come to realise his blunder."
    end

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
