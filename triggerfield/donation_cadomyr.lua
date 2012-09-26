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

    triggerfield.donation_base.donate(Item,User,"Cadomyr","Rosaline Edwards","TreasureCadomyr"); -- That's all folks

end