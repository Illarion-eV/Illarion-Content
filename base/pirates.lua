require("base.common")
--require("item.bookrests")

module("base.pirates", package.seeall)

optionsDE={"Kämpfe","Flieh","Zahl"}
optionsEN={"Fight","Fly","Pay"}
--[[
optionsDE={}
optionsDE[1]={"Kämpfe"}
optionsDE[2]={"Flieh"}
optionsDE[3]={"Zahl"}
optionsEN={}
optionsEN[1]={"Fight"}
optionsEN[2]={"Fly"}
optionsEN[3]={"Pay"}
]]--

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
			options = optionsDE[j]
		else
			options = optionsEN[j]
		end
	end


	local callback = function(dialog)
		success = dialog:getSuccess()
		if success then
			selected = dialog:getSelectedIndex()
			User:inform("lauftDE","lauftEN")
		else
			User:inform("lauftDE nicht","lauftEN nicht")
		end
	end
	local dialog
	if User:getPlayerLanguage() == Player.german then
		dialog = SelectionDialog("Piraten Angriff", "Piraten nähern sich eurem Schiff, dir stehen folgende Möglichkeiten zur Wahl.", callback)
	else
		dialog = SelectionDialog("Pirates attack", "Pirates are coming closer to your ship. You can choose between following options.", callback)
	end
	dialog:setCloseOnMove()
	
	for i=1,3 do
		dialog:addOption(options[i])
	end
	User:requestSelectionDialog(dialog)
end
