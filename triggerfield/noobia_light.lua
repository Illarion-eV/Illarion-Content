-- INSERT INTO triggerfields VALUES (45,21,100,'triggerfield.noobia_light');
-- INSERT INTO triggerfields VALUES (45,21,100,'triggerfield.noobia_light');
-- INSERT INTO triggerfields VALUES (45,21,100,'triggerfield.noobia_light');
-- INSERT INTO triggerfields VALUES (45,21,100,'triggerfield.noobia_light');

require("base.common")

module("triggerfield.noobia_light", package.seeall)

function MoveToField(Character)
    -- for noobia: the char has to walk to a specific field (this triggerfield); he gets a message and we add a LTEvalue so that we remember he was at the field
	find, myEffect = Character.effects:find(13)
	if find then
	    base.common.InformNLS(Character,
	    "@Rince: ziel erreicht DE",
	    "@Rince: ziel erreicht 1 EN");
        myEffect:addValue("noobiaLight",1)
	end
end