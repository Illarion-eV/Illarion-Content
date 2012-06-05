-- INSERT INTO triggerfields VALUES (60,55,101,'triggerfield.noobia_door');
-- INSERT INTO triggerfields VALUES (61,55,101,'triggerfield.noobia_door');
-- INSERT INTO triggerfields VALUES (62,55,101,'triggerfield.noobia_door');
-- INSERT INTO triggerfields VALUES (63,55,101,'triggerfield.noobia_door');

require("base.common")

module("triggerfield.noobia_door", package.seeall)

function MoveToField(Character)
    if Character:getQuestProgress(2) == 49 then
		base.common.InformNLS(Character,
		"Um eine Türe zu öffnen oder zu schließen, benutze einfach die Türe.",
		"To open or close a door, just use the door.")
		Character:setQuestProgress(2,50);
	end
end
