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

local common = require("base.common")

local M = {}

function M.StoneToQuestprogress(StoneNumber)
    if StoneNumber < 2^31 then
        return StoneNumber
    else
        return 2^31- 1 - StoneNumber
    end
end

function M.QuestprogressToStones(qpg)
    if qpg<0 then
        return 2^31-1-qpg
    else
        return qpg
    end
end

function M.CheckStone(Char,StoneNumber)
    --Char:inform("*** CHECK ***");
    local retVal=false;
    local StoneBase=130+math.floor((StoneNumber-1)/32);  -- Stone 0 to 31 -> 0, 32-.. ->2 etc.
    --Char:inform("Stonebase: "..StoneBase);
    local StoneBaseOffset=math.fmod(StoneNumber-1,32);  -- StoneNr inside range
    --Char:inform("Offset: "..StoneBaseOffset);
    local HasStones=M.QuestprogressToStones(Char:getQuestProgress(StoneBase));
    --Char:inform("HasStones: "..HasStones);
    --Char:inform("thisstone: "..2^(StoneBaseOffset));
    if bit32.btest(bit32.lshift(1, StoneBaseOffset), HasStones) then
        retVal=true;
    end
    return retVal;
end

function M.CountStones(Char)
    local nrStones=0;
    local StoneBase=130;
    local StoneEnd=149;
    local stones
    for i=StoneBase,StoneEnd do
        stones=M.QuestprogressToStones(Char:getQuestProgress(i));
        --debug("In Countstones, questid "..i.." and stones "..stones)
        while stones~=0 do
            nrStones=nrStones+math.fmod(stones,2);
            stones=math.floor(stones/2);
        end
    end
    return nrStones
end

function M.WriteStone(Char,StoneNumber)
    local StoneBase=130+math.floor((StoneNumber-1)/32);  -- Stone 0 to 31 -> 0, 32-.. ->2 etc.
    --Char:inform("Base: "..StoneBase);
    local StoneBaseOffset=math.fmod(StoneNumber-1,32);  -- StoneNr inside range
    --Char:inform("Offset: "..StoneBaseOffset);
    --Char:inform("Base offset: " .. StoneBase .. " Stone Nr "..StoneBaseOffset .. " for stone "..StoneNumber);
    local currentStones=M.QuestprogressToStones(Char:getQuestProgress(StoneBase));
    --Char:inform("currently: "..currentStones);
    Char:setQuestProgress(StoneBase,M.StoneToQuestprogress(bit32.bor(2^StoneBaseOffset,currentStones)));
    --Char:inform("new: "..(2^StoneBaseOffset).." in total: "..(bit32.bor(2^StoneBaseOffset,currentStones)-2^31));
    --Char:inform("CHeck: "..CheckStone(Char,StoneNumber));
end

-- reward[x] = {y,z} - x = stones to have collected, y = item id , z= amount of y
local reward = {}
reward[1] = {{3077, 2}}; -- 2 silver coins (3077)
reward[5] = {{3077, 10},{16,1},{97,1},{463,1},{326,1}}; -- items worth 10 silver coins - silver coins, orc helmet, leather bag, quill, steel boots
reward[10] = {{3077, 20},{455, 10},{2421,1},{2760,1},{2763,1},{126,1},{72,1}} -- items worth 20 silver coins - silver coins, smoked trout, white priest robe, rope, pick-axe, sickle, fishing rod
reward[20] = {{3077, 30},{90,1},{310,1},{2537,5},{254,3}} -- items worth 30 silver coins - silver coins, flute, mug with lid, iron plate, raw diamond
reward[50] = {{3077, 60},{1152,1},{2719,1},{453,20},{64,150}} -- items worth 60 silver coins - silver coins, chicken soup, comb, cookies, arrows
reward[100] = {{61, 1},{559,2},{1059,1},{533,1},{1223,1},{51,5}} -- items worth 1 gold coin - gold coin, lamb dish, dice cup, drum, empty alchemy bomb, bucket
reward[200] = {{61,2},{3723,4},{281,1},{357,1},{3642,1}} -- items worth 2 gold coins - gold coins, nut bread, golden emerald ring, blue wizard hat, empty salve jar
reward[350] = {{61,5},{332,1},{558,1},{1491,1},{2571,10}} -- items worth 5 gold coins - gold coins, harp, archmage robe, holy chain pants, merinium ingot
reward[500] = {{61,7},{205,1},{207,1},{1039,1},{2731,1}} -- items worth 7 gold coins - gold coins, double axe, battle staff, twinblade ranseur, two-handed sword
reward[750] = {{61,10},{1052,1},{2742,1},{2400,1},{757,10}} -- items worth 10 gold coins - gold coins, dwarven stormhammer, red fire dagger, state armour, tybalt star

function M.getReward(Char)
    local nrStones = M.CountStones(Char)
    if reward[nrStones] ~= nil then
        if #reward[nrStones] == 1 then
            common.CreateItem(Char, reward[nrStones][1][1], reward[nrStones][1][2], 699, nil)
            Char:inform("Du hast zwei Silberstücke erhalten, da du den ersten Markierungsstein entdeckt hast. Weiter so!", "You have received two silver coins for discovering the first marker stone. Keep it up!");
            Char:setQuestProgress(320,2)
        else
            M.rewardDialog(Char, nrStones)
        end
    end
end

function M.rewardDialog(Char, nrStones)
    local title = common.GetNLS(Char,"Entdeckergilde Belohnung","Explorerguild reward")
    local text = common.GetNLS(Char,"Du hast "..nrStones.." Markierungssteine entdeckt, daher kannst du dir nun eine Belohnung aussuchen.", "You discovered "..nrStones.." marker stones, therefore you can pick a reward.")

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            common.CreateItem(Char, reward[nrStones][selected][1], reward[nrStones][selected][2], 699, nil)
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

return M
