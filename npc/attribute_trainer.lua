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
--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue")
VALUES (0, 898, 801, 0, 4, 'Trainer El Cycib', 'npc.attribute_trainer', 0, 1, 5, 200, 200, 0, 140, 100, 10);
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue")
VALUES (0, 124, 581, 0, 6, 'Trainer David', 'npc.attribute_trainer', 0, 1, 5, 200, 200, 0, 140, 100, 10);
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue")
VALUES (0, 355, 254, 0, 4, 'Trainer Cloud McGoughey', 'npc.attribute_trainer', 0, 1, 5, 200, 200, 0, 140, 100, 10);
---]]


local money = require("base.money")
local M = {}

local init = {};

function M.nextCycle(npc)
    if not init[npc.id] then
        npc:createAtPos(3, 458, 1)
        npc:createAtPos(11, 195, 1)
        npc:createAtPos(5, 2622, 1)
        npc:createAtPos(9, 460, 1)
        npc:createAtPos(10, 369, 1)
        init[npc.id] = true
    end
end

function M.useNPC(npc, user)
    M.receiveText(npc, nil, "train", user)
end

function M.receiveText(npc, ttype, text, user)
    if not npc:isInRange(user, 2) then
        return
    end

    if string.match(text, "[Hh]elp") then
        user:inform("[Help] This NPC is a trainer. Ask him for training to change your basic attributes permanently, for a small fee of course.")
        return
    end
    
    if string.match(text, "[Hh]ilf") then
        user:inform("[Hilfe] Dieser NPC ist ein Trainer. Bitte ihn dich zu trainieren um deine grundlegenden Attribute dauerhaft zu ändern, gegen eine geringe Gebühr natürlich.")
        return
    end
    
    if not string.match(text, "[Tt]rain") then
        return
    end

    if user:getBaseAttributeSum() ~= user:getMaxAttributePoints() then
	    user:inform("Der Trainer weigert sich dich auszubilden (irreguläre Attribute)!",
	            "The trainer refuses to train you (irregular attributes)!", Character.highPriority)
	    return
	end

    local questId = 35
    local attributes = {"agility", "constitution", "dexterity", "essence", "intelligence", "perception", "strength", "willpower"}
	local attributesText, attributesKey, reduceText, increaseText
	local reduceOptions = {}
	local increaseOptions = {}
	
	local questProgress = user:getQuestProgress(questId)
	local costInGold = 2 ^ math.min(questProgress, 7)
	local cost = costInGold * 10000
	
	if user:getPlayerLanguage() == Player.german then
	    attributesText = {"Ausdauer", "Beweglichkeit", "Essenz", "Geschicklichkeit", "Intelligenz", "Stärke", "Wahrnehmung", "Willenskraft"}
	    attributesKey = {2, 1, 4, 3, 5, 7, 6, 8}
	    local costText = "\nDer Abschluss des Trainings wird dich " .. costInGold .. " Gold kosten."
	    reduceText = "Welches Attribut möchtest du verringern?" .. costText
	    increaseText = "Welches Attribut möchtest du erhöhen?" .. costText
	else
	    attributesText = {"Agility", "Constitution", "Dexterity", "Essence", "Intelligence", "Perception", "Strength", "Willpower"}
	    attributesKey = {1, 2, 3, 4, 5, 6, 7, 8}
	    local costText = "\nCompleting the training will cost you " .. costInGold .. " gold."
	    reduceText = "Which attribute do you want to reduce?" .. costText
	    increaseText = "Which attribute do you want to increase?" .. costText
	end

	local reduceCallback = function (dialog)
		if dialog:getSuccess() then
		    local selectedReduce = reduceOptions[dialog:getSelectedIndex() + 1]
		    local reduceAttribute = attributes[attributesKey[selectedReduce]]
			
			local increaseCallback = function (dialog)
			    if dialog:getSuccess() then
			        local selectedIncrease = increaseOptions[dialog:getSelectedIndex() + 1]
			        local increaseAttribute = attributes[attributesKey[selectedIncrease]]
			        			        
			        if questProgress ~= user:getQuestProgress(questId) then
			            user:inform("Der Trainer verflucht dich als dein Betrug auffliegt! Du hast ein mulmiges Gefühl.",
	                            "The trainer curses you as your fraud is detected! You have a queasy feeling.", Character.highPriority)
			            return
			        end
			        
			        if not money.CharHasMoney(user, cost) then
			            user:inform("Du hast nicht genug Geld!",
	                            "You do not have enough money!", Character.highPriority)
			            return
			        end
			        
			        if user:increaseBaseAttribute(reduceAttribute, -1) then
			            if user:increaseBaseAttribute(increaseAttribute, 1) then
			                if user:saveBaseAttributes() then
			                    money.TakeMoneyFromChar(user, cost)
			                    user:setQuestProgress(questId, questProgress + 1)
			                    
			                    local reduced = user:getBaseAttribute(reduceAttribute)
			                    local increased = user:getBaseAttribute(increaseAttribute)
			                    local caption, message
			                    local changesText = attributesText[selectedReduce] .. ": " .. (reduced+1) .. " -> " .. reduced .. "\n" ..
			                            attributesText[selectedIncrease] .. ": " .. (increased-1) .. " -> " .. increased
			                    
			                    if user:getPlayerLanguage() == Player.german then
			                        caption = "Erfolg!"
			                        message = "Nachdem du dir den Schweiß abgewischt hast fühlst du dich wie neu geboren. " ..
			                                "Dank harten Trainings konntest du deine grundlegenden Begabungen wie folgt ändern:\n\n" ..
			                                changesText .. "\n\n" ..
			                                "Dieses Training hat dich nur läppische " .. costInGold .. " Gold gekostet!"
			                    else
			                        caption = "Success!"
			                        message = "After you wiped off some sweat you feel like you have been reborn. " ..
			                                "Due to hard training you were able to change your basic abilities as follows:\n\n" ..
			                                changesText .. "\n\n" ..
			                                "This training only cost you the ridiculous sum of " .. costInGold .. " gold!"
	                            end
	                            
	                            local successMessage = MessageDialog(caption, message, function(dialog) end)
	                            user:requestMessageDialog(successMessage)
			                else
			                    -- safety net: should never happen
			                    user:increaseBaseAttribute(increaseAttribute, -1)
			                    user:increaseBaseAttribute(reduceAttribute, 1)
			                    user:inform("Der Trainer weigert sich dich auszubilden (kann nicht speichern)!",
	                                    "The trainer refuses to train you (cannot save)!", Character.highPriority)
			                end
			            else
			                -- safety net: should never happen
			                user:increaseBaseAttribute(reduceAttribute, 1)
			                user:inform("Der Trainer weigert sich dich auszubilden (kann nicht erhöhen)!",
	                                "The trainer refuses to train you (cannot increase)!", Character.highPriority)
			            end
			        else
			            -- safety net: should never happen
			            user:inform("Der Trainer weigert sich dich auszubilden (kann nicht verringern)!",
	                            "The trainer refuses to train you (cannot reduce)!", Character.highPriority)
			        end
			    end
			end
			
			local requestIncreaseAttribute = SelectionDialog("Trainer", increaseText, increaseCallback)
			requestIncreaseAttribute:setCloseOnMove()
			
			for key, text in ipairs(attributesText) do
        	    local attribute = attributes[attributesKey[key]]
        	    local base = user:getBaseAttribute(attribute)
        	    
        	    if key ~= selectedReduce and user:isBaseAttributeValid(attribute, base + 1) then
                    local value = user:increaseAttrib(attribute, 0)
                    local valueText = ": " .. base
                    
                    if value ~= base then
                        valueText = valueText .. " (" .. value .. ")"
                    end
                	
                	table.insert(increaseOptions, key)
                	requestIncreaseAttribute:addOption(0, text .. valueText)
                end
        	end
        	
        	user:requestSelectionDialog(requestIncreaseAttribute)
		end
	end
	
	local requestReduceAttribute = SelectionDialog("Trainer", reduceText, reduceCallback)
	requestReduceAttribute:setCloseOnMove()
	
	for key, text in ipairs(attributesText) do
	    local attribute = attributes[attributesKey[key]]
	    local base = user:getBaseAttribute(attribute)
	    
	    if user:isBaseAttributeValid(attribute, base - 1) then
            local value = user:increaseAttrib(attribute, 0)
            local valueText = ": " .. base
            
            if value ~= base then
                valueText = valueText .. " (" .. value .. ")"
            end
        	
        	table.insert(reduceOptions, key)
        	requestReduceAttribute:addOption(0, text .. valueText)
        end
	end
	
	user:requestSelectionDialog(requestReduceAttribute)
end

return M
