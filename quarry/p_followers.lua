module("lte.p_followers", package.seeall)
-- INSERT INTO longtimeeffects VALUES (6,'followers','lte_p_followers.lua');


function addEffect(Effect,Char)
	Char:inform("Follower effect added");
end

function callEffect(Effect,Char)
	Effect.nextCalled = 100;
	if string.find(Char.lastSpokenText,"remove follower") then
		Char.effects:removeEffect(6);
	end
end

function removeEffect(Effect,Char)
	Char:inform("Follower effect removed");
end
