function VampirismDesease(Monster, Enemy)
	local rand = math.random(100);
	if (rand < 5) then
		base.common.TalkNLS(Monster, Character.say, "#me murmelt eine mystische Formel.", "#me mumbles a mystical formula.");
		world:gfx(21, Monster.pos);
		world:gfx(6, Enemy.pos);
		world:makeSound(1, Enemy.pos); -- TODO: Assign Sound ID
		myEffect = LongTimeEffect(501,10);
		Enemy.effects:addEffect(myEffect, true);
	end
end
