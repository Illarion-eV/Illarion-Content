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

-- trees

-- additional tool: axe ( 74 )

local common = require("base.common")
local shared = require("craft.base.shared")
local gathering = require("craft.base.gathering")

local M = {}

local TreeItems = {}

local function AddTree(TreeId, TrunkId, LogId, HeartwoodId, BoughId, Amount, BoughProbability, HeartwoodProbability)
    local treeTable = {};
    treeTable.TrunkId = TrunkId;
    treeTable.LogId = LogId;
    treeTable.HeartwoodId = HeartwoodId;
    treeTable.BoughId = BoughId;
    treeTable.Amount = Amount;
    treeTable.BoughProbability = BoughProbability;
    treeTable.HeartwoodProbability = HeartwoodProbability;
    TreeItems[TreeId] = treeTable
end

AddTree(  11,125,2560,3786,  56,10,0,0); -- apple tree
AddTree(  14,125,2560,3786,  56,10,0,0); -- apple tree
AddTree( 299,541, 543,3786,  56,10,0,0); -- cherry tree
AddTree( 300,541, 543,3786,  56,10,0,0); -- cherry tree
AddTree( 308,309,   3,3786,  56,13,0.23,0); -- fir tree
AddTree( 586,587, 544,3786,  56,10,0,0.06); -- cachdern tree
AddTree(1804,542, 544,3786,  56,11,0,0.06); -- naldor tree
AddTree(1809,584, 544,3786,  56,11,0,0); -- eldan oak
AddTree(1817,585,   3,3786,  56,13,0.23,0); -- scandrel pine

local unchoppableTrees = {}
unchoppableTrees[203] = true
unchoppableTrees[892] = true
unchoppableTrees[893] = true
unchoppableTrees[894] = true
unchoppableTrees[910] = true
unchoppableTrees[911] = true
unchoppableTrees[912] = true
unchoppableTrees[913] = true
unchoppableTrees[959] = true
unchoppableTrees[960] = true
unchoppableTrees[961] = true
unchoppableTrees[962] = true
unchoppableTrees[963] = true
unchoppableTrees[1193] = true
unchoppableTrees[1194] = true
unchoppableTrees[1195] = true
unchoppableTrees[1198] = true
unchoppableTrees[1532] = true
unchoppableTrees[1533] = true
unchoppableTrees[1534] = true
unchoppableTrees[1535] = true
unchoppableTrees[1536] = true
unchoppableTrees[1807] = true
unchoppableTrees[1808] = true


local function preventCutting(User, theAxe, theTree)

    local effectType = theTree:getData("treeProtectionType")

    if effectType == "lightning" then
        world:gfx(2,User.pos)
        world:makeSound(13,User.pos)
        User:inform("Aus heiterem Himmel wirst du von einem Blitz getroffen!", "Out of the blue, you are struck by lightning!", Character.highPriority)
        User:increaseAttrib("hitpoints",-3000)
    elseif effectType == "axeSlippingOff" then
        User:inform("Als du zum Fällen ausholst, rutscht dir das Beil fast aus der Hand. Du kannst es gerade noch so festhalten.", "As you strike out, you nearly drop the hatchet. You barely keep hold of it.", Character.highPriority)
    elseif effectType == "slimyAcid" then
        world:gfx(8,User.pos)
        world:gfx(11,User.pos)
        world:makeSound(9,User.pos)
        User:increaseAttrib("hitpoints",-1000)
        User:talk(Character.say, "#me wird, bevor die Axt den berühren kann, von einem dicken Batzen Schleim getroffen, der aus der Baumkrone heraustropfte.", "#me is, before the hatchet touches the tree, hit by a big blob of slime which dropped down from the treetrop.")
        User:inform("Der Schleim verursacht ein überaus schmerzhaftes Brennen auf deiner Haut.", "The slime causes very painful burning to your skin.", Character.highPriority)
    else
        User:inform("Als du zum Fällen ausholst, rutscht dir das Beil fast aus der Hand. Du kannst es gerade noch so festhalten.", "As you strike out, you nearly drop the hatchet. You barely keep hold of it.", Character.highPriority)
        debug("Tree at " .. theTree.x .. ", " .. theTree.y .. ", " .. theTree.z .. " is missing a proper data value for the data key treeProtectionType")
    end
end

local function isChoppableTree(targetItem)
    if targetItem ~= nil and TreeItems[targetItem.id] ~= nil then
        return true;
    end

    return false;
end

local function isUnchoppableTree(targetItem,User)
    if targetItem ~= nil and unchoppableTrees[targetItem.id] ~= nil then
        common.TurnTo( User, targetItem.pos )
        User:inform("Diese Baumart kann nicht gefällt werden.","This kind of tree cannot be cut down.")
        return true;
    end

end

local function checkForTree(User,theFunction)
    local targetItem = common.GetFrontItem(User);
    if theFunction(targetItem,User) then
        return targetItem;
    end

    for x=-1,1 do
        for y=-1,1 do
            local pos = position(User.pos.x+x,User.pos.y+y,User.pos.z);
            if ( world:isItemOnField(pos) ) then
                targetItem = world:getItemOnField(pos);
                if theFunction(targetItem,User) then
                    return targetItem;
                end
            end
        end
    end
    return nil
end

local function getTree(User)
    local tree = checkForTree(User,isChoppableTree)
    if not tree then
        if checkForTree(User,isUnchoppableTree) then
            return false
        end
    end

    return tree
end

local function isTree(itemId)
    if unchoppableTrees[itemId] or TreeItems[itemId] then
        return true
    end
    return false
end

function M.StartGathering(User, SourceItem, ltstate)

    local toolItem=shared.getTool(User, 74) --hatchet (74)

    if not toolItem then
        return
    end
    
    local gatheringBonus=shared.getGatheringBonus(User, toolItem)

    local theCraft = gathering.GatheringCraft:new{LeadSkill = Character.woodcutting, LearnLimit = 100}; -- id_74_axe
    theCraft:AddRandomPureElement(User,gathering.prob_element*gatheringBonus); -- Any pure element
    theCraft:SetTreasureMap(User,gathering.prob_map*gatheringBonus,"Fein säuberlich aufgerollt findest du eine Schatzkarte in einem ausgehöhlten Ast.","You find a treasure map neatly rolled up in a hollowed-out branch.");
    theCraft:AddMonster(User,91,gathering.prob_monster/gatheringBonus,"Dein Frevel gegen die Natur ruft die Wächter der Bäume herbei. Wie aus dem Nichts stampft ein wütender Troll auf dich zu.","From the nearby brush you hear a guttural snarl just before an angry troll emerges into the clearing. There is no doubt his eyes are trained on you.",4,7);
    theCraft:AddRandomItem(2441,1,333,{},gathering.prob_rarely,"Im Erdboden machst du einen alten, rostigen Helm aus. Ein Überbleibsel einer längst vergessenen Schlacht?","As you work you unearth an old rusty helmet. A remnant of a long-forgotten battle?"); --Storm cap
    theCraft:AddRandomItem(235,1,333,{},gathering.prob_occasionally,"In einer Spechthöhle findest du einen goldenen Ring. Wird er dich ins Dunkle treiben?","From a woodpecker's hole a golden gleam catches your eye, and you discover it is a golden ring."); --gold ring
    theCraft:AddRandomItem(2664,1,333,{},gathering.prob_frequently,"Du findest einen Ast, den man auch sehr gut als Keule verwenden könnte.","You find a branch that resembles a sturdy club."); --Club
   
    common.ResetInterruption( User, ltstate );
    if ( ltstate == Action.abort ) then -- work interrupted
        return
    end

    if not common.CheckItem( User, SourceItem ) then -- security check
        return
    end

    if not common.FitForWork( User ) then -- check minimal food points
        return
    end

    common.TurnTo( User, SourceItem.pos ); -- turn if necessary

    -- check if it is a special and therefore uncuttable tree
    if SourceItem:getData("treeProtectionType") ~= "" then
        preventCutting(User, toolItem, SourceItem)
        return
    end

    local tree = TreeItems[SourceItem.id];

    local isPlayerPlanted = SourceItem:getData("playerPlanted") ~= ""

    -- check the amount
    local changeItem = false;
    local amount = SourceItem:getData("wood_amount");
    if ( amount == "" ) then
        if isPlayerPlanted then
            amount = 1
        else
            amount = tree.Amount;
        end
        SourceItem:setData("wood_amount", "" .. amount);
        changeItem = true;
    else
        amount = tonumber(amount);
    end

    if ( amount <= 0 ) then
        -- should never happen, but handle it nevertheless
        world:erase(SourceItem, SourceItem.number)
        if isPlayerPlanted then
            common.HighInformNLS(User, "Der Baum war zu jung, um nachwachsen zu können.", "The tree was too young to regrow.")
        else
            world:createItemFromId(tree.TrunkId, 1, SourceItem.pos, true, 333, nil);
            common.HighInformNLS( User,
            "Hier gibt es kein Holz mehr zu holen. Gib dem Baum Zeit um nachzuwachsen.",
            "There is no wood anymore that you can chop. Give the tree time to grow again." );
        end
        return;
    end

    -- user feedback per nice animation
    User:performAnimation(5)

    if ( ltstate == Action.none ) then -- currently not working -> let's go
        theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User);
        User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 6, 0);
        if ( changeItem ) then
            world:changeItem(SourceItem);
        end
        return;
    end

    -- since we're here, we're working
    if theCraft:FindRandomItem(User) then
        if ( changeItem ) then
            world:changeItem(SourceItem);
        end
        return
    end

    User:learn( theCraft.LeadSkill, theCraft.SavedWorkTime[User.id], theCraft.LearnLimit);
    amount = amount - 1;
    SourceItem:setData("wood_amount", "" .. amount);
    world:changeItem(SourceItem);

    local producedItemId = tree.LogId;
    if (math.random() <= tree.HeartwoodProbability ) then
        producedItemId = tree.HeartwoodId;
    elseif (math.random() <= tree.BoughProbability ) then
        producedItemId = tree.BoughId;
    end
    local created = common.CreateItem(User, producedItemId, 1, 333, nil) -- create the new produced items
    if created then -- character can still carry something
        if (amount > 0) then  -- there are still items we can work on
            theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User);
            User:changeSource(SourceItem);
            if not shared.toolBreaks( User, toolItem, theCraft:GenWorkTime(User) ) then -- damage and possibly break the tool
                User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 6, 0);
            end
        end
    end

    if ( amount <= 0 ) then
        world:erase(SourceItem, SourceItem.number);
        if isPlayerPlanted then
            common.HighInformNLS(User, "Der Baum war zu jung, um nachwachsen zu können.", "The tree was too you to regrow.")
        else
            world:createItemFromId(tree.TrunkId, 1, SourceItem.pos, true, 333, nil);
            common.HighInformNLS( User,
            "Hier gibt es kein Holz mehr zu holen. Gib dem Baum Zeit um nachzuwachsen.",
            "There is no wood anymore that you can chop. Give the tree time to grow again." );
        end
        return
    end

end

-- Used by item/id_74_axe
M.getTree = getTree

-- Used by item/tree
M.isChoppableTree = isChoppableTree
M.isUnchoppableTree = isUnchoppableTree

-- Used by plantTree in item/id_52_filledbucket
M.isTree = isTree

return M
