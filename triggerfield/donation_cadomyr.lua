-- INSERT INTO triggerfields VALUES (0,0,0,'triggerfield.donation_cadomyr');

require("base.common")
require("triggerfield.donation_base")

module("triggerfield.donation_cadomyr", package.seeall)

-- Donation to the Cadomyr treasury
-- 115, 552, 0 = Cadomyr

function PutItemOnField(Item,User)

    triggerfield.donation_base.donate(Item,User,"Cadomyr","Rosaline Edwards","TreasureCadomyr"); -- That's all folks

end