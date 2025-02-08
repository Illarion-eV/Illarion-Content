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
-- UPDATE items SET itm_script='item.id_372_poisonfield' where itm_id=372;

local common = require("base.common")
local character = require("base.character")
local traps = require("magic.arcane.traps")
local magicResistance = require("magic.arcane.magicResistance")

local M = {}

local poisonImmuneMonsters = {}

function M.setPoisonImmunity(monsterId)
    poisonImmuneMonsters[monsterId] = true
end

local function checkPoisonImmunity(monsterId)
    return poisonImmuneMonsters[monsterId]
end

local function DeleteFlame(user, flameItem)

    local field = world:getField(user.pos)
    local count = field:countItems()
    local currentitem
    local items = { }

    for i=0, count-1 do
        currentitem = world:getItemOnField(user.pos)
        world:erase(currentitem, currentitem.number)
        if currentitem.id ~= flameItem.id then
            table.insert(items, currentitem)
        end
    end

    for i, item in pairs(items) do
        world:createItemFromItem(item, user.pos, true)
    end

end

function M.CharacterOnField(user)

    local items = common.GetItemsOnField(user.pos)
    local fieldItem

    for _, theItem in pairs(items) do
        if theItem.id == 372 then
            fieldItem = theItem
            break
        end
    end

    if fieldItem:getData("spell") ~= "" then --It is an earth spell trap from arcane magic and not a poison cloud
        traps.triggerEarthTrap(fieldItem, user)
        return
    end

    -- dont harm dead chars anymore
    if (user:increaseAttrib("hitpoints", 0) == 0) then
        return
    end

    -- dont harm NPCs
    if user:getType() == Character.npc then
        return
    end

    -- immune
    if not character.IsPlayer(user) and checkPoisonImmunity(user:getMonsterType()) then
        return
    end

    -- Giftwolke auf dem Feld suchen
    -- !!Eventuell gibt es Probleme, wenn sich mehrere Wolken auf einem Feld befinden!!

    if (fieldItem.quality > 100) and user.pos.z ~= 100 and user.pos.z ~= 101 and user.pos.z ~= 40 then --no harmful flames on noobia or the working camp

        local resist = magicResistance.getMagicResistance(user)
        if resist >= 1 then  --Youd take no damage if you can resist 100% of it
            local foundEffect = user.effects:find(112) -- poisoncloud lte
            if not foundEffect then
                local myEffect = LongTimeEffect(112, 50) --5sec
                myEffect:addValue("quality", fieldItem.quality)
                user.effects:addEffect(myEffect)
            end
        else
            DeleteFlame(user, fieldItem)
        end
    else
        DeleteFlame(user, fieldItem)
        user:inform("Die Giftwolke war nur eine Illusion und verpufft.",
                    "The poisoncloud was just an illusion and disappears.")
    end
end

function M.lookAt(sourceItem)
end

return M
