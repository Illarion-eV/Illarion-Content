require("base.common")
--require("item.bookrests")

module("base.pirates", package.seeall)

optionsDE={"Kämpfe","Flieh","Zahl"}
optionsEN={"Fight","Flee","Pay"}

items={1,53,61}

function piratesattack(User,SourceItem,travler)
	User:inform("names: ","names: ")
	for i,player in ipairs(travler) do
		player:inform("Piraten nähern sich eurem Schiff, dir stehen folgende Möglichkeiten zur Wahl.", "Pirates are coming closer to your ship. You can choose between following options.")
		world:gfx(1,player.pos)
		world:makeSound(9,player.pos);
		player:warp(position(352,870,1))
		world:gfx(11,player.pos)
		world:makeSound(9,player.pos);	
	end

	local options
	local Amountoptions = table.getn(optionsDE)	
	for j = 1,Amountoptions do
	   	if  User:getPlayerLanguage() == Player.german then
			options = optionsDE
		else
			options = optionsEN
		end
	end


	local callback = function(dialog)
		success = dialog:getSuccess()
		if success then
			User:inform("uffff1","uffff1")
			selected = dialog:getSelectedIndex()
			User:inform("uffff2","uffff2")
      			if (selected == 0) then
				User:inform("lauftDE1","lauftEN1")
			elseif (selected == 1) then
				User:inform("lauftDE2","lauftEN2")
			elseif (selected == 2) then 
				User:inform("lauftDE3","lauftEN3")
			else
			User:inform("uffff3","uffff3")
			end
		else
			User:inform("lauftDE nicht","lauftEN nicht")
		end
			User:inform("uffff4","uffff4")
	end
	local dialog
	if User:getPlayerLanguage() == Player.german then
		dialog = SelectionDialog("Piraten Angriff", "Piraten nähern sich eurem Schiff, dir stehen folgende Möglichkeiten zur Wahl.", callback)
	else
		dialog = SelectionDialog("Pirates attack", "Pirates are coming closer to your ship. You can choose between following options.", callback)
	end
	dialog:setCloseOnMove()
	
	for i=1,Amountoptions do
		dialog:addOption(items[i],options[i])
	end
	User:requestSelectionDialog(dialog)
end
