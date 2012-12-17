-- Light a fire

-- UPDATE common SET com_script='item.woodlogs' WHERE com_itemid IN (3,543,544,2560);

require("base.common")

module("item.woodlogs", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param)
  local checkPos = SourceItem.pos;
  if (SourceItem:getType()~=3) then
    -- item is not on a field, try to light a fire at the front position.
    checkPos = base.common.GetFrontPosition(User);
    local posOkay = true;
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
    if not base.common.IsLookingAt(User,checkPos.pos) then
      base.common.TurnTo( User, checkPos.pos );
    end
  end
  
  -- check wether user is under roof
  local potentialRoofPos=position(checkPos.pos.x, checkPos.pos.y, checkPos.pos.z+1);
  local potRoof=world:getField(potentialRoofPos);
  local curWeather = world.weather;
  if ( ( (curWeather.percipitation_type == 1) or (curWeather.percipitation_type == 2) ) and (curWeather.percipitation_strength > 20) and
    (User.pos.z >= 0) and (potRoof == nil) ) then
    base.common.HighInformNLS(User,
    "Bei diesem Wetter wärst du nicht der Lage ein Feuer zu machen.",
    "You wouldn't be able to light a fire in this weather.");
    return;
  end
  
  -- everything is okay, erase the wood and light a fire
  world:erase(SourceItem, 1);
  world:createItemFromId(12,1,checkPos,false,333,nil);
  base.common.InformNLS(User,
  "Du entzündest ein Feuer.",
  "You light a fire.");
end
