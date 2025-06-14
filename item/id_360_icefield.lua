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
-- UPDATE items SET itm_script='item.id_360_icefield' where itm_id=360;

local common = require("base.common")
local character = require("base.character")
local magicResistance = require("magic.arcane.magicResistance")

local M = {}

local iceImmuneMonsters = {}

function M.setIceImmunity(monsterId)
    iceImmuneMonsters[monsterId] = true
end

local function checkIceImmunity(monsterId)
    return iceImmuneMonsters[monsterId]
end

local function DeleteFlame(User, FlameItem)
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
    if not character.IsPlayer(User) and checkIceImmunity(User:getMonsterType()) then
        return
    end

    -- Eisflamme auf dem Feld suchen
    -- !!Eventuell gibt es Probleme, wenn sich mehrere Flammen auf einem Feld befinden!!
    local Items = common.GetItemsOnField(User.pos)
    local FieldItem
    for _, item in pairs(Items) do
        if(item.id == 360) then
            FieldItem = item
            break
        end
    end

    if (FieldItem.quality > 100) and User.pos.z ~= 100 and User.pos.z ~= 101 and User.pos.z ~= 40 then --no harmful flames on noobia or the working camp

        local resist = magicResistance.getMagicResistance(User)
        if resist < 1.9 then -- high rolled level 80 mobs and 90+ mobs delete flames. Players would need a very high willpower to reach this value if at all.
            local foundEffect = User.effects:find(111); -- iceflame lte
            if not foundEffect then
                local myEffect = LongTimeEffect(111, 50) --5sec
                local scaling = FieldItem:getData("scaling")

                if common.IsNilOrEmpty(scaling) then
                    scaling = math.floor(FieldItem.quality/100)+1
                end

                myEffect:addValue("quality", tonumber(scaling))

                local magicPen = FieldItem:getData("magicPenetration")
                if not common.IsNilOrEmpty(magicPen) then
                    magicPen = math.floor(tonumber(magicPen*100))
                    myEffect:addValue("magicPenetration", magicPen)
                end

                User.effects:addEffect(myEffect)
            end
        else
            DeleteFlame(User, FieldItem)
        end
    else
        DeleteFlame(User, FieldItem);
        User:inform("Die Eisflamme war nur eine Illusion und verpufft.",
                    "The iceflame was just an illusion and disappears.");
    end
end

return M


