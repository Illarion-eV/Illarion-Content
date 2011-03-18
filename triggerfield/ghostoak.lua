-- Quest: The Ghost Oak (112)
require("base.common")

module("triggerfield.ghostoak", package.seeall)

function MoveToField(User)
	local QuestID = 112;
	--if (User:getQuestProgress(QuestID) == 1) then
		base.common.InformNLS(User, 
			"[Queststatus] Ein Schauer läuft dir den Rücken herunter, als du den Hain betrittst. Du hast die Geistereiche gefunden.",
			"[Quest status] A shiver runs down your spine as you enter the grove. You found the ghost oak.");
		--User:setQuestProgress(QuestID, 2);
	--end
end
