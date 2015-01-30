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
local lookat = require("base.lookat")
local common = require("base.common")
local lever = require("base.lever")
local deleteitem = require("handler.deleteitem")
local lockdoor = require("handler.lockdoor")
local unlockdoor = require("handler.unlockdoor")
local opendoor = require("handler.opendoor")
local closedoor = require("handler.closedoor")
local createitem = require("handler.createitem")
local createbridge = require("handler.createbridge")
local deletebridge = require("handler.deletebridge")
local settile = require("handler.settile")
local createeffect = require("handler.createeffect")
local createsound = require("handler.createsound")
local sendmessage = require("handler.sendmessage")
local movelever = require("handler.movelever")
local warpplayer = require("handler.warpplayer")
local warpgroup = require("handler.warpgroup")
local createmonster = require("handler.createmonster")
local eraseplayeritem = require("handler.eraseplayeritem")
local createplayeritem = require("handler.createplayeritem")
local evilrock = require("triggerfield.evilrock")

local M = {}

-- UPDATE items SET itm_script='item.lever' WHERE itm_id IN (434, 435, 436, 437, 438, 439);


local leverList = {}

local function AddToLevers(myLever)
    if (world:isItemOnField(myLever.pos)==true) then    -- item on field?
		itemID=world:getItemOnField(myLever.pos).id;
        if (itemID>=434 and itemID<=439) then           -- is item a lever?
            key=myLever.pos.x*1024*1024+myLever.pos.y*1024+myLever.pos.z;
            leverList[key]=myLever;                     -- calculate unique key
            return 1;                                   -- put into list and return 1
        else
            return -2;                                  -- item is no lever
        end
    else
        return -1;                                      -- no item there
    end
end

-- called by server.reload
function M.init()
	-- elevator from underground to ground--
	-- create "sun" graphic with id 46
	-- activate at every switching of the lever
	local elevator1 = lever.Lever(position(332,244,-6),true); --create lever object
	elevator1:bind(1, warpgroup.warpGroup(position(335,244,-6),2, position(329,247,0), 42 ));
	elevator1:bind(0, warpgroup.warpGroup(position(335,244,-6),2, position(329,247,0), 42 ));

	---elevator from ground to underground--
	local elevator2 = lever.Lever(position(332,247,0),true); --create lever object
	elevator2:bind(1, warpgroup.warpGroup(position(329,247,0),2, position(335,244,-6), nil ));
	elevator2:bind(0, warpgroup.warpGroup(position(329,247,0),2, position(335,244,-6), nil ));

	-- activate at every switching of the lever
	local evilrock1 = lever.Lever(position(977,171,-6),true); --create lever object
	evilrock1:bind(0, deleteitem.deleteItem(position(977,172,-6),467));
	evilrock1:bind(0, deleteitem.deleteItem(position(977,174,-6),467));
	evilrock1:bind(0, deleteitem.deleteItem(position(973,171,-6),467));
	evilrock1:bind(0, deleteitem.deleteItem(position(973,175,-6),467));
	evilrock1:bind(0, deleteitem.deleteItem(position(971,171,-6),467));
	evilrock1:bind(0, deleteitem.deleteItem(position(971,175,-6),467));
	evilrock1:bind(0, deleteitem.deleteItem(position(969,171,-6),467));
	evilrock1:bind(0, deleteitem.deleteItem(position(969,175,-6),467));
	evilrock1:bind(0, deleteitem.deleteItem(position(960,171,-6),467));
	evilrock1:bind(0, deleteitem.deleteItem(position(960,175,-6),467));
	evilrock1:bind(0, deleteitem.deleteItem(position(960,164,-6),467));
	evilrock1:bind(0, deleteitem.deleteItem(position(960,182,-6),467));
	evilrock1:bind(0, deleteitem.deleteItem(position(952,164,-6),467));
	evilrock1:bind(0, deleteitem.deleteItem(position(952,182,-6),467));
	evilrock1:bind(0, deleteitem.deleteItem(position(943,164,-6),467));
	evilrock1:bind(0, deleteitem.deleteItem(position(943,182,-6),467));
	evilrock1:bind(0, deleteitem.deleteItem(position(943,170,-6),467));
	evilrock1:bind(0, deleteitem.deleteItem(position(943,176,-6),467));
	evilrock1:bind(1, createitem.createItem(position(977,172,-6),467, 666, 1));
	evilrock1:bind(1, createitem.createItem(position(977,174,-6),467, 666, 1));
	evilrock1:bind(1, createitem.createItem(position(973,171,-6),467, 666, 1));
	evilrock1:bind(1, createitem.createItem(position(973,175,-6),467, 666, 1));
	evilrock1:bind(1, createitem.createItem(position(971,171,-6),467, 666, 1));
	evilrock1:bind(1, createitem.createItem(position(971,175,-6),467, 666, 1));
	evilrock1:bind(1, createitem.createItem(position(969,171,-6),467, 666, 1));
	evilrock1:bind(1, createitem.createItem(position(969,175,-6),467, 666, 1));
	evilrock1:bind(1, createitem.createItem(position(960,171,-6),467, 666, 1));
	evilrock1:bind(1, createitem.createItem(position(960,175,-6),467, 666, 1));
	evilrock1:bind(1, createitem.createItem(position(960,164,-6),467, 666, 1));
	evilrock1:bind(1, createitem.createItem(position(960,182,-6),467, 666, 1));
	evilrock1:bind(1, createitem.createItem(position(952,164,-6),467, 666, 1));
	evilrock1:bind(1, createitem.createItem(position(952,182,-6),467, 666, 1));
	evilrock1:bind(1, createitem.createItem(position(943,164,-6),467, 666, 1));
	evilrock1:bind(1, createitem.createItem(position(943,182,-6),467, 666, 1));
	evilrock1:bind(1, createitem.createItem(position(943,170,-6),467, 666, 1));
	evilrock1:bind(1, createitem.createItem(position(943,176,-6),467, 666, 1));

	-- activate at every switching of the lever
	local evilrock2 = lever.Lever(position(977,175,-6),true); --create lever object
	evilrock2:bind(0, deleteitem.deleteItem(position(977,173,-6),10));
	evilrock2:bind(1, createitem.createItem(position(977,173,-6),10, 666, 1));
	evilrock2:bind(1, createsound.createSound(position(977,173,-6),4));

	local evilrock3 = lever.Lever(position(966,169,2),true); --create lever object
	evilrock3:bind(0, evilrock.executePortalLeverRiddle(position(966,169,2)));
	evilrock3:bind(1, evilrock.executePortalLeverRiddle(position(966,169,2)));

	local evilrock4 = lever.Lever(position(967,169,2),true); --create lever object
	evilrock4:bind(0, evilrock.executePortalLeverRiddle(position(967,169,2)));
	evilrock4:bind(1, evilrock.executePortalLeverRiddle(position(967,169,2)));

	local evilrock5 = lever.Lever(position(968,169,2),true); --create lever object
	evilrock5:bind(0, evilrock.executePortalLeverRiddle(position(968,169,2)));
	evilrock5:bind(1, evilrock.executePortalLeverRiddle(position(968,169,2)));

	local evilrock6 = lever.Lever(position(969,169,2),true); --create lever object
	evilrock6:bind(0, evilrock.executePortalLeverRiddle(position(969,169,2)));
	evilrock6:bind(1, evilrock.executePortalLeverRiddle(position(969,169,2)));

	local evilrock7 = lever.Lever(position(970,169,2),true); --create lever object
	evilrock7:bind(0, evilrock.executePortalLeverRiddle(position(970,169,2)));
	evilrock7:bind(1, evilrock.executePortalLeverRiddle(position(970,169,2)));

	local evilrock8 = lever.Lever(position(971,169,2),true); --create lever object
	evilrock8:bind(0, evilrock.executePortalLeverRiddle(position(971,169,2)));
	evilrock8:bind(1, evilrock.executePortalLeverRiddle(position(971,169,2)));

	local evilrock9 = lever.Lever(position(972,169,2),true); --create lever object
	evilrock9:bind(0, evilrock.executePortalLeverRiddle(position(972,169,2)));
	evilrock9:bind(1, evilrock.executePortalLeverRiddle(position(972,169,2)));

	local evilrock10 = lever.Lever(position(973,169,2),true); --create lever object
	evilrock10:bind(0, evilrock.executePortalLeverRiddle(position(973,169,2)));
	evilrock10:bind(1, evilrock.executePortalLeverRiddle(position(973,169,2)));

	local evilrock11 = lever.Lever(position(974,169,2),true); --create lever object
	evilrock11:bind(0, evilrock.executePortalLeverRiddle(position(974,169,2)));
	evilrock11:bind(1, evilrock.executePortalLeverRiddle(position(974,169,2)));


	-- Wall appear / disappear in dwarf Dungeon
	local dronrul1 = lever.Lever(position(446,754,-3),true);
	dronrul1:bind(0, deleteitem.deleteItem(position(442,754,-3),613));
	dronrul1:bind(0, createsound.createSound(position(442,754,-3),22));
	--dronrul1.bind(0, sendmessage.sendMessage(position(442,754,-3), "Der Hebel bewegt sich und die Wand gegenüber senkt sich in den Boden.", "The lever moves and the wall on the opposite side sinks down into the floor.", 4));
	dronrul1:bind(1, createitem.createItem(position(442,754,-3),613, 333, 1));
	dronrul1:bind(1, createsound.createSound(position(442,754,-3),22));
	--dronrul1.bind(1, sendmessage.sendMessage(position(442,754,-3), "Der Hebel bewegt sich und das Loch in der Wand gegenüber schließt sich.", "The lever moves and the hole in the wall on the opposite side closes.", 4));

	-- Levers to spawn Bridge to pirate Isle
	local killerhuhn = lever.Lever(position(54,602,0),false);
	--[[killerhuhn:bind(0, createmonster.createMonster(position(50,604,0),5,40));
	killerhuhn:bind(0, createitem.createItem(position(49,604,0),5, 123, 1));
	killerhuhn:bind(1, createmonster.createMonster(position(50,604,0),12,40));
	killerhuhn:bind(1, deleteitem.deleteItem(position(49,604,0),613));]]

	local ki1 = lever.Lever(position(54,603,0),false);
	--[[ki1:bind(0, settile.setTile(position(49,604,0), 4));
	ki1:bind(1, settile.setTile(position(49,604,0), 6));]]

	local ki2 = lever.Lever(position(54,604,0),false);
	--No test-debug-try-shit, please! Please replace with proper messages ~Estralis
	--ki2:bind(0, handler.sendmessagetoplayer.sendMessageToPlayer(Char, "TestGerman","TestEnglish"));
	--ki2:bind(1, sendmessage.sendMessage(position(54,604,0), "TesinGerman","TesinEnglish", 10));

	--Please, please use commentaries! I have no idea why this lever creates money and whether it should be affected by the x10 price change ~Estralis
	local ki3 = lever.Lever(position(54,605,0),false);
	ki3:bind(0, eraseplayeritem.erasePlayerItem(Char, 3076,1));
	ki3:bind(1, createplayeritem.createPlayerItem(Char, 3076,1));

	local ki4 = lever.Lever(position(54,606,0),false);
	ki4:bind(0, createbridge.createBridge(position(58,599,0),0,3));
	ki4:bind(1, deletebridge.deleteBridge(position(58,599,0),0,3));

	-- Doors in Halfling Dungeon Will work once Data is assigned to doors!
	local openDoor = lever.Lever(position(558,520,-3),false);
	openDoor:bind(0, opendoor.openDoor(position(559,557,-6)));
	openDoor:bind(0, opendoor.openDoor(position(558,557,-6)));
	openDoor:bind(0, sendmessage.sendMessage(position(558,520,-3), "Ich öffne die Türe!","I open the door!", 10));
	openDoor:bind(1, closedoor.closeDoor(position(559,557,-6)));
	openDoor:bind(1, closedoor.closeDoor(position(558,557,-6)));
	openDoor:bind(1, sendmessage.sendMessage(position(558,520,-3), "Ich schließe die Türe!","I close the door!", 10));

	local openDoor1 = lever.Lever(position(538,557,-3),false);
	openDoor1:bind(0, unlockdoor.unlockDoor(position(559,556,-6)));
	openDoor1:bind(0, unlockdoor.unlockDoor(position(558,556,-6)));
	openDoor1:bind(0, sendmessage.sendMessage(position(538,557,-3), "Ich schließe die Türe auf!","I unlock the door!", 10));
	openDoor1:bind(1, lockdoor.lockDoor(position(559,556,-6)));
	openDoor1:bind(1, lockdoor.lockDoor(position(558,556,-6)));
	openDoor1:bind(1, sendmessage.sendMessage(position(538,557,-3), "Ich sperre die Türe zu!","I lock the door!", 10));
	-- Doors in Halfling Dungeon end -----

	-- Bridge in Lake of Life Dungeon ----
	local lakeofLife = lever.Lever(position(720, 258, -9), true)
    lakeofLife:bind(0, deletebridge.deleteBridge(position(722, 258, -9), 0, 19))
	lakeofLife:bind(0, deletebridge.deleteBridge(position(723, 258, -9), 0, 19))
    lakeofLife:bind(1, createbridge.createBridge(position(722, 258, -9), 0, 19))
	lakeofLife:bind(1, createbridge.createBridge(position(723, 258, -9), 0, 19))
	lakeofLife:bind(1, sendmessage.sendMessage(position(720, 258, -9), "Du hörst ein knarzendes Geräusch.", "You hear a grinding sound.", 10))
	lakeofLife:bind(1, sendmessage.sendMessage(position(781, 188, -9), "Du hörst ein knarzendes Geräsch in der Ferne.", "You hear a grinding sound a distance away.", 10))

	AddToLevers(elevator1);
	AddToLevers(elevator2);
	AddToLevers(evilrock1);
	AddToLevers(evilrock2);
	AddToLevers(evilrock3);
	AddToLevers(evilrock4);
	AddToLevers(evilrock5);
	AddToLevers(evilrock6);
	AddToLevers(evilrock7);
	AddToLevers(evilrock8);
	AddToLevers(evilrock9);
	AddToLevers(evilrock10);
	AddToLevers(evilrock11);
	AddToLevers(dronrul1);
	AddToLevers(killerhuhn);
	AddToLevers(ki1);
	AddToLevers(ki2);
	AddToLevers(ki3);
	AddToLevers(ki4);

	AddToLevers(openDoor);
	AddToLevers(openDoor1);
	AddToLevers(lakeofLife);
end


function M.UseItem(User, SourceItem, ltstate)

	local key = SourceItem.pos.x*1024*1024+SourceItem.pos.y*1024+SourceItem.pos.z;
    if leverList[key]~=nil then
        leverList[key]:switchLever(User);
    end
end

function M.LookAtItem(User, Item)

	return lookat.GenerateLookAt(User, Item, lookat.NONE)
end


return M

