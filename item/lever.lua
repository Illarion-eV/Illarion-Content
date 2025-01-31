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
local lever = require("base.lever")
local deleteitem = require("handler.deleteitem")
local createitem = require("handler.createitem")
local createbridge = require("handler.createbridge")
local deletebridge = require("handler.deletebridge")
local createsound = require("handler.createsound")
local sendmessage = require("handler.sendmessage")
local warpgroup = require("handler.warpgroup")
local evilrock = require("triggerfield.evilrock")
local oldSlimeFeeding = require("content.oldSlimeFeeding")
local volcano_chest = require("triggerfield.volcano_chest")
local magicSphere = require("item.magicSphere")

local M = {}

-- UPDATE items SET itm_script='item.lever' WHERE itm_id IN (434, 435, 436, 437, 438, 439);

local leverList = {}

local function AddToLevers(myLever)
    if (world:isItemOnField(myLever.pos) == true) then    -- item on field?
        local itemID = world:getItemOnField(myLever.pos).id
        if (itemID >= 434 and itemID <= 439) then           -- is item a lever?
            local key = myLever.pos.x * 1024 * 1024 + myLever.pos.y * 1024 + myLever.pos.z
            leverList[key] = myLever -- calculate unique key
            return 1 -- put into list and return 1
        else
            return -2 -- item is no lever
        end
    else
        return -1 -- no item there
    end
end

-- called by server.reload
function M.init()
    -- Galmair elevator from underground to ground
    local elevator1 = lever.Lever(position(332,244,-6),true) --create lever object
    elevator1:bind(1, warpgroup.warpGroup(position(335,244,-6),2, position(329,247,0), 42 ))
    elevator1:bind(0, warpgroup.warpGroup(position(335,244,-6),2, position(329,247,0), 42 ))

    -- Galmair elevator from ground to underground
    local elevator2 = lever.Lever(position(332,247,0),true) --create lever object
    elevator2:bind(1, warpgroup.warpGroup(position(329,247,0),2, position(335,244,-6), nil ))
    elevator2:bind(0, warpgroup.warpGroup(position(329,247,0),2, position(335,244,-6), nil ))

    -- Evilrock levers
    local evilrock1 = lever.Lever(position(977,171,-6),true) --create lever object
    evilrock1:bind(0, deleteitem.deleteItem(position(977,172,-6),467))
    evilrock1:bind(0, deleteitem.deleteItem(position(977,174,-6),467))
    evilrock1:bind(0, deleteitem.deleteItem(position(973,171,-6),467))
    evilrock1:bind(0, deleteitem.deleteItem(position(973,175,-6),467))
    evilrock1:bind(0, deleteitem.deleteItem(position(971,171,-6),467))
    evilrock1:bind(0, deleteitem.deleteItem(position(971,175,-6),467))
    evilrock1:bind(0, deleteitem.deleteItem(position(969,171,-6),467))
    evilrock1:bind(0, deleteitem.deleteItem(position(969,175,-6),467))
    evilrock1:bind(0, deleteitem.deleteItem(position(960,171,-6),467))
    evilrock1:bind(0, deleteitem.deleteItem(position(960,175,-6),467))
    evilrock1:bind(0, deleteitem.deleteItem(position(960,164,-6),467))
    evilrock1:bind(0, deleteitem.deleteItem(position(960,182,-6),467))
    evilrock1:bind(0, deleteitem.deleteItem(position(952,164,-6),467))
    evilrock1:bind(0, deleteitem.deleteItem(position(952,182,-6),467))
    evilrock1:bind(0, deleteitem.deleteItem(position(943,164,-6),467))
    evilrock1:bind(0, deleteitem.deleteItem(position(943,182,-6),467))
    evilrock1:bind(0, deleteitem.deleteItem(position(943,170,-6),467))
    evilrock1:bind(0, deleteitem.deleteItem(position(943,176,-6),467))
    evilrock1:bind(1, createitem.createItem(position(977,172,-6),467, 666, 1))
    evilrock1:bind(1, createitem.createItem(position(977,174,-6),467, 666, 1))
    evilrock1:bind(1, createitem.createItem(position(973,171,-6),467, 666, 1))
    evilrock1:bind(1, createitem.createItem(position(973,175,-6),467, 666, 1))
    evilrock1:bind(1, createitem.createItem(position(971,171,-6),467, 666, 1))
    evilrock1:bind(1, createitem.createItem(position(971,175,-6),467, 666, 1))
    evilrock1:bind(1, createitem.createItem(position(969,171,-6),467, 666, 1))
    evilrock1:bind(1, createitem.createItem(position(969,175,-6),467, 666, 1))
    evilrock1:bind(1, createitem.createItem(position(960,171,-6),467, 666, 1))
    evilrock1:bind(1, createitem.createItem(position(960,175,-6),467, 666, 1))
    evilrock1:bind(1, createitem.createItem(position(960,164,-6),467, 666, 1))
    evilrock1:bind(1, createitem.createItem(position(960,182,-6),467, 666, 1))
    evilrock1:bind(1, createitem.createItem(position(952,164,-6),467, 666, 1))
    evilrock1:bind(1, createitem.createItem(position(952,182,-6),467, 666, 1))
    evilrock1:bind(1, createitem.createItem(position(943,164,-6),467, 666, 1))
    evilrock1:bind(1, createitem.createItem(position(943,182,-6),467, 666, 1))
    evilrock1:bind(1, createitem.createItem(position(943,170,-6),467, 666, 1))
    evilrock1:bind(1, createitem.createItem(position(943,176,-6),467, 666, 1))

    local evilrock2 = lever.Lever(position(977,175,-6),true) --create lever object
    evilrock2:bind(0, deleteitem.deleteItem(position(977,173,-6),10))
    evilrock2:bind(1, createitem.createItem(position(977,173,-6),10, 666, 1))
    evilrock2:bind(1, createsound.createSound(position(977,173,-6),4))

    local evilrock3 = lever.Lever(position(966,169,2),true) --create lever object
    evilrock3:bind(0, evilrock.executePortalLeverRiddle(position(966,169,2)))
    evilrock3:bind(1, evilrock.executePortalLeverRiddle(position(966,169,2)))

    local evilrock4 = lever.Lever(position(967,169,2),true) --create lever object
    evilrock4:bind(0, evilrock.executePortalLeverRiddle(position(967,169,2)))
    evilrock4:bind(1, evilrock.executePortalLeverRiddle(position(967,169,2)))

    local evilrock5 = lever.Lever(position(968,169,2),true) --create lever object
    evilrock5:bind(0, evilrock.executePortalLeverRiddle(position(968,169,2)))
    evilrock5:bind(1, evilrock.executePortalLeverRiddle(position(968,169,2)))

    local evilrock6 = lever.Lever(position(969,169,2),true) --create lever object
    evilrock6:bind(0, evilrock.executePortalLeverRiddle(position(969,169,2)))
    evilrock6:bind(1, evilrock.executePortalLeverRiddle(position(969,169,2)))

    local evilrock7 = lever.Lever(position(970,169,2),true) --create lever object
    evilrock7:bind(0, evilrock.executePortalLeverRiddle(position(970,169,2)))
    evilrock7:bind(1, evilrock.executePortalLeverRiddle(position(970,169,2)))

    local evilrock8 = lever.Lever(position(971,169,2),true) --create lever object
    evilrock8:bind(0, evilrock.executePortalLeverRiddle(position(971,169,2)))
    evilrock8:bind(1, evilrock.executePortalLeverRiddle(position(971,169,2)))

    local evilrock9 = lever.Lever(position(972,169,2),true) --create lever object
    evilrock9:bind(0, evilrock.executePortalLeverRiddle(position(972,169,2)))
    evilrock9:bind(1, evilrock.executePortalLeverRiddle(position(972,169,2)))

    local evilrock10 = lever.Lever(position(973,169,2),true) --create lever object
    evilrock10:bind(0, evilrock.executePortalLeverRiddle(position(973,169,2)))
    evilrock10:bind(1, evilrock.executePortalLeverRiddle(position(973,169,2)))

    local evilrock11 = lever.Lever(position(974,169,2),true) --create lever object
    evilrock11:bind(0, evilrock.executePortalLeverRiddle(position(974,169,2)))
    evilrock11:bind(1, evilrock.executePortalLeverRiddle(position(974,169,2)))

  -- Bridges in Lake of Life Dungeon ----
    local lakeofLife1 = lever.Lever(position(741, 221, -9), true)
    lakeofLife1:bind(0, deletebridge.deleteBridge(position(722, 258, -9), 0, 19))
    lakeofLife1:bind(0, deletebridge.deleteBridge(position(723, 258, -9), 0, 19))
    lakeofLife1:bind(1, createbridge.createBridge(position(722, 258, -9), 0, 19))
    lakeofLife1:bind(1, createbridge.createBridge(position(723, 258, -9), 0, 19))
    lakeofLife1:bind(1, sendmessage.sendMessage(position(741, 221, -9), "Du h�rst ein knarzendes Ger�usch.", "You hear a grinding sound.", 10))

    local lakeofLife2 = lever.Lever(position(720, 258, -9), true)
    lakeofLife2:bind(0, deletebridge.deleteBridge(position(722, 258, -9), 0, 19))
    lakeofLife2:bind(0, deletebridge.deleteBridge(position(723, 258, -9), 0, 19))
    lakeofLife2:bind(1, createbridge.createBridge(position(722, 258, -9), 0, 19))
    lakeofLife2:bind(1, createbridge.createBridge(position(723, 258, -9), 0, 19))
    lakeofLife2:bind(1, sendmessage.sendMessage(position(720, 258, -9), "Du h�rst ein knarzendes Ger�usch.", "You hear a grinding sound.", 10))

    -- Galmair Blackhole Race
    local ThroneRoom = lever.Lever (position(345,207, 0), true) -- create lever object

    ThroneRoom:bind(0, deleteitem.deleteItem(position(304,291,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(312,283,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(322,276,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(327,266,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(336,264,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(346,261,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(356,255,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(364,257,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(373,256,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(383,250,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(392,250,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(403,250,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(409,250,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(414,250,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(422,250,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(430,250,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(435,253,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(440,255,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(444,258,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(449,259,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(453,260,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(459,258,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(465,254,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(471,250,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(478,249,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(487,249,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(494,244,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(496,238,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(494,233,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(494,227,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(500,221,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(502,215,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(497,210,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(498,202,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(498,195,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(493,193,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(486,193,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(480,191,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(474,191,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(464,188,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(461,184,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(459,179,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(453,163,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(448,159,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(448,154,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(448,147,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(445,143,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(438,141,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(431,139,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(423,138,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(416,142,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(410,146,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(401,147,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(397,142,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(392,140,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(389,147,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(384,152,0),767))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(300,293,0),762))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(301,293,0),762))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(301,294,0),762))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(302,294,0),762))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(302,295,0),762))
    ThroneRoom:bind(0, deleteitem.deleteItem(position(303,295,0),762))
    ThroneRoom:bind(1, createitem.createItem(position(304,291,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(312,283,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(322,276,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(327,266,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(336,264,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(346,261,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(356,255,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(364,257,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(373,256,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(383,250,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(392,250,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(403,250,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(409,250,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(414,250,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(422,250,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(430,250,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(435,253,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(440,255,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(444,258,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(449,259,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(453,260,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(459,258,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(465,254,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(471,250,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(478,249,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(487,249,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(494,244,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(496,238,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(494,233,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(494,227,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(500,221,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(502,215,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(497,210,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(498,202,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(498,195,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(493,193,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(486,193,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(480,191,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(474,191,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(464,188,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(461,184,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(459,179,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(453,163,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(448,159,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(448,154,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(448,147,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(445,143,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(438,141,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(431,139,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(423,138,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(416,142,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(410,146,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(401,147,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(397,142,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(392,140,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(389,147,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(384,152,0),767,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(300,293,0),762,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(301,293,0),762,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(301,294,0),762,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(302,294,0),762,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(302,295,0),762,1,1))
    ThroneRoom:bind(1, createitem.createItem(position(303,295,0),762,1,1))

    AddToLevers(elevator1)
    AddToLevers(elevator2)
    AddToLevers(evilrock1)
    AddToLevers(evilrock2)
    AddToLevers(evilrock3)
    AddToLevers(evilrock4)
    AddToLevers(evilrock5)
    AddToLevers(evilrock6)
    AddToLevers(evilrock7)
    AddToLevers(evilrock8)
    AddToLevers(evilrock9)
    AddToLevers(evilrock10)
    AddToLevers(evilrock11)
    AddToLevers(lakeofLife1)
    AddToLevers(lakeofLife2)
    AddToLevers(ThroneRoom)
end

function M.UseItem(user, sourceItem, ltstate)

    if sourceItem:getData("oldSlimeFeeding") == "true" then
        oldSlimeFeeding.useLever(user, sourceItem)
    end
    if sourceItem:getData("volcanoTreasure") == "true" then
        volcano_chest.useLever(user, sourceItem)
    end

    if magicSphere.leverPosCheck(sourceItem) then
        magicSphere.useLever(user, sourceItem)
    end

    magicSphere.peraPuzzle(user, sourceItem)
    magicSphere.qwanPuzzle(user, sourceItem)
    magicSphere.checkForSpider(user, sourceItem)

    local key = sourceItem.pos.x * 1024 * 1024 + sourceItem.pos.y * 1024 + sourceItem.pos.z
    if leverList[key] ~= nil then
        leverList[key]:switchLever(user)
    end
end

function M.LookAtItem(user, Item)

    return lookat.GenerateLookAt(user, Item, lookat.NONE)
end

return M
