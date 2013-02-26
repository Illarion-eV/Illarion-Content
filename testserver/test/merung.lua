require("base.common")
require("base.lookat")
require("base.money")
require("content.areas")
require("triggerfield.potionToTeacher")

-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function UseItem(User, SourceItem)
	
	local callback = function(dialog)
	
	local names
	if getPlayerLanguage() == Player.german then
		names = {"Runewick","Galmair","Cadomyr","Hanfschlinge"}
	else
		names = {"Runewick","Galmair","Cadomyr","Necktie"}
	end
	
	local items = {105,61,2701,1909}
	local targetPos = {position(788,826,0), position(424,245,0),position(127,647,0),position(684,307,0)}
	
		success = dialog:getSuccess()
		if success then
			selected = dialog:getSelectedIndex()
			if  base.money.CharHasMoney(User,1000) then
				
				if (targetPos[selcted+1].x - SourceItem.pos.x) * (targetPos[selcted+1].x - SourceItem.pos.x) < 10 then
					User:inform("Ihr befindet euch bereits in " ..names[selected+1]..".", "You are already in "..names[selected+1]..".")
				else
				
					User:inform("Ihr habt euch dazu entschlossen nach " ..names[selected+1].. " zu Reisen.", "You have chosen to travel to " ..names[selected+1]".")
					base.money.TakeMoneyFromChar(User,1000)
								
				
					User:warp(targetPos[selcted+1])
				end
			else
				User:inform("Ihr habt nicht genug Geld für diese Reise. Die Reise kostet zehn Silberstücke.", "You don't have enough money for this journey. The journey costs ten silver coins.")
			end
	
		end
	end
	
	if User:getPlayerLanguage() == Player.german then
		local dialog = SelectionDialog("Teleporter", "Eine Reise kostet zehn Silberstücke. Wähle eine Ziel aus.", callback)
	else
		local dialog = SelectionDialog("Teleporter", "A journey costs ten silver coins. Choose a destination.", callback)
	end
	
    for i=1,#items do
        dialog:addOption(items[i], names[i])
    end
  
	User:requestSelectionDialog(dialog)
	
end