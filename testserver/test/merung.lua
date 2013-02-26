require("base.common")
require("base.lookat")
require("base.money")
require("content.areas")
require("triggerfield.potionToTeacher")

-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function UseItem(User, SourceItem)
	
	local names = {"Runewick","Galmair","Cadomyr","Hanfschlinge"}
	local items = {105,61,2701,1909}
	local callback = function(dialog)
	targetPos = {position(900,800,0), position(220,110,1),position(1,1,0),position(450,450,0)}
	
		success = dialog:getSuccess()
		if success then
			selected = dialog:getSelectedIndex()
			if  base.money.CharHasMoney(User,1000) then
				
				User:inform("Ihr habt euch dazu entschlossen nach " ..names[selected+1].. " zu Reisen")
				base.money.TakeMoneyFromChar(User,1000)
				
				User:warp(targetPos[selceted+1])
			else
				User:inform("Ihr verfügt nicht über genug Geld für eine solche Reise")
			end
	    end
	end 
	local dialog = SelectionDialog("Teleporter", "Wähle eine Stadt aus", callback)
  
    for i=1,#items do
        dialog:addOption(items[i], names[i])
    end
  
	User:requestSelectionDialog(dialog)
end