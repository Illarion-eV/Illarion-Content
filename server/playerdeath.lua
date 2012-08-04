-- Player death
-- deadPlayer - The player (character) whose hitpoints have just been set to zero

require("base.common")
module("server.playerdeath", package.seeall)

DURABILITY_LOSS = 10
BLOCKED_ITEM = 228

function playerDeath(deadPlayer)
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
    
	MirrorOfDeathCounter(deadPlayer)
    world:makeSound(25,deadPlayer.pos);
    showDeathDialog(deadPlayer);
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

function MirrorOfDeathCounter(deadPlayer)
    -- see MirrorOfDeath(User) in "item.id_2874_mirror"
	local deathCounter
	local getProgress = deadPlayer:getQuestProgress(666)
	
	if getProgress < 10000 then
	    deadPlayer:setQuestProgress(666,10001)
	else
        deathCounter = getProgress-((math.floor(getProgress/10))*10)  
		if deathCounter < 5 then
		    deathCounter = deathCounter + 1
			deadPlayer:setQuestProgress(666,deathCounter)
        end
    end
end