-- Player death
-- deadPlayer - The player (character) whose hitpoints have just been set to zero

require("base.common")
module("server.playerdeath", package.seeall)

DURABILITY_LOSS = 10
BLOCKED_ITEM = 228

function playerDeath(deadPlayer)

    if deadPlayer:isAdmin() then --Admins don't die. Failed, noob!
	
	    deadPlayer:increaseAttrib("hitpoints",10000); -- Respawn
		base.common.InformNLS(deadPlayer,"[Wiederbelebung] Admins sterben nicht.","[Respawn] Admins don't die."); --sending a message
		return; --bailing out!
			
    elseif deadPlayer.pos.z==100 or deadPlayer.pos.z==101 then --someone died on Noobia!
	
	    deadPlayer:increaseAttrib("hitpoints",10000); -- Respawn
		world:gfx(53,deadPlayer.pos);
        base.common.InformNLS(deadPlayer,"[Wiederbelebung] Während des Tutorials bist du 'unsterblich'. Im Hauptspiel ist die Wiederbelebung mit merklichen Konsequenzen für deinen Charakter verbunden.","[Respawn] During the tutorial, you are 'immortal'. In the main game, serious consequences for your character are triggered upon respawn."); --sending a message
        return; --bailing out!
     
    elseif deadPlayer.pos.z==-40 then -- death in the prison mine; no kill taxi!	 
	
	    deadPlayer:increaseAttrib("hitpoints",10000); -- Respawn
		world:gfx(53,deadPlayer.pos);
        base.common.InformNLS(deadPlayer,"[Wiederbelebung] In der Gefängnismine bist du 'unsterblich'. Weiterarbeiten!","[Respawn] In the prison mine, you are 'immortal'. Work on!"); --sending a message
        return; --bailing out!
		
	else --valid death
	
		world:makeSound(25,deadPlayer.pos);
        showDeathDialog(deadPlayer);
		
        for i=Character.head,Character.coat do
            local item = deadPlayer:getItemAt(i)
            local common = world:getItemStats(item)

            if item.id > 0 and item.id ~= BLOCKEDITEM and item.quality > 100 and not common.isStackable then
                local durability = item.quality % 100

                if durability <= DURABILITY_LOSS then
                    deadPlayer:increaseAtPos(i, -1)
                else
                    item.quality = item.quality - DURABILITY_LOSS
                    world:changeItem(item)
                end
            end
        end
    end
	

end

function showDeathDialog(deadPlayer)

	local callback = function(nothing) end; --empty callback
		
	if deadPlayer:getPlayerLanguage() == 0 then		
		dialog = MessageDialog("Tod", "Du bist gestorben. Deine Ausrüstung nimmt schweren Schaden. Die Welt um dich herum verblasst und du bereitest dich darauf vor, den Göttern in Chergas Reich der Toten gegenüberzutreten.", callback);
	else		
		dialog = MessageDialog("Death", "You have died. Your equipment got damaged seriously. The world around you fades and you prepare yourself to face the Gods in the afterlife of Cherga's Realm.", callback);
	end	
	
	deadPlayer:requestMessageDialog(dialog); --showing the text
		
end