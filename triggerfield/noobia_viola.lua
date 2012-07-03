-- INSERT INTO triggerfields VALUES (36,95,100,'triggerfield.noobia_viola');

require("base.common")

module("triggerfield.noobia_viola", package.seeall)

function MoveToField(Character)

    -- for Noobia: the char has to walk to a field (this triggerfield); he gets a message and we change a queststatus so that we remember he was at the field
	
    find, myEffect = Character.effects:find(13); --Noob effect
	
	if find then --Is this even a noob?
        value = Character:getQuestProgress(314);
	
	    if (value == 0) then --Didn't visit the triggerfield yet

		    Character:setQuestProgress(314,1); --player passed the triggerfield
			
	        local callbackNewbie = function(dialogNewbie) end; --empty callback
			
	        if Character:getPlayerLanguage() == 0 then
		        dialogNewbie = MessageDialog("Tutorial","ÜBERSETZEN", callbackNewbie)
	        else	
		        dialogNewbie = MessageDialog("Tutorial", "This is the final station of the tutorial. Please choose a realm as home for your character now by stepping through a portal on one of the islands. Viola Baywillow will answer your questions on the available realms, just ask her for 'help'.", callbackNewbie)
	        end	
	        Character:requestMessageDialog(dialogNewbie)
		end
	end
end

