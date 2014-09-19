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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (313, 'quest.nimbur_goldhand_313_noobia');

local common = require("base.common")
local M = {}

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Einführung - Handwerk"
Title[ENGLISH] = "Tutorial - Crafting"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "An dieser Station wird dir beigebracht, wie man einem Handwerk nachgeht. Nimbur Goldhand ist ein sehr begabter Artisan, der die nötigen Kenntnisse vermittelt, die du benötigst, um die Laufbahn des Handwerkers einzuschlagen.\n\nHandwerke erfordern ebenso wie das Sammeln von Ressourcen ein Handwerkzeug und einen Arbeitsplatz sowie die nötigen Rohstoffe."
Description[ENGLISH][1] = "At this station, you will learn how to craft items. Nimbur Goldhand is a very skilled artisan who can teach you the necessary steps to get started with a crafting profession.\n\nCrafting requires a hand tool, just like gathering, and a static tool. You also need the necessary resources."
Description[GERMAN][2] = "Arr, richtig. Hör zu! Ich werd' dir alles, was ich weiß, über's Schmieden beibringen. Hier, nimm diesen Hammer und diesen Barren und geh rein und komm nicht eher raus, bis du fünfzehn Nägel in deiner Tasche hast! Um zu schmieden, stell dich vor einen Amboss und benutze den in der Hand gehaltenen Hammer. Wähle dann ein Produkt aus dem Menü, um es zu fertigen."
Description[ENGLISH][2] = "Arr... right. Listen up! I tell ye everything about blacksmithing ye need to know. Here, take this hammer and these ingots. Step inside and don't dare come out without fifteen pins in yer bag! Blacksmithing requires you to stand in front of an anvil and use a hammer, which must be held in your hands. Then, choose the pins from the menu to start working on it."
Description[GERMAN][3] = "Du hast die Einführung über das Handwerk abgeschlossen."
Description[ENGLISH][3] = "You finished the tutorial on crafting."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {42, 83, 100}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[2] = {position(47, 81, 100)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 3


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
