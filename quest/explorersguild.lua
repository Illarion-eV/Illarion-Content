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

-- This module holds the core functions for the explorers guild.
-- The questIDs start at 130 and go to 150.
-- Written by Martin and Lillian

require("base.common")

module("quest.explorersguild", package.seeall)

function StoneToQuestprogress(StoneNumber)
	if StoneNumber < 2^31 then
		return StoneNumber
	else
		return 2^31- 1 - StoneNumber
	end
end

function QuestprogressToStones(qpg)
	if qpg<0 then
		return 2^31-1-qpg
	else
		return qpg
	end
end

function CheckStone(Char,StoneNumber)
    --Char:inform("*** CHECK ***");
	retVal=false;
    StoneBase=130+math.floor((StoneNumber-1)/32);  -- Stone 0 to 31 -> 0, 32-.. ->2 etc.
	--Char:inform("Stonebase: "..StoneBase);
    StoneBaseOffset=math.fmod(StoneNumber-1,32);  -- StoneNr inside range
	--Char:inform("Offset: "..StoneBaseOffset);
    HasStones=QuestprogressToStones(Char:getQuestProgress(StoneBase));
	--Char:inform("HasStones: "..HasStones);
	--Char:inform("thisstone: "..2^(StoneBaseOffset));
    GotStone=LuaAnd(2^(StoneBaseOffset),HasStones);
	--Char:inform("GotStone: "..GotStone);
    if GotStone>0 then
        retVal=true;
    end
    return retVal;
end

function CountStones(Char)
    nrStones=0;
    StoneBase=130;
    StoneEnd=149;
    for i=StoneBase,StoneEnd do
        stones=QuestprogressToStones(Char:getQuestProgress(i));
		--debug("In Countstones, questid "..i.." and stones "..stones)
        while stones~=0 do
            nrStones=nrStones+math.fmod(stones,2);
            stones=math.floor(stones/2);
        end
    end
    return nrStones
end

function WriteStone(Char,StoneNumber)
    StoneBase=130+math.floor((StoneNumber-1)/32);  -- Stone 0 to 31 -> 0, 32-.. ->2 etc.
	--Char:inform("Base: "..StoneBase);
    StoneBaseOffset=math.fmod(StoneNumber-1,32);  -- StoneNr inside range
    --Char:inform("Offset: "..StoneBaseOffset);
	--Char:inform("Base offset: " .. StoneBase .. " Stone Nr "..StoneBaseOffset .. " for stone "..StoneNumber);
    currentStones=QuestprogressToStones(Char:getQuestProgress(StoneBase));
    --Char:inform("currently: "..currentStones);
	Char:setQuestProgress(StoneBase,StoneToQuestprogress(LuaOr(2^StoneBaseOffset,currentStones)));
	--Char:inform("new: "..(2^StoneBaseOffset).." in total: "..(LuaOr(2^StoneBaseOffset,currentStones)-2^31));
	--Char:inform("CHeck: "..CheckStone(Char,StoneNumber));
end

-- reward[x] = {y,z} - x = stones to have collected, y = item id , z= amount of y
reward = {}
reward[1] = {{3077, 2}}; -- 2 silver coins (3077)
reward[5] = {{3077, 10},{49,1},{97,1},{463,1},{842,1}}; -- items worth 10 silver coins - silver coins, bread, leather bag, quill, green white skirt
reward[10] = {{3077, 20},{455, 10},{812,1},{2629,1},{2359,1},{126,1},{72,1}} -- items worth 20 silver coins - silver coins, smoked fish, black doublet, light battle axe, mercenary armour, sickle, fishing rod
reward[20] = {{3077, 30},{53,1},{2360,1},{454,4},{18,1}} -- items worth 30 silver coins - silver coins, leather boots, Guardians armour, blackberry muffins, light shield
reward[50] = {{3077, 60},{2727, 1},{353,3},{2403,1},{2384,1}} -- items worth 60 silver coins - silver coins, fire hunters bow, apple pie, elvensilversteel armour, black coat
reward[100] = {{61, 1},{557,4},{2675,1},{2302,1},{2419,1},{51,5}} -- items worth 1 gold coin - gold coin, steak dish, rapier, gynk mercenary helm, red priest robe, bucket
reward[200] = {{61,2},{554,5},{1053,1},{696,1},{845,1}} -- items worth 2 gold coins - gold coins, vension dish, divine voulge, lizard armour, blue green heraldic dress
reward[350] = {{61,5},{354,14},{558,1},{96,1},{2367,1}} -- items worth 5 gold coins - gold coins, strawberry cakes, archmage robe, steel tower shield, albarian nobles armour
reward[500] = {{61,7},{2551,14},{2552,14},{2553,14},{2554,14}} -- items worth 7 gold coins - gold coins, pure aire, pure earth, pure fire, pure water
reward[750] = {{61,10},{1052,1},{2400,1},{2662,1},{1155,20}} -- items worth 10 gold coins - gold coins, dwarven stormhammer, elven state armour, magical dwarven axe, chicken dish

function getReward(Char)
	local nrStones = CountStones(Char)
	if reward[nrStones] ~= nil then
		if #reward[nrStones] == 1 then
			Char:createItem(reward[nrStones][1][1],reward[nrStones][1][2],699,nil);
			Char:inform("Du hast 2 Silberstücke erhalten, da du den ersten Markierungsstein entdeckt hast. Weiter so!", "You have received two silver coins for discovering the first marker stone. Keep it up!");
			Char:setQuestProgress(320,2)
		else
			rewardDialog(Char, nrStones)
		end
	end
end
	
function rewardDialog(Char, nrStones)
	local title = base.common.GetNLS(Char,"Entdeckergilde Belohnung","Explorerguild reward")
	local text = base.common.GetNLS(Char,"Du hast "..nrStones.." Markierungssteine entdeckt, daher kannst du dir nun eine Belohnung aussuchen.", "You discovered "..nrStones.." marker stones, therefore you can pick a reward.")
	
	local callback = function(dialog) 
		local success = dialog:getSuccess() 
		if success then
			selected = dialog:getSelectedIndex()+1
			Char:createItem(reward[nrStones][selected][1],reward[nrStones][selected][2], 699, nil);	
		end
	end

	local dialog = SelectionDialog(title, text, callback);
	
	local itemName;
	local language = Char:getPlayerLanguage();
	for i=1, #(reward[nrStones]) do
		itemName = world:getItemName(reward[nrStones][i][1],language);
		dialog:addOption(reward[nrStones][i][1], reward[nrStones][i][2].." "..itemName);
	end

	Char:requestSelectionDialog(dialog);
end