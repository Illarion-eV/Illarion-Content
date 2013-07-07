require("base.common")
--require("item.bookrests")

module("base.pirates", package.seeall)

optionsDE={"Kämpfe","Flieh","Zahl"}
optionsEN={"Fight","Flee","Pay"}

items={1,53,61}

function piratesattack(User,SourceItem,travler)
--	User:inform("names: ","names: ")
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


	local callpirat = function(dialog2)
	debug("..selected ")
		success = dialog2:getSuccess() 
		if success then
			selected = dialog2:getSelectedIndex() 
			User:inform("Success, you selected option "..selected+1) 
		else
			User:inform("Selection aborted!") 
		end
	debug("..selected2 ")
	end
--	debug("..selected ")
	local dialog2
	if User:getPlayerLanguage() == Player.german then
		dialog2 = SelectionDialog("Piraten Angriff", "Piraten nähern sich eurem Schiff, dir stehen folgende Möglichkeiten zur Wahl.", callpirat)
	else
		dialog2 = SelectionDialog("Pirates attack", "Pirates are coming closer to your ship. You can choose between following options.", callpirat)
	end
	dialog2:setCloseOnMove()
	
	for i=1,Amountoptions do
		dialog2:addOption(items[i],options[i])
	end
	User:requestSelectionDialog(dialog2)
end
