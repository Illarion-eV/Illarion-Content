require("base.common")


-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function UseItem(User,SourceItem,TargetItem,counter,param)
    local a,b,quality = string.find(User.lastSpokenText,"fire (%d+)")
    if a ~= nil then
        local quality = tonumber(quality)
		-- there is already a fire spitting potion effect going on
		-- char pukes out a flame on the map, no further effect added
		local foundEffect, myEffect = User.effects:find(60)
		if foundEffect then
			base.common.InformNLS(User, "Sofort steigt Hitze und Erbrochenes in dir auf.", 
			"Immediately, your body heats up and and some stomach contents comes up.")
			User:talkLanguage(Character.say, Player.german, "#me übergibt sich und spuckt dabei einen großen Feuerball aus.");
			User:talkLanguage(Character.say, Player.english, "#me throws up and pukes out a big fireball.");
			local frontPos = base.common.GetFrontPosition(User)
			world:makeSound(5,frontPos)
		    world:gfx(9,frontPos)
			world:createItemFromId(359,1,frontPos,true,333,nil)
			effectRemoved = User.effects:removeEffect(60)
			if not effectRemoved then
				base.common.InformNLS( User,"Fehler: Informiere einen Dev.", "Error: Inform a dev.")
				return
			end	
			return
	    end		
		
		-- inform and add effect
		User:inform("Die Flüssigkeit läuft deine Kehle hinunter und sofort merkst du ein starkes Brennen.",
		            "The potion runs down your throat and immediately, you get the feeling that throat was on fire.")
		
		-- quality determines length until char spits fire (better quality, shorter time)
		local firstCall = (20-(--[[math.floor(SourceItem.]]quality/100)*1.5)*10
		
		local myEffect=LongTimeEffect(60,firstCall)
		myEffect:addValue("quality",--[[math.floor(SourceItem.]]quality/100)
		User.effects:addEffect(myEffect)
	end		
end