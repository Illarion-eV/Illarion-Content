-- INSERT INTO triggerfields VALUES (33,21,100,'triggerfield.noobia_spawn');
-- INSERT INTO triggerfields VALUES (33,22,100,'triggerfield.noobia_spawn');

require("base.common")

module("triggerfield.noobia_spawn", package.seeall)

function MoveToField(Character)
    Status=Character:getQuestProgress(2);
	if (Status<4 and Status~=0) then
		Character:setQuestProgress(2,4);
		if (Status~=3) then
		base.common.InformNLS(Character,
			"Um etwas zu sprechen, gib den gewünschten Text mit deiner Tastatur ein - dieser erscheint automatisch im Nachrichtenfenster. Um ihn schließlich zu senden, drücke die Taste [Enter].",
			"To say something, write the desired text with your keyboard - it will automatically appear in the message window. To finally send it, press the button [Enter].");
		end
	end
end
