-- INSERT INTO triggerfields VALUES (37,20,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (37,21,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (37,22,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (38,20,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (38,22,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (39,20,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (39,21,100,'triggerfield.noobia_henry');
-- INSERT INTO triggerfields VALUES (39,22,100,'triggerfield.noobia_henry');


require("base.common")

module("triggerfield.noobia_henry", package.seeall)

function MoveToField(Character)

    -- for Noobia: the char has to walk to a specific field (this triggerfield); he gets a message and we add a LTE value so that we remember he was at the field
	
    find, myEffect = Character.effects:find(13); --Noob effect
	
	if find then --Is this even a noob?
        found, value = myEffect:findValue("noobiaHenry");
	
	    if (value == 0) then --Didn't visit the triggerfield yet

	        local callbackNewbie = function(dialogNewbie) end; --empty callback
			
            myEffect:addValue("noobiaHenry",1)
	
	        if Character:getPlayerLanguage() == 0 then
		        dialogNewbie = MessageDialog("Tutorial","Um mit dem Menschen zu sprechen, öffne die Sprachkonsole mit Return, schreibe ein Wort und drücke wieder Return. Alle NPCs reagieren auf bestimmte Schlüsselwörter wenn du in ihrer Nähe stehst. Begrüße den Menschen einfach mit 'Hallo'.", callbackNewbie)
	        else	
		        dialogNewbie = MessageDialog("Tutorial", "translation", callbackNewbie)
	        end	
	        Character:requestMessageDialog(dialogNewbie)
		end
	end
end

