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
-- UPDATE items SET itm_script='item.id_66_markerstone' WHERE itm_id IN (66);


local explorersguild = require("quest.explorersguild")
local common = require("base.common")
local ranklist = require("base.ranklist")
local explorerguild_320_questlog = require("quest.explorerguild_320_questlog")

module("item.id_66_markerstone", package.seeall)

function UseItem(User, SourceItem, ltstate)  -- DONT EDIT THIS LINE!
	local stonedata=SourceItem:getData("markerstone");
	if tonumber(stonedata) then
		if not explorersguild.CheckStone(User,tonumber(stonedata)) then
			--debug("Stone used. stonedata: "..stonedata)
			DisplayText = common.GetNLS( User, "Du hast einen Markierungsstein der Abenteurergilde entdeckt; er trägt die Nummer "..stonedata,"You found a marker stone of the Explorers' Guild; it has the number "..stonedata);
			explorersguild.WriteStone(User,tonumber(stonedata));
			explorersguild.getReward(User);
			ranklist.setRanklist(User, "explorerRanklist", explorersguild.CountStones(User));
			User:setQuestProgress(320,1)
		else
			DisplayText = common.GetNLS( User, "Du hast diesen Markierungsstein der Abenteurergilde bereits früher gefunden; er trägt die Nummer "..stonedata..". Du hast bereits "..explorersguild.CountStones(User).." dieser Steine gefunden.","You have already found that marker stone of the Explorers' Guild earlier; it has the number "..stonedata..". You have already found "..explorersguild.CountStones(User).." of these stones.");
		end
		User:inform(DisplayText);
    end
end

function LookAtItem(User,Item)
	local stonedata=Item:getData("markerstone");
	if tonumber(stonedata) then
		if not explorersguild.CheckStone(User,tonumber(stonedata)) then
			base.lookat.SetSpecialDescription( Item, "Ein Markierungsstein der Abenteurergilde.","A marker stone of the Explorers' Guild.");
		else
			base.lookat.SetSpecialDescription( Item, "Du hast diesen Markierungsstein der Abenteurergilde bereits früher gefunden; er trägt die Nummer "..stonedata,"You have already found that marker stone of the Explorers' Guild earlier; it has the number "..stonedata);
		end
    end
	return base.lookat.GenerateLookAt(User, Item, base.lookat.NONE)  
end
