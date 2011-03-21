-- Quest: A spark to a flame (113)
require("base.common")

module("triggerfield.asparktoaflame", package.seeall)

function MoveToField(User)
	if (User:getQuestProgress(113) == 1) then
		base.common.InformNLS(User, 
			"[Queststatus] Ein Schauer läuft dir den Rücken herunter, als du den Hain betrittst. Du hast die Geistereiche gefunden.",
			"[Quest status] A shiver runs down your spine as you enter the grove. You found the ghost oak.");
		User:setQuestProgress(113, 2);
	end
end
