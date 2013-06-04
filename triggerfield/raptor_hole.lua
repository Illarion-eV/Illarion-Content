-- INSERT INTO triggerfields VALUES (495,728,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (488,726,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (486,711,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (493,702,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (495,710,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (483,727,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (475,728,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (464,719,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (470,720,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (458,732,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (465,737,0,'triggerfield.raptor_hole');
-- INSERT INTO triggerfields VALUES (451,736,0,'triggerfield.raptor_hole');

require("base.common")
module("triggerfield.raptor_hole", package.seeall)


function MoveToField(char)
	if char:getType() ~= Character.player then --Player will be ingored
		world:makeSound(26,char.pos); --Rrroaaaarrrr!
	end	
end
