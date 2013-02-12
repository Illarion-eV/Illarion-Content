-- INSERT INTO triggerfields VALUES (890,596,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (876,590,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (878,562,0,'triggerfield.wonderland_612');

module("triggerfield.wonderland_612", package.seeall)


function MoveToField(Character)
	if Character:getQuestProgress(612) == 0 then
	Character:warp(position(900,580,0))
end
