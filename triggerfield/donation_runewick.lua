-- INSERT INTO triggerfields VALUES (897,779,2,'triggerfield.donation_runewick');
-- INSERT INTO triggerfields VALUES (897,780,2,'triggerfield.donation_runewick');
-- INSERT INTO triggerfields VALUES (896,779,2,'triggerfield.donation_runewick');
-- INSERT INTO triggerfields VALUES (896,780,2,'triggerfield.donation_runewick');

require("base.common")
require("triggerfield.donation_base")

module("triggerfield.donation_runewick", package.seeall)

-- Donation to the Runewick treasury
-- 898, 779, 2 = Runewick

function PutItemOnField(Item,User)

    triggerfield.donation_base.donate(Item,User,"Runewick","Elvaine Morgan","TreasureRunewick"); -- That's all folks

end