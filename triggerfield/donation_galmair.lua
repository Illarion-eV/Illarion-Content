-- INSERT INTO triggerfields VALUES (0,0,0,'triggerfield.galmair');

require("base.common")
require("triggerfield.donation_base")

module("triggerfield.donation_galmair", package.seeall)

-- Donation to the Galmair treasury
-- 337, 217, 0 = Galmair

function PutItemOnField(Item,User)

    triggerfield.donation_base.donate(Item,User,"Galmair","Valerio Guilianni","TreasureGalmair"); -- That's all folks

end