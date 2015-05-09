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
-- INSERT INTO triggerfields VALUES (912,771,0,'triggerfield.potionToTeacher');
-- INSERT INTO triggerfields VALUES (376,223,0,'triggerfield.potionToTeacher');
-- INSERT INTO triggerfields VALUES (137,543,0,'triggerfield.potionToTeacher');

local common = require("base.common")
local id_3109_open_pell = require("item.id_3109_open_pell")
local alchemy = require("alchemy.base.alchemy")

local M = {}

local function getNPC(Item)
    local myNPC = false
    local npcList = world:getNPCSInRangeOf(Item.pos, 5)
    if npcList[1] == nil then
        return myNPC
    else
        for i = 1, #npcList do
            if (npcList[i].name == "Vallaria Medrota") or (npcList[i].name == "Grator Bottlebreak") or (npcList[i].name == "Joseph Quatrilla") then
                myNPC = npcList[i]
                break
            end
        end
    end
    return myNPC
end

local function getTown(Item)
    if Item.pos == position(912, 771, 0) then
        return "Runewick"
    elseif Item.pos == position(137, 543, 0) then
        return "Cadomyr"
    elseif Item.pos == position(376, 223, 0) then
        return "Galmair"
    end
    return false
end

local function TellRecipe(User, effectId)
    local ingredientList = alchemy.getIngredients(effectId)
    local recipeEN = "Potion: "..alchemy.potionName[effectId][1].."\n\nComponents:\nStock:\n"
    local recipeDE = "Trank: "..alchemy.potionName[effectId][2].."\n\nKomponenten:\nSud:\n"
    local dataZList = alchemy.SplitData(User,ingredientList[2])
    for i = 1, 8 do
        recipeEN = recipeEN..alchemy.wirkung_en[dataZList[i]].." "..alchemy.wirkstoff[i].."\n"
        recipeDE = recipeDE..alchemy.wirkung_de[dataZList[i]].." "..alchemy.wirkstoff[i].."\n"
    end
    recipeEN = recipeEN.."\nEssence brew based on "..world:getItemName(ingredientList[1],Player.english)..":\n"
    recipeDE = recipeDE.."\nEssenzgebräu auf "..world:getItemName(ingredientList[1],Player.german).."basis:\n"
    local success = false
    for i = 3, 10 do
        if ingredientList[i] == false then
            break
        else
            success = true
            recipeEN = recipeEN..world:getItemName(ingredientList[i],Player.english).."\n"
            recipeDE = recipeDE..world:getItemName(ingredientList[i],Player.german).."\n"
        end
    end
    if not success then
        recipeEN = recipeEN.."No essenced herbs"
        recipeDE = recipeDE.."Keine essenzierten Kräuter"
    end

    if recipeDE and recipeEN then
        -- message box for the results
        local callback = function(empty) end
        local dialog
        if User:getPlayerLanguage() == 0 then
            dialog = MessageDialog("Erlerntes Rezept", recipeDE, callback)
        else
            dialog = MessageDialog("Learned Recipe" , recipeEN, callback)
        end
        User:requestMessageDialog(dialog)
    end

end

function M.PutItemOnField(Item,User)
    local myNPC = getNPC(Item)

    -- is the char an alchemist?
    local anAlchemist = alchemy.CheckIfAlchemist(User)
    if not anAlchemist then
        myNPC:talk(Character.say, "Mir ist nicht bekannt, dass Ihr ein Alchemist sein sollt. Nehmt Euer Zeug wieder weg.", "I haven't heard that you are an alchemist. Take your stuff from my table.")
        return
    end

    local town = getTown(Item)
    if town == false then
        return
    end
    local ListTaskItem = id_3109_open_pell.ListTaskItem[town]
    local success = false
    local myListPos
    for i = 1, #ListTaskItem do
        if Item.id == ListTaskItem[i][1] then
            if (ListTaskItem[i][2] == false) or (math.floor(Item.quality/100) >= ListTaskItem[i][2]) then
                if ListTaskItem[i][3] == nil then
                    success = true
                    myListPos = i
                    break
                else
                    local dataCheck = true
                    for j = 3, #ListTaskItem[i] do
                        if not (Item:getData(ListTaskItem[i][j][1]) == ListTaskItem[i][j][2]) then
                            dataCheck = false
                            break
                        end
                    end
                    if dataCheck == true then
                        success = true
                        myListPos = i
                        break
                    end
                end
            end
        end
    end
    if success == false then
        myNPC:talk(Character.say, "Dafür werde ich Euch nichts lehren. Schaut auf meine Liste und zeigt mir, was Euch interessiert und ich sage Euch, was ich dafür verlange.", "I won't teach you anything for this. Have a look at my list, show me what you would like to learn and I will tell you what you have to give me in return.")

    else
        local ListEffectId = id_3109_open_pell.ListEffectId[town]
        if User:getQuestProgress(ListEffectId[myListPos]+1000) ~= 0 then
            myNPC:talk(Character.say, "Mhh. Ich würde Euch wohl dafür etwas zeigen, aber Ihr macht den Eindruck, diese Kenntnisse schon zu haben.", "Hmm. Well, I would teach you something for this, but you seem to already have this knowledge.")
        else
            myNPC:talk(Character.say, "Ah! Sehr gut, sehr gut! Nun denn, Ihr habt es Euch verdient. Schaut genau her.", "Ah! Very good, very good! Well, you've earned your pay. Look closely.")
            world:erase(Item,1)
            myNPC:talk(Character.say, "#me beginnt sorgsam und langsam die einzelnen Zutaten vorzubereiten und dann zu verarbeiten, darauf Acht gebend, dass keine Unbefugten es sehen können. \"So geht das richtig.\"", "#me starts to prepare the ingredients carefully and slowly and then to process them, while making sure that no unauthorized eyes have a look at it. \"So this goes properly.\"")
            User:setQuestProgress(ListEffectId[myListPos]+1000,1)
            TellRecipe(User,ListEffectId[myListPos])
        end
    end
end

return M

