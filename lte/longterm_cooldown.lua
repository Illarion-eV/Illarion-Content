-- Longterm Cooldown
-- by Estralis
-- EffectID = 33;

require("base.common")

module("lte.longterm_cooldown", package.seeall)

function addEffect( Effect, Character)
    -- it is needed to add at least value to make sure the effect does not get deleted right after
    -- the first call
    Effect:addValue("10",0);
end;

function callEffect( Effect, Char ) -- Effect is called

    if Char:idleTime() < 180 then --absolutely no regeneration effect if the player is afk for more than three minutes

		--Addition by Estralis: Quest 119/120 (Cadomyr daily missions)
	    theQuestStatus=Char:getQuestProgress(120);
	
		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(120,theQuestStatus-1); --cooling!
		end
	    --Addition end
	
	end --all above is only conducted for players that aren't afk for more than five minutes

	Effect.nextCalled = 3000; --Effect gets called each 5 minutes

	return true; --No idea why!
	
end

function removeEffect( Effect, Character )

--This effect doesn't get removed.

end

function loadEffect(Effect, Character)

end
