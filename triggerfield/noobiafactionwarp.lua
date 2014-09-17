--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
-- Noobia triggerfields: teleport char to Cadomyr, Runewick or Galmair
-- by Merung

-- INSERT INTO triggerfields VALUES (56,96,100,'triggerfield.noobiafactionwarp');
-- INSERT INTO triggerfields VALUES (20,99,100,'triggerfield.noobiafactionwarp');
-- INSERT INTO triggerfields VALUES (40,111,100,'triggerfield.noobiafactionwarp');

local common = require("base.common")

module("triggerfield.noobiafactionwarp", package.seeall)

function MoveToField(Character)

	-- Cadomyr: 127 647 0
    -- Runewick: 788 826 0
    -- Galmair: 424 245 0
	
    -- we define our destination
	
	find, myEffect = Character.effects:find(13) 
	local oldPlayer 
	if not find then
		oldPlayer = true
	end
	
	local destination, factionID, dialogNewbieText, dialogNewbieTaskText, dialogNewbieTaskTitle
	if Character.pos == position(56,96,100) then --Cadomyr
	
	    destination = position(127,647,0);
		factionID = 1;
		
	    if Character:getPlayerLanguage() == 0 then
		    dialogNewbieText = "Herzlichen Glückwunsch, du hast das Tutorial erfolgreich abgeschlossen. Du hast dich dazu entschlossen, Cadomyr beizutreten, dem Reich von Ruhm und Ehre. Beachte bitte, dass von nun an jeder, dem du begegnest, erwarten wird, dass du in deiner Rolle bleibst - sei also ein nobler Ritter, ein unterwürfiger Diener oder ein edler Diplomat."
	        dialogNewbieTaskText = "Als Neuling hat man es nicht leicht. Man kennt die Gegend und die Leute nicht; und die Leute kennen dich nicht. Jakob Lindorn ist ein freundlicher und hilfsbereiter Mensch, der Neuankömmlingen hilft. Geh zu ihm herüber und sprich mit ihm, wenn du Hilfe am Beginn deines neuen Lebens wünscht!"
		else	
		    dialogNewbieText = "Congratulations, you have completed the tutorial. You have chosen to join Cadomyr, the realm of honour and glory. Please note that from this point on everyone that you encounter will expect you to stay 'in character', by remaining true to your chosen role - be it a proud knight, a humble servant or a noble diplomat."
			dialogNewbieTaskText = "Being new in town isn't easy. You don't know the area or the people, and neither do they know you. Jakob Lindorn is a friendly and helpful person, who is happy to help newcomers. Go and talk to him if you want to get some help at the beginning of your new life!"
	    end	
		
	elseif Character.pos == position(20,99,100) then --Runewick
	
	    destination = position(836, 813, 0);
	    factionID = 2;
		
	   	if Character:getPlayerLanguage() == 0 then
		    dialogNewbieText = "Herzlichen Glückwunsch, du hast das Tutorial erfolgreich abgeschlossen. Du hast dich dazu entschlossen, Runewick beizutreten, dem Reich der Weisheit und der Magie. Beachte bitte, dass von nun an jeder, dem du begegnest, erwarten wird, dass du in deiner Rolle bleibst - sei also ein geheimnisvoller Magier, ein weiser Gelehrter oder ein friedliebender Waldläufer."
			dialogNewbieTaskText = "Als Neuling hat man es nicht leicht. Man kennt die Gegend und die Leute nicht; und die Leute kennen dich nicht. Florain Dreyndel ist ein freundlicher und hilfsbereiter Mensch, der Neuankömmlingen hilft. Geh zu ihm herüber und sprich mit ihm, wenn du Hilfe am Beginn deines neuen Lebens wünscht!"
	    else	
		    dialogNewbieText = "Congratulations, you have completed the tutorial. You have chosen to join Runewick, the realm of wisdom and magic. Please note that from this point on everyone that you encounter will expect you to stay 'in character', by remaining true to your chosen role - be it a mysterious mage, a wise scholar or a peaceful ranger."
			dialogNewbieTaskText = "Being new in town isn't easy. You don't know the area or the people, and neither do they know you. Florain Dreyndel is a friendly and helpful person, who is happy to help newcomers. Go and talk to him if you want to get some help at the beginning of your new life!"
	    end	
		
    elseif Character.pos == position(40,111,100) then --Galmair
	
	    destination = position(424,245,0);
	    factionID = 3;
		
        if Character:getPlayerLanguage() == 0 then
		    dialogNewbieText = "Herzlichen Glückwunsch, du hast das Tutorial erfolgreich abgeschlossen. Du hast dich dazu entschlossen, Galmair beizutreten, dem Reich des aufstrebenden Wohlstands. Beachte bitte, dass von nun an jeder, dem du begegnest, erwarten wird, dass du in deiner Rolle bleibst - sei also ein fleißiger Handwerker, ein durchtriebener Gauner oder ein reicher Händler."
			dialogNewbieTaskText = "Als Neuling hat man es nicht leicht. Man kennt die Gegend und die Leute nicht; und die Leute kennen dich nicht. Joey Licavoli ist ein freundlicher und hilfsbereiter Mensch, der Neuankömmlingen hilft. Geh zu ihm herüber und sprich mit ihm, wenn du Hilfe am Beginn deines neuen Lebens wünscht!"
	    else	
		    dialogNewbieText = "Congratulations, you have completed the tutorial. You have chosen to join Galmair, the realm of prosperity and wealth. Please note that from this point on everyone that you encounter will expect you to stay 'in character', by remaining true to your chosen role - be it a sturdy craftsman, a shady thug or a wealthy merchant."
			dialogNewbieTaskText = "Being new in town isn't easy. You don't know the area or the people, and neither do they know you. Joey Licavoli is a friendly and helpful person, who is happy to help newcomers. Go and talk to him if you want to get some help at the beginning of your new life!"
	    end	
		
	end

	--Warping the character
    world:gfx(41,Character.pos);
	world:makeSound(13,Character.pos);
	Character:warp(destination);
    world:makeSound(13,destination);
    world:gfx(41,Character.pos);
	
	--"Finish" all Noobia quests
	Character:setQuestProgress(309,2); --Henry
	Character:setQuestProgress(310,4); --Aldania
	Character:setQuestProgress(311,6); --Groknar
	Character:setQuestProgress(312,3); --Nargon
	Character:setQuestProgress(313,3); --Nimbur
	Character:setQuestProgress(314,1); --Viola
	Character:setQuestProgress(320,1); --Explorer
	
	FactionCheck = base.factions.getFaction(Character);
	                                                           
	if (not Character:isAdmin() and not (FactionCheck.tid~=0)) and not oldPlayer then -- Admins and chars who are already members of a faction are unaffected and just warped 
	    
		-- Abuse protection: We delete some items, if the char has more than one of them (farmed)
		local DeleteList = {23,391,392,2763} --hammer, torch, lit torch, pick-axe (relict)
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
		
		-- Build the dialogs
		local callbackNewbie, callbackNewbieTask
        callbackNewbie = function(dialogNewbie) 
			callbackNewbieTask = function(dialogNewbieTask) end
			if Character:getPlayerLanguage() == 0 then
				dialogNewbieTaskTitle = "Ein guter Anfang";
			else
				dialogNewbieTaskTitle = "A good beginning";
			end
			dialogNewbieTask = MessageDialog(dialogNewbieTaskTitle, dialogNewbieTaskText, callbackNewbieTask)
			Character:requestMessageDialog(dialogNewbieTask)
		end
	    dialogNewbie = MessageDialog("Tutorial",dialogNewbieText, callbackNewbie)
		
		-- We send him a message box
		Character:requestMessageDialog(dialogNewbie); --sending the dialog box to tell him that he finished the tutorial 
													  --the callback of this box contains the dialog box to tell him to see the first quest giving NPC
	
		-- We tell other players about our noob
		
	    playerlist = world:getPlayersOnline();
		
	    for i = 1, #(playerlist) do 
		    FactionStuff = base.factions.getFaction(playerlist[i]);
	        if FactionStuff.tid == factionID then --Other faction members are alerted
                common.InformNLS(playerlist[i],"[New player] Ein neuer Spieler ist gerade deinem Reich beigetreten.","[New player] A new player has just joined your realm.");  
		    end
	    end
		
		-- We make the noob a faction member - finally!
		Character:setQuestProgress(199,factionID);
		base.factions.setRankpoints(Character,0);
		
	end	
end	