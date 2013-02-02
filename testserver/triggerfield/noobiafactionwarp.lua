-- Noobia triggerfields: teleport char to Cadomyr, Runewick or Galmair
-- by Merung

-- INSERT INTO triggerfields VALUES (56,96,100,'triggerfield.noobiafactionwarp');
-- INSERT INTO triggerfields VALUES (20,99,100,'triggerfield.noobiafactionwarp');
-- INSERT INTO triggerfields VALUES (40,111,100,'triggerfield.noobiafactionwarp');

require("base.common")

module("triggerfield.noobiafactionwarp", package.seeall)

function MoveToField(Character)

    -- Cadomyr: 127 647 0
    -- Runewick: 788 826 0
    -- Galmair: 424 245 0
	
    -- we define our destination
    if Character.pos == position(56,96,100) then --Cadomyr
	
	    destination = position(127,647,0);
		factionID = 1;
		
	    if Character:getPlayerLanguage() == 0 then
		    dialogNewbie = MessageDialog("Tutorial","Herzlichen Glückwunsch, du hast das Tutorial erfolgreich abgeschlossen. Du hast dich dazu entschlossen, Cadomyr beizutreten, dem Reich von Ruhm und Ehre. Beachte bitte, dass von nun an jeder, dem du begegnest, erwarten wird, dass du in deiner Rolle bleibst - sei also ein nobler Ritter, ein unterwürfiger Diener oder ein edler Diplomat.", callbackNewbie)
	    else	
		    dialogNewbie = MessageDialog("Tutorial", "Congratulations, you have completed the tutorial. You have chosen to join Cadomyr, the realm of honour and glory. Please note that from this point on everyone that you encounter will expect you to stay 'in character', by remaining true to your chosen role - be it a proud knight, a humble servant or a noble diplomat.", callbackNewbie)
	    end	
		
	elseif Character.pos == position(20,99,100) then --Runewick
	
	    destination = position(788,826,0);
	    factionID = 2;
		
	   	if Character:getPlayerLanguage() == 0 then
		    dialogNewbie = MessageDialog("Tutorial","Herzlichen Glückwunsch, du hast das Tutorial erfolgreich abgeschlossen. Du hast dich dazu entschlossen, Runewick beizutreten, dem Reich der Weisheit und der Magie. Beachte bitte, dass von nun an jeder, dem du begegnest, erwarten wird, dass du in deiner Rolle bleibst - sei also ein geheimnisvoller Magier, ein weiser Gelehrter oder ein friedliebender Waldläufer.", callbackNewbie)
	    else	
		    dialogNewbie = MessageDialog("Tutorial", "Congratulations, you have completed the tutorial. You have chosen to join Runewick, the realm of wisdom and magic. Please note that from this point on everyone that you encounter will expect you to stay 'in character', by remaining true to your chosen role - be it a mysterious mage, a wise scholar or a peaceful ranger.", callbackNewbie)
	    end	
		
    elseif Character.pos == position(40,111,100) then --Galmair
	
	    destination = position(424,245,0);
	    factionID = 3;
		
        if Character:getPlayerLanguage() == 0 then
		    dialogNewbie = MessageDialog("Tutorial","Herzlichen Glückwunsch, du hast das Tutorial erfolgreich abgeschlossen. Du hast dich dazu entschlossen, Galmair beizutreten, dem Reich des aufstrebenden Wohlstands. Beachte bitte, dass von nun an jeder, dem du begegnest, erwarten wird, dass du in deiner Rolle bleibst - sei also ein fleißiger Handwerker, ein durchtriebener Gauner oder ein reicher Händler.", callbackNewbie)
	    else	
		    dialogNewbie = MessageDialog("Tutorial", "Congratulations, you have completed the tutorial. You have chosen to join Galmair, the realm of prosperity and wealth. Please note that from this point on everyone that you encounter will expect you to stay 'in character', by remaining true to your chosen role - be it a sturdy craftsman, a shady thug or a wealthy merchant.", callbackNewbie)
	    end	
		
	end

    world:gfx(41,Character.pos);
	world:makeSound(13,Character.pos);
	Character:warp(destination);
    world:makeSound(13,destination);
    world:gfx(41,Character.pos);
	
	FactionCheck = base.factions.getFaction(Character);
	                                                            -- "Jupiter" check for testing. Merung
	if (not Character:isAdmin() and not (FactionCheck.tid~=0)) or Character.name == "Jupiter" then -- admins and chars who are already members of a faction are unaffected and just warped 
	
		-- We delete some items, if the char has more than one of them
		local DeleteList = {23,391,2763} --hammer, torch, pick-axe
		for i=1,#DeleteList do
			itemAmount = Character:countItem(DeleteList[i])
			Character:eraseItem( DeleteList[i], (itemAmount -1))
		end	
		
		-- We remove the newbie lte
		find, myEffect = Character.effects:find(13)
		if find then
			removedEffect = Character.effects:removeEffect(13)
			if not removedEffect then -- security check
				Character:inform("[Error] Please contact a developer. Error: Triggerfields to factions.", Player.highPriority)
			end
		end
		
		-- We restore the character 
		
		Character:setAttrib("hitpoints",10000)
		Character:setAttrib("mana",10000)
		Character:setAttrib("foodlevel",30000)
		
		-- We send him a message box
		local callbackNewbie
		if isTestserver() then
		    -- We guide him to the first NPC to tell him where to find tasks.
			callbackNewbie = function(dialogNewbie) 
				local NPCName
				if factionID == 1 then
				    NPCName = "Cadomyr_NPC" -- !!!
				elseif factionID == 2 then
				    NPCName = "Florain Dreyndel"
				else
				    NPCName = "Galmair_NPC" -- !!!
				end
				local callbackNewbieTask = function(dialogNewbieTask) end
				if Character:getPlayerLanguage() == 0 then
					dialogNewbieTask = MessageDialog("Ein guter Anfang", "Als Neuling hat man es nicht leicht. Man kennt die Gegend und die Leute nicht; und die Leute kennen dich nicht. "..NPCName.." ist ein freundlicher und hilfsbereiter Mensch, der Neuankömmlingen hilft. Geh zu ihm herüber und sprich mit ihm, wenn du Hilfe am Beginn deines neuen Lebens wünscht!", callbackNewbieTask)
				else
					dialogNewbieTask = MessageDialog("A good beginning" , "Being new in town isn't easy. You don't know the area or the people, and neither do they know you. "..NPCName.." is a friendly and helpful person, who is happy to help newcomers. Go and talk to him if you want to get some help at the beginning of your new life! ", callbackNewbieTask)
				end
				User:requestMessageDialog(dialogNewbieTask)
			end
		else
	        callbackNewbie = function(dialogNewbie) end; --empty callback
	    end
		Character:requestMessageDialog(dialogNewbie); --sending the dialog box
		
        -- We tell other players about our noob
		
	    playerlist = world:getPlayersOnline();
		
	    for i = 1, #(playerlist) do 
		    FactionStuff = base.factions.getFaction(playerlist[i]);
	        if FactionStuff.tid == factionID then --Other faction members are alerted
                base.common.InformNLS(playerlist[i],"[New player] Ein neuer Spieler ist gerade deinem Reich beigetreten.","[New player] A new player has just joined your realm.");  
		    end
	    end
		
		-- We make the noob a faction member - finally!
		Character:setQuestProgress(199,factionID);
		base.factions.setRankpoints(Character,0);
		
	end	
end	