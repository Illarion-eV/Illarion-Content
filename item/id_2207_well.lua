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

-- UPDATE items SET itm_script='item.id_2207_well' WHERE itm_id IN (2207);

local common = require("base.common")
local lookat = require("base.lookat")
local climbing = require("content.climbing")

local M = {}

local climeableWellPosition = {}
climeableWellPosition[1] = position(528, 555, 0) -- maze
climeableWellPosition[2] = position(105, 600, 0) -- Cadomyr
climeableWellPosition[7] = position(357, 272, 0) -- Galmair
climeableWellPosition[4] = position(849, 841, 0) -- Runewick

function M.UseItem(User, SourceItem, ltstate)

    if (SourceItem:getData("modifier") == "wishing well") then
        common.InformNLS(User,
            "Vielleicht kann sich einer deiner Wünsche erfüllen, wenn du etwas hineinwirfst?",
            "Maybe one of your wishes come true, if you pitch something in?")
        -- TODO: select dialog for coins
        return
    end

    local climbable = common.isInList(SourceItem.pos, climeableWellPosition)

    local ITEM_ID_ROPE = 2760
    if climbable and climbing.hasRope(User) and common.hasItemIdInHand(User, ITEM_ID_ROPE) then
        climbing.climbDown(User)
        return
    end

    local ITEM_ID_BUCKET = 51
    local emptybucket = require("item.id_51_emptybucket")
    if common.hasItemIdInHand(User, ITEM_ID_BUCKET) then
        emptybucket.UseItem(User, common.getItemInHand(User, ITEM_ID_BUCKET), ltstate)
        return
    end

    local ITEM_ID_BOTTLE = 2498
    local emptybottle = require("item.id_2498_empty_bottle")
    if common.hasItemIdInHand(User, ITEM_ID_BOTTLE) then
        emptybottle.UseItem(User, common.getItemInHand(User, ITEM_ID_BOTTLE), ltstate)
        return
    end

    if climbable then
        common.HighInformNLS(User,
            "Du kannst hier einen Eimer oder eine große leere Flasche in deine Hand nehmen und mit Wasser füllen. Oder du kletterst mit einem Seil hier hinab.",
            "Take an empty bucket or a large empty bottle into hand to fill it with water. Or you use a rope to climb down here.")
    else
        common.HighInformNLS(User,
            "Du kannst hier einen Eimer oder eine große leere Flasche in deine Hand nehmen und mit Wasser füllen.",
            "Take an empty bucket or a large empty bottle into hand to fill it with water.")
    end


end

function M.LookAtItem(User, Item)

  local lookAt = lookat.GenerateLookAt(User, Item)

  if ( Item:getData("modifier") == "wishing well" ) then
    lookAt.name = common.GetNLS(User, "Wunschbrunnen", "wishing well")
  elseif Item.pos == climeableWellPosition[1] then
    lookAt.name = common.GetNLS(User, "Ausgetrockneter Brunnen", "Dry well")
  elseif Item.pos == climeableWellPosition[2] then
    lookAt.name = common.GetNLS(User, "Zisterne von Cadomyr", "Cadomyr Cavern")
  elseif Item.pos == climeableWellPosition[3] then
    lookAt.name = common.GetNLS(User, "Zisterne von Galmair", "Galmair Cavern")
  elseif Item.pos == climeableWellPosition[4] then
    lookAt.name = common.GetNLS(User, "Zisterne von Runewick", "Runewick Cavern")
  end

  return lookAt
end

return M
