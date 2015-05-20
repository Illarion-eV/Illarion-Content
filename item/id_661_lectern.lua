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
local lookat = require("base.lookat")
local ranklist = require("base.ranklist")

-- UPDATE items SET itm_script='item.id_661_lectern' WHERE itm_id IN (661, 660);

local M = {}

local function isRanklistLocation(pos)
	return pos == position(138, 551, 0) or pos == position(358, 217, 0) or pos == position(960, 791, 0)
end

function M.UseItem(User, SourceItem)
	if isRanklistLocation(SourceItem.pos) then
		ranklist.getRanklist(User, "explorerRanklist", true)
	end
    
    if (User:getQuestProgress(539) == 5) and SourceItem.pos == position(613, 188, -3) then --OK, the player does the quest 3
        User:inform(
        "Das Rezept ist für Kaefitys absolute Lebensauslöschungsbombe, aber die meisten können den Kauderwelsch nicht entziffern. Die wenigen, die es lesen können, werden feststellen, dass an entscheidenden Stellen wichtige Zutaten fehlen.",
        "The recipe is for Kaefity's Total Life Annihilator Bomb, but most cannot read the gibberish. The few who can read it will find that there are important ingredients missing in key places.")
        User:setQuestProgress(539, 6)
        return
    elseif SourceItem.pos == position(613, 188, -3) then
        User:inform(
        "Das Rezept ist für Kaefitys absolute Lebensauslöschungsbombe, aber die meisten können den Kauderwelsch nicht entziffern. Die wenigen, die es lesen können, werden feststellen, dass an entscheidenden Stellen wichtige Zutaten fehlen.",
        "The recipe is for Kaefity's Total Life Annihilator Bomb, but most cannot read the gibberish. The few who can read it will find that there are important ingredients missing in key places.")
        return
    end
end

function M.LookAtItem(User, item)
	if isRanklistLocation(item.pos) then
		lookat.SetSpecialDescription(item, "Rangliste der Entdeckergilde.", "Ranklist of the explorer guild")
	end
	return lookat.GenerateLookAt(User, item, lookat.NONE)
end

return M

