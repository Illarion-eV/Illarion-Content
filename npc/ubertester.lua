
module("npc.ubertester", package.seeall)


function receiveText(texttype, message, speaker)
    thisNPC:increaseSkill(1,"common language",100);
    if lastspeaker==nil then 
	    lastspeaker=speaker;
	end
    thisNPC:talk(CCharacter.say,"I heard "..speaker.name..".");
	thisNPC:talk(CCharacter.say,"Before that, I heard "..lastspeaker.name..".");
	lastspeaker=speaker;
end;
function nextCycle()

end

