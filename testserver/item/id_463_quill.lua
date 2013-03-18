-- UPDATE common SET com_script='item.id_463_quill' WHERE com_itemid IN (463);
require("base.common")
require("alchemy.base.alchemy")
require("base.lookat")

module("item.id_463_quill", package.seeall)

function UseItem(User, SourceItem, ltstate)
    -- we check if the char holds a bottle to label it
    local bottle = CheckIfBottleInHand(User)
	if bottle then 
	    WriteLabel(User,SourceItem)
	end	

end

function CheckIfBottleInHand(User)

	local bottleList = alchemy.base.alchemy.bottleList
	for i=1,((#bottleList)+1) do
		local ItemA = User:getItemAt(5)
		local ItemB = User:getItemAt(6)
		if (ItemA.id == bottleList[i]) or (ItemA.id == 164) then
			return ItemA
		elseif (ItemB.id == bottleList[i]) or (ItemB.id == 164) then
			return ItemB
		end
	end
	return nil		
end

function WriteLabel (User,SourceItem)
    
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
			local bottle = CheckIfBottleInHand(User) -- check for the bottle again
			if bottle then
				if bottle.number > 1 then
					User:inform("Du kannst immer nur eine Flasche beschriften.","You can label only one bottle at once.")		
					return
				end
				local labelText = dialog:getInput()
				base.lookat.SetSpecialDescription(bottle,"Flaschenetikett: ".."\""..labelText.."\"","Bottle label: ".."\""..labelText.."\"")
				world:changeItem(bottle)
			end	
		end
	end
	local dialog = InputDialog(title, infoText, false, 100, callback)
	User:requestInputDialog(dialog)
	
end