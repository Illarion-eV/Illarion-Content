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
reward[5] = {{3077, 10},{49,1},{841,1},{463,1},{27,1}}; -- items worth 10 silver coins
reward[10] = {{3077, 20},{455, 10},{21,20},{325,1},{230,1}} -- items worth 20 silver coins
reward[20] = {{3077, 30},{322,50},{1,1},{9,1},{2922,1}} -- items worth 30 silver coins
reward[50] = {{3077, 60},{1062, 6},{353,3},{811,1},{297,1}} -- items worth 60 silver coins
reward[100] = {{61, 1},{2390,1},{2647,5},{557,4},{2675,1}} -- items worth 1 gold coin
reward[200] = {{61,2},{2369,1},{164,30},{2718,1},{547,1}} -- items worth 2 gold coins
reward[350] = {{61,3},{193,1},{2685,1},{559,7},{2360,1}} -- items worth 3 gold coins
reward[500] = {{61,5},{2551,10},{2552,10},{2553,10},{2554,10}} -- items worth 5 gold coins
reward[750] = {{61,8},{2367,1},{2693,1},{2662,1},{559,10}} -- items worth 8 gold coins

function getReward(Char)
	local nrStones = CountStones(Char)
	if reward[nrStones] ~= nil then
		if #reward[nrStones] == 1 then
			Char:createItem(reward[nrStones][1][1],reward[nrStones][1][2],333,nil);
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
			Char:createItem(reward[nrStones][selected][1],reward[nrStones][selected][2], 800, nil);	
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