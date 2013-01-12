-- mining mit Spitzhacke

-- UPDATE common SET com_script='item.id_2763_pickaxe' WHERE com_itemid=2763;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 1246 WHERE com_itemid = 1246;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 1246 WHERE com_itemid = 915;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 1245 WHERE com_itemid = 1245;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 1245 WHERE com_itemid = 1254;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 232  WHERE com_itemid = 232;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 232  WHERE com_itemid = 233;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 914  WHERE com_itemid = 914;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 914  WHERE com_itemid = 1265;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 1273 WHERE com_itemid = 1273;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 1273 WHERE com_itemid = 1257;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 1276 WHERE com_itemid = 1276;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 1276 WHERE com_itemid = 1278;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 1250 WHERE com_itemid = 1250;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 1250 WHERE com_itemid = 1251;

require("item.general.metal")
require("base.common")
require("base.treasure")
require("content.gathering")
require("base.gatheringcraft")
require("base.lookat")

module("item.id_2763_pickaxe", package.seeall, package.seeall(item.general.metal))

function LookAtItem(User,Item)

     world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,1,false,false ));
		
	--Noobia addition by Estralis: Examining a pick-axe is a task of NPC Aldania

    if User:getQuestProgress(310)==3 and Item.id==2763 and User:isInRangeToPosition((position (52,24,100)),20) then --only invoked if the user has the quest, examines a pick-axe and is in range of the NPC
		User:setQuestProgress(310,4); --Connection to easyNPC
		NPCList=world:getNPCSInRangeOf(position(52,24,100),1); --Let's be tolerant, the NPC might move a tile.
		for i, Aldania in pairs(NPCList) do
		    base.common.TalkNLS(Aldania, Character.say, "Gegenstände können von unterschiedlicher Güte sein, denk daran, wenn du über sie verhandelst. Meine letzte Lektion ist das Benutzen von Gegenständen. Nimm diese Fackel und entzünde sie!", "See, items can be of differing quality. Keep this in mind when you are negotiating a trade with a merchant. My final lesson is on how to use items. I have given you a torch, try lighting it!");
		    User:createItem(391,1,333,nil); --Torch
		end
	    base.common.InformNLS( User,"[Tutorial] Du kannst einen Gegenstand mit einerm Doppelklick benutzen. Doppelklicke die Fackel in deinem Inventar, um sie zu entzünden.","[Tutorial] You can perform a double click on an item to use it. Double click the torch in your inventory to ignite it." );
	end

--Noobia end
end

function MoveItemAfterMove(User,SourceItem,TargetItem)

--Noobia addition by Estralis: Equipping a pick-axe is a task of NPC Aldania

    if User:getQuestProgress(310)==2 and TargetItem.id==2763 and User:isInRangeToPosition((position (51,30,100)),20) and TargetItem:getType() == 4 then --only invoked if the user has the quest, moves a pick-axe to a hand slot and is in range of the NPC
		User:setQuestProgress(310,3); --Connection to easyNPC
		NPCList=world:getNPCSInRangeOf(position(52,24,100),1); --Let's be tolerant, the NPC might move a tile.
		for i, Aldania in pairs(NPCList) do
		    base.common.TalkNLS(Aldania, Character.say, "Sehr gut, nun weißt du, wie man mit Ausrüstung umgeht. Helme, Schuhe und ähnliches werden genauso angelegt. In meiner nächsten Lektion wirst du lernen, noch mehr über einen Gegenstand zu erfahren, beispielweise seinen Zustand oder die handwerkliche Güte. Untersuche bitte die Spitzhacke, um ihre Qualität einzuschätzen.", "Very good, you know how to properly handle your equipment now. Helmets, shoes and the like are equipped in the same way. My next lesson will allow you to learn more information about your items, such as how damaged and how well-crafted they are. To see the quality of your pick-axe, please examine it now.");
	    end
		base.common.InformNLS( User,"[Tutorial] Bewege den Mauszeiger über die Spitzhacke in deinem Inventar um sie zu untersuchen.","[Tutorial] Move the mouse cursor over the pick-axe in your inventory in order to examine it." );
	end

--Noobia end

return true; --leave savely

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
1245: 60% Coal + 7% Obsidian + 3% Ruby
1246: 40% Coal + 7% Amethyst + 3% Emerald

For iron mines:
914: 60% Iron + 7% Ruby + 3% Topaz
1273: 40% Iron + 7% Sapphire + 3% Obsidian

For copper mines:
1276: 60% Copper + 7% Emerald + 3% Sapphire

For gold and copper mines:
232: 40% Copper + 10% Gold + 7% Diamond 3% Amethyst

For gold and merinium mines:
1250: 10% Gold + 5% Merinium + 7% Topaz + 3% Diamond

Coalmine: Galmair "Dark Hole Mine"
Coordinates: 406,159,-3
Radius 20

Iron/gold/coppermine: Galmair "Malachite Mine"
Coordinates: 420,371,0
Radius 30

Coalmine: Cadomyr "Cornerstone of Candour"
Coordinates: 142,686,0
Radius 15

Iron/gold/coppermine: Cadomyr "Liberty Quarry"
Coordinates: 165,603,0
Radius 15

Merinium/gold/coalmine: Wilderness "Glittering Cave"
Coordinates: 548,371,0
Radius 15

Coal/Iron/Gold/coppermine: Wilderness "Skewer Drift"
Coordinates: 942,444,0
Radius 15
]]--
	
    --Galmair "Dark Hole Mine" 
    AddArea( 1, position(406,159,-3), 20 );
    AddStone( 1, 1245 );
    SetResource( 1, 1245,  21, 60); -- coal
	SetResource( 1, 1245,  252, 7); -- obsidian
    SetResource( 1, 1245,  255, 3); -- rubys
    AddStone( 1, 1246 );
    SetResource( 1, 1246, 21,  40); -- coal
    SetResource( 1, 1246, 251,  7); -- amethysts
    SetResource( 1, 1246,  256,  3); -- emerald

	--Galmair "Malachite Mine"
    AddArea( 2, position(420,371,0), 30 );
    AddStone( 2, 232 );
    SetResource( 2, 232, 2536, 40); -- copper
    SetResource( 2, 232, 234,  10); -- gold nuggets
	SetResource( 2, 232, 254,  7); -- diamonds
	SetResource( 2, 232, 251,  3); -- amethysts
    AddStone( 2, 914 );
    SetResource( 2, 914,  22, 60); -- iron ore
	SetResource( 2, 914,  255, 7); -- rubys
	SetResource( 2, 914,  257, 3); -- topas
    AddStone( 2, 1273 );
    SetResource( 2, 1273,  22, 40); -- iron ore
	SetResource( 2, 1273,  253, 7); -- sapphire
	SetResource( 2, 1273,  252, 3); -- obsidian
    AddStone( 2, 1276 );
    SetResource( 2, 1276,  2536, 40); -- copper ore
	SetResource( 2, 1276,  256, 7); -- emerald
	SetResource( 2, 1276,  253, 3); -- sapphire
	
	--Cadomyr "Cornerstone of Candour"
	AddArea( 3, position(142,686,0), 15 );
    AddStone( 3, 1245 );
    SetResource( 3, 1245,  21, 60); -- coal
	SetResource( 3, 1245,  252, 7); -- obsidian
    SetResource( 3, 1245,  255, 3); -- rubys
    AddStone( 3, 1246 );
    SetResource( 3, 1246, 21,  40); -- coal
    SetResource( 3, 1246, 251,  7); -- amethysts
    SetResource( 3, 1246,  256,  3); -- emerald
	
	--Cadomyr "Liberty Quarry"
	AddArea( 4, position(165,603,0), 15 );
    AddStone( 4, 232 );
    SetResource( 4, 232, 2536, 40); -- copper
    SetResource( 4, 232, 234,  10); -- gold nuggets
	SetResource( 4, 232, 254,  7); -- diamonds
	SetResource( 4, 232, 251,  3); -- amethysts
    AddStone( 4, 914 );
    SetResource( 4, 914,  22, 60); -- iron ore
	SetResource( 4, 914,  255, 7); -- rubys
	SetResource( 4, 914,  257, 3); -- topas
    AddStone( 4, 1273 );
    SetResource( 4, 1273,  22, 40); -- iron ore
	SetResource( 4, 1273,  253, 7); -- sapphire
	SetResource( 4, 1273,  252, 3); -- obsidian
	AddStone( 4, 1276 );
    SetResource( 4, 1276,  2536, 40); -- copper ore
	SetResource( 4, 1276,  256, 7); -- emerald
	SetResource( 4, 1276,  253, 3); -- sapphire
	
	--Wilderness "Glittering Cave"
	AddArea( 5, position(548,371,0), 15 );
    AddStone( 5, 1245 );
    SetResource( 5, 1245,  21, 60); -- coal
	SetResource( 5, 1245,  252, 7); -- obsidian
    SetResource( 5, 1245,  255, 3); -- rubys
    AddStone( 5, 1246 );
    SetResource( 5, 1246, 21,  40); -- coal
    SetResource( 5, 1246, 251,  7); -- amethysts
    SetResource( 5, 1246, 256,  3); -- emerald
    AddStone( 5, 1250 );
    SetResource( 5, 1250, 234,  10); -- gold nuggets
    SetResource( 5, 1250, 2534,  5); -- merinium ore
    SetResource( 5, 1250,  254,  7); -- diamonds
	SetResource( 5, 1250,  257,  3); -- topas
		
	--Wilderness "Skewer Drift"
	AddArea( 6, position(942,444,0), 15 );
    AddStone( 6, 232 );
    SetResource( 6, 232, 2536, 40); -- copper
    SetResource( 6, 232, 234,  10); -- gold nuggets
	SetResource( 6, 232, 254,  7); -- diamonds
	SetResource( 6, 232, 251,  3); -- amethysts
    AddStone( 6, 914 );
    SetResource( 6, 914,  22, 60); -- iron ore
	SetResource( 6, 914,  255, 7); -- rubys
	SetResource( 6, 914,  257, 3); -- topas
    AddStone( 6, 1273 );
    SetResource( 6, 1273,  22, 40); -- iron ore
	SetResource( 6, 1273,  253, 7); -- sapphire
	SetResource( 6, 1273,  252, 3); -- obsidian
	AddStone( 6, 1245 );
    SetResource( 6, 1245,  21, 60); -- coal
	SetResource( 6, 1245,  252, 7); -- obsidian
    SetResource( 6, 1245,  255, 3); -- rubys
    AddStone( 6, 1246 );
    SetResource( 6, 1246, 21,  40); -- coal
    SetResource( 6, 1246, 251,  7); -- amethysts
    SetResource( 6, 1246,  256,  3); -- emerald
	AddStone( 6, 1276 );
    SetResource( 6, 1276,  2536, 40); -- copper ore
	SetResource( 6, 1276,  256, 7); -- emerald
	SetResource( 6, 1276,  253, 3); -- sapphire
	    	
	----------- Noobia Mine -----------
	AddArea( 7, position(59,49,100), 15 );
    AddStone( 7, 232 );
    SetResource( 7, 232, 2536, 40); -- copper
    SetResource( 7, 232, 234,  10); -- gold nuggets
	SetResource( 7, 232, 254,  7); -- diamonds
	SetResource( 7, 232, 251,  3); -- amethysts
    AddStone( 7, 914 );
    SetResource( 7, 914,  22, 60); -- iron ore
	SetResource( 7, 914,  255, 7); -- rubys
	SetResource( 7, 914,  257, 3); -- topas
    AddStone( 7, 1273 );
    SetResource( 7, 1273,  22, 40); -- iron ore
	SetResource( 7, 1273,  253, 7); -- sapphire
	SetResource( 7, 1273,  252, 3); -- obsidian
	AddStone( 7, 1245 );
    SetResource( 7, 1245,  21, 60); -- coal
	SetResource( 7, 1245,  252, 7); -- obsidian
    SetResource( 7, 1245,  255, 3); -- rubys
    AddStone( 7, 1246 );
    SetResource( 7, 1246, 21,  40); -- coal
    SetResource( 7, 1246, 251,  7); -- amethysts
    SetResource( 7, 1246,  256,  3); -- emerald
	AddStone( 7, 1276 );
    SetResource( 7, 1276,  2536, 40); -- copper ore
	SetResource( 7, 1276,  256, 7); -- emerald
	SetResource( 7, 1276,  253, 3); -- sapphire
	AddStone( 7, 1250 );
    SetResource( 7, 1250, 234,  10); -- gold nuggets
    SetResource( 7, 1250, 2534,  5); -- merinium ore
    SetResource( 7, 1250,  254,  7); -- diamonds
	SetResource( 7, 1250,  257,  3); -- topas
	------- Noobia Mine - FERTIG ------

	----------- Prison Mine -----------
	AddArea( 8, position(-480,-480,-40), 30 );
    AddStone( 8, 232 );
    SetResource( 8, 232, 2536, 40); -- copper
    SetResource( 8, 232, 234,  10); -- gold nuggets
	SetResource( 8, 232, 254,  7); -- diamonds
	SetResource( 8, 232, 251,  3); -- amethysts
    AddStone( 8, 914 );
    SetResource( 8, 914,  22, 60); -- iron ore
	SetResource( 8, 914,  255, 7); -- rubys
	SetResource( 8, 914,  257, 3); -- topas
    AddStone( 8, 1273 );
    SetResource( 8, 1273,  22, 40); -- iron ore
	SetResource( 8, 1273,  253, 7); -- sapphire
	SetResource( 8, 1273,  252, 3); -- obsidian
	AddStone( 8, 1245 );
    SetResource( 8, 1245,  21, 60); -- coal
	SetResource( 8, 1245,  252, 7); -- obsidian
    SetResource( 8, 1245,  255, 3); -- rubys
    AddStone( 8, 1246 );
    SetResource( 8, 1246, 21,  40); -- coal
    SetResource( 8, 1246, 251,  7); -- amethysts
    SetResource( 8, 1246,  256,  3); -- emerald
	AddStone( 8, 1276 );
    SetResource( 8, 1276,  2536, 40); -- copper ore
	SetResource( 8, 1276,  256, 7); -- emerald
	SetResource( 8, 1276,  253, 3); -- sapphire
	AddStone( 8, 1250 );
    SetResource( 8, 1250, 234,  10); -- gold nuggets
    SetResource( 8, 1250, 2534,  5); -- merinium ore
    SetResource( 8, 1250,  254,  7); -- diamonds
	SetResource( 8, 1250,  257,  3); -- topas
	------- Prison Mine - FERTIG ------
	
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

function getRock(User, AreaId)
  local targetItem = base.common.GetFrontItem(User);
  if (targetItem ~= nil and Area[AreaId]["Stones"][targetItem.id] ~= nil) then
    return targetItem;
  end
  local Radius = 1;
  for x=-Radius,Radius do
    for y=-Radius,Radius do 
      local targetPos = position(User.pos.x + x, User.pos.y + y, User.pos.z);
      if (world:isItemOnField(targetPos)) then
        local targetItem = world:getItemOnField(targetPos);
        if (Area[AreaId]["Stones"][targetItem.id] ~= nil) then
          return targetItem;
        end
      end
    end
  end
  return nil;
end

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
  Init();
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
    User:talkLanguage(Character.say, Player.german, "#me unterbricht "..gText.." Arbeit.");
    User:talkLanguage(Character.say, Player.english,"#me interrupts "..eText.." work.");
    return
  end

  if not base.common.CheckItem( User, SourceItem ) then -- security check
    return
  end
  
  if (SourceItem:getType() ~= 4) then -- tool in hand
    base.common.HighInformNLS( User,
    "Du musst die Spitzhacke in der Hand haben!",
    "You have to hold the pick-axe in your hand!" );
    return
  end

  if not base.common.FitForWork( User ) then -- check minimal food points
    return
  end
  
  if DigForTresure(User) then
    return;
  end
  
  local areaId = GetAreaId(User.pos);
  if (areaId == nil) then
    base.common.HighInformNLS(User,
    "Die Gegend sieht nicht so aus, als könnte man hier etwas finden.",
    "The area doesn't look like a good place to mine.");
    return;
  end
  
  local rock = getRock(User, areaId);
  if (rock == nil) then
    -- TODO check if this condition is needed.
    --if (ltstate ~= Action.success) then
        base.common.HighInformNLS(User,
        "Du musst neben einem Felsen stehen um Bergbau zu betreiben.",
        "You have to stand next to a rock to mine.");
    --end
    return
  end

  if not base.common.IsLookingAt( User, rock.pos ) then -- check looking direction
    base.common.TurnTo( User, rock.pos ); -- turn if necessary
  end
  
  if ( ltstate == Action.none ) then -- currently not working -> let's go
    mining.SavedWorkTime[User.id] = mining:GenWorkTime(User,SourceItem);
    User:startAction( mining.SavedWorkTime[User.id], 0, 0, 0, 0);
    User:talkLanguage( Character.say, Player.german, "#me beginnt mit einer Spitzhacke auf den Stein zu schlagen.");
    User:talkLanguage( Character.say, Player.english, "#me starts to hit the stone with a pick-axe."); 
	User:performAnimation(14);
    return
  end

  -- since we're here, we're working

  User:performAnimation(14);
  if mining:FindRandomItem(User) then
    return
  end
  
  local productId = GetResource(areaId, rock.id);

  User:learn( mining.LeadSkill, mining.SavedWorkTime[User.id], 20);
  local amount = 1; -- set the amount of items that are produced
  local notCreated = User:createItem( productId, amount, 333, nil ); -- create the new produced items
  local rockBroken = breakRock(rock);
  if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
    world:createItemFromId( productId, notCreated, User.pos, true, 333, nil );
    base.common.HighInformNLS(User,
    "Du kannst nichts mehr halten und der Rest fällt zu Boden.",
    "You can't carry any more and the rest drops to the ground.");
  elseif (not rockBroken) then -- character can still carry something and rock is okay
    rock = getRock(User, areaId);
    if (rock ~= nil) then  -- there are still items we can work on
      mining.SavedWorkTime[User.id] = mining:GenWorkTime(User,SourceItem);
      User:startAction( mining.SavedWorkTime[User.id], 0, 0, 0, 0);
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

  if base.common.GatheringToolBreaks( User, SourceItem ) then -- damage and possibly break the tool
    base.common.HighInformNLS(User,
    "Deine alte Spitzhacke zerbricht.",
    "Your old pick-axe breaks.");
    return
  end
end

-- @return  True if found a treasure.
function DigForTresure(User)
  local TargetPos = base.common.GetFrontPosition(User);
  local groundTile = world:getField( TargetPos ):tile();
  local GroundType = base.common.GetGroundType( groundTile );

  if ( (GroundType ~= base.common.GroundType.rocks) and
      base.treasure.DigForTreasure( 
        User, TargetPos, (User:getSkill(Character.mining)/10)+1,
        base.common.GetNLS( User,
          "Du schwingst deine Spitzhacke gegen den steinigen Boden und stößt auf etwas das noch härter ist als der Boden. Das muss er sein! Der Schatz. Noch einmal graben und der grenzenlose Reichtum ist dein!",
          "You swing your pick-axe against the stony ground and hit something that is even harder then the ground. That must it be! The treasure! Another swing and it is yours!" ), 
        false) ) then
    return true;
  end
  return false;
end
