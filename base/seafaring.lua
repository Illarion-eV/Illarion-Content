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
local common = require("base.common")
local doors = require("base.doors")
local factions = require("base.factions")
local character = require("base.character")
local money = require("base.money")

local M = {}

M.ferrySourceItemPos={position(101,790,0),position(727,809,0),position(888,485,0),position(870,285,0),position(451,95,0),position(105,833,0),position(554,658,0)}

local ferryDE={}
local ferryEN={}
--ferryDE[1]={"Bauerninsel","Cadomyr - Verlorener Hafen","Leuchtturm","Einsame Inseln ","Runewick Hafen","Ostland Hafen","Nördlicher Hafen"} --for the future with farmer island & lonely islands
--ferryEN[1]={"Farmer Island","Cadomyr - Lost Harbour","Lighthouse","Lonely Islands","Runewick Harbour","Eastland Harbour","Northern Harbour"} --for the future with farmer island & lonely islands
ferryDE[1]={"Cadomyr - Verlorener Hafen","Leuchtturm","Runewick Hafen","Ostland Hafen","Nördlicher Hafen"}  ---replace this with the one above
ferryEN[1]={"Cadomyr - Lost Harbour","Lighthouse","Runewick Harbour","Eastland Harbour","Northern Harbour"}  ---replace this with the one above
--ferryDE[2]={"Cadomyr Hafen","Bauern Insel","Cadomyr - Verlorener Hafen","Leuchtturm","Einsame Inseln","Ostland Hafen","Nördlicher Hafen"} --for the future with farmer island & lonely islands
--ferryEN[2]={"Cadomyr Harbour","Farmer Island","Cadomyr - Lost Harbour","Lighthouse","Lonely Islands","Eastland Harbour","Northern Harbour"} --for the future with farmer island & lonely islands
ferryDE[2]={"Cadomyr Hafen","Cadomyr - Verlorener Hafen","Leuchtturm","Ostland Hafen","Nördlicher Hafen"}  ---replace this with the one above
ferryEN[2]={"Cadomyr Harbour","Cadomyr - Lost Harbour","Lighthouse","Eastland Harbour","Northern Harbour"}  ---replace this with the one above
ferryDE[3]={"Cadomyr Hafen","Runewick Hafen","Nördlicher Hafen"}
ferryEN[3]={"Cadomyr Harbour","Runewick Harbour","Northern Harbour"}
--ferryDE[4]={"Cadomyr Hafen","Runewick Hafen","Ostland Hafen","Böser Fels"}  ---for the future with Evil Rock
--ferryEN[4]={"Cadomyr Harbour","Runewick Harbour","Eastland Harbour","Evil Rock"}  ---for the future with Evil Rock
ferryDE[4]={"Cadomyr Hafen","Runewick Hafen","Ostland Hafen"}  ---replace this with the one above
ferryEN[4]={"Cadomyr Harbour","Runewick Harbour","Eastland Harbour"}  ---replace this with the one above
ferryDE[5]={"Nördliche Inseln - Ra","Nördliche Inseln - Hept","Nördliche Inseln - Yeg","Nördliche Inseln - Sohl","Nördliche Inseln - Pen","Unüberwindbarer Limes"}
ferryEN[5]={"Northern Islands - Ra","Northern Islands - Hept","Northern Islands - Yeg","Northern Islands - Sohl","Northern Islands - Pen","Insurmountable Limes"}
--ferryDE[6]={"Bauerninsel","Cadomyr Hafen","Leuchtturm","Einsame Inseln ","Runewick Hafen","Ostland Hafen","Nördlicher Hafen"} --for the future with farmer island & lonely islands
--ferryEN[6]={"Farmer Island","Cadomyr Harbour","Lighthouse","Lonely Islands","Runewick Harbour","Eastland Harbour","Northern Harbour"} --for the future with farmer island & lonely islands
ferryDE[6]={"Cadomyr Hafen","Leuchtturm","Runewick Hafen","Ostland Hafen","Nördlicher Hafen"}  ---replace this with the one above
ferryEN[6]={"Cadomyr Harbour","Lighthouse","Runewick Harbour","Eastland Harbour","Northern Harbour"}  ---replace this with the one above
--ferryDE[7]={"Bauerninsel","Cadomyr Hafen","Cadomyr - Verlorener Hafen","Einsame Inseln ","Runewick Hafen","Ostland Hafen","Nördlicher Hafen"} --for the future with farmer island & lonely islands
--ferryEN[7]={"Farmer Island","Cadomyr Harbour","Cadomyr - Lost Harbour","Lonely Islands","Runewick Harbour","Eastland Harbour","Northern Harbour"} --for the future with farmer island & lonely islands
ferryDE[7]={"Cadomyr Hafen","Cadomyr - Verlorener Hafen","Runewick Hafen","Ostland Hafen","Nördlicher Hafen"}  ---replace this with the one above
ferryEN[7]={"Cadomyr Harbour","Cadomyr - Lost Harbour","Runewick Harbour","Eastland Harbour","Northern Harbour"}  ---replace this with the one above


local ferrytravelDE={}
local ferrytravelEN={}
--ferrytravelDE[1]={"der Bauerninsel","nach Cadomyr - Verlorener Hafen","zum Leuchtturm","zu den Einsamen Inseln","nach Runewick Hafen","nach Ostland Hafen","zum Nördlichen Hafen"} --for the future with farmer island & lonely islands
--ferrytravelEN[1]={"Farmer Island","Cadomyr - Lost Harbour","Lighthouse","Lonely Islands","Runewick Harbour","Eastland Harbour","Northern Harbour"} --for the future with farmer island & lonely islands
ferrytravelDE[1]={"nach Cadomyr - Verlorener Hafen","zum Leuchtturm","nach Runewick Hafen","nach Ostland Hafen","zum Nördlichen Hafen"}  ---replace this with the one above
ferrytravelEN[1]={"Cadomyr - Lost Harbour","Lighthouse","Runewick Harbour","Eastland Harbour","Northern Harbour"}  ---replace this with the one above
--ferrytravelDE[2]={"nach Cadomyr Hafen","der Bauern Insel","nach Cadomyr - Verlorener Hafen","zum  Leuchtturm","zu den Einsamen Inseln","zum Ostland Hafen","zum Nördlichen Hafen"} --for the future with farmer island & lonely islands
--ferrytravelEN[2]={"Cadomyr Harbour","Farmer Island","Cadomyr - Lost Harbour","Lighthouse","Lonely Islands","Eastland Harbour","Northern Harbour"} --for the future with farmer island & lonely islands
ferrytravelDE[2]={"nach Cadomyr Hafen","nach Cadomyr - Verlorener Hafen","zum  Leuchtturm","zum Ostland Hafen","zum Nördlichen Hafen"}  ---replace this with the one above
ferrytravelEN[2]={"Cadomyr Harbour","Cadomyr - Lost Harbour","Lighthouse","Eastland Harbour","Northern Harbour"}  ---replace this with the one above
ferrytravelDE[3]={"nach Cadomyr Hafen","nach Runewick Hafen","zum Nördlichen Hafen"}
ferrytravelEN[3]={"Cadomyr Harbour","Runewick Harbour","Northern Harbour"}
--ferrytravelDE[4]={"nach Cadomyr Hafen","nach Runewick Hafen","nach Ostland Hafen","zum Bösen Fels"}  ---for the future with Evil Rock
--ferrytravelEN[4]={"Cadomyr Harbour","Runewick Harbour","Eastland Harbour","Evil Rock"}  ---for the future with Evil Rock
ferrytravelDE[4]={"nach Cadomyr Hafen","nach Runewick Hafen","zum Ostland Hafen"}  ---replace this with the one above
ferrytravelEN[4]={"Cadomyr Harbour","Runewick Harbour","Eastland Harbour"}  ---replace this with the one above
ferrytravelDE[5]={"zu den Nördlichen Inseln -  Ra","zu den Nördlichen Inseln -  Hept","zu den Nördlichen Inseln -  Yeg","zu den Nördlichen Inseln -  Sohl","zu den Nördlichen Inseln -  Pen","zum Unüberwindbaren Limes"}
ferrytravelEN[5]={"Northern Islands -  Ra","Northern Islands -  Hept","Northern Islands -  Yeg","zu den Nördlichen Inseln -  Sohl","zu den Nördlichen Inseln -  Pen","Insurmountable Limes"}
--ferrytravelDE[6]={"der Bauerninsel","nach Cadomyr Hafen","zum Leuchtturm","zu den Einsamen Inseln","nach Runewick Hafen","nach Ostland Hafen","zum Nördlichen Hafen"} --for the future with farmer island & lonely islands
--ferrytravelEN[6]={"Farmer Island","Cadomyr Harbour","Lighthouse","Lonely Islands","Runewick Harbour","Eastland Harbour","Northern Harbour"} --for the future with farmer island & lonely islands
ferrytravelDE[6]={"nach Cadomyr Hafen","zum Leuchtturm","nach Runewick Hafen","nach Ostland Hafen","zum Nördlichen Hafen"}  ---replace this with the one above
ferrytravelEN[6]={"Cadomyr Harbour","Lighthouse","Runewick Harbour","Eastland Harbour","Northern Harbour"}  ---replace this with the one above
--ferrytravelDE[7]={"der Bauerninsel","nach Cadomyr Hafen","nach Cadomyr - Verlorener Hafen","zu den Einsamen Inseln","nach Runewick Hafen","nach Ostland Hafen","zum Nördlichen Hafen"} --for the future with farmer island & lonely islands
--ferrytravelEN[7]={"Farmer Island","Cadomyr Harbour","Cadomyr - Lost Harbour","Lonely Islands","Runewick Harbour","Eastland Harbour","Northern Harbour"} --for the future with farmer island & lonely islands
ferrytravelDE[7]={"nach Cadomyr Hafen","nach Cadomyr - Verlorener Hafen","nach Runewick Hafen","nach Ostland Hafen","zum Nördlichen Hafen"}  ---replace this with the one above
ferrytravelEN[7]={"Cadomyr Harbour","Cadomyr - Lost Harbour","Runewick Harbour","Eastland Harbour","Northern Harbour"}  ---replace this with the one above



local ferryItem={}
--ferryItem[1]={259,272,467,3099,105,2760,308} --for the future with farmer island & lonely islands
ferryItem[1]={272,467,105,2760,308}  ---replace this with the one above
--ferryItem[2]={2701,259,272,467,3099,2760,308} --for the future with farmer island & lonely islands
ferryItem[2]={2701,272,467,2760,308}  ---replace this with the one above
ferryItem[3]={2701,105,308}
--ferryItem[4]={2701,105,2760,915}  ---for the future with Evil Rock
ferryItem[4]={2701,105,2760}  ---replace this with the one above
ferryItem[5]={359,360,372,1272,467,474}
--ferryItem[6]={259,2701,467,3099,105,2760,308} --for the future with farmer island & lonely islands
ferryItem[6]={2701,467,105,2760,308}  ---replace this with the one above
--ferryItem[7]={259,2701,272,3099,105,2760,308} --for the future with farmer island & lonely islands
ferryItem[7]={2701,272,105,2760,308}  ---replace this with the one above



local ferryTargetPos={}
--ferryTargetPos[1]={position(86,980,0),position(105,832,0),position(553,658,0),position(616,859,0),position(728,809,0),position(888,486,0),position(870,286,0)} --for the future with farmer island & lonely islands
ferryTargetPos[1]={position(105,832,0),position(553,658,0),position(728,809,0),position(888,486,0),position(870,286,0)}  ---replace this with the one above
--ferryTargetPos[2]={position(102,790,0),position(86,980,0),position(105,832,0),position(553,658,0),position(616,859,0),position(888,486,0),position(870,286,0) --for the future with farmer island & lonely islands
ferryTargetPos[2]={position(102,790,0),position(105,832,0),position(553,658,0),position(888,486,0),position(870,286,0)}  ---replace this with the one above
ferryTargetPos[3]={position(102,790,0),position(728,809,0),position(870,286,0)}
--ferryTargetPos[4]={position(102,790,0),position(728,809,0),position(888,486,0),position(987,256,0)}  ---for the future with Evil Rock
ferryTargetPos[4]={position(102,790,0),position(728,809,0),position(888,486,0),}  ---replace this with the one above
ferryTargetPos[5]={position(364,49,0),position(415,85,0),position(478,34,0),position(424,24,0),position(389,39,0),position(682,45,0)}
--ferryTargetPos[6]={position(86,980,0),position(102,790,0),position(553,658,0),position(616,859,0),position(728,809,0),position(888,486,0),position(870,286,0)} --for the future with farmer island & lonely islands
ferryTargetPos[6]={position(102,790,0),position(553,658,0),position(728,809,0),position(888,486,0),position(870,286,0)}  ---replace this with the one above
--ferryTargetPos[7]={position(86,980,0),position(102,790,0),position(105,832,0),position(616,859,0),position(728,809,0),position(888,486,0),position(870,286,0)} --for the future with farmer island & lonely islands
ferryTargetPos[7]={position(102,790,0),position(105,832,0),position(728,809,0),position(888,486,0),position(870,286,0)}  ---replace this with the one above


local pirateOptionsDE={"Kämpfe gegen die Piraten","Fliehe vor den Piraten (25% Erfolgschance, ansonsten wartet der Kampf)","Zahle ein Goldstück, um verschont zu bleiben."}
local pirateOptionsEN={"Fight against the pirates","Flee from the pirates (25% chance of success, otherwise you have to fight)","Pay a gold coin in order to be spared"}

local pirateItem={1,53,61}


local monster={}; ---monster, numbers are archers -> excluded currently
monster[1]={1,2,3,4,5}; --human
monster[2]={11,12,13,14}; --dwarf 15
monster[3]={21,22,23,24}; --halfling 25
monster[4]={31,32,33,34}; --elf 35
monster[5]={41,42,43,45}; --orc 44
monster[6]={51,53,53,54,55}; -- lizard
monster[7]={91,92,93,95,791,792,793,796}; -- troll 94,794,795
monster[8]={101,102,103,104,106,151,152,171,172,173}; -- mummy
monster[9]={111,112,113,114,115}; --skeleton
monster[10]={573,574,576,577,578}; --rats 575
monster[11]={891,892,893,901,902,903}; --Imp
monster[12]={782,783}; --golden skeleton 784
monster[13]={301,311,321,331,341}; --golem
monster[14]={851,852,853,861,862,863,871,872,873,881,882,883}; --hellhound
monster[15]={62,63,64,65}; -- drow 61
monster[16]={201,202,203,204}; --demon skeleton 205


local piratesSpawnGround={position(349,869,1),position(349,873,1),position(350,881,1),position(352,884,1),position(356,885,1),position(359,882,1),position(359,879,1),position(359,871,1)}
local piratesSpawnTop={position(351,863,2),position(355,862,2),position(357,863,2)}

M.pirateDoors={position(354,873,0),position(355,873,0)}

M.travlerslist={}

function M.Ferry(User, SourceItem)
    local chanceforpirateattack = math.random(1,100)
    local names
    local namestravel
    local items
    local targetPos
    local Amountferry = #M.ferrySourceItemPos
    for j = 1,Amountferry do
       if (SourceItem.pos == M.ferrySourceItemPos[j]) then
        if  User:getPlayerLanguage() == Player.german then
            names = ferryDE[j]
            namestravel = ferrytravelDE[j]
        else
            names = ferryEN[j]
            namestravel = ferrytravelEN[j]
        end

        items = ferryItem[j]
        targetPos = ferryTargetPos[j]
       end
    end

    local callback = function(dialog)

        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()
            if  money.CharHasMoney(User,1000) then

                    money.TakeMoneyFromChar(User,1000)
                    local travlers = world:getPlayersInRangeOf(SourceItem.pos, 5)
                    M.travlerslist[User.name] = travlers

                    if chanceforpirateattack < 6 and SomeoneThere(User) ~= true then --chance of 5% and noone else is there
                        M.previousselected = {}
                        for i,player in ipairs(M.travlerslist[User.name]) do
                            M.previousselected[player.name] = selected
                        end
                        portalremoveforleftovers(User)
                        piratesAttack(User)
                        for i,player in ipairs(M.travlerslist[User.name]) do
                            player:inform("[Hinweis 1] Piraten nähern sich dem Schiff. Folgende Möglichkeiten stehen zur Wahl: Kämpfen, fliehen oder ein Goldstück zahlen.", "[Information 1] Pirates are coming closer to your ship. You can choose between the following options: fight, flee or pay a gold coin.")
                            player:inform("[Hinweis 2] Auswählen in der Auswahl-Box kann die Person, die für die Fährenfahrt bezahlt hat.", "[Information 2] The person who paid for the ferry trip can select an option in the selection box.")
                            world:gfx(1,player.pos)
                            world:makeSound(9,player.pos)
                            player:warp(position(352,870,1))
                            world:gfx(11,player.pos)
                            world:makeSound(9,player.pos)
                        end
                     else
                        for i,player in ipairs(M.travlerslist[User.name]) do
                            player:inform("Du hast dich dazu entschlossen, " ..namestravel[selected+1].. " zu Reisen.", "You have chosen to travel to " ..namestravel[selected+1]..".")
                            world:gfx(1,player.pos)
                            world:makeSound(9,player.pos)
                            player:warp(targetPos[selected+1])
                            world:makeSound(9,player.pos)
                        end
                    end

            else
                User:inform("Du hast nicht genug Geld für diese Reise. Die Reise kostet zehn Silberstücke für eine Überfahrt.", "You don't have enough money for this journey. The journey costs ten silver coins for one passage.")
            end
        end
    end

    local dialog
    if User:getPlayerLanguage() == Player.german then
        dialog = SelectionDialog("Fähre", "Eine Reise kostet zehn Silberstücke für die ganze Gruppe. Wähle eine Ziel aus.", callback)
    else
        dialog = SelectionDialog("Ferry", "A journey costs ten silver coins for the group. Choose a destination.", callback)
    end
    dialog:setCloseOnMove()

    for i=1,#items do
        dialog:addOption(items[i], names[i])
    end
    User:requestSelectionDialog(dialog)
end

function piratesAttack(User)
    local pirateOptions
    local Amountoptions = #pirateOptionsDE
    for j = 1,Amountoptions do
        if  User:getPlayerLanguage() == Player.german then
            pirateOptions = pirateOptionsDE
        else
            pirateOptions = pirateOptionsEN
        end
    end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()
            if (selected == 0) then
                piratesFight(User)
            elseif (selected == 1) then
                piratesFlee(User)
            elseif (selected == 2) then
                piratesPay(User)
            end
        elseif User:isInRangeToPosition(position(352,870,0), 30) or User:isInRangeToPosition(position(352,870,1), 30) or User:isInRangeToPosition(position(352,870,2), 30) then
            piratesAttack(User)
        end
    end
    local dialog

    if  User:getPlayerLanguage() == Player.german then
        dialog = SelectionDialog("Piratenangriff", "Piraten nähern sich dem Schiff. Folgende Möglichkeiten stehen zur Wahl:", callback)
    else
        dialog = SelectionDialog("Pirates attack", "Pirates are coming closer to your ship. You can choose between the following options.", callback)
    end

    for i=1,Amountoptions do
        dialog:addOption(pirateItem[i],pirateOptions[i])
    end
    User:requestSelectionDialog(dialog)

    for d=1,2 do
        local checkDoor = world:getItemOnField(M.pirateDoors[d])
        if checkDoor.id == 3318 then
            world:swap(checkDoor,3314,233)
        end
    end
end

function piratesFight(User)
    local travlers = world:getPlayersInRangeOf(User.pos, 40)
    M.travlerslist[User.name] = travlers
    for i,player in ipairs(M.travlerslist[User.name]) do
        if player:isInRangeToPosition(position(352,870,0), 30) or player:isInRangeToPosition(position(352,870,1), 30) or player:isInRangeToPosition(position(352,870,2), 30) then
            player:inform("Die Piraten erreichen das Schiff und ziehen ihre Waffen. Auf welcher Seite wird wohl Malachín stehen?", "The pirates reach the ship and draw their weapons. Which side will be supported by Malachín?")
        end
    end
    for i,player in ipairs(M.travlerslist[User.name]) do
        if player:isInRangeToPosition(position(352,870,0), 30) or player:isInRangeToPosition(position(352,870,1), 30) or player:isInRangeToPosition(position(352,870,2), 30) then
            player:inform("[Hinweis] Von nun an bleiben nur noch fünf Minuten über, um ein Scheitern und somit die Begegnung mit Cherga zu vermeiden. Unten im Schiffsbauch befindet sich Hilfe. Öffne die Tür für den Sträfling George Backstab und er wird das Schiff von den Piraten säubern. Aber bedenke, dies kostet den Verlust von Rangpunkten!", "[Hint] You have just five minutes left to avoid failure and thus a meeting with Cherga. There is help waiting for you downstairs in the ship's hold. Open the door to free the prisoner George Backstab and he will help you clear the ship of pirates. However, this will cost you some rank points.")
        end
    end
    local countplayers = #M.travlerslist[User.name]
    local monsterTyp = math.random(1,16)
    local monsterAmountDown
    local monsterAmountUp
    if countplayers >= 6 then
        monsterAmountDown = 8
        monsterAmountUp = math.random(1,3)
    else
        monsterAmountDown = countplayers + math.random(1,2)
        monsterAmountUp = math.random(1,2)
    end
    for p=1,monsterAmountDown do
        local enemy = monster[monsterTyp][math.random(1,#monster[monsterTyp])]
        world:gfx(41,piratesSpawnGround[p]);
              world:createMonster(enemy,piratesSpawnGround[p],0);
        world:makeSound(1,User.pos)
    end
    for pp=1,monsterAmountUp do
        local enemy = monster[monsterTyp][math.random(1,#monster[monsterTyp])]
        world:gfx(41,piratesSpawnTop[pp]);
              world:createMonster(enemy,piratesSpawnTop[pp],0);
        world:makeSound(1,User.pos)
    end

    for i,player in ipairs(M.travlerslist[User.name]) do
        player:setQuestProgress(662,30)
        player:setQuestProgress(663,30)
        local find, myEffect = player.effects:find(82)
        if find then
            return
        else
            myEffect = LongTimeEffect(82,10)
            player.effects:addEffect(myEffect)
        end
    end
end

function M.piratesPiratesAreThere(User)
    local monsters = world:getMonstersInRangeOf(position(352,870,1), 30); --get all monster in player range
    for i,mon in ipairs(monsters) do
        return true
    end
end

function SomeoneThere(User)
    local someone
    local someone = world:getCharactersInRangeOf(position(352,870,1), 30); --get everyone on the ship
    for i,character in ipairs(someone) do
        if i <= 1 then
        else
            return true
        end
    end
end

function M.piratesGeorgeBackstabRocks(User)
    local monsters = world:getMonstersInRangeOf(position(352,870,1), 30); --get all monster in player range
    for i,mon in ipairs(monsters) do
        mon:warp(position(5,5,0))
        character.DeathAfterTime(mon,math.random(10,30),0,33,true) --kill all monsters
    end
    local travlers = world:getPlayersInRangeOf(User.pos, 40)
    M.travlerslist[User.name] = travlers
    for i,player in ipairs(M.travlerslist[User.name]) do
        if player:isInRangeToPosition(position(352,870,0), 30) or player:isInRangeToPosition(position(352,870,1), 30) or player:isInRangeToPosition(position(352,870,2), 30) then
            if M.previousselected == nil then
            else
                player:inform("George Backstab stürmt die Stufen hinauf und säubert das Schiff von den Piraten. Anschließend springt er über Board und schwimmt davon. Seine Flucht wird in deiner Fraktion gar nicht gut angkommen. Wie dem auch sei, das gewünschte Ziel wird sicher erreicht", "George Backstab storms up the stairs and throws all the pirates over the ship's rail. He jumps off the ship then and swims away. His escape is not well received in your faction. However, you reach your final destination safely.")
                if player:getQuestProgress(200) == 0 then
                    factions.setRankpoints(player,player:getQuestProgress(202)-20)
                else
                end
                world:gfx(1,player.pos)
                world:makeSound(9,player.pos)
                player:warp(targetPos[M.previousselected[User.name]+1])
                world:gfx(11,player.pos)
                world:makeSound(9,player.pos)
            end
        end
    end
    portalcreateforleftovers(User)
end

function M.piratesPiratesKill(User)
    local travlers = world:getPlayersInRangeOf(User.pos, 40)
    M.travlerslist[User.name] = travlers
    for i,player in ipairs(M.travlerslist[User.name]) do
        if player:isInRangeToPosition(position(352,870,0), 30) or player:isInRangeToPosition(position(352,870,1), 30) or player:isInRangeToPosition(position(352,870,2), 30) then
            if M.previousselected == nil then
            else
                player:inform("Nachdem die Piratenmeute zurückgeschlagen werden konnte, wird das gewünschte Ziel sicher erreicht.", "After all the pirates were pushed back, you reach your final destination safely.")
                world:gfx(1,player.pos)
                world:makeSound(9,player.pos)
                player:warp(targetPos[M.previousselected[User.name]+1])
                world:gfx(11,player.pos)
                world:makeSound(9,player.pos)
            end
        end
    end
    portalcreateforleftovers(User)
end

function M.piratesPiratesRule(User)
    local travlers = world:getPlayersInRangeOf(User.pos, 40)
    M.travlerslist[User.name] = travlers
    for i,player in ipairs(M.travlerslist[User.name]) do
        if player:isInRangeToPosition(position(352,870,0), 30) or player:isInRangeToPosition(position(352,870,1), 30) or player:isInRangeToPosition(position(352,870,2), 30) then
            if M.previousselected == nil then
            else
                player:inform("Malachín war wohl mit den Piraten. Sie sind in der Lage das Schiff zu überlaufen und setzen alle Anwesenden ihrem Glück mit Cherga aus. Wird Cherga Gnade haben?", "Malachín was obviously with the pirates. They overrun the ship and all passenger have to face Cherga. Will Cherga have mercy on you?")
                player:warp(targetPos[M.previousselected[User.name]+1])
                character.DeathAfterTime(player,math.random(10,30),0,27,true) --kill all players
            end
        end
    end
    local monsters = world:getMonstersInRangeOf(position(352,870,1), 30); --get all monster in player range
    for i,mon in ipairs(monsters) do
        mon:warp(position(5,5,0))
        character.DeathAfterTime(mon,100) --kill all monsters
    end
    portalcreateforleftovers(User)
end

function M.piratesTimeWarning(User)
    local travlers = world:getPlayersInRangeOf(User.pos, 40)
    M.travlerslist[User.name] = travlers
    for i,player in ipairs(M.travlerslist[User.name]) do
        if player:isInRangeToPosition(position(352,870,0), 30) or player:isInRangeToPosition(position(352,870,1), 30) or player:isInRangeToPosition(position(352,870,2), 30) then
            player:inform("[Hinweis] Es ist nur noch eine Minute übrig, das Schiff von den Piraten zu säubern. Vielleicht sollte die Hilfe von George Backstab doch in Anspruch genommen werden. Hierzu einfach die Verliestür unten im Schiffsbauch öffnen.", "[Hint] There is only one minute left to clear the boat of pirates. You should probably consider using the help of George Backstab. Just open the door down in the ship's hold.")
        end
    end
end

function piratesFlee(User)
    local travlers = world:getPlayersInRangeOf(User.pos, 40)
    M.travlerslist[User.name] = travlers
    if math.random(1,100)< 26 then
        for i,player in ipairs(M.travlerslist[User.name]) do
            if player:isInRangeToPosition(position(352,870,0), 30) or player:isInRangeToPosition(position(352,870,1), 30) or player:isInRangeToPosition(position(352,870,2), 30) then
                if M.previousselected == nil then
                else
                    player:inform("Die Bemühungen zahlen sich aus und die Flucht gelingt. Sicher wird das gewünschte Ziel erreicht.", "Your effort is rewarded. You are able to flee successfully and reach your final destination safely.")
                    world:gfx(1,player.pos)
                    world:makeSound(9,player.pos)
                    player:warp(targetPos[M.previousselected[User.name]+1])
                    world:gfx(11,player.pos)
                    world:makeSound(9,player.pos)
                end
            end
        end
        portalcreateforleftovers(User)
    else
        for i,player in ipairs(M.travlerslist[User.name]) do
            if player:isInRangeToPosition(position(352,870,0), 30) or player:isInRangeToPosition(position(352,870,1), 30) or player:isInRangeToPosition(position(352,870,2), 30) then
                player:inform("Oh nein, zu langsam!", "Oh no, too slow!")
            end
        end
        piratesFight(User)
    end
end

function piratesPay(User)
    local travlers = world:getPlayersInRangeOf(User.pos, 40)
    M.travlerslist[User.name] = travlers
    if money.CharHasMoney(User,10000) then
        money.TakeMoneyFromChar(User,10000)
        for i,player in ipairs(M.travlerslist[User.name]) do
            if player:isInRangeToPosition(position(352,870,0), 30) or player:isInRangeToPosition(position(352,870,1), 30) or player:isInRangeToPosition(position(352,870,2), 30) then
                if M.previousselected == nil then
                else
                    player:inform("Das Gold ist weg, aber dafür das gewünschte Ziel erreicht.", "The gold is gone but in return you reach your final destination safely.")
                    world:gfx(1,player.pos)
                    world:makeSound(9,player.pos)
                    player:warp(targetPos[M.previousselected[User.name]+1])
                    world:gfx(11,player.pos)
                    world:makeSound(9,player.pos)
                end
            end
        end
        portalcreateforleftovers(User)
    else
        for i,player in ipairs(M.travlerslist[User.name]) do
            if player:isInRangeToPosition(position(352,870,0), 30) or player:isInRangeToPosition(position(352,870,1), 30) or player:isInRangeToPosition(position(352,870,2), 30) then
                player:inform("Nein, das ist zu wenig Geld! Damit lassen sich die Piraten nicht bestechen.", "No, that's not enough for bribing the pirates!")
            end
        end
        piratesFight(User)
    end
end

function portalcreateforleftovers(User)
    repeat
        local checkleftovers = world:getItemOnField(position(355,864,2))
        world:erase(checkleftovers,1)
        if checkleftovers.id == 0 then break end
    until world:isItemOnField(position(355,864,2)) == false
    world:createItemFromId( 10, 1, position(355,864,2), true, 999, nil)
    local checkPortalforleftovers = world:getItemOnField(position(355,864,2))
    checkPortalforleftovers.id = 10
    checkPortalforleftovers.quality = 999
    checkPortalforleftovers.wear = 255
    world:changeItem(checkPortalforleftovers)
end

function portalremoveforleftovers(User)
    repeat
        local checkPortalforleftovers = world:getItemOnField(position(355,864,2))
        world:erase(checkPortalforleftovers,1)
        if checkPortalforleftovers.id == 0 then break end
    until world:isItemOnField(position(355,864,2)) == false
end

return M
