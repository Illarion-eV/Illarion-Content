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
-- Tree Script
-- Envi
local common = require("base.common")
local lookat = require("base.lookat")
local vision = require("content.vision")

local M = {}

-- Edit by faladron 13. April 2012 added lines 72 - 92 for Endurance Cave Quest

-- UPDATE items SET itm_script='item.pillar' WHERE itm_id IN (272, 440, 441, 442, 443, 467, 692, 693, 694, 695, 2805);

function M.LookAtItem(User,Item)

	-------------------------------- ENDURANCE CAVE QUEST LOOKAT -----------------------------------------
	if Item.pos == position (7,11,-15) then
		local language = User:getPlayerLanguage();
		local stage = User:getQuestProgress(204);
		local lang = User:getPlayerLanguage(); --returns 0 for german, 1=english
	
		if stage >= 9 then 
			if language == 1 then
			User:inform("This time the woman leers at you with madness in her bloodshot eyes. Her hair has turned to crimson flames.");
			else
			User:inform("Die Frau sieht dich diesmal mit stechendem irren Blick an, ihre Augen blutunterlaufen. Ihr Haar zu roten Flammen gewandelt."); 
			return;
			end
		end
	
		return;	--stage to the player
	end
	-------------------------------- ENDURANCE CAVE QUEST LOOKAT DONE -----------------------------------------
	
	local lookAt
	
	-- Statue of Queen Rosaline
	if (Item.pos == position(118,566,0)) then
		lookAt = RosalineLookAt(User, Item)
	end

	-- Statue of Sir Reginald Rosaline
	if (Item.pos == position(125,566,0)) then
		lookAt = ReginaldLookAt(User, Item)
	end
		
	-- Chancellor Statue 1
	if (Item.pos == position(371,266,0)) then
		lookAt = Chancellor1LookAt(User, Item)
	end

	-- Chancellor Statue 2
	if (Item.pos == position(359,266,0)) then
		lookAt = Chancellor2LookAt(User, Item)
	end
	
	-- Chancellor Statue 3
	if (Item.pos == position(374,282,0)) then
		lookAt = Chancellor3LookAt(User, Item)
	end
	
	if lookAt then
	    return lookAt --Send the custom lookAt
	else
		return lookat.GenerateLookAt(User, Item)
	end
end


function M.UseItem(User, SourceItem, ltstate)
	
	vision.UseDarkColumnsPuzzle(User, SourceItem, ltstate)
	vision.UseDarkColumns(User, SourceItem, ltstate)
	
	--Begin special statues of Sir Reginald and Queen Rosaline
	
   	if SourceItem.pos == position (125,566,0) then --Sir Reginald's statue
   
		--Dialog
		local callbackReginald = function(dialogReginald) end; --empty callback
			
	    if User:getPlayerLanguage() == 0 then

			dialogReginald = MessageDialog("Sitten Cadomyrs", "I. Glaube: Ehre die Götter. Nur sie alleine sind wahrhaftig allmächtig.\nII. Gehorsam: Sei loyal und folgsam. Dein Monarch verkörpert den Willen der Götter.\nIII. Ehre: Handle stets ehrenhaft. Deine Ehre zu verteidigen ist dein Recht und deine Pflicht.\nIV. Abstammung: Kenne deinen Platz. Deine Geburt zählt mehr als dein Leben oder dein Tod.\nV. Ehrlichkeit: Halte dein Wort und gib kein falsches Zeugnis ab. Du wirst an deinen Worten gemessen.\nVI. Gerechtigkeit: Sei gerecht zu jedem. Stehle nicht, gib deine Freundschaft dem Freund und dein Schwert dem Feind.\nVII. Courage: Fürchte nicht. Stehe für deinen Herrscher und dein Ehre ein. Kein Rückzug, niemals aufgeben.\nVIII. Patriarchat: Gehorche dem Vater. Gehorche dem Ehemann. Aber gehorche nicht dem Sohn.\nIX. Besitz: Was dein ist, soll auch dein bleiben, sei es Getreide, Hund oder Mann.\nX. Verantwortung: Deine Taten hängen dir nach. Nur du bist ihr Ursprung.", callbackReginald)

	    else	
		    dialogReginald = MessageDialog("Customs of Cadomyr","I. Faith: Worship the Gods, they alone are true and almighty.\nII. Obedience: Be loyal and obedient, your monarch represents the will of the gods.\nIII. Honour: In all things act with honour. Defending it is your right and duty.\nIV. Lineage: Know your place. Your birth matters more than your life or death.\nV. Truth: Keep your word and give no false testimony. The strength of your word measures your worth.\nVI. Justice: In all things be fair and just; never steal, offer your friendship freely, but do not spare your enemy the sword.\nVII. Courage: Fear is not permissible. Stand for your honour and sovereign. Never retreat, never surrender.\nVIII. Patriarchy: Obey your father, obey your husband, but never your son.\nIX. Property: What is yours will remain yours, be it crop, dog, or man.\nX. Responsibility: In all things you are bound to your deeds. You are their origin.", callbackReginald)

	    end	
	    
		User:requestMessageDialog(dialogReginald)
		
		--Quest		   
		if User:getQuestProgress(111)==1 then --change when quest is ready!
            
			User:setQuestProgress(111,2); --the player read all laws
            common.InformNLS(User,"[Queststatus] Du hast nun die Sitten Cadomyrs gelesen.","[Quest progress] You read the Cadomyrian customs."); --sending the message
         				
      	end   
		
    elseif SourceItem.pos == position (118,566,0) then --Queen Rosaline's statue

		--Dialog
		local callbackRosaline = function(dialogRosaline) end; --empty callback
			
	    if User:getPlayerLanguage() == 0 then
		
		    dialogRosaline = MessageDialog("Herrscher Cadomyrs","1. König Edward - 16 BS\n\n2. König Reginald - 0 AS\n\n3. Königin Rosaline Edwards - 22 AS", callbackRosaline)
			
	    else	
		
		    dialogRosaline = MessageDialog("Souvereigns of Cadomyr", "1. Sir Edward - 16 BS\n\n2. Sir Reginald - 0 AS\n\n3. Queen Rosaline Edwards - 22 AS", callbackRosaline)
			
	    end	
	    
		User:requestMessageDialog(dialogRosaline)		
 
    end
	
	--End special statues of Sir Reginald and Queen Rosaline

end

function RosalineLookAt(User, Item)
	local lookAt = ItemLookAt();
--	lookAt.rareness = ItemLookAt.rareItem;
	if (User:getPlayerLanguage()==0) then
		lookAt.name = "Königin Rosaline";
		lookAt.description = "Dieses Monument zeigt die junge Königin Rosaline. Eine Auflistung der Herrscher von Cadomyr ist auf einer Messingtafel am Sockel den Monuments zu lesen."
	else
		lookAt.name = "Queen Rosaline";
		lookAt.description = "This monument shows young Queen Rosaline. A register of the rulers of Cadomyr is engraved upon a brass plate at the bottom of the pedestal."
	end
	return lookAt
end

function ReginaldLookAt(User, Item)
	local lookAt = ItemLookAt();
--	lookAt.rareness = ItemLookAt.rareItem;
	if (User:getPlayerLanguage()==0) then
		lookAt.name = "Sir Reginald";
		lookAt.description = "Dieses Monument zeigt Sir Reginald Edwards, den verstorbenen König Cadomyrs und Vater von Königin Rosaline. Die Sitten Cadomyrs sind auf einer Messingtafel am Sockel den Monuments zu lesen."
	else
		lookAt.name = "Sir Reginald";
		lookAt.description = "This monument shows Sir Reginald Edwards, the departed king of Cadomyr and father of Queen Rosaline. The customs of Cadomyr are engraved upon a brass plate at the bottom of the pedestal."
	end
	return lookAt
end

--------------------------------------Galmair Chancellor Statues-------------------------------------------------------------------
function M.UseItem(User, SourceItem, ltstate)
	
	vision.UseDarkColumnsPuzzle(User, SourceItem, ltstate)
	vision.UseDarkColumns(User, SourceItem, ltstate)
	
	--Begin special statues of for the Chancellors of Galmair
	
   	if SourceItem.pos == position (371,266,0) then -- Chancellor Statue 1
   
		--Dialog
		local callbackChancellor1 = function(dialogChancellor1) end; --empty callback
			
	    if User:getPlayerLanguage() == 0 then

			dialogChancellor1 = MessageDialog("Liste der Galmarianischen Kanzler","Arcia im Jahr 44\nII. Evie Pryler im Jahr 43\nIII. Oxiana im Jahr42\nIV. Oxiana im Jahr 41", callbackChancellor1)

	    else	
		    dialogChancellor1 = MessageDialog("List of Galmairian Chancellors","Arcia in the year 44\nII. Evie Pryler in the year 43\nIII. Oxiana in the year 42\nIV. Oxiana in the year 41", callbackChancellor1)

	    end	
	    
		User:requestMessageDialog(dialogChancellor1)
		
    elseif SourceItem.pos == position (359,266,0) then --Chancellor Statue 2

		--Dialog
		local callbackChancellor2 = function(dialogChancellor2) end; --empty callback
			
	    if User:getPlayerLanguage() == 0 then
		
		    dialogChancellor2 = MessageDialog("Liste der Galmarianischen Kanzler","Kyre im Jahr 44\nII. Velisai im Jahr 43\nIII. Kyre im Jahr42\nIV. Kyre im Jahr" callbackChancellor2)
			
	    else	
		
		    dialogChancellor2 = MessageDialog("List of Galmairian Chancellors","Kyre in the year 44\nII. Velisai in the year 43\nIII. Kyre in the year 42\nIV. Kyre in the year 41", callbackChancellor2)
			
	    end	
	    
		User:requestMessageDialog(dialogChancellor2)		
		
	elseif SourceItem.pos == position (359,266,0) then --Chancellor Statue 3

		--Dialog
		local callbackChancellor3 = function(dialogChancellor3) end; --empty callback
			
	    if User:getPlayerLanguage() == 0 then
		
		    dialogChancellor3 = MessageDialog("Liste der Galmarianischen Kanzler","Sarangerel (Ufedhin Copperhand) im Jahr 44\nII. Sarangerel im Jahr 43\nIII. Uhuru Pryler im Jahr42\nIV. Purple im Jahr" callbackChancellor3)
			
	    else	
		
		    dialogChancellor3 = MessageDialog("List of Galmairian Chancellors","Sarangerel (Ufedhin Copperhand) in the year 44\nII. Sarangerel in the year 43\nIII. Uhuru Pryler in the year 42\nIV. Purple in the year 41", callbackChancellor3)
			
	    end	
	    
		User:requestMessageDialog(dialogChancellor3)	
 
    end
	
	--End special statues of Galmairian Chancellors

end

function Chancellor1LookAt(User, Item)
	local lookAt = ItemLookAt();
--	lookAt.rareness = ItemLookAt.rareItem;
	if (User:getPlayerLanguage()==0) then
		lookAt.name = "Kanzler Statue #1";
		lookAt.description = "Die Namen der Kanzler Galmairs sind auf die Statue graviert."
	else
		lookAt.name = "Chancellor Statue #1";
		lookAt.description = "The names of the Galmairian Chancellors are engraved on the statue."
	end
	return lookAt
end

function Chancellor2LookAt(User, Item)
	local lookAt = ItemLookAt();
--	lookAt.rareness = ItemLookAt.rareItem;
	if (User:getPlayerLanguage()==0) then
			lookAt.name = "Kanzler Statue #2";
		lookAt.description = "Die Namen der Kanzler Galmairs sind auf die Statue graviert."
	else
		lookAt.name = "Chancellor Statue #2";
		lookAt.description = "The names of the Galmairian Chancellors are engraved on the statue."
	end
	return lookAt
end

function Chancellor3LookAt(User, Item)
	local lookAt = ItemLookAt();
--	lookAt.rareness = ItemLookAt.rareItem;
	if (User:getPlayerLanguage()==0) then
			lookAt.name = "Kanzler Statue #3";
		lookAt.description = "Die Namen der Kanzler Galmairs sind auf die Statue graviert."
	else
		lookAt.name = "Chancellor Statue #3";
		lookAt.description = "The names of the Galmairian Chancellors are engraved on the statue."
	end
	return lookAt
end
--------------------------------------------Galmair Chancellor Statues End-------------------------------------------------------------------

return M

