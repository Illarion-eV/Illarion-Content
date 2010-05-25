-- INSERT INTO triggerfields VALUES (62,63,100,'tf_noobia_ladder.lua');
-- INSERT INTO triggerfields VALUES (62,64,100,'tf_noobia_ladder.lua');
-- INSERT INTO triggerfields VALUES (62,65,100,'tf_noobia_ladder.lua');

require("base.common")

function MoveToField(Character)
    if Character:getQuestProgress(2) == 48 then
		base.common.InformNLS(Character,
		"Um eine Leiter hinauf- oder hinunterzuklettern, trete einfach auf die Leiter.",
		"To climb up or down a ladder, just step on the ladder.")
		Character:setQuestProgress(2,49);
	end
end
