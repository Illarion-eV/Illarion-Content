-- INSERT INTO triggerfields VALUES (41,74,100,'triggerfield.noobia_nimbur');
-- INSERT INTO triggerfields VALUES (40,74,100,'triggerfield.noobia_nimbur');
-- INSERT INTO triggerfields VALUES (39,74,100,'triggerfield.noobia_nimbur');
-- INSERT INTO triggerfields VALUES (38,74,100,'triggerfield.noobia_nimbur');

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
		        dialogNewbie = MessageDialog("Tutorial","An dieser Station wird dir beigebracht, wie man einem Handwerk nachgeht. Nimbur Goldhand ist ein sehr begabter Artisan, der die nötigen Kenntnisse vermittelt, die du benötigst, um die Laufbahn des Handwerkers einzuschlagen.", callbackNewbie)
	        else	
		        dialogNewbie = MessageDialog("Tutorial", "At this station, you will learn how to craft items. Nimbur Goldhand is a very skilled artisan who can teach you the necessary steps to get started with a crafting profession.", callbackNewbie)
	        end	
	        Character:requestMessageDialog(dialogNewbie)
		end
	end
end

