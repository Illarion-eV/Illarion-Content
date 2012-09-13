-- INSERT INTO triggerfields VALUES (0,0,0,'triggerfield.donation_cadomyr');

require("base.common")
require("triggerfield.donation_base")

module("triggerfield.donation_cadomyr", package.seeall)

function PutItemOnField(Item,User)

    triggerfield.donation_base.donate(Item,User,"Cadomyr","Rosaline Edwards","TreasureCadomyr"); -- That's all folks

end