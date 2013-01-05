require("base.common")


-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function UseItem(User,SourceItem,TargetItem,counter,param)
    if (User.lastSpokenText == "glas") then
        User:increaseSkill(Character.glassBlowing,100)
    end
	
	if (User.lastSpokenText == "drop") then
	   for i = 1,10 do
		   local drop = function(posi)
				world:createItemFromId(15,1,posi,false,333,nil)
			end
			for j=1,5 do
				base.common.CreateCircle(User.pos, i, drop)
			end	

			local delete = function(posi)
				local theItem = world:getItemOnField(posi)
				if theItem.id == 15 then 
					world:erase(theItem,1)
				end	
			end
			for k=1,5 do
				base.common.CreateCircle(User.pos, i, delete)
			end	
	    end 
		User:inform("drop end")
	end		
end