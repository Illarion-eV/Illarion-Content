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

    if Char:idleTime() < 300 then --absolutely no regeneration effect if the player is afk for more than five minutes

		--Addition by Estralis: Quest 119/120 (Cadomyr daily missions)
	    theQuestStatus=Char:getQuestProgress(120);
	
		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(120,theQuestStatus-1); --cooling!
		end
	    --Addition end
		
		--Addition by Estralis: Quest 127/128/129 Caravan of Honour (Phillip Molitor) Cooldown
	    theQuestStatus=Char:getQuestProgress(129);
	
		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(129,theQuestStatus-1); --cooling!
		end
		--Addition end
	
	end --all above is only conducted for players that aren't afk for more than five minutes

	--Addition by Estralis: Quest 127/128/129 Caravan of Honour (Phillip Molitor) Countdown
	theQuestStatus=Char:getQuestProgress(128);
	
	if theQuestStatus == 1 then --Time over!
	
        base.common.InformNLS(Char,"[Auftragssstatus] Du hast es nicht geschafft, den Auftrag von Philipp Molitor zu erledigen.","[Order status] You failed to fulfill the order of Philipp Molitor."); -- Feedback!
		Char:setQuestProgress(127,0);
		
	end
	
	if theQuestStatus == 12 then --One hour left
	
	    base.common.InformNLS(Char,"[Auftragssstatus] Es verbleibt dir noch eine Stunde, um den Auftrag von Philipp Molitor zu erledigen.","[Order status] You have one hour left to fulfill the order of Philipp Molitor."); -- Feedback!
	
	end
	
	if theQuestStatus > 0 then --Is there a countdown? Will be reduced even if the player is AFK/idle
		Char:setQuestProgress(128,theQuestStatus-1); --counting down!
	end
	--Addition end
	
	Effect.nextCalled = 3000; --Effect gets called each 5 minutes

	return true; --No idea why!
	
end

function removeEffect( Effect, Character )

--This effect doesn't get removed.

end

function loadEffect(Effect, Character)

end
