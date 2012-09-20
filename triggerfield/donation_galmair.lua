-- INSERT INTO triggerfields VALUES (340,216,0,'triggerfield.galmair');
-- INSERT INTO triggerfields VALUES (340,217,0,'triggerfield.galmair');
-- INSERT INTO triggerfields VALUES (339,216,0,'triggerfield.galmair');
-- INSERT INTO triggerfields VALUES (339,217,0,'triggerfield.galmair');

require("base.common")
require("triggerfield.donation_base")

module("triggerfield.donation_galmair", package.seeall)

-- Donation to the Galmair treasury
-- 337, 217, 0 = Galmair

function PutItemOnField(Item,User)

    triggerfield.donation_base.donate(Item,User,"Galmair","Valerio Guilianni","TreasureGalmair"); -- That's all folks

end