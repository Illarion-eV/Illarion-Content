require("base.common")


-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function UseItem(User,SourceItem,TargetItem,counter,param)
    if (User.lastSpokenText == "glas") then
        User:increaseSkill(Character.glassBlowing,100)
    end
	
	if (User.lastSpokenText == "drop") then
	    local drop = function(posi)
		    world:createItemFromId(myPlant,15,posi,false,333,nil)
	    end
		for i=1,5 do
		    base.common.CreateCircle(User.pos, i, drop)
		end	
	end
	if (User.lastSpokenText == "remove") then
	    local delete = function(posi)
		    local theItem = world:getItemOnField(posi)
			if theItem.id == 15 then 
			    world:erase(theItem,1)
			end	
        end
		for i=1,5 do
		    base.common.CreateCircle(User.pos, i, delete)
		end	
	end		
end