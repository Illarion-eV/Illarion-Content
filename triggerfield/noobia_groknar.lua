-- INSERT INTO triggerfields VALUES (37,40,100,'triggerfield.noobia_groknar');
-- INSERT INTO triggerfields VALUES (38,40,100,'triggerfield.noobia_groknar');
-- INSERT INTO triggerfields VALUES (39,40,100,'triggerfield.noobia_groknar');
-- INSERT INTO triggerfields VALUES (40,40,100,'triggerfield.noobia_groknar');
-- INSERT INTO triggerfields VALUES (41,40,100,'triggerfield.noobia_groknar');
-- INSERT INTO triggerfields VALUES (42,40,100,'triggerfield.noobia_groknar');


require("base.common")

module("triggerfield.noobia_groknar", package.seeall)

function MoveToField(Character)

    -- for Noobia: the char has to walk to a field (this triggerfield); he gets a message and we change a queststatus so that we remember he was at the field
	
    find, myEffect = Character.effects:find(13); --Noob effect
	
	if find then --Is this even a noob?
        value = Character:getQuestProgress(311);
	
	    if (value == 0) then --Didn't visit the triggerfield yet

		    Character:setQuestProgress(311,1); --player passed the first station
			
	        local callbackNewbie = function(dialogNewbie) end; --empty callback
			
	        if Character:getPlayerLanguage() == 0 then
		        dialogNewbie = MessageDialog("Tutorial","ÜBERSETZEN", callbackNewbie)
	        else	
		        dialogNewbie = MessageDialog("Tutorial", "At the next station, you will learn how to fight. Groknar, the instructor, is a proud and mighty Orc warrior. Just speak up to him - carefully.", callbackNewbie)
	        end	
	        Character:requestMessageDialog(dialogNewbie)
		end
	end
end

