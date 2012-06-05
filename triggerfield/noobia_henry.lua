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

    -- for Noobia: the char has to walk to a specific field (this triggerfield); he gets a message and we add a LTEvalue so that we remember he was at the field
	
    find, myEffect = Character.effects:find(13)
    found, value = myEffect:findValue("noobiaHenry");
	Character:inform("Value: "..value.."!");

    if not value then --Didn't visit the triggerfield yet

	    local callbackNewbie = function(dialogNewbie)
           find, myEffect = Character.effects:find(13)
		   if find then
		      myEffect:addValue("noobiaHenry",1)
			end  
	    end
	
	    if Character:getPlayerLanguage() == 0 then
		    dialogNewbie = MessageDialog("Sehr gut!","Um mit dem Menschen zu sprechen, öffne die Sprachkonsole mit Return, schreibe ein Wort und drücke wieder Enter. Alle NPCs (NonPlayerCharacters) reagieren auf bestimmte Schlüsselwörter wenn du in ihrer Nähe stehst. Versuche den Menschen um 'Hilfe' zu bitten. Ist die Sprachkonsole leer, kannst du sie mit erneutem Drücken der Returntaste schließen.", callbackNewbie)
	    else	
		    dialogNewbie = MessageDialog("Very good!", "translation", callbackNewbie)
	    end	
	    Character:requestMessageDialog(dialogNewbie)
	end
end

