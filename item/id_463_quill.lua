-- UPDATE common SET com_script='item.id_463_quill' WHERE com_itemid IN (463);
require("base.common")
require("alchemy.base.alchemy")


module("item.id_463_quill", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
    User:inform("0.5")
    -- we check if the char holds a bottle to label it
    local bottle = alchemy.base.alchemy.CheckIfBottleInHand(User)
	if bottle then 
	    User:inform("1")
		WriteLabel(User,SourceItem,bottle)
	end	

end

function WriteLabel (User,SourceItem,bottle)
    
	-- does the char have parchment?
    if User:countItem(2745) < 1 then 
	    User:inform("Dir fehlt Pergament, das Du als Etikett nutzen könntest.","You don't have any parchment you could use as a label.")		
	    return
	end
	
    local title
	local infoText
    if User:getPlayerLanguage() == 0 then
	    title = "Tranketikettierung" 
		infoText = "Füge hier den Text ein, mit dem du das Etikett beschriften willst."
	else
        title = "Potion labelling"
		infoText = "Insert the text you want to write on the label." 
    end	
	
	-- input dialog
	local callback = function(dialog)
		if not dialog:getSuccess() then
			-- player canceld the dialog; nothing
		else
			local labelText = dialog:getInput()
			base.lookat.SetSpecialDescription(bottle, labelText, labelText)
			world:changeItem(bottle)
			User:eraseItem(2745,1)
		end
	end
	local dialog = InputDialog(title, infoText, false, 100, callback)
	User:requestInputDialog(dialog)
	
end