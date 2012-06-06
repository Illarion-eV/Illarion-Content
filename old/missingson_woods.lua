-- Quest: The Missing Son
require("base.common")

module("triggerfield.missingson_woods", package.seeall)

function MoveToField(User)
	local QuestID = 999;
	if (User:getQuestProgress(QuestID) == 1) then
		base.common.InformNLS(User, 
			"Als du dich im Wald umsiehst, siehst du eine kleine Spielzeugpuppe auf dem Boden liegen.",
			"While looking around in the wood, you see a small doll on the ground.");
		base.common.InformNLS(User,
			"Kurz darauf fallen dir Fußspuren im Wald auf, sie scheinen höchstwahrscheinlich von einem Kind zu stammen. Sie führen in Richtung [DIRECTION_DE]!",
			"Furthermore, you see some footprints on the ground, they seem to be of a young child. They lead to the [DIRECTION_EN].");
		User:setQuestProgress(QuestID, 2);
	end
end
