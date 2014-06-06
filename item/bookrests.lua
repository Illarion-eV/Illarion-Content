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
require("base.common")
require("base.seafaring")
require("base.townManagement")

-- UPDATE common SET com_script='item.bookrests' WHERE com_itemid = 3104;
-- UPDATE common SET com_script='item.bookrests' WHERE com_itemid = 3105;
-- UPDATE common SET com_script='item.bookrests' WHERE com_itemid = 3106;
-- UPDATE common SET com_script='item.bookrests' WHERE com_itemid = 3107;
-- UPDATE common SET com_script='item.bookrests' WHERE com_itemid = 3108;

module("item.bookrests", package.seeall)

function LookAtItem(User,Item)

	local lookAt
	-- Bookrest for the Salavesh dungeon!
	if (Item.pos == position(741,406,-3)) then
		lookAt = SalaveshLookAt(User, Item)
	end
	-- Salavesh end

	-- Bookrest for townManagement
	local AmountTM = table.getn(base.townManagement.townManagmentItemPos)	
	for i = 1,AmountTM do
		if (Item.pos == base.townManagement.townManagmentItemPos[i]) then
			lookAt = TMLookAt(User, Item)
		end
	end
	-- Bookrest for townManagement end

	-- Bookrest for ferry
	local Amountferry = table.getn(base.seafaring.ferrySourceItemPos)
	for i = 1,Amountferry do
		if (Item.pos == base.seafaring.ferrySourceItemPos[i]) then
			lookAt = FerryLookAt(User, Item)
		end
	end
	-- ferries end

	-- static teleporter
	if Item:getData("staticTeleporter") ~= "" then
		lookAt = StaticTeleporterLookAt(User, Item)
	end
	-- teleporter end

	if lookAt then
	    world:itemInform(User, Item, lookAt)
	else
	    world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, 0))
	end
end


function FerryLookAt(User, Item)
	local lookAt = ItemLookAt();
--	lookAt.rareness = ItemLookAt.rareItem;
	if (User:getPlayerLanguage()==0) then
		lookAt.name = "Fähre";
		lookAt.description = "Wer bei der nächsten Fahrt mit möchte, sollte sich schnellstens hier innerhalb von fünf Schritten sammeln. Preis: Zehn Silberstücke für die ganze Gruppe."
	else
		lookAt.name = "Ferry";
		lookAt.description = "Anyone who would like to join for the next trip should gather here within five steps. Price: Ten silver pieces for the whole group."
	end
	return lookAt
end

function TMLookAt(User, Item)
	local lookAt = ItemLookAt();
--	lookAt.rareness = ItemLookAt.rareItem;
	if (User:getPlayerLanguage()==0) then
		lookAt.name = "Stadtverwaltung";
		lookAt.description = "Instrument zur Verwaltung der Stadt. Nur für offizielle Vertreter."
	else
		lookAt.name = "Town Managment";
		lookAt.description = "Instrument for town management. Only for officials."
	end
	return lookAt
end

function StaticTeleporterLookAt(User, Item)

	local lookAt = ItemLookAt();
	lookAt.name = "Teleporter";
	return lookAt
end

function SalaveshLookAt(User, Item)

	local lookAt = ItemLookAt();
	lookAt.rareness = ItemLookAt.rareItem;

	if (User:getPlayerLanguage()==0) then
		lookAt.name = "Tagebuch des Abtes Elzechiel";
		lookAt.description = "Dieses Buch ist von einer schaurigen Schönheit. Du bist versucht, es dennoch zu lesen..."
	else
		lookAt.name = "Journal of Abbot Elzechiel";
		lookAt.description = "This item has an evil presence. You are tempted to read it, though..."
	end
	return lookAt
end

function UseItem(User, SourceItem)
	-- Bookrest for the Salavesh dungeon!
	if (SourceItem.pos == position(741,406,-3)) then
	    User:sendBook(201);
	end
	-- Salavesh end

	-- Bookrest for the Evilrock!
	if (SourceItem.pos == position(975,173,0)) then
		local controlpannel = world:getPlayersInRangeOf(position(969,173,0), 8)
		if User:getQuestProgress(667) >= 25 then
			local AmountDarkColumnEvilrock = table.getn(content.vision.darkColumnEvilrock)
			for i=1,AmountDarkColumnEvilrock do
				local DarkColumnEvilrockLightErase = world:getItemOnField(content.vision.darkColumnEvilrock[i])
				if DarkColumnEvilrockLightErase.id == 467 then
					world:erase(DarkColumnEvilrockLightErase,DarkColumnEvilrockLightErase.number)
					world:gfx(45,content.vision.darkColumnEvilrockLight[i])
				end
			end
			content.vision.beamMeDown(User, SourceItem)
			return
		else
			for i,player in ipairs(controlpannel) do
				player:inform("Du hörst ein Klicken, aber nichts passiert.", "You hear a clicking but nothing happens.")

			end
			world:makeSound(22,position(975,173,0))
		end

	end
	-- Evilrock end

	-- TownManagement
	local AmountTM = table.getn(base.townManagement.townManagmentItemPos)	
	for i = 1,AmountTM do	
		if (SourceItem.pos == base.townManagement.townManagmentItemPos[i]) then
			base.townManagement.townManagmentUseItem(User, SourceItem)
		end
	end
	-- TownManagement end

	-- ferries
	local Amountferry = table.getn(base.seafaring.ferrySourceItemPos)
	for i = 1,Amountferry do
		if (SourceItem.pos == base.seafaring.ferrySourceItemPos[i]) then
			base.seafaring.Ferry(User, SourceItem)
		end
	end
	-- ferries end

	-- static teleporter
	if SourceItem:getData("staticTeleporter") ~= "" then
	    StaticTeleporter(User, SourceItem)
	end
	-- static teleporter end
end

function StaticTeleporter(User, SourceItem)

    local names
	if  User:getPlayerLanguage() == Player.german then
		names = {"Runewick","Galmair","Cadomyr","Gasthof zur Hanfschlinge"}
	else
		names = {"Runewick","Galmair","Cadomyr","Hemp Necktie Inn"}
	end
	local items = {105,61,2701,1909}
	local targetPos = {position(835,813,0), position(423,246,0),position(126,647,0),position(684,307,0)}

	local callback = function(dialog)

		success = dialog:getSuccess()
		if success then
			selected = dialog:getSelectedIndex()
			if  base.money.CharHasMoney(User,500) then

				if (targetPos[selected+1].x - SourceItem.pos.x) * (targetPos[selected+1].x - SourceItem.pos.x) < 10 then
					User:inform("Ihr befindet euch bereits in " ..names[selected+1]..".", "You are already in "..names[selected+1]..".")
				else

					User:inform("Ihr habt euch dazu entschlossen nach " ..names[selected+1].. " zu Reisen.", "You have chosen to travel to " ..names[selected+1]..".")
					base.money.TakeMoneyFromChar(User,500)
					world:gfx(46,User.pos)
					world:makeSound(13,User.pos);

					User:warp(targetPos[selected+1])
					world:gfx(46,User.pos)
					world:makeSound(13,User.pos);
				end
			else
				User:inform("Ihr habt nicht genug Geld für diese Reise. Die Reise kostet fünf Silberstücke.", "You don't have enough money for this journey. The journey costs five silver coins.")
			end

		end
	end

	local dialog
	if User:getPlayerLanguage() == Player.german then
		dialog = SelectionDialog("Teleporter", "Eine Reise kostet fünf Silberstücke. Wähle eine Ziel aus.", callback)
	else
		dialog = SelectionDialog("Teleporter", "A journey costs five silver coins. Choose a destination.", callback)
	end
	dialog:setCloseOnMove()

	for i=1,#items do
		dialog:addOption(items[i], names[i])
	end
	User:requestSelectionDialog(dialog)
end

