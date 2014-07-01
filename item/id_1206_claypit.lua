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

-- UPDATE common SET com_script='item.id_1206_claypit' WHERE com_itemid=1206;

require("base.common")
require("base.lookat")
require("content.gatheringcraft.claydigging")

module("item.id_1206_claypit", package.seeall)

holePosition = position(854, 414, 0);

function UseItem(User, SourceItem, ltstate)

  if SourceItem.pos == holePosition then
    base.common.InformNLS(User,
      "Vielleicht kannst du mit einem Seil hinabklettern?",
      "Maybe you can climb down with a rope?");
    return;
  end

  content.gatheringcraft.claydigging.StartGathering(User, SourceItem, ltstate);
end

function LookAtItem(User, Item)

  local lookAt = base.lookat.GenerateLookAt(User, Item);

  if Item.pos == holePosition then
	lookAt.name = base.common.GetNLS(User,
      "Ein tiefes Loch",
      "A deep hole");
    lookAt.description = base.common.GetNLS(User,
      "Dieses Loch scheint bodenlos.",
      "This hole looks bottomless.");
  end

  return lookAt
end
