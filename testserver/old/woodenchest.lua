-- UPDATE common SET com_script='item.woodenchest' WHERE com_itemid IN (8,1360,1361,1362);

require("base.common")

module("item.woodenchest", package.seeall)

ALWAYS = -1;
DELETE_CHEST = -1;
RESET_DATA = -2;

TreasureList = { add = function(self,data,CurStatus,NextStatus,Items)
					self[data] = {};
					self[data].CurStatus = CurStatus;
					self[data].NextStatus = NextStatus;
					self[data].Items = Items;
				end
};

--[[
TreasureList:add( data, currentStatus, nextStatus, Items );

data: the data value of the chest and the QPG ID
currentStatus: items are only created if this value equals the QPG status. Set to ALWAYS if independent of QPG status.
nextStatus: the QPG is set to this value after the items are created.
			Alternatively you can set nextStatus to DELETE_CHEST or RESET_DATA (of chest to zero), then player QPG won't be changed.

Items entry should have this format:
{
	{id = 1, minNum = 1},
	{id = 2, minNum = 4, maxNum = 19, quality = 666, data = 42}
}
id and minNum (minimum number) has to be set.
	Optionally you can set maxNum (then a random value between min and max of this item is created), quality (default: 333) and data (default: 0).
]]

TreasureList:add( 1, ALWAYS, RESET_DATA, {{id=2,minNum=2}} );
TreasureList:add( 2, ALWAYS, DELETE_CHEST, {{id=1,minNum=1,maxNum=5,quality=999,data=1}} );
TreasureList:add( 1001, 2, 3, {{id=2,minNum=2},{id=1,minNum=1,maxNum=5,quality=999,data=1}} );

function UseItem(User, SourceItem, LTState)
	if string.find(User.lastSpokenText,"qpg") then
		User:inform("current qpg:" .. User:getQuestProgress(1001) .. "; set to " .. Counter-1);
		User:setQuestProgress(1001,Counter-1);
		return;
	end
	
	local data = SourceItem.data;
	
	local this = TreasureList[data];
	if not this then
		return;
	end
	if this.CurStatus>=0 and this.CurStatus~=User:getQuestProgress(data) then
		return;
	end
	local rest = 0;
	local num = 0;
	for _,item in this.Items do
		num = math.random(item.minNum,(item.maxNum or item.minNum));
		rest = User:createItem(item.id, num, (item.quality or 333), (item.data or nil));
		if rest>0 then
			world:createItemFromId(item.id, rest, User.pos, true, (item.qual or 333), (item.data or nil));
		end
	end
	if this.NextStatus==DELETE_CHEST then
		world:erase(SourceItem,SourceItem.number);
	elseif this.NextStatus==RESET_DATA then
		SourceItem.data = 0;
		world:changeItem(SourceItem);
	else
		User:setQuestProgress(data,this.NextStatus);
	end
	local doNormalInform = true;
	-- [EDIT BELOW] --
	
	-- [EDIT ABOVE] --
	if doNormalInform then
		local gText,eText = "In der Kiste findest du etwas.","You find something in the chest.";
		if this.NextStatus==DELETE_CHEST then
			gText = gText .. " Doch sofort danach brechen die morschen Holzlatten auseinander und die Kiste ist kaputt.";
			eText = eText .. " But in this very moment the rotten wood lathes break off and the chest is destroyed.";
		end
		base.common.InformNLS(User,gText,eText);
	end
end
