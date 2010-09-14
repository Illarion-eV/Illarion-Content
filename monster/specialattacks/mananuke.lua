function ManaNuke(Monster, Enemy)
	if (Enemy:get_magic_type() == 1) then
		local rand = math.random(100);
		if (rand < 5) then
			base.common.TalkNLS(Monster, CCharacter.say, "#me murmelt eine mystische Formel.", "#me mumbles a mystical formula.");
			world:gfx(14, Monster.pos); -- TODO: Assign GFX ID
			world:gfx(15, Enemy.pos); -- TODO: Assign GFX ID
			world:makeSound(1, Enemy.pos); -- TODO: Assign Sound ID
			myEffect = CLongTimeEffect(500,5);
			Character.effects:addEffect(myEffect, true);
		end
	end
end