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
require("base.common")
require("base.lookat")

-- UPDATE items SET itm_script='item.id_623_rockface' WHERE itm_id IN (623);

module("item.id_623_rockface", package.seeall)

function UseItem(User, SourceItem, ltstate)

  -- entrance to the cave
  local pos = position(894, 627, 0);
  if (SourceItem.pos ~= pos) then
		return
  end

  -- open on keyword
  local spokenText = User.lastSpokenText;
  if (string.find(spokenText, "[Ff][Oo][Xx]") ~= nil or
	  string.find(spokenText, "[Ff][Uu][Cc][Hh][Ss]") ~= nil) then

	world:erase(SourceItem, 1);

	base.common.InformNLS(User,
      "Die Steinwand verschwindet als du sie berührst!",
      "The rock wall disappears as you touch it!");


    local Characters = world:getPlayersInRangeOf(pos, 5);
    for i, Char in pairs(Characters) do
	  if (User.id ~= Char.id) then
        base.common.InformNLS(Char,
	    "Eine Steinwand verschwindet einfach.",
	    "A rock wall just disappears.");
	  end
    end

  else
	base.common.InformNLS(User,
      "Nichts passiert als du die Steinwand berührst.",
      "Nothing happens as you touch the rock wall.");
  end
end

function LookAtItem(User, Item)
  if (Item.pos == position(894, 627, 0)) then
		base.lookat.SetSpecialDescription(Item, "Eine merkwürdige Steinwand.", "A peculiar rock wall.");
  end
  return base.lookat.GenerateLookAt(User, Item, base.lookat.NONE)
end
