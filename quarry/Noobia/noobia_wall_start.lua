-- INSERT INTO triggerfields VALUES (42,34,100,'triggerfield.noobia_wall_start');
-- INSERT INTO triggerfields VALUES (43,34,100,'triggerfield.noobia_wall_start');
-- INSERT INTO triggerfields VALUES (44,34,100,'triggerfield.noobia_wall_start');
-- INSERT INTO triggerfields VALUES (45,34,100,'triggerfield.noobia_wall_start');
-- INSERT INTO triggerfields VALUES (46,34,100,'triggerfield.noobia_wall_start');
-- INSERT INTO triggerfields VALUES (47,34,100,'triggerfield.noobia_wall_start');
-- INSERT INTO triggerfields VALUES (48,34,100,'triggerfield.noobia_wall_start');

require("base.common")

module("triggerfield.noobia_wall_start", package.seeall)

function MoveToField(Character)

	if Character:getQuestProgress(2) < 20 and not Character:isAdmin() then
		Character:warp(position(46,32,100));
		base.common.InformNLS(Character,
			"Du hast die ersten Lektionen noch nicht absolviert. Gehe den Weg zurück zum Hafen und spreche den Menschen Henry an. Wenn du fertig bist, wird er dich weiterschicken.",
			"You haven't passed the first lessons. Go this way back to the harbour and talk to the human Henry. He will send you further if you're done.");
	elseif (not Character:isAdmin() ) then
		base.common.InformNLS(Character,
			"Siehst du den Gnom dort vorn? Vielleicht solltest du zu ihm gehen und 'Hallo' sagen. Wenn du einem NPC begegnest, dann grüße ihn einfach, um ein Gespräch zu beginnen.",
			"Du you see the Gnome over there? Perhaps you should go to him and say 'Hello'. If you meet a NPC just greet him to start a conversation.");
	end
end
