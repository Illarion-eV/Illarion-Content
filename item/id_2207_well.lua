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

-- UPDATE common SET com_script='item.id_2207_well' WHERE com_itemid IN (2207);

require("base.common")
require("base.lookat")

module("item.id_2207_well", package.seeall)

wellPosition1 = position(528, 555, 0);

function UseItem(User, SourceItem, ltstate)

  if (SourceItem:getData("modifier") == "wishing well") then
    base.common.InformNLS(User,
      "Vielleicht kann sich einer deiner Wünsche erfüllen, wenn du etwas hineinwirfst?",
      "Maybe one of your wishes come true, if you pitch something in?");
  elseif SourceItem.pos == wellPosition1 then
    base.common.InformNLS(User,
      "Vielleicht kannst du mit einem Seil hinabklettern?",
      "Maybe you can climb down with a rope?");
  end

end

function LookAtItem(User, Item)

  local lookAt = base.lookat.GenerateLookAt(User, Item);

  if ( Item:getData("modifier") == "wishing well" ) then
    lookAt.name = base.common.GetNLS(User, "Wunschbrunnen", "wishing well");
  elseif Item.pos == wellPosition1 then
    lookAt.name = base.common.GetNLS(User, "Ausgetrockneter Brunnen", "Dry well");
  end

  world:itemInform(User, Item, lookAt);
end


