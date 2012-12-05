-- INSERT INTO triggerfields VALUES (-471,241,0,'triggerfield.hellbriar_hidden_entrance');
-- INSERT INTO triggerfields VALUES (-469,241,0,'triggerfield.hellbriar_hidden_entrance');

module("triggerfield.hellbriar_hidden_entrance", package.seeall)

function MoveToField(User)
	
	local WALLPOS = position(-470,241,0);
	local theWall = world:getItemOnField(WALLPOS);
	if theWall.id ~= 287 or (theWall.id == 287 and theWall.wear ~= 255) then
		
		if world:isCharacterOnField(WALLPOS) then
			return;
		end
		world:erase(theWall,250);
		theWall = world:createItemFromId(287,1,WALLPOS,true,333,0);
		theWall.wear = 255;
		world:changeItem(theWall);
		local charList = world:getPlayersInRangeOf(WALLPOS,15);
		for i,char in charList do
			if char.pos.z == WALLPOS.z then
				char:inform(char:getPlayerLanguage()==0 and
					"#w Du hörst das Geräusch von sich verschiebendem Gestein." or
					"#w You hear the sound of moving stone.");
			end
		end
	end
end
