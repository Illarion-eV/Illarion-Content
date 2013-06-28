
require("alchemy.base.brewing")
require("scheduled.alchemy")

-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

HERB_LIST={15,80,154,200,201,259,290,302,772,778,2493,138,146,152,754,755,756,757,758,760,761,762,764,765,766,768,769,81,133,134,135,136,137,140,141,142,143,144,145,147,148,149,151,153,155,156,158,159,160,161,162,163,199,388,752,753,759,763,767}
 
 
 
 
function UseItem(User, SourceItem,ltstate)
   if User.lastSpokenText == "schatz" then
        User:inform(""..User:getQuestProgress(60))
   end

   if User.lastSpokenText == "alchemist" then
	    User:setMagicType(3)
		User:increaseAttrib("essence",30)
	    User:inform("You are now an alchemist.")
		return
	end
	
	if User.lastSpokenText == "herbs" then
	    --
		for i=1,#HERB_LIST do
		    User:createItem(HERB_LIST[i],20,333,nil)
		end
	end
	
	if User.lastSpokenText == "fruit" then
	    scheduled.alchemy.startAlchemyTest()
	end
	
	if User.lastSpokenText == "cross" then
		npc.yellowcross.nextCycle(User)
	end
	
	if User.lastSpokenText == "lte" then
	    local  find, myEffect = User.effects:find(329)
		if find then
			local effectRemoved = User.effects:removeEffect(329)
			if effectRemoved then 
				User:inform("lte 329 removed")
			end
		end
	end
	
	local found, _, Value = string.find(User.lastSpokenText, "mp (%d+)")
	if found then
		User.movepoints = User.movepoints - Value
		User:inform("mp : "..User.movepoints)
	end
	
end






function LookAtItem(player, item)
    
end	