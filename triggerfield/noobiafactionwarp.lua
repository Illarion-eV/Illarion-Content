-- noobia triggerfields: teleport char to Cadomyr, Runewick or Galmair
-- by Merung
function MoveToField(Character)

    -- we define our destination
    if Character.pos == postion(--[[cadomyr-field]]) then 
	   destination = postion(--[[cadomyr]]) 
	elseif Character.pos == postion(--[[runewick-field]]) then 
	   destination = postion(--[[runcewick]])
    elseif Character.pos == postion(--[[galmair-field]]) then 
	   destination = postion(--[[galmair]])
	end

    world:gfx(41,Character.pos)	
	Character:warp(destination)
    world:makeSound(4,destination)
    world:gfx(41,Character.pos)	
	
	--[[FactionCheck = base.factions.get_Faction(Character)]]
	if not Character:isAdmin() --[[and not (FactionCheck[2]~=0)]] then -- admins and chars who are already members of a faction are unaffected and just warped 
	
		-- we delete some items, if the char has more than one of them
		local DeleteList = {--[[ids]]}
		for i=1,#DeleteList do
			itemAmount = Character:count(DeleteList[i])
			Character:eraseItem( ItemListe[i], (itemAmount -1))
		end	
		
		-- we remove the newbie lte
		find, myEffect = Character.effects:find(13)
		if find then
			removedEffect = Character.effects:removeEffect(13)
			if not removedEffect then -- security check
				Character:inform("Please contact a dev or gm. error: triggerfields to factions")
			end
		end
		
		Character:setAttrib("hitpoints",10000)
		Character:setAttrib("mana",10000)
		Character:setAttrib("foodlevel",30000)
		
		local callbackNewbie = function(dialogNewbie) end; --empty callback
			
	        if Character:getPlayerLanguage() == 0 then
		        dialogNewbie = MessageDialog("Überschrift","deutscher Text", callbackNewbie)
	        else	
		        dialogNewbie = MessageDialog("Headline", "english text", callbackNewbie)
	        end	
	        Character:requestMessageDialog(dialogNewbie)
	end	
end	