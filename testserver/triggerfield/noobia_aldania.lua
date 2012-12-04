-- INSERT INTO triggerfields VALUES (45,17,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (45,18,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (45,19,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (45,20,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (45,21,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (45,22,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (45,23,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (45,24,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (45,25,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (45,26,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (45,27,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (44,27,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (43,27,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (42,27,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (41,27,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (40,27,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (39,27,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (38,27,100,'triggerfield.noobia_aldania');
-- INSERT INTO triggerfields VALUES (37,27,100,'triggerfield.noobia_aldania');


require("base.common")

module("triggerfield.noobia_aldania", package.seeall)

function MoveToField(Character)

    -- for Noobia: the char has to walk to a field (this triggerfield); he gets a message and we change a queststatus so that we remember he was at the field
	
    find, myEffect = Character.effects:find(13); --Noob effect
	
	if find then --Is this even a noob?
        value = Character:getQuestProgress(310);
	
	    if (value == 0) then --Didn't visit the triggerfield yet

		    Character:setQuestProgress(310,1); --player passed the first station
			
	        local callbackNewbie = function(dialogNewbie) end; --empty callback
			
	        if Character:getPlayerLanguage() == 0 then
		        dialogNewbie = MessageDialog("Tutorial","An dieser Station wird dir die Elfe erkläre, wie man Gegenstände anlegt, sie benutzt und sie untersucht. Begrüße sie einfach so, wie du es von Henry Cunnigan gelernt hast!", callbackNewbie)
	        else	
		        dialogNewbie = MessageDialog("Tutorial", "At this station, the elfess will explain to you how to equip, use and examine items. Greet her as you learned from Henry Cunnigan!", callbackNewbie)
	        end	
	        Character:requestMessageDialog(dialogNewbie)
		end
	end
end

