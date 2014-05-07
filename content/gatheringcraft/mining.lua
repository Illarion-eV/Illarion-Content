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

-- rocks

-- additional tool: pickaxe ( 2763 )

require("base.common")
require("content.gathering")

module("content.gatheringcraft.mining", package.seeall)

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();
	local mining = content.gathering.mining;

	base.common.ResetInterruption( User, ltstate );
	if ( ltstate == Action.abort ) then -- work interrupted
		if (User:increaseAttrib("sex",0) == 0) then
			gText = "seine";
			eText = "his";
		else
			gText = "ihre";
			eText = "her";
		end
		User:talk(Character.say, "#me unterbricht "..gText.." Arbeit.", "#me interrupts "..eText.." work.")
		return
	end

	if not base.common.CheckItem( User, SourceItem ) then -- security check
		return
	end

	-- additional tool item is needed
	if (User:countItemAt("all",2763)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst eine Spitzhacke um zu graben.",
		"You need a pickaxe for digging." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~=2763 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 2763 ) then
			base.common.HighInformNLS( User,
			"Du musst die Spitzhacke in der Hand haben!",
			"You have to hold the pickaxe in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		mining.SavedWorkTime[User.id] = mining:GenWorkTime(User, toolItem);
		User:startAction( mining.SavedWorkTime[User.id], 0, 0, 18, 15);
		User:talk(Character.say, "#me beginnt mit einer Spitzhacke auf den Stein zu schlagen.", "#me starts to hit the stone with a pick-axe.")
		User:performAnimation(14);
		return
	end

	-- since we're here, we're working

	User:performAnimation(14);
	if mining:FindRandomItem(User) then
		return
	end

	local areaId = content.gatheringcraft.mining.GetAreaId(User.pos);
	local productId = GetResource(areaId, SourceItem.id);

	User:learn( mining.LeadSkill, mining.SavedWorkTime[User.id], mining.LearnLimit);
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( productId, amount, 333, nil ); -- create the new produced items
	local rockBroken = breakRock(SourceItem);
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( productId, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	elseif (not rockBroken) then -- character can still carry something and rock is okay
		SourceItem = getRock(User, areaId);
		if (SourceItem ~= nil) then  -- there are still items we can work on
			mining.SavedWorkTime[User.id] = mining:GenWorkTime(User, toolItem);
			User:changeSource(SourceItem);
			User:startAction( mining.SavedWorkTime[User.id], 0, 0, 18, 15);
		else -- no items left (as the rock is still okay, this should never happen... handle it anyway)
			base.common.HighInformNLS(User,
			"Hier gibt es keine Steine mehr, an denen du arbeiten kannst.",
			"There are no stones for mining anymore.");
		end
	else
		-- rock is broken
		base.common.HighInformNLS(User,
		"Hier gibt es keine Steine mehr, an denen du arbeiten kannst.",
		"There are no stones for mining anymore.");
	end

	if base.common.GatheringToolBreaks( User, toolItem, mining:GenWorkTime(User, toolItem) ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Spitzhacke zerbricht.",
		"Your old pick-axe breaks.");
		return
	end
end



function Init()
    if InitDone then
        return
    end

    Rocks={};       -- Steine

    Rocks[1246]  = 915;
    Rocks[1245]  = 1254;
    Rocks[232]   = 233;
    Rocks[914]   = 1265;
    Rocks[1273]  = 1257;
    Rocks[1276]  = 1278;
    Rocks[1250]  = 1251;

--[[
For coals mines:
1245: 60% Coal + 3% Obsidian + 1% Ruby
1246: 40% Coal + 3% Amethyst + 1% Emerald

For iron mines:
914: 60% Iron + 3% Ruby + 1% Topaz
1273: 40% Iron + 3% Sapphire + 1% Obsidian

For copper mines:
1276: 60% Copper + 3% Emerald + 1% Sapphire

For gold and copper mines:
232: 40% Copper + 5% Gold + 3% Diamond 1% Amethyst

For gold and merinium mines:
1250: 10% Gold + 1% Merinium + 3% Topaz + 1% Diamond

Coalmine/silver: Galmair "Dark Hole Mine" +10iron&coal+5silver
Coordinates: 406,159,-3
Radius 20

Iron/gold/coppermine: Galmair "Malachite Mine" +10iron-2gold
Coordinates: 420,371,0
Radius 30

Coalmine/silver: Cadomyr "Cornerstone of Candour" -20iron-15coal
Coordinates: 142,686,0
Radius 15

Iron/gold/coppermine: Cadomyr "Liberty Quarry" -20iron
Coordinates: 165,603,0
Radius 15

Merinium/gold/coalmine/silver: Wilderness "Glittering Cave"
Coordinates: 548,371,0
Radius 15

Coal/Iron/Gold/coppermine: Wilderness "Skewer Drift" +20
Coordinates: 942,444,0
Radius 15
]]--

    --Galmair "Dark Hole Mine"
    AddArea( 1, position(406,159,-3), 20 );
    AddStone( 1, 1245 );
    SetResource( 1, 1245,  21, 70); -- coal
    SetResource( 1, 1245, 1062,  10); -- silver
	SetResource( 1, 1245,  252, 6); -- obsidian
    SetResource( 1, 1245,  255, 2); -- rubys
    AddStone( 1, 1246 );
    SetResource( 1, 1246, 21,  50); -- coal
    SetResource( 1, 1246, 1062,  10); -- silver
    SetResource( 1, 1246, 251,  6); -- amethysts
    SetResource( 1, 1246,  256,  2); -- emerald

	--Galmair "Malachite Mine"
    AddArea( 2, position(420,371,0), 30 );
    AddStone( 2, 232 );
    SetResource( 2, 232, 2536, 40); -- copper
    SetResource( 2, 232, 234,  3); -- gold nuggets
	SetResource( 2, 232, 254,  3); -- diamonds
	SetResource( 2, 232, 251,  1); -- amethysts
    AddStone( 2, 914 );
    SetResource( 2, 914,  22, 70); -- iron ore
	SetResource( 2, 914,  255, 3); -- rubys
	SetResource( 2, 914,  257, 1); -- topas
    AddStone( 2, 1273 );
    SetResource( 2, 1273,  22, 50); -- iron ore
	SetResource( 2, 1273,  253, 3); -- sapphire
	SetResource( 2, 1273,  252, 1); -- obsidian
    AddStone( 2, 1276 );
    SetResource( 2, 1276,  2536, 40); -- copper ore
	SetResource( 2, 1276,  256, 3); -- emerald
	SetResource( 2, 1276,  253, 1); -- sapphire

	--Cadomyr "Cornerstone of Candour"
	AddArea( 3, position(142,686,0), 15 );
    AddStone( 3, 1245 );
    SetResource( 3, 1245,  21, 40); -- coal
    SetResource( 3, 1245, 1062,  5); -- silver
	SetResource( 3, 1245,  252, 3); -- obsidian
    SetResource( 3, 1245,  255, 1); -- rubys
    AddStone( 3, 1246 );
    SetResource( 3, 1246, 21,  25); -- coal
    SetResource( 3, 1246, 1062,  5); -- silver
    SetResource( 3, 1246, 251,  3); -- amethysts
    SetResource( 3, 1246,  256,  1); -- emerald

	--Cadomyr "Liberty Quarry"
	AddArea( 4, position(165,603,0), 15 );
    AddStone( 4, 232 );
    SetResource( 4, 232, 2536, 40); -- copper
    SetResource( 4, 232, 234,  5); -- gold nuggets
	SetResource( 4, 232, 254,  3); -- diamonds
	SetResource( 4, 232, 251,  1); -- amethysts
    AddStone( 4, 914 );
    SetResource( 4, 914,  22, 40); -- iron ore
	SetResource( 4, 914,  255, 3); -- rubys
	SetResource( 4, 914,  257, 1); -- topas
    AddStone( 4, 1273 );
    SetResource( 4, 1273,  22, 25); -- iron ore
	SetResource( 4, 1273,  253, 3); -- sapphire
	SetResource( 4, 1273,  252, 1); -- obsidian
	AddStone( 4, 1276 );
    SetResource( 4, 1276,  2536, 40); -- copper ore
	SetResource( 4, 1276,  256, 3); -- emerald
	SetResource( 4, 1276,  253, 1); -- sapphire

	--Wilderness "Glittering Cave"
	AddArea( 5, position(548,371,0), 15 );
    AddStone( 5, 1245 );
    SetResource( 5, 1245,  21, 60); -- coal
    SetResource( 5, 1245, 1062,  5); -- silver
	SetResource( 5, 1245,  252, 3); -- obsidian
    SetResource( 5, 1245,  255, 1); -- rubys
    AddStone( 5, 1246 );
    SetResource( 5, 1246, 21,  40); -- coal
    SetResource( 5, 1246, 1062,  5); -- silver
    SetResource( 5, 1246, 251,  3); -- amethysts
    SetResource( 5, 1246, 256,  1); -- emerald
    AddStone( 5, 1250 );
    SetResource( 5, 1250, 234,  10); -- gold nuggets
    SetResource( 5, 1250, 2534,  1); -- merinium ore
    SetResource( 5, 1250,  254,  3); -- diamonds
	SetResource( 5, 1250,  257,  1); -- topas

	--Wilderness "Skewer Drift"
	AddArea( 6, position(942,444,0), 15 );
    AddStone( 6, 232 );
    SetResource( 6, 232, 2536, 60); -- copper
    SetResource( 6, 232, 234,  15); -- gold nuggets
	SetResource( 6, 232, 254,  9); -- diamonds
	SetResource( 6, 232, 251,  3); -- amethysts
    AddStone( 6, 914 );
    SetResource( 6, 914,  22, 80); -- iron ore
	SetResource( 6, 914,  255, 9); -- rubys
	SetResource( 6, 914,  257, 3); -- topas
    AddStone( 6, 1273 );
    SetResource( 6, 1273,  22, 60); -- iron ore
	SetResource( 6, 1273,  253, 9); -- sapphire
	SetResource( 6, 1273,  252, 3); -- obsidian
	AddStone( 6, 1245 );
    SetResource( 6, 1245,  21, 80); -- coal
	SetResource( 6, 1245,  252, 9); -- obsidian
    SetResource( 6, 1245,  255, 3); -- rubys
    AddStone( 6, 1246 );
    SetResource( 6, 1246, 21,  60); -- coal
    SetResource( 6, 1246, 251,  9); -- amethysts
    SetResource( 6, 1246,  256,  3); -- emerald
	AddStone( 6, 1276 );
    SetResource( 6, 1276,  2536, 60); -- copper ore
	SetResource( 6, 1276,  256, 9); -- emerald
	SetResource( 6, 1276,  253, 3); -- sapphire

	----------- Noobia Mine (increased coal yield) -----------
	AddArea( 7, position(59,49,100), 15 );
    AddStone( 7, 232 );
    SetResource( 7, 232, 2536, 40); -- copper
    SetResource( 7, 232, 234,  5); -- gold nuggets
	SetResource( 7, 232, 254,  3); -- diamonds
	SetResource( 7, 232, 251,  1); -- amethysts
    AddStone( 7, 914 );
    SetResource( 7, 914,  22, 60); -- iron ore
	SetResource( 7, 914,  255, 3); -- rubys
	SetResource( 7, 914,  257, 1); -- topas
    AddStone( 7, 1273 );
    SetResource( 7, 1273,  22, 60); -- iron ore
	SetResource( 7, 1273,  253, 3); -- sapphire
	SetResource( 7, 1273,  252, 1); -- obsidian
	AddStone( 7, 1245 );
    SetResource( 7, 1245,  21, 80); -- coal
	SetResource( 7, 1245,  252, 3); -- obsidian
    SetResource( 7, 1245,  255, 1); -- rubys
    AddStone( 7, 1246 );
    SetResource( 7, 1246, 21,  40); -- coal
    SetResource( 7, 1246, 251,  3); -- amethysts
    SetResource( 7, 1246,  256,  1); -- emerald
	AddStone( 7, 1276 );
    SetResource( 7, 1276,  2536, 40); -- copper ore
	SetResource( 7, 1276,  256, 3); -- emerald
	SetResource( 7, 1276,  253, 1); -- sapphire
	AddStone( 7, 1250 );
    SetResource( 7, 1250, 234,  10); -- gold nuggets
    SetResource( 7, 1250, 2534,  1); -- merinium ore
    SetResource( 7, 1250,  254,  3); -- diamonds
	SetResource( 7, 1250,  257,  1); -- topas
	------- Noobia Mine - FERTIG ------

	----------- Prison Mine -----------
	AddArea( 8, position(-480,-480,-40), 30 );
    AddStone( 8, 232 );
    SetResource( 8, 232, 2536, 40); -- copper
    SetResource( 8, 232, 234,  5); -- gold nuggets
	SetResource( 8, 232, 254,  3); -- diamonds
	SetResource( 8, 232, 251,  1); -- amethysts
    AddStone( 8, 914 );
    SetResource( 8, 914,  22, 60); -- iron ore
	SetResource( 8, 914,  255, 3); -- rubys
	SetResource( 8, 914,  257, 1); -- topas
    AddStone( 8, 1273 );
    SetResource( 8, 1273,  22, 40); -- iron ore
	SetResource( 8, 1273,  253, 3); -- sapphire
	SetResource( 8, 1273,  252, 1); -- obsidian
	AddStone( 8, 1245 );
    SetResource( 8, 1245,  21, 60); -- coal
	SetResource( 8, 1245,  252, 3); -- obsidian
    SetResource( 8, 1245,  255, 1); -- rubys
    AddStone( 8, 1246 );
    SetResource( 8, 1246, 21,  40); -- coal
    SetResource( 8, 1246, 1062,  5); -- silver
    SetResource( 8, 1246, 251,  3); -- amethysts
    SetResource( 8, 1246,  256,  1); -- emerald
	AddStone( 8, 1276 );
    SetResource( 8, 1276,  2536, 40); -- copper ore
	SetResource( 8, 1276,  256, 3); -- emerald
	SetResource( 8, 1276,  253, 1); -- sapphire
	AddStone( 8, 1250 );
    SetResource( 8, 1250, 234,  10); -- gold nuggets
    SetResource( 8, 1250, 2534,  1); -- merinium ore
    SetResource( 8, 1250,  254,  3); -- diamonds
	SetResource( 8, 1250,  257,  1); -- topas
	------- Prison Mine - FERTIG ------

	----------- Digging Projects (temporarly) -----------
	----------- Galmair Tunnel Project -----------
	AddArea( 91, position(427,206,0), 10 );
		AddStone( 91, 914 );
		AddStone( 91, 232 );
		AddStone( 91, 1245 );
	AddArea( 92, position(427,187,0), 10 );
		AddStone( 92, 914 );
		AddStone( 92, 232 );
		AddStone( 92, 1245 );
	AddArea( 93, position(410,187,0), 10 );
		AddStone( 93, 914 );
		AddStone( 93, 232 );
		AddStone( 93, 1245 );
	AddArea( 94, position(393,187,0), 10 );
		AddStone( 94, 914 );
		AddStone( 94, 232 );
		AddStone( 94, 1245 );
	AddArea( 95, position(393,169,0), 10 );
		AddStone( 95, 914 );
		AddStone( 95, 232 );
		AddStone( 95, 1245 );



    InitDone = true;
end

function AddArea(AreaID,Center,Rad)
    if (Area == nil) then
        Area = { };
    end
    Area[AreaID] = { };
    Area[AreaID]["Center"] = Center;
    Area[AreaID]["Radius"] = Rad;
end

function AddStone(AreaID,StoneID)
    if ( Area[AreaID]["Stones"] == nil ) then
        Area[AreaID]["Stones"] = { };
    end
    Area[AreaID]["Stones"][StoneID] = { };
end

function SetResource(AreaID,StoneID,RessID,Chance)
  Area[AreaID]["Stones"][StoneID][RessID] = Chance;
end

function GetResource(AreaID, StoneID)
  ResourceList = Area[AreaID]["Stones"][StoneID];
  cumulatedProbability = 0;
  rand = math.random(1,100);
  -- Default: raw stone
  resourceId = 735;
  for i,chances in pairs(ResourceList) do
    cumulatedProbability = cumulatedProbability + chances;
    if (rand <= cumulatedProbability) then
      resourceId = i;
      break;
    end
  end
  return resourceId;
end

function GetAreaId(TargetPos)
	Init();
    local XDiff = 0;
    local YDiff = 0;
    for i, AreaData in pairs(Area) do
        XDiff = AreaData["Center"].x - TargetPos.x;
        YDiff = AreaData["Center"].y - TargetPos.y;
        if (math.sqrt((XDiff * XDiff) + (YDiff * YDiff)) <= AreaData["Radius"]) then
            if (TargetPos.z == AreaData["Center"].z) then
                return i;
            end
        end
    end
    return nil;
end

function breakRock(Rock)
    local RockPos=Rock.pos;
    local RockQual=Rock.quality;
    local HitDMG=math.random(6,8);
    if (RockQual<HitDMG) then
        world:swap(Rock,Rocks[Rock.id],333);
        return true;
    else
        if ((RockQual-HitDMG)==(math.floor(RockQual/100))*100) then HitDMG=HitDMG-1 end
        world:changeQuality(Rock,-HitDMG)
    end
    return false;
end

function isMinableRock(AreaId, Rock)
	if (Rock ~= nil and Area[AreaId]["Stones"][Rock.id] ~= nil) then
		return true;
	end
	return false;
end

function getRock(User, AreaId)
  local targetItem = base.common.GetFrontItem(User);
  if (isMinableRock(AreaId, targetItem)) then
    return targetItem;
  end
  local Radius = 1;
  for x=-Radius,Radius do
    for y=-Radius,Radius do
      local targetPos = position(User.pos.x + x, User.pos.y + y, User.pos.z);
      if (world:isItemOnField(targetPos)) then
        local targetItem = world:getItemOnField(targetPos);
        if (isMinableRock(AreaId, targetItem)) then
          return targetItem;
        end
      end
    end
  end
  return nil;
end
