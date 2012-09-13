-- INSERT INTO triggerfields VALUES (0,0,0,'triggerfield.runewick');

require("base.common")
require("triggerfield.donation_base")

module("triggerfield.donation_runewick", package.seeall)

function PutItemOnField(Item,User)

    triggerfield.donation_base.donate(Item,User,"Runewick","Elvaine Morgan","TreasureRunewick"); -- That's all folks

end