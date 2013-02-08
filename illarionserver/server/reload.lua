-- called after every !rd command and !fr command
-- note that !rd is a !fr without npc and spawn reloading
-- note further that reload_tables will be called after this if and only if the !rd was successful and the !rd was issued by a !fr

require("base.common")
require("base.doors")
require("content.doors")
require("content.signpost")
require("content.gods")
require("item.lever")
require("content.areas")
require("alchemy.base.alchemy")

module("server.reload", package.seeall)

function onReload()
    -- logToFile("start onReload");
    content.doors.initDoors();
    initDepots();
    --initExplorerStones();
    initAltars();
    content.signpost.InitWegweiser();
	initNoobia();
	initTreasureChests();
    alchemy.base.alchemy.InitAlchemy();
	-- logToFile("end onReload");
    item.lever.init();
	content.areas.Init();
    
    return true;
end

function initDepots()
    -- AddDepot(x, y, z, data)
end

function initExplorerStones()
    -- AddExplorerStone(x, y, z, number, value);
end

function initAltars()
    -- AddAltar(x, y, z, god);
end

function AddDepot(DepotX,DepotY,DepotZ,DepotData)
    DepotPos=position(DepotX,DepotY,DepotZ);
    if world:isItemOnField(DepotPos) then
        thisDepot=world:getItemOnField(DepotPos);
        if (thisDepot.id == 321) then
            thisDepot:setData("depot", DepotData);
            world:changeItem(thisDepot);
        else
            world:createItemFromId(321,1,DepotPos,true,333,nil);
        end
	end
end

function AddExplorerStone(StoneX,StoneY,StoneZ,StoneNumber,StoneValue)
    StonePos=position(StoneX,StoneY,StoneZ);
    if world:isItemOnField(StonePos) then
        thisStone=world:getItemOnField(StonePos);
        if (thisStone.id == 1272) then
            thisStone:setData("stonenumber", StoneNumber);
            thisStone.quality=StoneValue;
            world:changeItem(thisStone);
        else
            world:createItemFromId(1272,1,StonePos,true,StoneValue,nil);
        end
	end
end

function AddAltar(AltarX,AltarY,AltarZ,God,Altar)
    AltarPos=position(AltarX,AltarY,AltarZ);
    if world:isItemOnField(AltarPos) then
        thisAltar=world:getItemOnField(AltarPos);
        thisAltar:setData("god", God);
        world:changeItem(thisAltar);
    else
        if Altar then
            world:createItemFromId(Altar,1,AltarPos,false,333,nil);
        end;
    end
end

function initNoobia()

end

function AddNoobiaPortal( Portal, PortalX, PortalY, PortalZ )

	local PortalPos = position(PortalX,PortalY,PortalZ);
	local itemList = base.common.GetItemsOnField(PortalPos);
	for i,item in pairs(itemList) do
		if item.id == 10 and item:getData("portal") == Portal then
			return;
		end
	end
	thePortal = world:createItemFromId(10,1,position(PortalX,PortalY,PortalZ),true,333,nil);
	thePortal.wear = 255;
	world:changeItem(thePortal);
end

function AddMagicalDoor( Portal, PortalX, PortalY, PortalZ )

	local PortalPos = position(PortalX,PortalY,PortalZ);
	local itemList = base.common.GetItemsOnField(PortalPos);
	for i,item in pairs(itemList) do
		if item.id == 10 and item:getData("portal") == Portal then
			return;
		end
	end
	thePortal = world:createItemFromId(10,1,position(PortalX,PortalY,PortalZ),true,333,nil);
	thePortal.wear = 255;
	world:changeItem(thePortal);
end



function initTreasureChests()
	AddTreasureChest(8,1,3,3,0);
end

--[[
ChestId:
	open chests: 1361 (South), 1362 (West)
	closed chests: 1360 (South), 8 (West)
]]

function AddTreasureChest(ChestId, ChestData, ChestX, ChestY, ChestZ)
	-- DEACTIVATED until I know what the data is for. Merung
	--[[local pos = position(ChestX,ChestY,ChestZ);
	local item = world:getItemOnField(pos);
	if item.id==ChestId then
		item.data = ChestData;
		world:changeItem(item);
	else
		world:createItemFromId(ChestId,1,pos,false,333,ChestData);
	end]]
end

