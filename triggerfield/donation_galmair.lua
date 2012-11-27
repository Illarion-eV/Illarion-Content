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

    -- Quest 206 (NPC Job, NPC Name )

    if donated then
	    -- add your quest here
	end

	-- Quest end

end
