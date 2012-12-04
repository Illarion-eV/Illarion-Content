module("lte.p_priests", package.seeall)
-- INSERT INTO longtimeeffects VALUES (17,'priests','lte_p_priests.lua');

function addEffect(Effect,Char)
	Char:inform("Priest effect added");
end

function callEffect(Effect,Char)
	Effect.nextCalled = 100;
	if string.find(Char.lastSpokenText,"remove priest") then
		Char.effects:removeEffect(17);
	end
end

function removeEffect(Effect,Char)
	Char:inform("Priest effect removed");
end
