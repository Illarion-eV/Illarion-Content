-- INSERT INTO triggerfields VALUES (27,54,100,'triggerfield.noobia_nargon');
-- INSERT INTO triggerfields VALUES (28,54,100,'triggerfield.noobia_nargon');
-- INSERT INTO triggerfields VALUES (29,54,100,'triggerfield.noobia_nargon');
-- INSERT INTO triggerfields VALUES (30,54,100,'triggerfield.noobia_nargon');
-- INSERT INTO triggerfields VALUES (31,54,100,'triggerfield.noobia_nargon');
-- INSERT INTO triggerfields VALUES (32,54,100,'triggerfield.noobia_nargon');
-- INSERT INTO triggerfields VALUES (33,54,100,'triggerfield.noobia_nargon');
-- INSERT INTO triggerfields VALUES (34,54,100,'triggerfield.noobia_nargon');
-- INSERT INTO triggerfields VALUES (35,54,100,'triggerfield.noobia_nargon');
-- INSERT INTO triggerfields VALUES (36,54,100,'triggerfield.noobia_nargon');
-- INSERT INTO triggerfields VALUES (37,54,100,'triggerfield.noobia_nargon');
-- INSERT INTO triggerfields VALUES (38,54,100,'triggerfield.noobia_nargon');
-- INSERT INTO triggerfields VALUES (39,54,100,'triggerfield.noobia_nargon');
-- INSERT INTO triggerfields VALUES (40,54,100,'triggerfield.noobia_nargon');
-- INSERT INTO triggerfields VALUES (41,54,100,'triggerfield.noobia_nargon');
-- INSERT INTO triggerfields VALUES (42,54,100,'triggerfield.noobia_nargon');


require("base.common")

module("triggerfield.noobia_nargon", package.seeall)

function MoveToField(Character)

    -- for Noobia: the char has to walk to a field (this triggerfield); he gets a message and we change a queststatus so that we remember he was at the field
	
    find, myEffect = Character.effects:find(13); --Noob effect
	
	if find then --Is this even a noob?
        value = Character:getQuestProgress(312);
	
	    if (value == 0) then --Didn't visit the triggerfield yet

		    Character:setQuestProgress(312,1); --player passed the first station
			
	        local callbackNewbie = function(dialogNewbie) end; --empty callback
			
	        if Character:getPlayerLanguage() == 0 then
		        dialogNewbie = MessageDialog("Tutorial","An dieser Station lernst du, wie man Rohstoffe abbaut. Der Augenmerk liegt auf Bergbau aber im Prinzip laufen alle Handwerke nach dem selben Schema ab. Nun, wer ist wohl der Richtige, um dir zu zeigen, wie man nach Gold gräbt? Natürlich ein Zwerg wie Nargon Hammerfist!", callbackNewbie)
	        else	
		        dialogNewbie = MessageDialog("Tutorial", "At this station, you will learn how to gather resources. This station will focus on mining, though similar principles are applicable to the other crafts. Now, who might be the best to teach you how to mine for gold? Why, a dwarf like Nargon Hammerfist of course.", callbackNewbie)
	        end	
	        Character:requestMessageDialog(dialogNewbie)
		end
	end
end

