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
local monstermagic = require("monster.base.spells.base")

local M = {}

local poisonImmuneMonsters = {}

function M.setPoisonImmunity(monsterId)
    poisonImmuneMonsters[monsterId] = true
end

local function checkPoisonImmunity(monsterId)
    return poisonImmuneMonsters[monsterId]
end


function M.CharacterOnField(User)

    -- dont harm dead chars anymore
    if (User:increaseAttrib("hitpoints", 0) == 0) then
        return
    end

    -- dont harm NPCs
    if User:getType() == Character.npc then
        return
    end

    -- immune
    if User:getType() == Character.monster and checkPoisonImmunity(User:getMonsterType()) then
        return
    end

    -- Giftwolke auf dem Feld suchen
    -- !!Eventuell gibt es Probleme, wenn sich mehrere Wolken auf einem Feld befinden!!
    local Items = common.GetItemsOnField(User.pos)
    local FieldItem
    for _, item in pairs(Items) do
        if(item.id == 372) then
            FieldItem = item
            break
        end
    end

    if (FieldItem.quality > 100) and User.pos.z ~= 100 and User.pos.z ~= 101 and User.pos.z ~= 40 then --no harmful flames on noobia or the working camp

        local resist = monstermagic.getSpellResistence(User) * 10
        if resist < FieldItem.quality then
            local foundEffect = User.effects:find(112); -- poisoncloud lte
            if not foundEffect then
                local myEffect = LongTimeEffect(112, 50) --5sec
                myEffect:addValue("quality", FieldItem.quality);
                User.effects:addEffect(myEffect)
            end
        else
            DeleteFlame(User, FieldItem);
        end
    else
        DeleteFlame(User, FieldItem);
        User:inform("Die Giftwolke war nur eine Illusion und verpufft.",
                    "The poisoncloud was just an illusion and disappears.")
    end
end

function DeleteFlame(User, FlameItem)
    local field = world:getField(User.pos);
    local count = field:countItems();
    local currentitem;
    local items = { };
    for i=0, count-1 do
        currentitem = world:getItemOnField(User.pos);
        world:erase(currentitem, currentitem.number);
        if(currentitem.id ~= FlameItem.id) then
            table.insert(items, currentitem);
        end
    end
    for i,item in pairs(items) do
        world:createItemFromItem(item, User.pos, true);
    end
end

return M

