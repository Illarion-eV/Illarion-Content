require("base.common")


-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function UseItem(User,SourceItem,TargetItem,counter,param)
    if (User.lastSpokenText == "glas") then
        User:increaseSkill(Character.glassBlowing,100)
    end
	
	if (User.lastSpokenText == "drop") then
	   for i = 1,50 do
		   local drop = function(posi)
				world:createItemFromId(15,1,posi,false,333,nil)
			end
			for j=1,5 do
				base.common.CreateCircle(User.pos, j, drop)
			end	

			local delete = function(posi)
				local theItem = world:getItemOnField(posi)
				if theItem.id == 15 then 
					world:erase(theItem,1)
				end	
			end
			for k=1,5 do
				base.common.CreateCircle(User.pos, k, delete)
			end	
	    end 
		User:inform("drop end")
	end

    if (User.lastSpokenText == "gaia") then
        for i=1,50 do
	    
		local rndValue = math.random(1,#plnt)
		local myPlant = plnt[rndValue]
	    local myGrndsList = grnd[rndValue]
		local myPos = position( math.random(0,1024), math.random(0,1024), 0 )
		local theTile=world:getField(myPos);
		if theTile then
			local groundType = base.common.GetGroundType( theTile:tile() )
			
			local success = false
			for i=1,#myGrndsList do
				if groundType == myGrndsList[i] then
					success = true
				end
			end			
			
			if success then
				User:inform(""..myPos.x.." "..myPos.y.." "..myPos.z)
				world:createItemFromId(myPlant,1,myPos,false,333,nil)
				herbCounter = herbCounter + 1
			end
		end	
    end	
end