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

local common = require("base.common")
local lookat = require("base.lookat")
local licence = require("base.licence")
local granorsHut = require("content.granorsHut")
local alchemy = require("alchemy.base.alchemy")
local emptyBottle = require("item.id_164_emptybottle")

local M = {}

function M.UseItem(user, SourceItem, ltstate)

    local cauldron = alchemy.GetCauldronInfront(user)

    if not cauldron then
        user:inform("Du brauchst einen Kessel vor dir, wenn du damit etwas anfangen willst.", "You'll need a cauldron in front of you if you want to do anything with this.")
        return
    end

    if cauldron:getData("granorsHut") ~= "" then
        granorsHut.fillingFromCauldron(user, ltstate)
        return
    end

    if licence.licence(user) then --checks if user is citizen or has a licence
        return -- avoids crafting if user is neither citizen nor has a licence
    end

    if not emptyBottle.CheckWaterEmpty(user, SourceItem, cauldron) then
        return
    end

    if not alchemy.checkFood(user) then
        return
    end

    if ( ltstate == Action.abort ) then
        common.InformNLS(user, "Du brichst deine Arbeit ab.", "You abort your work.")
        return
    end

    if (ltstate == Action.none) then
        user:startAction(20,21,5,15,25);
        return
    end

    M.FillIntoJar(user, SourceItem, cauldron)
    alchemy.lowerFood(user)
end

function M.FillIntoJar(user, sourceItem, cauldron)

    if (cauldron:getData("filledWith") == "stock") or (cauldron:getData("filledWith") == "essenceBrew") or (cauldron:getData("filledWith") == "potion") then
        user:inform("Die Flüssigkeit im Kessel ist viel zu dünn. Du brauchst hier eine leere Zaubertrankflasche, keinen Salbentiegel!", "The liquid in the cauldron is far too thin. You'll need an empty potion bottle here, not a salve jar!")
        return
    end

    if cauldron:getData("filledWith") == "salve" then
        if sourceItem.number > 1 then -- stack!
            local data = {}
            data.potionEffectId = cauldron:getData("potionEffectId")
            data.filledWith = "salve"
            data.creator = user.name
            common.CreateItem(user, 3643, 1, tonumber(cauldron:getData("potionQuality")), data)
            world:erase(sourceItem, 1)
        else
            sourceItem.id = 3643
            alchemy.FillFromTo(cauldron, sourceItem)
            world:changeItem(sourceItem)
        end
        alchemy.RemoveAll(cauldron)
    end
    world:changeItem(cauldron)
    world:makeSound(10,cauldron.pos)
end

function M.LookAtItem(user,Item)
    return lookat.GenerateLookAt(user, Item, 0)
end

return M
