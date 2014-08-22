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


require("quest.explorersguild")
require("base.common")
require("base.ranklist")
require("quest.explorerguild_320_questlog")

module("item.id_66_markerstone", package.seeall)

function UseItem(User, SourceItem, ltstate)  -- DONT EDIT THIS LINE!
	local stonedata=SourceItem:getData("markerstone");
	if tonumber(stonedata) then
		if not quest.explorersguild.CheckStone(User,tonumber(stonedata)) then
			--debug("Stone used. stonedata: "..stonedata)
			DisplayText = base.common.GetNLS( User, "Du hast einen Markierungsstein der Abenteurergilde entdeckt; er trägt die Nummer "..stonedata,"You found a marker stone of the Explorers' Guild; it has the number "..stonedata);
			quest.explorersguild.WriteStone(User,tonumber(stonedata));
			quest.explorersguild.getReward(User);
			base.ranklist.setRanklist(User, "explorerRanklist", quest.explorersguild.CountStones(User));
			User:setQuestProgress(320,1)
		else
			DisplayText = base.common.GetNLS( User, "Du hast diesen Markierungsstein der Abenteurergilde bereits früher gefunden; er trägt die Nummer "..stonedata..". Du hast bereits "..quest.explorersguild.CountStones(User).." dieser Steine gefunden.","You have already found that marker stone of the Explorers' Guild earlier; it has the number "..stonedata..". You have already found "..quest.explorersguild.CountStones(User).." of these stones.");
		end
		User:inform(DisplayText);
    end
end

function LookAtItem(User,Item)
	local stonedata=Item:getData("markerstone");
	if tonumber(stonedata) then
		if not quest.explorersguild.CheckStone(User,tonumber(stonedata)) then
			base.lookat.SetSpecialDescription( Item, "Ein Markierungsstein der Abenteurergilde.","A marker stone of the Explorers' Guild.");
		else
			base.lookat.SetSpecialDescription( Item, "Du hast diesen Markierungsstein der Abenteurergilde bereits früher gefunden; er trägt die Nummer "..stonedata,"You have already found that marker stone of the Explorers' Guild earlier; it has the number "..stonedata);
		end
    end
	return base.lookat.GenerateLookAt(User, Item, base.lookat.NONE)  
end
