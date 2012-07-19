-- Player death

-- deadPlayer - The player (character) whose hitpoints have just been set to zero

require("base.common")
module("server.playerdeath", package.seeall)

function playerDeath(deadPlayer)
    world:makeSound(25,deadPlayer.pos);
    showDeathDialog(deadPlayer);
	
    --vilarion: Please insert the death consequences here.
	
end

function showDeathDialog(deadPlayer)

	local callback = function(nothing) end; --empty callback
		
	if deadPlayer:getPlayerLanguage() == 0 then		
		dialog = MessageDialog("Tod", "Du bist gestorben. Die Welt um dich herum verblasst und du bereitest dich darauf vor, den Göttern in Chergas Reich der Toten gegenüberzutreten.", callback);
	else		
		dialog = MessageDialog("Death", "You have died. The world around you fades and you prepare yourself to face the Gods in the afterlife of Cherga's Realm.", callback);
	end	
	
	deadPlayer:requestMessageDialog(dialog); --showing the text
		
end