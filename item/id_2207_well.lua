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

local wellPosition1 = position(528, 555, 0) -- maze
local wellPosition2 = position(105, 600, 0) -- Cadomyr
local wellPosition3 = position(357, 272, 0) -- Galmair
local wellPosition4 = position(849, 841, 0) -- Runewick

function M.UseItem(User, SourceItem, ltstate)

    if (SourceItem:getData("modifier") == "wishing well") then
        common.InformNLS(User,
            "Vielleicht kann sich einer deiner Wünsche erfüllen, wenn du etwas hineinwirfst?",
            "Maybe one of your wishes come true, if you pitch something in?")
        -- TODO: select dialog for coins
        return
    end

    local climbable = false

    if SourceItem.pos == wellPosition1 then
        climbable = true
    elseif SourceItem.pos == wellPosition2 then
        climbable = true
    elseif SourceItem.pos == wellPosition3 then
        climbable = true
    elseif SourceItem.pos == wellPosition4 then
        climbable = true
    end

    if climbable then
        common.HighInformNLS(User,
            "Du brauchst ein Seil um hier hinab zu klettern.",
            "You need a rope to climb down here.")
        if content.climbing.hasRope(User) then
            content.climbing.climbDown(User)
        end
    end
  -- TODO: select diaolg water scooping + climbing

end

function M.LookAtItem(User, Item)

  local lookAt = lookat.GenerateLookAt(User, Item)

  if ( Item:getData("modifier") == "wishing well" ) then
    lookAt.name = common.GetNLS(User, "Wunschbrunnen", "wishing well")
  elseif Item.pos == wellPosition1 then
    lookAt.name = common.GetNLS(User, "Ausgetrockneter Brunnen", "Dry well")
  elseif Item.pos == wellPosition2 then
    lookAt.name = common.GetNLS(User, "Zisterne von Cadomyr", "Cadomyr Cavern")
  elseif Item.pos == wellPosition3 then
    lookAt.name = common.GetNLS(User, "Zisterne von Galmair", "Galmair Cavern")
  elseif Item.pos == wellPosition4 then
    lookAt.name = common.GetNLS(User, "Zisterne von Runewick", "Runewick Cavern")
  end

  return lookAt
end



return M

