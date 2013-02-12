-- INSERT INTO triggerfields VALUES (890,596,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (876,590,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (878,562,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (901,581,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (900,581,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (899,581,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (899,580,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (899,579,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (900,579,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (901,579,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (901,580,0,'triggerfield.wonderland_612');

module("triggerfield.wonderland_612", package.seeall)




function MoveToField(Character)
if not isTestserver() then
return
end
--901,581,0 correct choice
	if Character:getQuestProgress(612) == 0 then
	Character:warp(position(900,580,0))
	Character:inform("Du hörst ein Lachen und eine krächzende Stimme sagen: \"HAHA! Du gehörst nun mir!\" Nach einer Weile hörst du eine andere Stimme aus dem Nordwesten: \"Geh weg von mir!\"","You hear a laughter and a scratchy voice is saying: \"HAHA! You are mine now!\" After a while you hear another voice from the northwest: \"Go away from me!\"")  
	Character:setQuestProgress(612,0)
	end
--start
	if Character:getQuestProgress(612) == 0
	and
        Character.pos == position(901,581,0)   
	then
	Character:warp(position(905,574,0))
	Character:inform("Du hörst ein Lachen und eine krächzende Stimme sagen: \"HAHA! Du gehörst nun mir!\" Nach einer Weile hörst du eine andere Stimme aus dem Nordwesten: \"Geh weg von mir!\"","You hear a laughter and a scratchy voice is saying: \"HAHA! You are mine now!\" After a while you hear another voice from the northwest: \"Go away from me!\"")  
	Character:setQuestProgress(612,0)
	end
end


