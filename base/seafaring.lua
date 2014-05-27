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
require("base.common")
require("base.doors")
require("base.factions")

module("base.seafaring", package.seeall)

ferrySourceItemPos={position(101,790,0),position(727,809,0),position(888,485,0),position(870,285,0),position(451,95,0)}

ferryDE={}
ferryEN={}
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
ferryDE[5]={"Nördliche Inseln - Ra","Nördliche Inseln - Hept","Nördliche Inseln - Yeg","Unüberwindbarer Limes"}
ferryEN[5]={"Northern Islands - Ra","Northern Islands - Hept","Northern Islands - Yeg","Insurmountable Limes"}

ferrytravelDE={}
ferrytravelEN={}
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
ferrytravelDE[5]={"zu den Nördlichen Inseln -  Ra","zu den Nördlichen Inseln -  Hept","zu den Nördlichen Inseln -  Yeg","zum Unüberwindbaren Limes"}
ferrytravelEN[5]={"Northern Islands -  Ra","Northern Islands -  Hept","Northern Islands -  Yeg","Insurmountable Limes"}

ferryItem={}
--ferryItem[1]={259,272,467,3099,105,2760,308} --for the future with farmer island & lonely islands
ferryItem[1]={272,467,105,2760,308}  ---replace this with the one above
--ferryItem[2]={2701,259,272,467,3099,2760,308} --for the future with farmer island & lonely islands
ferryItem[2]={2701,272,467,2760,308}  ---replace this with the one above
ferryItem[3]={2701,105,308}
--ferryItem[4]={2701,105,2760,915}  ---for the future with Evil Rock
ferryItem[4]={2701,105,2760}  ---replace this with the one above
ferryItem[5]={359,360,372,474}

ferryTargetPos={}
--ferryTargetPos[1]={position(86,980,0),position(105,832,0),position(553,658,0),position(616,859,0),position(728,809,0),position(888,486,0),position(870,286,0)} --for the future with farmer island & lonely islands
ferryTargetPos[1]={position(105,832,0),position(553,658,0),position(728,809,0),position(888,486,0),position(870,286,0)}  ---replace this with the one above
--ferryTargetPos[2]={position(102,790,0),position(86,980,0),position(105,832,0),position(553,658,0),position(616,859,0),position(888,486,0),position(870,286,0) --for the future with farmer island & lonely islands
ferryTargetPos[2]={position(102,790,0),position(105,832,0),position(553,658,0),position(888,486,0),position(870,286,0)}  ---replace this with the one above
ferryTargetPos[3]={position(102,790,0),position(728,809,0),position(870,286,0)}
--ferryTargetPos[4]={position(102,790,0),position(728,809,0),position(888,486,0),position(987,256,0)}  ---for the future with Evil Rock
ferryTargetPos[4]={position(102,790,0),position(728,809,0),position(888,486,0),}  ---replace this with the one above
ferryTargetPos[5]={position(364,49,0),position(415,85,0),position(478,34,0),position(682,45,0)}


pirateOptionsDE={"Kämpfe gegen die Piraten","Fliehe vor den Piraten (25% Erfolgschance, ansonsten wartet der Kampf)","Zahle ein Goldstück, um verschont zu bleiben."}
pirateOptionsEN={"Fight against the pirates","Flee from the pirates (25% chance of success, otherwise you have to fight)","Pay a gold coin in order to be spared"}

pirateItem={1,53,61}


monster={}; ---monster, numbers are archers -> excluded currently
monster[1]={1,2,3,4,5}; --human
monster[2]={11,12,13,14}; --dwarf 15
monster[3]={21,22,23,24}; --halfling 25
monster[4]={31,32,33,34}; --elf 35
monster[5]={41,42,43,45}; --orc 44
monster[6]={51,53,53,54,55}; -- lizard 
monster[7]={91,92,93,95,791,792,801,812}; -- troll 94,802,811
monster[8]={101,102,103,104,106,151,152,171,172,173}; -- mummy
monster[9]={111,112,113,114,115}; --skeleton
monster[10]={921,922,932,941,942}; --rats 931
monster[11]={891,892,893,901,902,903}; --Imp
monster[12]={782,783}; --golden skeleton 784
monster[13]={301,311,321,331,341}; --golem 
monster[14]={851,852,853,861,862,863,871,872,873,881,882,883}; --hellhound
monster[15]={62,63,64,65}; -- drow 61
monster[16]={201,202,203,204}; --demon skeleton 205 


piratesSpawnGround={position(349,869,1),position(349,873,1),position(350,881,1),position(352,884,1),position(356,885,1),position(359,882,1),position(359,879,1),position(359,871,1)}
piratesSpawnTop={position(351,863,2),position(355,862,2),position(357,863,2)}

pirateDoors={position(354,873,0),position(355,873,0)}

travlerslist={}

function Ferry(User, SourceItem)
	local chanceforpirateattack = math.random(1,100)
	local names
	local namestravel
	local Amountferry = table.getn(ferrySourceItemPos)	
	for j = 1,Amountferry do
	   if (SourceItem.pos == ferrySourceItemPos[j]) then
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
	
		success = dialog:getSuccess()
		if success then
			local selected = dialog:getSelectedIndex()
			if  base.money.CharHasMoney(User,1000) then
				
					base.money.TakeMoneyFromChar(User,1000)
					local travlers = world:getPlayersInRangeOf(SourceItem.pos, 5) 
					travlerslist[User.name] = travlers

					if chanceforpirateattack< 6 and SomeoneThere(User) ~= true then --chance of 20% and noone else is there
						--[[previousselected = {}						
						previousselected[User.name] = selected
						piratesAttack(User)
						for i,player in ipairs(travlerslist[User.name]) do
							player:inform("[Hinweis] Piraten nähern sich dem Schiff. Folgende Möglichkeiten stehen zur Wahl: Kämpfen, fliehen oder ein Goldstück zahlen. Wenn keine Entscheidung in der nächsten Minute getroffen wird, dann bleibt nur eine Option zur Wahl: Kämpfen.", "[Information] Pirates are coming closer to your ship. You can choose between the following options: fight, flee or pay a gold coin. If you do not make your decision within the next minute, there will be only one option left: fight.")
							player:inform("[Hinweis 2] Auswählen in der Auswahl-Box kann die Person, die für die Fährenfahrt bezahlt hat.", "[Information 2] The person who paid for the ferry trip can select an option in the selection box.")
							world:gfx(1,player.pos)
							world:makeSound(9,player.pos)
							player:warp(position(352,870,1))
							world:gfx(11,player.pos)
							world:makeSound(9,player.pos)
						end]]
						--Deactivated. Please make this pirate attack more sound. See Mantis ~Estralis
 					else
						for i,player in ipairs(travlerslist[User.name]) do
							player:inform("Du hast dich dazu entschlossen, " ..namestravel[selected+1].. " zu Reisen.", "You have chosen to travel to " ..namestravel[selected+1]..".")
							world:gfx(1,player.pos)
							world:makeSound(9,player.pos)
							player:warp(targetPos[selected+1])
							--world:gfx(11,player.pos)
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
	local options
	local Amountoptions = table.getn(pirateOptionsDE)	
	for j = 1,Amountoptions do
	   	if  User:getPlayerLanguage() == Player.german then
			pirateOptions = pirateOptionsDE
		else
			pirateOptions = pirateOptionsEN
		end
	end

	local callback = function(dialog)
		success = dialog:getSuccess() 
		if success then
			local selected = dialog:getSelectedIndex() 
			if (selected == 0) then
				piratesFight(User)
				User:setQuestProgress(663,1)
			elseif (selected == 1) then
				piratesFlee(User)

				User:setQuestProgress(663,1)
			elseif (selected == 2) then
				piratesPay(User)
				User:setQuestProgress(663,1)
			end
		end
	end
	local dialog

	if  User:getPlayerLanguage() == Player.german then
		dialog = SelectionDialog("Piratenangriff", "Piraten nähern sich dem Schiff. Folgende Möglichkeiten zur Wahl:", callback)
	else
		dialog = SelectionDialog("Pirates attack", "Pirates are coming closer to your ship. You can choose between the following options.", callback)
	end
--	dialog:setCloseOnMove()
	
	for i=1,Amountoptions do
		dialog:addOption(pirateItem[i],pirateOptions[i])
	end
	User:requestSelectionDialog(dialog)

	User:setQuestProgress(662,36)
	User:setQuestProgress(663,0)

	for d=1,2 do
		local checkDoor = world:getItemOnField(pirateDoors[d])
		if checkDoor.id == 3318 then
			world:swap(checkDoor,3314,233)
		end
	end

	find, myEffect = User.effects:find(82)
	if find then 
		return
	else
		myEffect = LongTimeEffect(82,10)
	end
	User.effects:addEffect(myEffect)
end


function piratesFight(User)
	if User:getQuestProgress(663) == 1 then
		User:inform("[Hinweis] Es ist zu spät. Die Auswahlzeit ist abgelaufen.", "[Information] It is too late. The time for selecting an option has passed.")
		return
	end

	for i,player in ipairs(travlerslist[User.name]) do
		player:inform("Die Piraten erreichen das Schiff und ziehen ihre Waffen. Auf welcher Seite wird wohl Malachín stehen?", "The pirates reach the ship and draw their weapons. Which side will be supported by Malachín?")
	end
	for i,player in ipairs(travlerslist[User.name]) do
		player:inform("[Hinweis] Von nun an bleiben nur noch fünf Minuten über, um ein Scheitern und somit die Begegnung mit Cherga zu vermeiden. Unten im Schiffsbauch befindet sich Hilfe. Öffne die Tür für den Sträfling George Backstab und er wird das Schiff von den Piraten säubern. Aber bedenke, dies kostet den Verlust von Rangpunkten!", "[Hint] You have just five minutes left to avoid failure and thus a meeting with Cherga. There is help waiting for you downstairs in the ship's hold. Open the door to free the prisoner George Backstab and he will help you clear the ship of pirates. However, this will cost you some rank points.")
	end
	local monsterTyp = math.random(1,16)
	for p=1,8 do
		local enemy = monster[monsterTyp][math.random(1,table.getn(monster[monsterTyp]))]
		world:gfx(41,piratesSpawnGround[p]);
	      	world:createMonster(enemy,piratesSpawnGround[p],0);
		world:makeSound(1,User.pos)
	end
	for pp=1,3 do
		local enemy = monster[monsterTyp][math.random(1,table.getn(monster[monsterTyp]))]
		world:gfx(41,piratesSpawnTop[pp]);
	      	world:createMonster(enemy,piratesSpawnTop[pp],0);
		world:makeSound(1,User.pos)
	end

	User:setQuestProgress(662,29)

	find, myEffect = User.effects:find(82)
	if find then 
		return
	else
		myEffect = LongTimeEffect(82,10)
		User.effects:addEffect(myEffect)
	end

end


function piratesPiratesAreThere(User)
	local monsters = world:getMonstersInRangeOf(position(352,870,1), 20); --get all monster in player range 
	for i,mon in ipairs(monsters) do
		return true
	end
end


function SomeoneThere(User)
	local someone
	local someone = world:getCharactersInRangeOf(position(352,870,1), 20); --get everyone on the ship
	for i,character in ipairs(someone) do
		if i <= 1 then
		else
			return true
		end
	end
end


function piratesGeorgeBackstabRocks(User)
	local monsters = world:getMonstersInRangeOf(position(352,870,1), 20); --get all monster in player range 
	for i,mon in ipairs(monsters) do
		base.character.DeathAfterTime(mon,math.random(10,30),0,33,true) --kill all monsters
	end
	for i,player in ipairs(travlerslist[User.name]) do
		player:inform("George Backstab stürmt die Stufen hinauf und säubert das Schiff von den Piraten. Anschließend springt er über Board und schwimmt davon. Seine Flucht wird in deiner Fraktion gar nicht gut angkommen. Wie dem auch sei, das gewünschte Ziel wird sicher erreicht", "George Backstab storms up the stairs and throws all the pirates over the ship's rail. He jumps off the ship then and swims away. His escape is not well received in your faction. However, you reach your final destination safely.")
		if player:getQuestProgress(200) == 0 then
			base.factions.setRankpoints(player,player:getQuestProgress(202)-20)
		else
		end
		world:gfx(1,player.pos)
		world:makeSound(9,player.pos)
		player:warp(targetPos[previousselected[User.name]+1])
		world:gfx(11,player.pos)
		world:makeSound(9,player.pos)
	end
end



function piratesPiratesKill(User)
	for i,player in ipairs(travlerslist[User.name]) do
		player:inform("Nachdem die Piratenmeute zurückgeschlagen werden konnte, wird das gewünschte Ziel sicher erreicht.", "After all the pirates were pushed back, you reach your final destination safely.")
		world:gfx(1,player.pos)
		world:makeSound(9,player.pos)
		player:warp(targetPos[previousselected[User.name]+1])
		world:gfx(11,player.pos)
		world:makeSound(9,player.pos)
	end
end


function piratesPiratesRule(User)
	for i,player in ipairs(travlerslist[User.name]) do
		player:inform("Malachín war wohl mit den Piraten. Sie sind in der Lage das Schiff zu überlaufen und setzen alle Anwesenden ihrem Glück mit Cherga aus. Wird Cherga Gnade haben?", "Malachín was obviously with the pirates. They overrun the ship and all passenger have to face Cherga. Will Cherga have mercy on you?")
		base.character.DeathAfterTime(player,math.random(10,30),0,27,true) --kill all players
	end
	local monsters = world:getMonstersInRangeOf(position(352,870,1), 20); --get all monster in player range 
	for i,mon in ipairs(monsters) do
		base.character.DeathAfterTime(mon,700) --kill all monsters
	end
end


function piratesTimeWarning(User)
	for i,player in ipairs(travlerslist[User.name]) do
		player:inform("[Hinweis] Es ist nur noch eine Minute übrig, das Schiff von den Piraten zu säubern. Vielleicht sollte die Hilfe von George Backstab doch in Anspruch genommen werden. Hierzu einfach die Verliestür unten im Schiffsbauch öffnen.", "[Hint] There is only one minute left to clear the boat of pirates. You should probably consider using the help of George Backstab. Just open the door down in the ship's hold.")
	end
end


function piratesFlee(User)
	if User:getQuestProgress(663) == 1 then
		User:inform("[Hinweis] Es ist zu spät. Die Auswahlzeit ist abgelaufen.", "[Information] It is too late. The time for selecting an option has passed.")
		return
	end

	if math.random(1,100)< 26 then
		for i,player in ipairs(travlerslist[User.name]) do
			player:inform("Die Bemühungen zahlen sich aus und die Flucht gelingt. Sicher wird das gewünschte Ziel erreicht.", "Your effort is rewarded. You are able to flee successfully and reach your final destination safely.")
			world:gfx(1,player.pos)
			world:makeSound(9,player.pos)
			player:warp(targetPos[previousselected[User.name]+1])
			world:gfx(11,player.pos)
			world:makeSound(9,player.pos)
		end
	else
		for i,player in ipairs(travlerslist[User.name]) do
			player:inform("Oh nein, zu langsam! Die Piraten erreichen das Schiff und ziehen ihre Waffen. Auf welcher Seite wird wohl Malachín stehen?", "Oh no, too slow! The pirates reach the ship and draw their weapons. Which side will be supported by Malachín?")
		end		
		piratesFight(User)
	end
end


function piratesPay(User)
	if User:getQuestProgress(663) == 1 then
		User:inform("[Hinweis] Es ist zu spät. Die Auswahlzeit ist abgelaufen.", "[Information] It is too late. The time for selecting an option has passed.")
		return
	end
	if base.money.CharHasMoney(User,10000) then
		base.money.TakeMoneyFromChar(User,10000)
		for i,player in ipairs(travlerslist[User.name]) do
			player:inform("Das Gold ist weg, aber dafür das gewünschte Ziel erreicht.", "The gold is gone but in return you reach your final destination safely.")
			world:gfx(1,player.pos)
			world:makeSound(9,player.pos)
			player:warp(targetPos[previousselected[User.name]+1])
			world:gfx(11,player.pos)
			world:makeSound(9,player.pos)
		end
	else
		for i,player in ipairs(travlerslist[User.name]) do
			player:inform("Nein, das ist zu wenig Geld! Damit lassen sich die Piraten nicht bestechen. Diese erreichen das Schiff und ziehen ihre Waffen. Auf welcher Seite wird wohl Malachín stehen?", "No, that's not enough for bribing the pirates! They reach the ship and draw their weapons. Which side will be supported by Malachín?")
		end
		piratesFight(User)
	end
end
