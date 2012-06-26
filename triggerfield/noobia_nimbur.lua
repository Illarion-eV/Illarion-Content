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

module("triggerfield.noobia_nimbur", package.seeall)

function MoveToField(Character)

    -- for Noobia: the char has to walk to a field (this triggerfield); he gets a message and we change a queststatus so that we remember he was at the field
	
    find, myEffect = Character.effects:find(13); --Noob effect
	
	if find then --Is this even a noob?
        value = Character:getQuestProgress(313);
	
	    if (value == 0) then --Didn't visit the triggerfield yet

		    Character:setQuestProgress(313,1); --player passed the triggerfield
			
	        local callbackNewbie = function(dialogNewbie) end; --empty callback
			
	        if Character:getPlayerLanguage() == 0 then
		        dialogNewbie = MessageDialog("Tutorial","ÜBERSETZEN", callbackNewbie)
	        else	
		        dialogNewbie = MessageDialog("Tutorial", "At this station, you will learn how to craft. Nimbur Goldhand is a very skilled artisan who can teach you the ropes.", callbackNewbie)
	        end	
	        Character:requestMessageDialog(dialogNewbie)
		end
	end
end

