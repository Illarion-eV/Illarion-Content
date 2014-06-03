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
-- Light a fire

-- UPDATE common SET com_script='item.woodlogs' WHERE com_itemid IN (3,543,544,2560);

require("base.common")

module("item.woodlogs", package.seeall)

function UseItem(User, SourceItem)
  local checkPos = SourceItem.pos;
  if (SourceItem:getType()~=3) then
    -- item is not on a field, try to light a fire at the front position.
    checkPos = base.common.GetFrontPosition(User);

    -- there should be no item on the field
    if (world:getField(checkPos):countItems() > 0) then
      base.common.HighInformNLS(User,
      "Du kannst nur an einer freien Stelle ein Feuer entfachen.",
      "You can light a fire only at a free spot.");
      return;
    end
  else
    -- item on a field
    -- no stacks of wood
    if (SourceItem.number > 1) then
      base.common.HighInformNLS(User,
      "Du kannst immer nur ein Feuer gleichzeitig entfachen.",
      "You can light a fire only one at a time.");
      return;
    end
    -- there should be no other item on the field
    if (world:getField(checkPos):countItems() > 1) then
      base.common.HighInformNLS(User,
      "Du kannst nur an einer freien Stelle ein Feuer entfachen.",
      "You can light a fire only at a free spot.");
      return;
    end
    -- turn to field if necessary
	base.common.TurnTo( User, checkPos );
  end
  
  --Weather is not shown by the client. So, players can only guess that it rains. Deactivated. ~Estralis
  --[[
  -- check wether user is under roof
  local potentialRoofPos=position(checkPos.x, checkPos.y, checkPos.z+1);
  local potRoof=world:getField(potentialRoofPos);
  local curWeather = world.weather;
  if ( ( (curWeather.percipitation_type == 1) or (curWeather.percipitation_type == 2) ) and (curWeather.percipitation_strength > 20) and
    (User.pos.z >= 0) and (potRoof == nil) ) then
    base.common.HighInformNLS(User,
    "Bei diesem Wetter wärst du nicht der Lage ein Feuer zu machen.",
    "You wouldn't be able to light a fire in this weather.");
    return;
  end
]]

  -- everything is okay, erase the wood and light a fire
  world:erase(SourceItem, 1);
  world:createItemFromId(12,1,checkPos,false,333,nil);
  base.common.InformNLS(User,
  "Du entzündest ein Feuer.",
  "You light a fire.");
end
