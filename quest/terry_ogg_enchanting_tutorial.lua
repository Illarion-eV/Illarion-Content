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

local GERMAN = Player.german
local ENGLISH = Player.english

local Title = {}
Title[GERMAN] = "GERMAN TRANSLATION"
Title[ENGLISH] = "Enchanting Tutorial"

local Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "GERMAN TRANSLATION"
Description[ENGLISH][1] = "Terry Ogg has agreed to introduce you to the workings of enchanting jewellery through the means of glyph forging. He has told you to first have a look at a glyph ritual shrine, used in the forging of glyphs, then return to him in Troll's Haven. You can either use your wand to create your own shrine, or use the one next to Terry."
Description[GERMAN][2] = "GERMAN TRANSLATION"
Description[ENGLISH][2] = "You've inspected a glyph ritual shrine and can return to Terry Ogg in Troll's Haven for the next task."
Description[GERMAN][3] = "GERMAN TRANSLATION"
Description[ENGLISH][3] = "Terry Ogg has handed you the candles and candlesticks required to prepare the glyph ritual shrine for use. Go ahead and use your wand at a glyph ritual shrine to do so, then return to Terry Ogg in Troll's Haven."
Description[GERMAN][4] = "GERMAN TRANSLATION"
Description[ENGLISH][4] = "You've set up the candle ritual required to do enchanting work at a glyph ritual shrine. Return to Terry Ogg in Troll's Haven for your next task."
Description[GERMAN][5] = "GERMAN TRANSLATION"
Description[ENGLISH][5] = "Terry Ogg has handed you a full set of the glyph shards required to craft the glyph Anemo. If you've lost the glyph shards since then, any other complete set that you are experienced enough at enchanting to craft will work. Go use your wand at the glyph ritual shrine you prepared the candle ritual at in order to combine the shards into the corresponding glyph, then return to Terry Ogg in Troll's Haven."
Description[GERMAN][6] = "GERMAN TRANSLATION"
Description[ENGLISH][6] = "You successfully created the glyph Anemo. Return to Terry Ogg in Troll's Haven for your next task."
Description[GERMAN][7] = "GERMAN TRANSLATION"
Description[ENGLISH][7] = "Terry Ogg in Troll's Haven has told you to inspect the newly created glyph using your wand. If you've lost the glyph since then, any other glyph will do. Once you've done so, return to him."
Description[GERMAN][8] = "GERMAN TRANSLATION"
Description[ENGLISH][8] = "You successfully inspected the glyph. Return to Terry Ogg in Troll's Haven for your next task."
Description[GERMAN][9] = "GERMAN TRANSLATION"
Description[ENGLISH][9] = "Upon your inspection of the glyph, you learned what jewellery it can be matched with. Terry Ogg handed you a copper amethyst ring that can have the glyph Anemo socketed into it. Socket any glyph into its corresponding jewellery to complete his task and return to him in Troll's haven."
Description[GERMAN][10] = "GERMAN TRANSLATION"
Description[ENGLISH][10] = "You successfully socketed a piece of jewellery with a glyph. Return to Terry Ogg in Troll's Haven for your next task."
Description[GERMAN][11] = "GERMAN TRANSLATION"
Description[ENGLISH][11] = "Terry Ogg in Troll's Haven has tasked you with breaking out the glyph you just socketed into a piece of jewellery, which can be done at a glyph ritual shrine that has been set up with a candle ritual. Once done, report back to Terry Ogg."
Description[GERMAN][12] = "GERMAN TRANSLATION"
Description[ENGLISH][12] = "You've successfully broken a glyph out of a piece of jewellery. Return to Terry Ogg in Troll's Haven."

local FINAL_QUEST_STATUS = 13

function M.QuestTitle(user)
    return common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function M.QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return common.GetNLS(user, german, english)
end

function M.QuestStart()
    return {656, 316, 0}
end

function M.QuestTargets(user, status)
    return position(656, 316, 0)
end

function M.QuestFinalStatus()
    return FINAL_QUEST_STATUS
end

function M.QuestAvailability(user, status)
    if status == 0 and user:getQuestProgress(37) == 1 then --Only available to mages
        return Player.questAvailable
    else
        return Player.questNotAvailable
    end
end

return M
