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
-- INSERT INTO triggerfields VALUES (906,573,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (906,574,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (906,575,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (905,575,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (904,575,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (904,574,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (904,573,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (905,573,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,573,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,574,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,575,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (885,575,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,575,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,574,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,573,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (885,573,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (891,560,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (890,560,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (889,560,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (889,559,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (889,558,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (880,558,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (891,558,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (891,559,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,583,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,584,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,585,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (885,585,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,585,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,584,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,583,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (885,583,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,593,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,594,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (886,595,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (885,595,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,595,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,594,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (884,593,0,'triggerfield.wonderland_612');
-- INSERT INTO triggerfields VALUES (885,593,0,'triggerfield.wonderland_612');

module("triggerfield.wonderland_612", package.seeall)




function MoveToField(Character)
if not isTestserver() then
return
end
--884,594,0 correct choice #6
	if Character:getQuestProgress(612) == 0 and Character.pos == position(884,594,0) then
	Character:warp(position(863,578,0))
	Character:inform("Du vernimmst noch ein langezogenes 'Nein'. Danach kehrt Stille ein.", "You hear an dieing 'No'. Afterwards there is silience.")  
	Character:setQuestProgress(612,0)
	end

--886,584,0 correct choice #5
	if Character:getQuestProgress(612) == 0 and Character.pos == position(886,584,0) then
	Character:warp(position(885,594,0))
	Character:inform("Die krächzende Stimme brüllt: \"Verdammt!\" Worauf die eine Stimme aus dem Norden ruft: \"In den Baum! In den Baum!\"", "The scratchy voice bellows: \"Blimey!\". A voice from the north shouts: \"Into the tree! Into the tree!\"")  
	Character:setQuestProgress(612,0)
	end

--890,560,0 correct choice #4
	if Character:getQuestProgress(612) == 0 and Character.pos == position(890,560,0) then
	Character:warp(position(885,584,0))
	Character:inform("Die krächzende Stimme bellt: \"Narr!\" Worauf eine Stimme aus dem Süden ruft: \"Zum Meer! Zum Meer!\"", "The scratchy voice barks: \"Fool!\". A voice from the south shouts: \"To the sea! To the sea!\"")  
	Character:setQuestProgress(612,0)
	end

--885,573,0 correct choice #3
	if Character:getQuestProgress(612) == 0 and Character.pos == position(885,573,0) then
	Character:warp(position(890,559,0))
	Character:inform("Die krächzende Stimme ruft: \"Vergeblich!\" Worauf eine Stimme aus dem Süden flüstert: \"Zu mir!\"", "The scratchy voice says: \"Futile!\". A voice from the south whispers: \"To me!\"")  
	Character:setQuestProgress(612,0)
	end

--906,573,0 correct choice #2
	if Character:getQuestProgress(612) == 0 and Character.pos == position(906,573,0) then
	Character:warp(position(885,574,0))
	Character:inform("Die krächzende Stimme schreit: \"Gib auf! Du bist mein!\" Worauf eine Stimme aus dem Norden antwortet: \"Komm zu mir!\"", "The scratchy voice shouts: \"Surrender! You are mine!\". A voice from the north answers: \"Come to me!\"")  
	Character:setQuestProgress(612,0)
	end

--901,581,0 correct choice #1
	if Character:getQuestProgress(612) == 0 and Character.pos == position(901,581,0) then
	Character:warp(position(905,574,0))
	Character:inform("Die krächzende Stimme meldet sich wieder: \"Keine Chance!\" Worauf eine Stimme aus dem Südwesten sagt: \"Lauf weg!\"", "The scratchy voice says: \"No Chance!\". A voice from the southwest replies: \"Run away!\"")  
	Character:setQuestProgress(612,0)
	end
--start
	if Character:getQuestProgress(612) == 0 and Character.pos == position(890,596,0) or Character.pos == position(876,590,0) or Character.pos == position(878,562,0) then
	Character:warp(position(901,579,0))
	Character:inform("Du hörst ein Lachen und eine krächzende Stimme sagen: \"HAHA! Du gehörst nun mir!\" Nach einer Weile hörst du eine andere Stimme aus dem Nordwesten: \"Geh weg von mir!\"","You hear a laughter and a scratchy voice is saying: \"HAHA! You are mine now!\" After a while you hear another voice from the northwest: \"Go away from me!\"")  
	Character:setQuestProgress(612,0)
	end
--wrong turn
	if Character:getQuestProgress(612) == 0 then
	Character:warp(position(901,579,0))
	Character:inform("Du hörst ein Lachen und eine krächzende Stimme sagen: \"HAHA! Du enkommst mir nicht!\" Eine andere Stimme ruft dir erneut aus dem Nordwesten zu: \"Gib nicht auf! Du kannst es schaffen.\"","You hear a laughter and a scratchy voice is saying: \"HAHA! You cannot escape!\"Another voice replies again from the northwest: \"Do not give in! You can make it.\"")  
	Character:setQuestProgress(612,0)
	end
end


