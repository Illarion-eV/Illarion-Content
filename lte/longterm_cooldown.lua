--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
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


		--Addition by Envi: Quest 680 (Evil Rock Reward)
	    theQuestStatus=Char:getQuestProgress(680);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(680,theQuestStatus-1); --cooling!
			if theQuestStatus == 1 then --only for this quest. the player should know when he can do it again.
				base.common.InformNLS(Char,"[Info] Die Zeit scheint reif, um dein Glück auf der Insel 'Böser Fels' erneut zu versuchen.","[Info] It seems it is time to try your luck again on the island 'Evilrock'.");
			end
		end
	    --Addition end

		--Addition by Envi: Quest 665 (Evil Rock Vision)
	    theQuestStatus=Char:getQuestProgress(665);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(665,theQuestStatus-1); --cooling!
		end
	    --Addition end

		--Addition by Envi: Quest 673 (Feed Galmair's bear)
	    theQuestStatus=Char:getQuestProgress(673);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(673,theQuestStatus-1); --cooling!
		end
	    --Addition end


		--Addition by Envi: Quest 811 (Licence Cadomyr)
	    theQuestStatus=Char:getQuestProgress(811);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(811,theQuestStatus-1); --cooling!
			if theQuestStatus == 1 then --only for this quest. the player should know when he can do it again.
				base.common.InformNLS(Char,"Deine Lizenz für die Benutzung der Geräte von Cadomyr ist abgelaufen. Du kannst sie im Zensusbüro von Cadomyr erneuern.","Your licence for Cadomyr's static tools has expired. You can get a new one at the census office of Cadomyr.");
			end
		end
	    --Addition end

		--Addition by Envi: Quest 812 (Licence Runewick)
	    theQuestStatus=Char:getQuestProgress(812);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(812,theQuestStatus-1); --cooling!
			if theQuestStatus == 1 then --only for this quest. the player should know when he can do it again.
				base.common.InformNLS(Char,"Deine Lizenz für die Benutzung der Geräte von Runewick ist abgelaufen. Du kannst sie im Zensusbüro von Runewick erneuern.","Your licence for Runewick's static tools has expired. You can get a new one at the census office of Runewick.");
			end
		end
	    --Addition end

		--Addition by Envi: Quest 811 (Licence Galmair)
	    theQuestStatus=Char:getQuestProgress(813);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(813,theQuestStatus-1); --cooling!
			if theQuestStatus == 1 then --only for this quest. the player should know when he can do it again.
				base.common.InformNLS(Char,"Deine Lizenz für die Benutzung der Geräte von Galmair ist abgelaufen. Du kannst sie im Zensusbüro von Galmair erneuern.","Your licence for Galmair's static tools has expired. You can get a new one at the census office of Galmair.");
			end
		end
	    --Addition end

		--Addition by Envi: Quest 613 (Paula Bronzeblatt)
	    theQuestStatus=Char:getQuestProgress(613);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(613,theQuestStatus-1); --cooling!
			if theQuestStatus == 1 then --only for this quest. the player should know when he can do it again.
				base.common.InformNLS(Char,"Eine Taube wirft ein Pergamentstück neben dir ab. Du liest: 'Ich sollte morgen wieder eine Schatzkarte für dich haben. -Paula Bronzeblatt'","A dove drops a parchment next to you. You read: 'I should have another treasure map for you tomorrow. -Paula Bronzeblatt'");
			end
		end
	    --Addition end


		--Addition by Envi: Quest 614 (Arno Unterland)
	    theQuestStatus=Char:getQuestProgress(614);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(614,theQuestStatus-1); --cooling!
			if theQuestStatus == 1 then --only for this quest. the player should know when he can do it again.
				base.common.InformNLS(Char,"Eine Taube wirft ein Pergamentstück neben dir ab. Du liest: 'Morgen können wir wieder etwas drehen. Kommt vorbei! -Arno Unterland'","A dove drops a parchment next to you. You read: 'Tomorrow, we can do it again. Visit me! -Arno Unterland'");
			end
		end
	    --Addition end


		--Addition by Envi: Quest 661 (Elstree Forest)
	    theQuestStatus=Char:getQuestProgress(661);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(661,theQuestStatus-1); --cooling!
		end
	    --Addition end

		--Addition by Envi: Quest 660 (Galmair bridges)
	    theQuestStatus=Char:getQuestProgress(660);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(660,theQuestStatus-1); --cooling!
		end
	    --Addition end

		--Addition by Estralis: Quest 119/120 (Cadomyr daily missions)
	    theQuestStatus=Char:getQuestProgress(120);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(120,theQuestStatus-1); --cooling!
		end
	    --Addition end

		--Addition by Estralis: Quest 152/153 (Galmair daily missions)
	    theQuestStatus=Char:getQuestProgress(153);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(153,theQuestStatus-1); --cooling!
		end
	    --Addition end

		--Addition by Estralis: Quest 160/161 (Runewick daily missions)
	    theQuestStatus=Char:getQuestProgress(161);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(161,theQuestStatus-1); --cooling!
		end
	    --Addition end

		--Addition by Merung: Quest 162 (Runewick daily missions II)
	    theQuestStatus=Char:getQuestProgress(165);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(165,theQuestStatus-1); --cooling!
		end
	    --Addition end

		--Addition by Estralis: Quest 127/128/129 Caravan of Honour (Phillip Molitor) Cooldown
	    theQuestStatus=Char:getQuestProgress(129);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(129,theQuestStatus-1); --cooling!
		end
		--Addition end

		--Addition by Estralis: Quest 162/163/164 Glorious Bounty (Palis Nestros) Cooldown
	    theQuestStatus=Char:getQuestProgress(164);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(164,theQuestStatus-1); --cooling!
		end
		--Addition end

		--Addition by Caldarion: Quest 181/182/183 Spy Informant (Bula Glasha) Cooldown
	    theQuestStatus=Char:getQuestProgress(183);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(183,theQuestStatus-1); --cooling!
		end
		--Addition end

		--Addition by Caldarion: Quest 184/185/186 The Researcher (Maelyrra Umrielyth) Cooldown
	    theQuestStatus=Char:getQuestProgress(186);

		if theQuestStatus > 0 then --Is there a cooldown? Will only be reduced if the player isn't AFK/idle
			Char:setQuestProgress(186,theQuestStatus-1); --cooling!
		end
		--Addition end

	end --all above is only conducted for players that aren't afk for more than five minutes

	--Addition by Estralis: Quest 127/128/129 Caravan of Honour (Phillip Molitor) Countdown
	theQuestStatus=Char:getQuestProgress(128);

	if theQuestStatus == 1 then --Time over!

        base.common.InformNLS(Char,"[Auftragssstatus] Du hast es nicht geschafft, den Auftrag von Philipp Molitor zu erledigen.","[Order status] You failed to fulfil the order of Philipp Molitor."); -- Feedback!
		Char:setQuestProgress(127,0);

	end

	if theQuestStatus == 3 then --Ten minutes left!

        base.common.InformNLS(Char,"[Auftragssstatus] Es verbleiben dir noch zehn Minuten, um den Auftrag von Philipp Molitor zu erledigen.","[Order status] You have ten minutes left to fulfil the order of Philipp Molitor."); -- Feedback!

	end

	if theQuestStatus == 13 then --One hour left

	    base.common.InformNLS(Char,"[Auftragssstatus] Es verbleibt dir noch eine Stunde, um den Auftrag von Philipp Molitor zu erledigen.","[Order status] You have one hour left to fulfil the order of Philipp Molitor."); -- Feedback!

	end

	if theQuestStatus > 0 then --Is there a countdown? Will be reduced even if the player is AFK/idle
		Char:setQuestProgress(128,theQuestStatus-1); --counting down!
	end
	--Addition end

	--Addition by Estralis: Quest 162/163/164 Glorious Bounty (Palis Nestros) Cooldown
	theQuestStatus=Char:getQuestProgress(163);

	if theQuestStatus == 1 then --Time over!

        base.common.InformNLS(Char,"[Kopfgeldstatus] Das Kopfgeld von Palis Nestros kannst du dir abschminken.","[Bounty status] You can kiss the bounty of Palis Nestros goodbye."); -- Feedback!
		Char:setQuestProgress(162,0);

	end

	if theQuestStatus == 3 then --Ten minutes left!

        base.common.InformNLS(Char,"[Kopfgeldstatus] In zehn Minuten läuft dein Kopfgeldvertrag mit Palis Nestros aus.","[Bounty status] In ten minutes, your bounty contract with Palis Nestros will expire."); -- Feedback!

	end

	if theQuestStatus == 13 then --One hour left

	    base.common.InformNLS(Char,"[Kopfgeldstatus] Eine Stunde verbleibt dir, um das Kopfgeld von Palis Nestros zu verdienen.","[Bounty status] One hour left for earning the bounty of Palis Nestros."); -- Feedback!

	end

	if theQuestStatus > 0 then --Is there a countdown? Will be reduced even if the player is AFK/idle
		Char:setQuestProgress(163,theQuestStatus-1); --counting down!
	end
	--Addition end

	--Addition by Caldarion: Quest 181/182/183 Spy Informant (Bula Glasha) Cooldown
	theQuestStatus=Char:getQuestProgress(182);

	if theQuestStatus == 1 then --Time over!

        base.common.InformNLS(Char,"[Informanten Status] Du warst zu langsam um die Informationen zu beschaffen, du bekommst keine Belohnung.","[Information status] You were too slow collecting data, you have lost your fee."); -- Feedback!
		Char:setQuestProgress(181,0);

	end

	if theQuestStatus == 3 then --Ten minutes left!

        base.common.InformNLS(Char,"[Informanten Status] In zehn Minuten ist deine Chance vestrichen, um Informationen für Bula Glasha zu sammeln.","[Information status] In ten minutes, your chance to collect information for Bula Glasha will be over."); -- Feedback!

	end

	if theQuestStatus == 13 then --One hour left

	    base.common.InformNLS(Char,"[Informanten Status] Eine Stunde verbleibt um Informationen für Bula Glasha zu sammeln.","[Information status] One hour left for earning the information fee of Bula Glasha."); -- Feedback!

	end

	if theQuestStatus > 0 then --Is there a countdown? Will be reduced even if the player is AFK/idle
		Char:setQuestProgress(182,theQuestStatus-1); --counting down!
	end
	--Addition end

		--Addition by Caldarion: Quest 184/185/186 The Researcher (Maelyrra Umrielyth) Cooldown
	theQuestStatus=Char:getQuestProgress(185);

	if theQuestStatus == 1 then --Time over!

        base.common.InformNLS(Char,"[Forschung Status] Du warst zu langsam um die Informationen zu beschaffen, du bekommst keine Belohnung.","[Research status] You were too slow collecting data, you have lost your fee."); -- Feedback!
		Char:setQuestProgress(184,0);

	end

	if theQuestStatus == 3 then --Ten minutes left!

        base.common.InformNLS(Char,"[Forschung Status] In zehn Minuten ist deine Chance vestrichen, um Informationen für Maelyrra Umrielyth zu sammeln.","[Research status] In ten minutes, your chance to collect information for Maelyrra Umrielyth will be over."); -- Feedback!

	end

	if theQuestStatus == 13 then --One hour left

	    base.common.InformNLS(Char,"[Forschung Status] Eine Stunde verbleibt um Forschung für Maelyrra Umrielyth zu sammeln.","[Research status] One hour left for earning the research fee of Maelyrra Umrielyth."); -- Feedback!

	end

	if theQuestStatus > 0 then --Is there a countdown? Will be reduced even if the player is AFK/idle
		Char:setQuestProgress(185,theQuestStatus-1); --counting down!
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
