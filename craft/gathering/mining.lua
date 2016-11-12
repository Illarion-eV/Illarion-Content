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

local common = require("base.common")
local gathering = require("craft.base.gathering")

module("craft.gathering.mining", package.seeall)

function Init()

    local frequently = 0.005; --0.5% (1/200)
    local occasionally = 0.0025; --0.25% (1/400)
    local uncommon = 0.001; --0.1% (1/1000)
    local rarely = 0.00025; --0.025% (1/4000)
    
    mining = gatheringcraft.GatheringCraft:new{LeadSkill = Character.mining, LearnLimit = 100}; -- id_2763_pickaxe
    mining:AddRandomItem(2552,1,333,{},rarely,"Für deine harte und ehrliche Arbeit belohnt dich Ushara, die Göttin der Erde, mit einem Kleinod aus Reiner Erde.","For your hard and honest labour Ushara, the Godess of Earth, rewards you with a treasure of Pure Earth."); --Pure earth
    mining:AddRandomItem(gems.getMagicGemId(gems.OBSIDIAN),1,999,gems.getMagicGemData(1),rarely,"Deine Spitzhacke zertrümmert den Fels und zum Vorschein kommt ein eingeschlossener Edelstein. Du findest einen magischen Obsidian.","Your pickaxe smashes the rock and reveals an enclosed gemstone. A magical obsidian!"); --Magical obsidian
    mining:AddRandomItem(310,1,333,{},rarely,"Zwerge scheinen alten Krügen keine Beachtung beizumessen, insbesondere, wenn sie leer sind. Auch hier liegt einfach einer heru","Dwarves seem to pay no attention to old pitchers, especially if they are empty. As you work one catches your eye."); --mug with lid
    mining:AddRandomItem(1908,1,333,{},occasionally,"Diese Mine wurde offensichtlich kürzlich von Zwergen aufgesucht. Wie sonst erklärt sich der Bierkrug, den du zwischen dem Geröll findest?","This mine was occupied recently. How else would you explain the beer mug at your feet?"); --beer mug
    mining:AddRandomItem(391,1,333,{},frequently,"In einer Felsspalte liegt eine alte Fackel. Hier ist wohl jemanden ein Licht aufgegangen.","In a crevice you spot an old torch."); --torch
    mining:SetTreasureMap(uncommon,"In einer engen Felsspalte findest du ein altes Pergament, das wie eine Karte aussieht. Kein Versteck ist so sicher, dass es nicht gefunden wird.","In a narrow crevice you find an old parchment that looks like a map. No hiding place is too safe that it cannot be found.");
    mining:AddMonster(1052,uncommon,"Als du den Fels malträtierst, läuft etwas Schleim aus einer Felsspalte...","As you slam your pick-axe on the rock, some slime flows out of the fissure...",4,7);
    
end

function StartGathering(User, SourceItem, ltstate)

    gathering.InitGathering();
    local mining = gathering.mining;

    common.ResetInterruption( User, ltstate );
    if ( ltstate == Action.abort ) then -- work interrupted
        return
    end

    if not common.CheckItem( User, SourceItem ) then -- security check
        return
    end

    -- additional tool item is needed
    if (User:countItemAt("all",2763)==0) then
        common.HighInformNLS( User,
        "Du brauchst eine Spitzhacke um zu graben.",
        "You need a pickaxe for digging." );
        return
    end
    local toolItem = User:getItemAt(5);
    if ( toolItem.id ~=2763 ) then
        toolItem = User:getItemAt(6);
        if ( toolItem.id ~= 2763 ) then
            common.HighInformNLS( User,
            "Du musst die Spitzhacke in der Hand haben!",
            "You have to hold the pickaxe in your hand!" );
            return
        end
    end

    if not common.FitForWork( User ) then -- check minimal food points
        return
    end

    common.TurnTo( User, SourceItem.pos ); -- turn if necessary

    -- user feedback per nice animation
    User:performAnimation(14)

    if ( ltstate == Action.none ) then -- currently not working -> let's go
        mining.SavedWorkTime[User.id] = mining:GenWorkTime(User, toolItem);
        User:startAction( mining.SavedWorkTime[User.id], 0, 0, 18, 15);
        return
    end

    -- since we're here, we're working
    if mining:FindRandomItem(User) then
        return
    end

    local areaId = GetAreaId(User.pos);
    local productId = GetResource(areaId, SourceItem.id);

    User:learn( mining.LeadSkill, mining.SavedWorkTime[User.id], mining.LearnLimit);
    local amount = 1; -- set the amount of items that are produced
    local created = common.CreateItem(User, productId, amount, 333, nil) -- create the new produced items
    local rockBroken = breakRock(SourceItem);
    if created then -- character can still carry something
        if not rockBroken then -- rock is okay
            SourceItem = getRock(User, areaId);
            if (SourceItem ~= nil) then  -- there are still items we can work on
                mining.SavedWorkTime[User.id] = mining:GenWorkTime(User, toolItem);
                User:changeSource(SourceItem);
                User:startAction( mining.SavedWorkTime[User.id], 0, 0, 18, 15);
            else -- no items left (as the rock is still okay, this should never happen... handle it anyway)
                common.HighInformNLS(User,
                "Hier gibt es keine Steine mehr, an denen du arbeiten kannst.",
                "There are no stones for mining anymore.");
            end
        else
            -- rock is broken
            common.HighInformNLS(User,
            "Hier gibt es keine Steine mehr, an denen du arbeiten kannst.",
            "There are no stones for mining anymore.");
        end
    end

    if common.ToolBreaks( User, toolItem, mining:GenWorkTime(User, toolItem) ) then -- damage and possibly break the tool
        common.HighInformNLS(User,
        "Deine alte Spitzhacke zerbricht.",
        "Your old pick-axe breaks.");
        return
    end
end


local  Rocks = {}       -- Steine

    Rocks[1246]  = 915;
    Rocks[1245]  = 1254;
    Rocks[232]   = 233;
    Rocks[914]   = 1265;
    Rocks[1273]  = 1257;
    Rocks[1276]  = 1278;
    Rocks[1250]  = 1251;

local Area = {}
local function AddArea(AreaID,Center,Rad)

    Area[AreaID] = { };
    Area[AreaID]["Center"] = Center;
    Area[AreaID]["Radius"] = Rad;
end

local function AddStone(AreaID,StoneID)
    if ( Area[AreaID]["Stones"] == nil ) then
        Area[AreaID]["Stones"] = { };
    end
    Area[AreaID]["Stones"][StoneID] = { };
end

local function SetResource(AreaID,StoneID,RessID,Chance)
    Area[AreaID]["Stones"][StoneID][RessID] = Chance;
end

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


function GetResource(AreaID, StoneID)
  local ResourceList = Area[AreaID]["Stones"][StoneID];
  local cumulatedProbability = 0;
  local rand = math.random(1,100);
  -- Default: raw stone
  local resourceId = 735;
  for i,chances in pairs(ResourceList) do
    cumulatedProbability = cumulatedProbability + chances;
    if (rand <= cumulatedProbability) then
      resourceId = i;
      break;
    end
  end
  return resourceId;
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
  local targetItem = common.GetFrontItem(User);
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
