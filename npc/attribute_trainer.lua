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
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue")
VALUES (0, 695, 311, 0, 6, 'Trainer Blight Ronin', 'npc.attribute_trainer', 0, 1, 5, 200, 200, 0, 140, 100, 10);
---]]


local common = require("base.common")
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
    local saidText = {}
    --saidText[i] = {said,answerId}
    saidText[1] = {"hello",1}
    saidText[2] = {"greet",1}
    saidText[3] = {"hail",1}
    saidText[4] = {"good day",1}
    saidText[5] = {"good morning",1}
    saidText[6] = {"good evening",1}
    saidText[7] = {"good night",1}
    saidText[8] = {"grüß",1}
    saidText[9] = {"gruß",1}
    saidText[10] = {"guten morgen",1}
    saidText[11] = {"guten tag",1}
    saidText[12] = {"guten abend",1}
    saidText[13] = {"gute nacht",1}
    saidText[14] = {"mahlzeit",1}
    saidText[15] = {"tach",1}
    saidText[16] = {"moin",1}
    saidText[17] = {"mohltied",1}
    saidText[18] = {"hiho",1}
    saidText[19] = {"hallo",1}
    saidText[20] = {"hey",1}
    saidText[21] = {"greeb",1}
    saidText[22] = {"farewell",2}
    saidText[23] = {"bye",2}
    saidText[24] = {"fare well",2}
    saidText[25] = {"see you",2}
    saidText[26] = {"tschüß",2}
    saidText[27] = {"tschüss",2}
    saidText[28] = {"wiedersehen",2}
    saidText[29] = {"gehab wohl",2}
    saidText[30] = {"ciao",2}
    saidText[31] = {"adieu",2}
    saidText[32] = {"au revoir",2}
    saidText[33] = {"farebba",2}
    saidText[34] = {"how are you",3}
    saidText[35] = {"how feel",3}
    saidText[36] = {"how do you do",3}
    saidText[37] = {"wie geht",3}
    saidText[38] = {"wie fühlst",3}
    saidText[39] = {"wie ist es ergangen",3}
    saidText[40] = {"wie befind",3}
    saidText[41] = {"your name",4}
    saidText[42] = {"who are you",4}
    saidText[43] = {"who art thou",4}
    saidText[44] = {"ihr name",4}
    saidText[45] = {"dein name",4}
    saidText[46] = {"wer bist du",4}
    saidText[47] = {"wer seid ihr",4}
    saidText[48] = {"wie heißt",4}
    saidText[49] = {"besser",5}
    saidText[50] = {"better",5}
    saidText[51] = {"improve",5}
    saidText[52] = {"god",6}
    saidText[53] = {"gott",6}
    saidText[54] = {"gött",6}

    
    local answeredText = {}
    answeredText[1] = {"Grüß dich!","Hallo mein Freund!","Hallo, lange nicht gesehen!","Be greeted!","Hello my friend!","Hello, I haven't seen you for awhile!"}
    answeredText[2] = {"Tschüss und viel Glück!","Man sieht sich!","Machs gut und pass auf dich auf!","Bye and good luck!","Goodbye and good luck!","Have fun!"}
    answeredText[3] = {"Danke und dir?","Ich kann nicht klagen aber du solltest das.","Mir ging es nie besser.","Thank you, and yourself?","I can't complain, but you should.","Never better than today."}
    answeredText[4] = {"Nenn mich der Bessere.","Trainer, einfach Trainer.","Ich bin "..npc.name..".","Call me the stronger guy.","Trainer, simply trainer.","I am "..npc.name.."."}
    answeredText[5] = {"Man kann immer besser werden. Man muss nur wollen.","Es gibt immer was zu tun, packen wir es an.","Wer will schon bleiben wie er ist?","You can always improve yourself, if you want.","There is always something to do. Let's start.","Do you really want to stay as you are?"}
    answeredText[6] = {"Wenn ich dich unter meine Fitiche nehme schauen die Götter lieber weg.","Was die Götter uns gaben können wir verbessern.","Dein Trainer ist dein siebzehnter Gott.","Be assured as I work with you the Gods close their eyes.","Gods give, gods take, but in the end we decide if we want to use the gifts at their best.","Your trainer is your seventeenth God."}
    
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
    
    for i=1,#saidText do
        if string.match(string.lower(text), saidText[i][1]) then
            local answerId = saidText[i][2]
            local textSelection = math.random(1,3)
            if not common.IsNilOrEmpty(answeredText[answerId][textSelection]) and not common.IsNilOrEmpty(answeredText[answerId][textSelection+3]) then
                common.TalkNLS(npc, Character.say,
                        answeredText[answerId][textSelection],
                        answeredText[answerId][textSelection+3])
                return
            end
        end
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
                
                if key ~= selectedReduce and ( user:isBaseAttributeValid(attribute, base + 1) or base < 8 )then
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
        
        if user:isBaseAttributeValid(attribute, base - 1) or base > 12 then
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
