-- INSERT INTO triggerfields VALUES (59,89,100,'tf_noobia_wall_desert.lua');
-- INSERT INTO triggerfields VALUES (59,90,100,'tf_noobia_wall_desert.lua');
-- INSERT INTO triggerfields VALUES (59,91,100,'tf_noobia_wall_desert.lua');
-- INSERT INTO triggerfields VALUES (59,92,100,'tf_noobia_wall_desert.lua');
-- INSERT INTO triggerfields VALUES (59,93,100,'tf_noobia_wall_desert.lua');
-- INSERT INTO triggerfields VALUES (59,94,100,'tf_noobia_wall_desert.lua');
-- INSERT INTO triggerfields VALUES (59,95,100,'tf_noobia_wall_desert.lua');
-- INSERT INTO triggerfields VALUES (59,96,100,'tf_noobia_wall_desert.lua');
-- INSERT INTO triggerfields VALUES (59,97,100,'tf_noobia_wall_desert.lua');
-- INSERT INTO triggerfields VALUES (59,98,100,'tf_noobia_wall_desert.lua');
-- INSERT INTO triggerfields VALUES (59,99,100,'tf_noobia_wall_desert.lua');

require("base.common")

function MoveToField(Character)

	if Character:getQuestProgress(2) < 48 and not Character:isAdmin() then
		Character:warp(position(56,98,100));
		base.common.TempInformNLS(Character,
			"Du hast die Lektionen von Amelia noch nicht absolviert. Gehe den Weg zurück zu ihr und spreche sie an. Wenn du fertig bist, wird sie dich weiterschicken.",
			"You haven't passed the lessons of Amelia. Go this way back and talk to her. She will send you further if you're done.");
	end
end
