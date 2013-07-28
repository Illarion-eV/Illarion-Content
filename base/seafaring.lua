require("base.common")
require("base.doors")
--require("item.bookrests")

module("base.seafaring", package.seeall)





ferrySourceItemPos={position(101,790,0),position(727,809,0),position(888,485,0),position(870,285,0),position(451,95,0)}

ferryDE={}
ferryEN={}
ferryDE[1]={"Cadomyr Hafen","Bauern Insel","Cadomyr Verlorener Hafen","Leuchtturm","Einsame Inseln","Runewick Hafen","Ostland Hafen","Nördlicher Hafen"}
ferryEN[1]={"Cadomyr Harbour","Farmer Island","Cadomyr Lost Harbour","Lighthouse","Lonely Islands","Runewick Harbour","Eastland Harbour","Northern Harbour"}
ferryDE[2]={"Cadomyr Hafen","Bauern Insel","Cadomyr Verlorener Hafen","Leuchtturm","Einsame Inseln","Runewick Hafen","Ostland Hafen","Nördlicher Hafen"}
ferryEN[2]={"Cadomyr Harbour","Farmer Island","Cadomyr Lost Harbour","Lighthouse","Lonely Islands","Runewick Harbour","Eastland Harbour","Northern Harbour"}
ferryDE[3]={"Cadomyr Hafen","Runewick Hafen","Ostland Hafen","Nördlicher Hafen"}
ferryEN[3]={"Cadomyr Harbour","Runewick Harbour","Eastland Harbour","Northern Harbour"}
ferryDE[4]={"Cadomyr Hafen","Runewick Hafen","Ostland Hafen","Nördlicher Hafen","Böser Fels"}
ferryEN[4]={"Cadomyr Harbour","Runewick Harbour","Eastland Harbour","Northern Harbour","Evilrock"}
ferryDE[5]={"Galmair Hafen","Nördliche Inseln -  Ra","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg","Unüberwindbarer Limes"}
ferryEN[5]={"Galmair Harbour","Northern Islands -  Ra","Northern Islands -  Hept","Northern Islands -  Yeg","Insurmountable Limes"}


ferryItem={}
ferryItem[1]={2701,259,272,467,3099,105,2760,308}
ferryItem[2]={2701,259,272,467,3099,105,2760,308}
ferryItem[3]={2701,105,2760,308}
ferryItem[4]={2701,105,2760,308,915}
ferryItem[5]={61,359,360,372,474}

ferryTargetPos={}
ferryTargetPos[1]={position(102,790,0),position(78,980,0),position(105,832,0),position(553,658,0),position(616,859,0),position(728,809,0),position(888,486,0),position(870,286,0)}
ferryTargetPos[2]={position(102,790,0),position(78,980,0),position(105,832,0),position(553,658,0),position(616,859,0),position(728,809,0),position(888,486,0),position(870,286,0)}
ferryTargetPos[3]={position(102,790,0),position(728,809,0),position(888,486,0),position(870,286,0)}
ferryTargetPos[4]={position(102,790,0),position(728,809,0),position(888,486,0),position(870,286,0),position(987,256,0)}
ferryTargetPos[5]={position(450,95,0),position(364,49,0),position(415,85,0),position(478,34,0),position(682,45,0)}


pirateOptionsDE={"Kämpfe gegen die Piraten","Fliehe vor den Piraten (25% Erfolgschance, ansonsten wartet der Kampf)","Zahle zehn Goldstücke, um verschont zu bleiben."}
pirateOptionsEN={"Fight against the pirates","Flee from the pirates (25% chance of success. Otherwise you have to fight)","Pay ten gold coins in order to be spared"}

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
--[[
travlers={}
travlers[1]={world:getPlayersInRangeOf(position(352,870,1), 20)}
travlers[2]={world:getPlayersInRangeOf(position(352,870,2), 20)}
travlers[3]={world:getPlayersInRangeOf(position(352,870,0), 20)}
]]

function Ferry(User, SourceItem)
	local names
	local Amountferry = table.getn(ferrySourceItemPos)	
	for j = 1,Amountferry do
	   if (SourceItem.pos == ferrySourceItemPos[j]) then
		if  User:getPlayerLanguage() == Player.german then
			names = ferryDE[j]
		else
			names = ferryEN[j]
		end

		items = ferryItem[j]
		targetPos = ferryTargetPos[j]
           end
	end

	local callback = function(dialog)
	
		success = dialog:getSuccess()
		if success then
			selected = dialog:getSelectedIndex()
			if  base.money.CharHasMoney(User,10000) then
				
				if (targetPos[selected+1].x - SourceItem.pos.x) * (targetPos[selected+1].x - SourceItem.pos.x) < 10 then
					User:inform("Du befindest dich bereits in " ..names[selected+1]..".", "You are already in "..names[selected+1]..".")
				else
					base.money.TakeMoneyFromChar(User,10000)
					travlers = world:getPlayersInRangeOf(SourceItem.pos, 5) 
					if math.random(1,100)< 91 then
						previousselected = selected
						piratesAttack(User,previousselected,travlers)
						for i,player in ipairs(travlers) do
							player:inform("[Hinweis:] Piraten nähern sich dem Schiff. Folgende Möglichkeiten stehen zur Wahl: Kämpfen, fliehen oder zehn Goldstücke zahlen. Wenn keine Entscheidung in der nächsten Minute getroffen wird, dann bleibt nur eine zur Wahl: Kämpfen.", "[Information:] Pirates are coming closer to your ship. You can choose between following options: fight, free or pay ten gold coins. If you do not make your decision with the next minute, there will be only one left: fight.")
							world:gfx(1,player.pos)
							world:makeSound(9,player.pos)
							player:warp(position(352,870,1))
							world:gfx(11,player.pos)
							world:makeSound(9,player.pos)
						end
 					else
						for i,player in ipairs(travlers) do
							player:inform("Du hast dich dazu entschlossen nach " ..names[selected+1].. " zu Reisen.", "You have chosen to travel to " ..names[selected+1]..".")
							world:gfx(1,player.pos)
							world:makeSound(9,player.pos)
							player:warp(targetPos[selected+1])
							world:gfx(11,player.pos)
							world:makeSound(9,player.pos)
						end
					end
				end
			else
				User:inform("Du hast nicht genug Geld für diese Reise. Die Reise kostet ein Goldstück für eine Überfahrt.", "You don't have enough money for this journey. The journey costs one gold coin for one passage.")
			end
		
		end
	end
		
	local dialog
	if User:getPlayerLanguage() == Player.german then
		dialog = SelectionDialog("Fähre", "Eine Reise kostet ein Goldstück für die ganze Gruppe. Wähle eine Ziel aus.", callback)
	else
		dialog = SelectionDialog("Ferry", "A journey costs one gold coin for the group. Choose a destination.", callback)
	end
	dialog:setCloseOnMove()
	
	for i=1,#items do
		dialog:addOption(items[i], names[i])
	end
	User:requestSelectionDialog(dialog)
end








function piratesAttack(User,previousselected,travlers)
	local options
	local Amountoptions = table.getn(pirateOptionsDE)	
	for j = 1,Amountoptions do
	   	if  User:getPlayerLanguage() == Player.german then
			pirateOptions = pirateOptionsDE
		else
			pirateOptions = pirateOptionsEN
		end
	end

	for d=1,2 do
		local checkDoor = world:getItemOnField(pirateDoors[d])
			if checkDoor.id == 3318 then
				world:swap(checkDoor,3314,233)
			end
		end
	end


	local callback = function(dialog)
--	debug("..selected ")
		success = dialog:getSuccess() 
		if success then
			local selected = dialog:getSelectedIndex() 
--			User:inform("Success, you selected option "..selected+1)
			if (selected == 0) then
				piratesFight(User,previousselected,travlers)
			elseif (selected == 1) then
				piratesFlee(User,previousselected,travlers)
			elseif (selected == 2) then
				piratesPay(User,previousselected,travlers)
			end
		end
	end
	local dialog
	if  User:getPlayerLanguage() == Player.german then
		dialog = SelectionDialog("Piraten Angriff", "Piraten nähern sich dem Schiff. Folgende Möglichkeiten zur Wahl:", callback)
	else
		dialog = SelectionDialog("Pirates attack", "Pirates are coming closer to your ship. You can choose between following options.", callback)
	end
--	dialog:setCloseOnMove()
	
	for i=1,Amountoptions do
		dialog:addOption(pirateItem[i],pirateOptions[i])
	end
	User:requestSelectionDialog(dialog)

	User:setQuestProgress(662,36)

	find, myEffect = User.effects:find(82)
	if find then 
		return
	else
	myEffect = PiratesAttack(82,10)

end



function piratesFight(User,previousselected,travlers)
--	travlers = world:getPlayersInRangeOf(position(352,870,1), 20)
	for i,player in ipairs(travlers) do
		player:inform("Die Piraten erreichen das Schiff und ziehen ihre Waffen. Auf welcher Seite wird wohl Malachín stehen?", "The pirates reach the ship and draw their weapons. Which side will be supported by Malachín?")
	end
	for i,player in ipairs(travlers) do
		player:inform("[Hinweis:] Von nun an bleiben nur noch fünf Minuten über, um ein Scheitern und somit die Begegnung mit Cherga zu vermeiden. Unten im Schiffsbauch befindet sich Hilfe. Öffne die Tür für den Sträfling George Backstab und er wird das Schiff von den Piraten säubern. Aber bedenke, dies kostet den Verlust von Rangpunkten!", "[Hint:] You have just five minutes left from now to avoid a failure and thus a meeting with Cherga. There is help waiting for you downstairs at the ship's hold. Open the door for the prisoner George Backstab and he will help you cleaning the ship from the pirates. However, this will cost you some rang points.")
	end
	local monsterTyp = math.random(1,16)
	for p=1,8 do
		local enemy = monster[monsterTyp][math.random(1,table.getn(monster[monsterTyp]))]
		world:gfx(41,piratesSpawnGround[p]);
	      	world:createMonster(enemy,piratesSpawnGround[p],0);
		world:makeSound(1,player.pos)
	end
	for pp=1,3 do
		local enemy = monster[monsterTyp][math.random(1,table.getn(monster[monsterTyp]))]
		world:gfx(41,piratesSpawnTop[pp]);
	      	world:createMonster(enemy,piratesSpawnTop[pp],0);
		world:makeSound(1,player.pos)
	end

	User:setQuestProgress(662,30)

	find, myEffect = User.effects:find(82)
	if find then 
		return
	else
	myEffect = PiratesAttack(82,10)
	end
end



function piratesPiratesAreThere(User,previousselected,travlers)
	local monsters = world:getMonstersInRangeOf(position(352,870,1), 20); --get all monster in player range 
	for i,mon in ipairs(monsters) do
		return true
	end
end



function piratesGeorgeBackstabRocks(User,previousselected,travlers)
	local monsters = world:getMonstersInRangeOf(position(352,870,1), 20); --get all monster in player range 
	for i,mon in ipairs(monsters) do
		base.character.DeathAfterTime(mon,math.random(10,30),0,33,true) --kill all monsters
	end
--	travlers = world:getPlayersInRangeOf(position(352,870,1), 20)	
	for i,player in ipairs(travlers) do
		player:inform("George Backstab stürmt die Stufen hinauf und säubert das Schiff von den Piraten. Anschließend springt er über Board und schwimmt davon. Seine Flucht wird in deiner Fraktion gar nicht gut angkommen. Wie dem auch sei, das gewünschte Ziel wird sicher erreicht", "George Backstab storms up the stairs and throws all pirats over the ship's rail. He jumps off the ship then and swims away. His escape is not well received in your faction. However, you reach save your final destination.")
		if not base.factions.getSpecialRank(player) then
			base.factions.setRankpoints(player,-20)
		end
		world:gfx(1,player.pos)
		world:makeSound(9,player.pos)
		player:warp(targetPos[previousselected+1])
		world:gfx(11,player.pos)
		world:makeSound(9,player.pos)
	end
end



function piratesPiratesKill(User,previousselected,travlers)
--	travlers = world:getPlayersInRangeOf(position(352,870,1), 20)	
	for i,player in ipairs(travlers) do
		player:inform("Nachdem die Piratenmeute zurückgeschlagen werden konnte, wird das gewünschte Ziel sicher erreicht.", "After all pirates were be thrown back, you reach save your final destination.")
		world:gfx(1,player.pos)
		world:makeSound(9,player.pos)
		player:warp(targetPos[previousselected+1])
		world:gfx(11,player.pos)
		world:makeSound(9,player.pos)
	end
end



function piratesPiratesRule(User,previousselected,travlers)
--	travlers = world:getPlayersInRangeOf(position(352,870,1), 20)	
	for i,player in ipairs(travlers) do
		player:inform("Malachín war woll mit den Piraten. Sie sind in der Lage das Schiff zu überlaufen und setzen alle Anwensenden ihrem Glück mit Cherga aus. Wird Cherga Gnade haben?", "Malachin was obviously with the pirates. They overrun the ship and all passenger have to face Cherga. Will Cherga have merci with you?")
		base.character.DeathAfterTime(player,math.random(10,30),0,27,true) --kill all players
	end
end



function piratesTimeWarning(User,previousselected,travlers)
--	travlers = world:getPlayersInRangeOf(position(352,870,1), 20)	
	for i,player in ipairs(travlers) do
		player:inform("Es ist nur noch eine Minute übrig, das Schiff von den Piraten zu säubern. Vielleicht sollte die Hilfe von George Backstab doch in Anspruch genommen werden. Hierzu einfach die Verliestür unten im Schiffsbauch öffnen.", "There is only one minute left to clean the boat from the pirates. Probably, you should consider the help of George Backstab. Just open the door down in the ship's rail.")
	end
end



function piratesFlee(User,previousselected,travlers)
--	travlers = world:getPlayersInRangeOf(position(352,870,1), 20)
	if math.random(1,100)< 26 then
		for i,player in ipairs(travlers) do
			player:inform("Die Bemühungen zahlen sich aus und die Flucht gelingt. Sicher wird das gewünschte Ziel erreicht.", "Your effort is rewarded. You are able to flee successfully and reach save your final destination.")
			world:gfx(1,player.pos)
			world:makeSound(9,player.pos)
			player:warp(targetPos[previousselected+1])
			world:gfx(11,player.pos)
			world:makeSound(9,player.pos)
		end
	else
		for i,player in ipairs(travlers) do
			player:inform("Oh nein, zu langsam! Die Piraten erreichen das Schiff und ziehen ihre Waffen. Auf welcher Seite wird wohl Malachín stehen?", "Oh no, too slow! The pirates reach the ship and draw their weapons. Which side will be supported by Malachín?")
			piratesFight(User,previousselected,travlers)
		end
	end
end



function piratesPay(User,previousselected,travlers)
--	travlers = world:getPlayersInRangeOf(position(352,870,1), 20)
	if base.money.CharHasMoney(User,100000) then
		for i,player in ipairs(travlers) do
			base.money.TakeMoneyFromChar(User,100000)
			player:inform("Das Gold ist weg, aber dafür das gewünschte Ziel erreicht.", "The gold is gone but in return you reach save your final destination.")
			world:gfx(1,player.pos)
			world:makeSound(9,player.pos)
			player:warp(targetPos[previousselected+1])
			world:gfx(11,player.pos)
			world:makeSound(9,player.pos)
		end
	else
		for i,player in ipairs(travlers) do
			player:inform("Nein, das ist zu wenig Geld! Damit lassen sich die Piraten nicht bestechen. Diese erreichen das Schiff und ziehen ihre Waffen. Auf welcher Seite wird wohl Malachín stehen?", "No, that's not enough for bribing the pirates! Them reach the ship and draw their weapons. Which side will be supported by Malachín?")
			piratesFight(User,previousselected,travlers)
		end
	end
end
