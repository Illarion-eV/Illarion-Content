-- INSERT INTO triggerfields VALUES (115,520,0,'triggerfield.donation_cadomyr');
-- INSERT INTO triggerfields VALUES (115,521,0,'triggerfield.donation_cadomyr');
-- INSERT INTO triggerfields VALUES (116,520,0,'triggerfield.donation_cadomyr');
-- INSERT INTO triggerfields VALUES (116,521,0,'triggerfield.donation_cadomyr');

require("base.common")
require("triggerfield.donation_base")

module("triggerfield.donation_cadomyr", package.seeall)

-- Donation to the Cadomyr treasury
-- 115, 552, 0 = Cadomyr

function PutItemOnField(Item,User)

    donated=triggerfield.donation_base.donate(Item,User,"Cadomyr","Rosaline Edwards","TreasureCadomyr"); -- That's all folks
	
	-- Quest 151 (Cadomyr Treasury, NPC Ioannes Faber)

    if (donated) and (User:getQuestProgress(151) == 1) then
		User:setQuestProgress(151, 2); --Quest solved!
		base.common.InformNLS(User,"[Queststatus] Du hast den Befehl erfolgreich ausgeführt. Kehre zu Ioannes Faber zurück, um deine Belohnung einzufordern.","[Quest status] You completed your task successfully. Return to Ioannes Faber to claim your reward."); --sending a message
	end
	
	-- Quest end
	
end