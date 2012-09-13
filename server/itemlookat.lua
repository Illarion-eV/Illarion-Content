-- This script is the central item lookat.

module("server.itemlookat", package.seeall)

--- Item Lookat
-- The task of this function is to generate the lookat on a item.
-- This function is called by the server.
--
-- @param[in] player 	the player that is supposed to receive the inform
-- @param[in] item      the item the player is looking at
-- @return TRUE in case the script generated the lookat
function lookAtItem(player, item)
	local itemCommon = world:getItemStatsFromId(item.id);
	local lookAt = ItemLookAt();
	lookAt.name     = world:getItemName(item.id, player:getPlayerLanguage());
	
	local rarenessData = item:getData("rareness");
	if (rarenessData == nil) then
		lookAt.rareness = ItemLookAt.commonItem;
	else
		-- Valid values:
		--  ItemLookAt.commonItem
		--  ItemLookAt.uncommonItem
		--  ItemLookAt.rareItem
		--  ItemLookAt.epicItem
		local value = tonumber(rarenessData);
		if (value ~= nil) then
			lookAt.rareness = value;
	    end;
	end;
	
	usedDescription = nil;
	if (player:getPlayerLanguage() == Player.german) then
		usedDescription = item:getData("descriptionDe");
	else
		usedDescription = item:getData("descriptionEn");
	end;
	
	if (usedDescription ~= nil) then
		lookAt.description = usedDescription;
	end;
	
	if (itemCommon.AgeingSpeed < 255) then
		local craftedByData = item:getData("craftedBy");
		if (craftedByData ~= nil) then
			lookAt.craftedBy = craftedByData;
		end;
		
		lookAt.weight = itemCommon.Weight;
		lookAt.worth = itemCommon.Worth;
		
		-- lookAt.qualityText (string)
		-- lookAt.durabilityText (string)
		-- lookAt.durabilityValue (int: 1 - 100)
		
		-- lookAt.diamondLevel (int: 0 - 10)
		-- lookAt.emeraldLevel (int: 0 - 10)
		-- lookAt.rubyLevel (int: 0 - 10)
		-- lookAt.sapphireLevel (int: 0 - 10)
		-- lookAt.amethystLevel (int: 0 - 10)
		-- lookAt.obsidianLevel (int: 0 - 10)
		-- lookAt.topazLevel (int: 0 - 10)
		-- lookAt.bonus (int: 0 - 255)
	end;
	
	world:itemInform(player, item, lookAt);
	return true;
end;
