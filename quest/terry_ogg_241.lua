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
Title[GERMAN] = "Glyphenmagie"
Title[ENGLISH] = "Glyph Magic"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Der wandernde Magier Terry Ogg hat dich mit der Vorbereitung eines Glyphenrituals beauftragt. Dazu brauchst du Kerzen, Kerzenständer, deinen Zauberstab und dein Grimoire. Außerdem solltest du für später einige einfache Amethystschmuckstücke und Glyphensplitter vorbereiten. Um das Ritual vorzubereiten, stimme deinen Zauberstab über das Grimoire auf das Glyphenschmieden ein. Benutze dann den Zauberstab und wähle 'Glyphenritualplatz finden', um zum nächstgelegenen Glyphenritualplatz geführt zu werden. Am Glyphenritual-Schrein angekommen, kannst du mit der Vorbereitung des Rituals beginnen, indem du 'Glyphenritual vorbereiten' wählst."
Description[ENGLISH][1] = "The wandering mage Terry Ogg has tasked you with preparing a glyph ritual. For this you'll need candles, candlesticks, your wand and your grimoire. Furthermore, it might be wise to prepare some basic amethyst jewellery and glyph shards for further down the line. To prepare the ritual, attune your wand to glyph forging via the grimoire. Then use the wand and select 'find a glyph ritual place' to be guided to the closest glyph ritual location. Finally, when next to the glyph ritual shrine, you can start preparing the ritual by selecting 'prepare glyph ritual'."
Description[GERMAN][2] = "Kehrt zu Terry Ogg auf der magischen Insel in Troll's Haven zurück."
Description[ENGLISH][2] = "Return to Terry Ogg at the magic island in Troll's Haven."
Description[GERMAN][3] = "Nachdem du nun dein Glyphenritual vorbereitet hast, ist es an der Zeit, die Glyphen zu schmieden. Terry Ogg hat dich gebeten, ihm ein Amethystamulett mit Glyphen zu schmieden. Dazu brauchst du ein Amethystamulett und die erforderlichen Glyphensplitter. Um zu sehen, welche Glyphsplitter du brauchst, kannst du dich dem Ritualplatz nähern, deinen Zauberstab benutzen und dann 'Glyphsplitter prüfen' und anschließend 'Amethyst-Amulette' auswählen. Wenn du alles hast, was du brauchst, gehst du einfach zum vorbereiteten Ritualplatz, benutzt deinen Zauberstab und wählst 'Schmuck mit Glyphen verzaubern'."
Description[ENGLISH][3] = "Now that you've prepared your glyph ritual, it's time to actually glyph forge. Terry Ogg has requested that you forge him a glyphed amethyst amulet. For this, you'll need an amethyst amulet along with the pre-requisite glyph shards. To see what glyph shards you'll need, you can approach the ritual place and use your wand, then select 'Check your glyph shards' followed by 'amethyst amulets'. Once you have all you need, just approach the prepared ritual location, use your wand and select 'glyph some jewellery'."
Description[GERMAN][4] = "Kehrt zu Terry Ogg auf der magischen Insel in Troll's Haven zurück."
Description[ENGLISH][4] = "Return to Terry Ogg at the magic island in Troll's Haven."
Description[GERMAN][5] = "Für deine letzte Aufgabe möchte der wandernde Magier, dass du lernst, wie man Glyphen aus Schmuckstücken herausbricht. Haltet dazu das Amulett, das du gerade verzaubert hast, an eurem Gürtel bereit, benutze deinen Zauberstab an der Ritualstelle und wähle 'Eine Glyphe aus einem Schmuckstück herausbrechen'. Du wirst wahrscheinlich etwas üben müssen, da du mindestens Stufe 20 in der Verzauberung von Juwelen haben musst, um die Glyphen herauszubrechen."
Description[ENGLISH][5] = "For your final task, the wandering mage wants you to learn how to break glyphs out of jewellery. To do so, have the amulet you just glyphed ready at your belt then use your wand at the ritual place and select 'Break a glyph out of some jewellery'. You'll likely have to practice some, though, as you must be at least level 20 in enchanting of jewels to break the glyphs out."
Description[GERMAN][6] = "Kehrt zu Terry Ogg auf der magischen Insel in Troll's Haven zurück."
Description[ENGLISH][6] = "Return to Terry Ogg at the magic island in Troll's Haven."
-- Insert the position of the quest start here (probably the position of an NPC or item)
local Start = {position(656, 316, 0)}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
local QuestTarget = {}

-- Insert the quest status which is reached at the end of the quest
local FINAL_QUEST_STATUS = 7

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
