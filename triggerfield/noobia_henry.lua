-- INSERT INTO triggerfields VALUES (36,20,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (36,21,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (36,22,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (37,20,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (37,22,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (38,20,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (38,21,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (38,22,100,'triggerfield.noobia_henry');


require("base.common")

module("triggerfield.noobia_henry", package.seeall)

function MoveToField(Character)

    -- for Noobia: the char has to walk to a specific field (this triggerfield); he gets a message and we add a LTE value so that we remember he was at the field
	
    find, myEffect = Character.effects:find(13); --Noob effect
	
	if find then --Is this even a noob?
        value = Character:getQuestProgress(309);
	
	    if (value == 0) then --Didn't visit the triggerfield yet

		    Character:setQuestProgress(309,1); --remember that he knows how to walk
			
	        local callbackNewbie = function(dialogNewbie) end; --empty callback
			
	        if Character:getPlayerLanguage() == 0 then
		        dialogNewbie = MessageDialog("Tutorial","Um mit dem Menschen zu sprechen, öffne die Sprachkonsole mit Return, schreibe ein Wort und drücke wieder Return. Alle NPCs reagieren auf bestimmte Schlüsselwörter wenn du in ihrer Nähe stehst. Begrüße den Menschen einfach mit 'Hallo'.", callbackNewbie)
	        else	
		        dialogNewbie = MessageDialog("Tutorial", "In order to speak to the human, open the chat box with return, type a word and hit return again. All NPCs react on certain keywords if you stand next to them. Greet the human with a simple 'hello'!.", callbackNewbie)
	        end	
	        Character:requestMessageDialog(dialogNewbie)
		end
	end
end

