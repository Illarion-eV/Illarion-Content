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

function M.MoveToField(Character)
    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(337) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(337, 1) --remember that the triggerfield was visited
        local callbackNewbie = function(informNewbie)
            Character:inform("Von den abgewetzten Bodendielen steigt ein kräftiger Hauch von gesoffenem Ale auf, gemildert von treibenden Aromen von Braten und exotischen Gewürzen. Der geschäftige Barkeeper bedient Reisende und Händler, die an reichlich rustikalen Tischen eine Pause einlegen, schroff.","A strong whiff of sloshed ale rises from scuffed boards, tempered by drifting aromas of roasting meat and exotic spices. The bustling barkeep gruffly serves travellers and merchants taking respite at abundant rustic tables.")
        end --end callback
        local dialogText = common.GetNLS(Character,
            "Unzählige Wege kreuzen sich am Gasthof zur Hanfschlinge, da Reisende, Händler, Abenteurer und Gesetzlose alle einen Grund für einen Besuch haben. Die Taverne und die Umgebung bieten Gelegenheit, andere Charaktere zu treffen und das Leben außerhalb der Reiche zu erleben. Dieses neutrale Territorium ist frei von den Zwängen der Reichsbeamten und ihrer Gesetze, aber es fehlt auch der Schutz und die Vorteile, die die Städte bieten können. Während einige Gesetzlose aus dem Reich verbannt werden können, können alle den Gasthof zur Hanfschlinge betreten.\n\nViele Quests beginnen in und um diese Taverne. Achte auf geplante GM- oder Spieler-Quests im Illarion Launcher und auf der Website. Zahlreiche statische Quests in ganz Illarion können durch Sprechen mit NPCs ausgelöst werden. Nach dem Start kannst du das Questlog für diese finden, indem du 'Q' drückst oder auf das Schriftrollen-Symbol in der unteren rechten Ecke des Fensters klickst.",
            "Countless paths cross at the Hemp Necktie Inn as travellers, traders, adventurers, and outlaws all have reason to visit. The tavern and surrounds give opportunity to meet other characters and experience life outside the realms. This neutral territory is free of the constraint of realm officials and their laws, but also lacks the same protection and benefits the towns may offer. Whilst some outlaws may be banished from the realms, all are free to enter the Hemp Necktie Inn.\n\nMany quests start in and around the Hemp Necktie Inn. Look out for planned GM or playere quests on the Illarion Launcher and the website. Numerous static quests throughout Illarion can be triggered by speaking to NPCs. Once started, the quest log for these can be found by pressing 'Q' or clicking on the scroll icon in the bottom right corner of the window.")
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

return M
