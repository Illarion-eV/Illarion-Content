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


require("gm.base.log")
require("base.factions")
require("base.common")
require("base.licence")
module("gm.items.townManagement", package.seeall, package.seeall(gm.base.log))


townManagmentItemPos={position(118,530,0),position(899,775,2),position(344,223,0)}

toolUseNameDE={"Wache","Lizenz","Schlüssel"}
toolUseNameEN={"Guard","Licence","Key"}


function townManagmentUseItem(User, SourceItem)

	local toolUse
	local AmountToolFunct = table.getn(toolUseNameDE)	
	for j = 1,AmountToolFunct do
		if (SourceItem.pos == townManagmentItemPos[j]) then
			toolTown = j
			if  User:getPlayerLanguage() == Player.german then
				toolUse = toolUseNameDE
			else
				toolUse = toolUseNameEN
			end
		end
	end

	if not User:getQuestProgress(680) == toolTown and User:getQuestProgress(680) >= 7 and User:isAdmin() == true then
		return
	end

	local callback = function(dialog)
		success = dialog:getSuccess()
		if success then
			selected = dialog:getSelectedIndex() 
			if selected == 0 then
				TownGuard(User,toolTown)
			elseif selected == 1 then
				TownLicence(User,toolTown)
			elseif selected == 2 then
				TownKey(User,toolTown)
			end
	
		end
	end


	local dialog
	if User:getPlayerLanguage() == Player.german then
		dialog = SelectionDialog("Stadtmanagement", "Instrument zur Verwaltung der Stadt. Nur für offizielle Vertreter.", callback)
	else
		dialog = SelectionDialog("Town Management", "Instrument for town management. Only for officials.", callback)
	end
	dialog:setCloseOnMove()
	
	for i=1,#toolUse do
		dialog:addOption(0, toolUse[i])
	end
	if User:getQuestProgress(199) == toolTown and User:getQuestProgress(200) >= 7 and User:isAdmin() or User:isAdmin() == true then
		User:requestSelectionDialog(dialog)
	else
		base.common.InformNLS(User,"Du hast keine Befugnis hierzu.","You are not supposed to use this.")		
		return
	end
end


function townOfficial(User,toolTown)
	if User:getQuestProgress(680) == toolTown and User:getQuestProgress(680) >= 7 then
	
	end
end


function TownGuard(User,toolTown)
--debug("TownGuard: "..User.name)
	local callback = function(dialog)
		if not dialog:getSuccess() then
			base.common.InformNLS(User,"Abbruch. Niemand wurd gebannt.","Abortion. No one was banned.")
			return
		else 
			local myString = dialog:getInput()
			local myCharId
			local myCharName
		        local days
			local allFound = false
			local a, b
			if string.find(myString,"(%d+)") then
				a,b,myCharId,days = string.find(myString,"(%d+)")
		                myCharId = tonumber(myCharId)
				allFound = true
			elseif string.find(myString,".*") then
				a,b = string.find(myString,".*")
				myCharName=string.sub (myString, a,b)
        		        allFound = true
			end
			if allFound then
				local onlineChars = world:getPlayersOnline()
				local theChar
				for i=1,#onlineChars do
					local checkChar = onlineChars[i]
					if myCharId then
						if checkChar.id == myCharId then
							theChar = checkChar
							break
						end	
				        else 
					if checkChar.name == myCharName then
							theChar = checkChar
							break
						end
					end	
				end    
				if not theChar then
					base.common.InformNLS(User,"Charakter wurde nicht gefunden.","Character has not been found.") 
				else
					local townId = toolTown
					base.factions.setIndividualPlayerRelation(theChar, townId, base.factions.RELATION_HOSTILE, 3);
					base.common.InformNLS(User,theChar.name.." ist für einen Zwergentag gebannt",theChar.name.." is banned for one dwarven day.")
				end
			else
				base.common.InformNLS(User,"Du hast nicht alle notwendige Information angegeben.","You haven't put in all necessary informations.")
			end
		end	
	end
	if  User:getPlayerLanguage() == Player.german then
		local dialog = InputDialog("Charkter, der gebannt werden soll.","Gib an: [Name|ID] Beispiel: Max Mustermann",false,255,callback)
		User:requestInputDialog(dialog)	
	else
		local dialog = InputDialog("Character that should be banned.","Insert: [Name|ID] Example: John Doe",false,255,callback)
		User:requestInputDialog(dialog)	
	end

end


function TownLicence(User,toolTown)
--debug("TownLicence: "..User.name)
	local factionIds = {0,1,2,3};
	local FirstLicence = toolTown;
	local licence = base.licence;
	local licenceStrings = {};
	if  User:getPlayerLanguage() == Player.german then
		licenceStrings[licence.PERMISSION_NONE] = "Benutzung von statischen Werkzeugen ist verboten.";
		licenceStrings[licence.PERMISSION_ACTIVE] = "Benutzung von statischen Werkzeugen ist erlaubt.";
		TextWithRespctToA = " für "
		TextWithRespctToB = " für ..."
		TextSetLicenceOf = "Setze die Lizenz von Galmair "
		TextTo = " auf ..."
		TextLicence = "Lizenz"
		TextSetLicence = "Setze Lizenz"
	else
		licenceStrings[licence.PERMISSION_NONE] = "Permission for static tools is restricted.";
		licenceStrings[licence.PERMISSION_ACTIVE] = "Permission for static tools is granted.";
		TextWithRespctToA = " with respect to "
		TextWithRespctToB = " with respect to ..."
		TextSetLicenceOf = "Set licence of "
		TextTo = " to ..."
		TextLicence = "Licence"
		TextSetLicence = "Set licence"
	end
	local licenceValues = {licence.PERMISSION_NONE, licence.PERMISSION_ACTIVE};
	local cbSecondLicence = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		local SecondLicence = factionIds[dialog:getSelectedIndex()+1];
		local cbSetLicence = function (dialog)
			if (not dialog:getSuccess()) then
				return;
			end
			local newLicence = licenceValues[dialog:getSelectedIndex()+1];
			licence.SetLicence(FirstLicence, SecondLicence, newLicence); 
		end
		local sd = SelectionDialog(TextSetLicence, TextSetLicenceOf .. base.factions.getTownNameByID(FirstLicence) .. TextWithRespctToA .. base.factions.getTownNameByID(SecondLicence) .. TextTo, cbSetLicence);
		for _,m in ipairs(licenceValues) do 
			sd:addOption(0,licenceStrings[m]);
		end
		User:requestSelectionDialog(sd);
	end
	local sd = SelectionDialog(TextLicence, TextSetLicenceOf .. base.factions.getTownNameByID(FirstLicence) .. TextWithRespctToB, cbSecondLicence);
	for _,f in ipairs(factionIds) do 
		sd:addOption(0,base.factions.getTownNameByID(f) .. ": " .. licenceStrings[licence.GetLicenceByFaction(FirstLicence, f)]); 
	end
	User:requestSelectionDialog(sd);
end


keyID={}
keyID[1]={}
keyID[2]={}
keyID[3]={3056,3055,2558,2558,2558,2558,2558,2558,2558,2558,2558}

keydoorsID={}
keydoorsID[1]={}
keydoorsID[2]={}
keydoorsID[3]={110,111,120,121,122,123,124,125,126,127,128}

keydoorsnameDE={}
keydoorsnameEN={}
keydoorsnameDE[1]={"test"}
keydoorsnameEN[1]={"test"}
keydoorsnameDE[2]={"test"}
keydoorsnameEN[2]={"test"}
keydoorsnameDE[3]={"Malachite Haus","Villa Goldader","Wohnung Irmorom","Wohnung Elara","Wohnung Adron","Wohnung Malachin","Wohnung Oldra","Wohnung Nargun","Wohnung Ronagan","Wohnung Sirani","Wohnung Zhambra"}
keydoorsnameEN[3]={"House of Malachite","Villa Goldvein","Flat Irmorom","Flat Elara","Flat Adron","Flat Malachin","Flat Oldra","Flat Nargun","Flat Ronagan","Flat Sirani","Flat Zhambra"}


function TownKey(User,toolTown)
--debug("TownKey: "..User.name)	
	local keydoorsname
	local AmountKeyDoors = table.getn(keydoorsnameDE[toolTown])	
	for j = 1,AmountKeyDoors do
		if  User:getPlayerLanguage() == Player.german then
			keydoorsname = keydoorsnameDE[toolTown]
		else
			keydoorsname = keydoorsnameEN[toolTown]
		end
	end

	if not User:getQuestProgress(680) == toolTown and User:getQuestProgress(680) >= 7 and User:isAdmin() == true then
		return
	end

	local callback = function(dialog)
		success = dialog:getSuccess()
		if success then
			selected = dialog:getSelectedIndex() 
			User:createItem(keyID[toolTown][selected+1],1,999,{["lockId"]=keydoorsID[toolTown][selected+1],["descriptionDe"]=keydoorsnameDE[toolTown][selected+1],["descriptionEn"]=keydoorsnameEN[toolTown][selected+1]})
	
		end
	end


	local dialog
	if User:getPlayerLanguage() == Player.german then
		dialog = SelectionDialog("Schlüsselgenerator", "Erstelle einen Schlüssel für folgende Türen.", callback)
	else
		dialog = SelectionDialog("Key-Generator", "Create a key for following doors.", callback)
	end
	dialog:setCloseOnMove()
	
	for i=1,#keydoorsname do
		dialog:addOption(0, keydoorsname[i])
	end
	User:requestSelectionDialog(dialog)
end

