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

-- UPDATE items SET itm_script='item.id_3077_silvercoins' WHERE itm_id IN (3077);

local common = require("base.common")
local lookat = require("base.lookat")
local goldenGoblet = require("item.id_224_goldengoblet")
local createitem = require("handler.createitem")

local M = {}

local TimeList = {}

function M.LookAtItem(User, Item)
    if Item.number == 1 then
        lookat.SetSpecialDescription(Item, "Eine einzelne Münze", "A single coin")
    else
        lookat.SetSpecialDescription(Item, "Eine Sammlung aus " .. Item.number .. " Münzen", "A collection of " .. Item.number .. " coins")
    end
    return lookat.GenerateLookAt(User, Item, lookat.NONE)
end

function M.UseItem(User, SourceItem)

    if goldenGoblet.putCoinsInGoblet(User, SourceItem) then
        return
    end

    local frontItem = common.GetFrontItem(User)
    if frontItem then
        if frontItem.id == 2805 and frontItem.pos == position(386, 260, -6) then --if frontItem is quest pillar
            if User:getQuestProgress(170) == 0 then
                User:setQuestProgress (170, 1)
                User:inform('Die Münze fällt durch den Schlitz und mit einem metallischen Klicken öffnet sich eine versteckte Klappe in der Säule, aus der ein Schild fällt.', 'The coin falls into the slit and with a metallic click a hidden hatch opens and a shield drops out.')
                world:erase(SourceItem, 1)
                local data = {}
                data.descriptionDe = "Geweihter Schild Ronagans"
                data.descriptionEn = "Blessed Shield of Ronagan"
                common.CreateItem(User, 17, 1, 799, data)
            else
                User:inform('Die Münze verschwindet im Schlitz, aber nichts passiert.', 'The coin disappears but nothing happens.')
                world:erase(SourceItem, 1)
            end
        elseif frontItem.id == 2805 and frontItem.pos == position(370, 473, 1) then--if frontItem is quest pillar for entrance to Dragorog Dungeon
            if User:getQuestProgress(515) == 1 and (world:getItemOnField(position(373, 477, 1)).id ~= 603) then
                User:setQuestProgress (515, 2)
                User:inform('Als die Münze in der Säule verschwindet spürst du etwas in deinen Finger stechen. Das schmerzt! Teile Aelfinn mit, dass du den Eingang gefunden hast.', 'As the coin disappears into the column you feel something pierce your finger. That hurt! Tell Aelfinn you found the entrance.')
                world:erase(SourceItem, 1)
                world:gfx(13,User.pos)
                world:makeSound(31,User.pos)
                User:increaseAttrib("hitpoints",-1000)
                world:createItemFromId(606, 1,position(371,477,1), true, 333, nil) --bridge
                world:createItemFromId(603, 1,position(372,477,1), true, 333, nil) --bridge
                world:createItemFromId(603, 1,position(373,477,1), true, 333, nil) --bridge
                world:createItemFromId(603, 1,position(374,477,1), true, 333, nil) --bridge
                world:createItemFromId(601, 1,position(375,477,1), true, 333, nil) --bridge
            elseif User:getQuestProgress(515) == 1 and (world:getItemOnField(position(373, 477, 1)).id == 603) then
                User:setQuestProgress (515, 2)
                User:inform('Als die Münze in der Säule verschwindet spürst du etwas in deinen Finger stechen. Das schmerzt! Teile Aelfinn mit, dass du den Eingang gefunden hast.', 'As the coin disappears into the column you feel something pierce your finger. That hurt! Tell Aelfinn you found the entrance.')
                world:erase(SourceItem, 1)
                world:gfx(13,User.pos)
                world:makeSound(31,User.pos)
            elseif (world:getItemOnField(position(373, 477, 1)).id ~= 603) then
                User:inform('Als die Münze in der Säule verschwindet spürst du etwas in deinen Finger stechen. Das schmerzt!', 'As the coin disappears into the column you feel something pierce your finger. That hurt!')
                world:erase(SourceItem, 1)
                world:gfx(13,User.pos)
                world:makeSound(31,User.pos)
                User:increaseAttrib("hitpoints",-1000)
                world:createItemFromId(606, 1,position(371,477,1), true, 333, nil) --bridge
                world:createItemFromId(603, 1,position(372,477,1), true, 333, nil) --bridge
                world:createItemFromId(603, 1,position(373,477,1), true, 333, nil) --bridge
                world:createItemFromId(603, 1,position(374,477,1), true, 333, nil) --bridge
                world:createItemFromId(601, 1,position(375,477,1), true, 333, nil) --bridge
            elseif (world:getItemOnField(position(373, 477, 1)).id == 603) then
                User:inform('Als die Münze in der Säule verschwindet spürst du etwas in deinen Finger stechen. Das schmerzt und die Brücke ist bereits da!', 'As the coin disappears into the column you feel something pierce your finger. That hurt and the bridge is already there!')
                world:erase(SourceItem, 1)
                world:gfx(13,User.pos)
                world:makeSound(31,User.pos)
                User:increaseAttrib("hitpoints",-1000)
            end
        elseif frontItem.id == 2805 and frontItem.pos == position(375, 479, 1) then--if frontItem is quest pillar for entrance to Dragorog Dungeon
            if (world:getItemOnField(position(373, 477, 1)).id ~= 603) then
                User:inform('Als die Münze in der Säule verschwindet spürst du etwas in deinen Finger stechen. Das schmerzt!', 'As the coin disappears into the column you feel something pierce your finger. That hurt!')
                world:erase(SourceItem, 1)
                world:gfx(13,User.pos)
                world:makeSound(31,User.pos)
                User:increaseAttrib("hitpoints",-1000)
                world:createItemFromId(606, 1,position(371,477,1), true, 333, nil) --bridge
                world:createItemFromId(603, 1,position(372,477,1), true, 333, nil) --bridge
                world:createItemFromId(603, 1,position(373,477,1), true, 333, nil) --bridge
                world:createItemFromId(603, 1,position(374,477,1), true, 333, nil) --bridge
                world:createItemFromId(601, 1,position(375,477,1), true, 333, nil) --bridge
            elseif (world:getItemOnField(position(373, 477, 1)).id == 603) then
                User:inform('Als die Münze in der Säule verschwindet spürst du etwas in deinen Finger stechen. Das schmerzt und die Brücke ist bereits da!', 'As the coin disappears into the column you feel something pierce your finger. That hurt and the bridge is already there!')
                world:erase(SourceItem, 1)
                world:gfx(13,User.pos)
                world:makeSound(31,User.pos)
                User:increaseAttrib("hitpoints",-1000)
            end
        return;
    end
end

    if common.spamProtect(User, 5) then
        return
    end

    if math.random(2) == 1 then
        User:talk(Character.say, "#me wirft eine Münze in die Luft und fängt sie wieder auf. Sie zeigt Kopf.", "#me throws a coin in the air and catches it again. It shows head.")
    else
        User:talk(Character.say, "#me wirft eine Münze in die Luft und fängt sie wieder auf. Sie zeigt Zahl.", "#me throws a coin in the air and catches it again. It shows tail.")
    end
end

return M
