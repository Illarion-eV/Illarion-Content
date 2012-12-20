-- INSERT INTO triggerfields VALUES (340,216,0,'triggerfield.donation_galmair');
-- INSERT INTO triggerfields VALUES (340,217,0,'triggerfield.donation_galmair');
-- INSERT INTO triggerfields VALUES (339,216,0,'triggerfield.donation_galmair');
-- INSERT INTO triggerfields VALUES (339,217,0,'triggerfield.donation_galmair');

require("base.common")
require("triggerfield.donation_base")

module("triggerfield.donation_galmair", package.seeall)

-- Donation to the Galmair treasury
-- 337, 217, 0 = Galmair

function PutItemOnField(Item,User)

    donated=triggerfield.donation_base.donate(Item,User,"Galmair","Valerio Guilianni","TreasureGalmair"); -- That's all folks


   -- Quest 206 (Galmair Treasury, NPC Geretel Goldhair)

    if (donated) and (User:getQuestProgress(206) == 1) then
		User:setQuestProgress(206, 2); --Quest solved!
		base.common.InformNLS(User,"[Queststatus] Du hast erfolgreich etwas an den Don gespendet. Sprich mit Geretel Goldhair, um deine Belohnung einzufordern.","[Quest status] You successfully made a donnation to the Don. Talk to Gretel Goldhair to claim your reward."); --sending a message
	end

	-- Quest end

end
