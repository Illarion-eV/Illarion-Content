-- INSERT INTO triggerfields VALUES (890,596,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (876,590,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (878,562,0,'triggerfield.wonderland_612');

module("triggerfield.wonderland_612", package.seeall)


function MoveToField(Character)
	if Character:getQuestProgress(612) == 0 then
	Character:warp(position(900,580,0))
	Character:inform("Du hörst ein Lachen und eine krächzende Stimme sagen: \"HAHA! Du gehörst nun mir!\" Nach einer Weile hörst du eine andere Stimme aus dem Nordwesten: \"Geh weg von mir!\"","You hear a laughter and a scratchy voice is saying: \"HAHA! You are mine now!\" After a while you hear another voice from the northwest: \"Go away from me!\"")  
end
