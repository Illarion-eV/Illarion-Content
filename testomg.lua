function MGolem_Shield (monster,char)
--  Permanent Spell Shield - each time when casted upon, there is a chance of either shooting a spell back at the attacker (as reflection) or healing itself slightly. (onCasted)	
	if (math.random(100)<= 25) then	
		if (math.random(100)<= 70) then
			monster:talk(CCharacter.say, "#me's merinium body absorbs the spell, soon to repell it back at the caster.");
			char:increaseAttrib ("hitpoints",-3000);
		else
			monster:talk(CCharacter.say, "#me's merinium body absorbs the spell, seemingly energising the it with new strenght.");
			monster:increaseAttrib ("hitpoints",1500);
		end
	else
		return false;
	end
end