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


local factions = require("base.factions")
local common = require("base.common")
local licence = require("base.licence")

local M = {}

 -- Cadomyr, Runewick, Galmair
M.townManagmentItemPos = {position(116, 527, 0), position(951, 786, 1), position(344, 223, 0)}
local requiredRank = {8,8,8}

local toolUseNameDE = {"Verbannung","Lizenz","Schl�ssel"}
local toolUseNameEN = {"Ban a character","Licence","Key"}


function M.townManagmentUseItem(User, SourceItem)

	local toolUse
	local AmountToolFunct = #toolUseNameDE
	for j = 1,AmountToolFunct do
		if (SourceItem.pos == M.townManagmentItemPos[j]) then
			toolTown = j
			if  User:getPlayerLanguage() == Player.german then
				toolUse = toolUseNameDE
			else
				toolUse = toolUseNameEN
			end
		end
	end

	local callback = function(dialog)
		local success = dialog:getSuccess()
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
		dialog = SelectionDialog("Stadtmanagement", "Instrument zur Verwaltung der Stadt. Nur f�r offizielle Vertreter.", callback)
	else
		dialog = SelectionDialog("Town Management", "Instrument for town management. Only for officials.", callback)
	end
	dialog:setCloseOnMove()

	for i=1,#toolUse do
		dialog:addOption(0, toolUse[i])
	end
	if User:getQuestProgress(199) == toolTown and User:getQuestProgress(200) >= requiredRank[toolTown] and User:getQuestProgress(202) >= 600 or User:isAdmin() == true then
		User:requestSelectionDialog(dialog)
	else
		common.InformNLS(User,"Du hast keine Befugnis hierzu.","You are not supposed to use this.")
		return
	end
end

function TownGuard(User,toolTown)

	local callback = function(dialog)
		if not dialog:getSuccess() then
			common.InformNLS(User,"Abbruch. Niemand wurde gebannt.","Aborted. No one was banned.")
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
					common.InformNLS(User,"Charakter wurde nicht gefunden.","Character was not found.")
				else
					local townId = toolTown
					factions.setIndividualPlayerRelation(theChar, townId, factions.RELATION_HOSTILE, 3);
					common.InformNLS(User,theChar.name.." ist f�r einen Zwergentag gebannt.",theChar.name.." is banned for one dwarven day.")
					User:logAdmin("bans " .. theChar.name .. " for one day from " .. factions.getTownNameByID(townId));
				end
			else
				common.InformNLS(User,"Du hast nicht alle notwendige Information angegeben.","You haven't put in all necessary information.")
			end
		end
	end
	if  User:getPlayerLanguage() == Player.german then
		local dialog = InputDialog("Charakter bannen","Um einen Charakter einen Zwergentag zu bannen, gib folgendes an: [Name|ID] Beispiel: Max Mustermann",false,255,callback)
		User:requestInputDialog(dialog)
	else
		local dialog = InputDialog("Ban a character","To ban a character for one dwarven day, please insert: [Name|ID] Example: John Doe",false,255,callback)
		User:requestInputDialog(dialog)
	end

end

function TownLicence(User,toolTown)

	local factionIds = {0,1,2,3};
	local FirstLicence = toolTown;
	local licenceStrings = {};
	if  User:getPlayerLanguage() == Player.german then
		licenceStrings[licence.PERMISSION_NONE] = "Benutzung von statischen Werkzeugen ist verboten.";
		licenceStrings[licence.PERMISSION_ACTIVE] = "Benutzung von statischen Werkzeugen ist erlaubt.";
		TextWithRespctToA = " f�r "
		TextWithRespctToB = " f�r ..."
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
			licenceStrings[licence.PERMISSION_NONE] = "restricted";
			licenceStrings[licence.PERMISSION_ACTIVE] = "granted";
			User:logAdmin("sets license of " .. factions.getTownNameByID(FirstLicence) .. " with respect to " .. factions.getTownNameByID(SecondLicence) .. " to " .. licenceStrings[newLicence] );
		end
		local sd = SelectionDialog(TextSetLicence, TextSetLicenceOf .. factions.getTownNameByID(FirstLicence) .. TextWithRespctToA .. factions.getTownNameByID(SecondLicence) .. TextTo, cbSetLicence);
		for _,m in ipairs(licenceValues) do
			sd:addOption(0,licenceStrings[m]);
		end
		User:requestSelectionDialog(sd);
	end
	local sd = SelectionDialog(TextLicence, TextSetLicenceOf .. factions.getTownNameByID(FirstLicence) .. TextWithRespctToB, cbSecondLicence);
	for _,f in ipairs(factionIds) do
		sd:addOption(0,factions.getTownNameByID(f) .. ": " .. licenceStrings[licence.GetLicenceByFaction(FirstLicence, f)]);
	end
	User:requestSelectionDialog(sd);
end


local keyID = {}
keyID[1]={3054,3054,3054,2558,2558,2558,2558,2558,2558,2558,2558}
keyID[2]={2558,2558,2558,2558,2558,2558,2558,2558,2558,2558,2558,2558,2558}
keyID[3]={3056,3055,2558,2558,2558,2558,2558,2558,2558,2558,2558,2558,2558,2558}

local keydoorsID = {}
keydoorsID[1]={310,311,312,320,321,322,323,324,325,326,327}
keydoorsID[2]={240,241,242,251,211,210,236,233,235,234,230,231,243}
keydoorsID[3]={110,111,120,121,122,123,124,125,126,127,128,113,114,115}

local keydoorsnameDE = {}
local keydoorsnameEN = {}
keydoorsnameDE[1]={"Villa Rosaline","Villa Edward","Villa Reginald","Wohnungsquartier - Verantwortung","Wohnungsquartier - Glaube & Gehorsam","Wohnungsquartier - Ehre & Abstammung","Wohnungsquartier - Ehrlichkeit & Gerechtigkeit","Wohnungsquartier - Courage","Wohnungsquartier - Patriarchat","Wohnungsquartier - Besitz","Wohnungsquartier - Wachsamkeit"}
keydoorsnameEN[1]={"Villa Rosaline","Villa Edward","Villa Reginald","Flat quarter - Responsibility","Flat quarter - Faith & Obedience","Flat quarter - Honour & Lineage","Flat quarter - Truth & Justice","Flat quarter - Courage","Flat quarter - Patriarchy","Flat quarter - Property","Flat quarter - Alertness"}
keydoorsnameDE[2]={"Insel des Feuers Appartement 1","Insel des Feuers Appartement 2","Insel des Feuers Appartement 3","Landhaus","Insel der Luft Appartement 2","Insel der Luft Appartement 1","Insel der Erde Appartement 6","Insel der Erde Appartement 3","Insel der Erde Appartement 5","Insel der Erde Appartement 4","Insel der Erde Appartement 1","Insel der Erde Appartement 2","Insel des Feuers Appartement 4"}
keydoorsnameEN[2]={"Island of Fire Apartment 1","Island of Fire Apartment 2","Island of Fire Apartment 3","Cottage","Island of Air Apartment 2","Island of Air Apartment 1","Island of Earth Apartment 6","Island of Earth Apartment 3","Island of Earth Apartment 5","Island of Earth Apartment 4","Island of Earth Apartment 1","Island of Earth Apartment 2","Island of Fire Apartment 4"}
keydoorsnameDE[3]={"Malachite Haus","Villa Goldader","Wohnung Irmorom","Wohnung Elara","Wohnung Adron","Wohnung Malachin","Wohnung Oldra","Wohnung Nargun","Wohnung Ronagan","Wohnung Sirani","Wohnung Zhambra", "Gl�ckskupfer", "Silberner Verdienst", "Goldener Abschluss"}
keydoorsnameEN[3]={"House of Malachite","Villa Goldvein","Flat Irmorom","Flat Elara","Flat Adron","Flat Malachin","Flat Oldra","Flat Nargun","Flat Ronagan","Flat Sirani","Flat Zhambra", "Lucky Copper", "Silver Profit", "Golden Deal"}


function TownKey(User,toolTown)
--debug("TownKey: "..User.name)
	local keydoorsname
	local AmountKeyDoors = #keydoorsnameDE[toolTown]
	for j = 1,AmountKeyDoors do
		if  User:getPlayerLanguage() == Player.german then
			keydoorsname = keydoorsnameDE[toolTown]
		else
			keydoorsname = keydoorsnameEN[toolTown]
		end
	end

	local callback = function(dialog)
		local success = dialog:getSuccess()
		if success then
			local selected = dialog:getSelectedIndex() + 1
			User:createItem(keyID[toolTown][selected],1,999,{["lockId"]=keydoorsID[toolTown][selected],["descriptionDe"]=keydoorsnameDE[toolTown][selected],["descriptionEn"]=keydoorsnameEN[toolTown][selected]})
			User:logAdmin("creates a key for " .. keydoorsnameEN[toolTown][selected]);
		end
	end


	local dialog
	if User:getPlayerLanguage() == Player.german then
		dialog = SelectionDialog("Schl�sselgenerator", "Erstelle einen Schl�ssel f�r folgende T�ren.", callback)
	else
		dialog = SelectionDialog("Key-Generator", "Create a key for following doors.", callback)
	end
	dialog:setCloseOnMove()

	for i=1,#keydoorsname do
		dialog:addOption(0, keydoorsname[i])
	end
	User:requestSelectionDialog(dialog)
end

return M
