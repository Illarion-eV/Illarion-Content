-- prevent monsters from stepping on and blocking ladders

-- UPDATE common SET com_script='I_35_2832_ladder.lua' WHERE com_itemid IN (35,2832)

-- NOT in DB, because it blocks the warp fields.
require("base.common")

function CharacterOnField( user )
	
	if ( user:get_type( )==1 ) then
		step_away(user);
	end
	
	if equapos(user.pos,position(60,67,101)) then
		user:warp(position(59,67,100));
	elseif equapos(user.pos,position(60,67,100)) then
		user:warp(position(59,67,101));
	end
end

function step_away(monster)
	
	frontPos = base.common.GetFrontPosition(monster);
	
	monster:warp(frontPos);
	
	monster.movepoints = monster.movepoints-math.random(30,40);
	monster:talkLanguage(CCharacter.say, CPlayer.german, "#me stolpert über die Leiter, kann sich aber wieder aufrichten.");
	monster:talkLanguage(CCharacter.say, CPlayer.english, "#me stumbles over the ladder, but can straighten up again.");
end
