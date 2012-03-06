-- INSERT INTO triggerfields VALUES (45,21,100,'triggerfield.noobia_light');
-- INSERT INTO triggerfields VALUES (45,21,100,'triggerfield.noobia_light');
-- INSERT INTO triggerfields VALUES (45,21,100,'triggerfield.noobia_light');
-- INSERT INTO triggerfields VALUES (45,21,100,'triggerfield.noobia_light');

require("base.common")

module("triggerfield.noobia_light", package.seeall)

function MoveToField(Character)
    find, myEffect = User.effects:find(13)
	if find then
	    base.common.InformNLS(Character,
	    "@Rince: ziel erreicht DE",
	    "@Rince: ziel erreicht 1 EN");
        Character.effects:removeEffect(13)
	end
end