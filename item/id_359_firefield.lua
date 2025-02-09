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
-- UPDATE items SET itm_script='item.id_359_firefield' where itm_id=359;

local common = require("base.common")
local character = require("base.character")
local magicResistance = require("magic.arcane.magicResistance")

local M = {}

local flameImmuneMonsters = {}

function M.setFlameImmunity(monsterId)
    flameImmuneMonsters[monsterId] = true
end

local function checkFlameImmunity(monsterId)
    return flameImmuneMonsters[monsterId]
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

local golems = {}
golems[301]=true --Stone Golem/Fighter/Plate/Blunt
golems[302]=true --Son of the Mountains/Fighter/Plate/Blunt
golems[303]=true --Clay Golem/Fighter/Plate/Blunt
golems[304]=true --Lava Golem/Fighter/Plate/Blunt
golems[305]=true --Silver Golem/Fighter/Plate/Blunt
golems[306]=true --Diamond Golem/Fighter/Plate/Blunt
golems[561]=true --Iron Golem/Fighter/Plate/Blunt
golems[562]=true --Steel Golem/Fighter/Plate/Blunt
golems[563]=true --Merinium Golem/Fighter/Plate/Blunt
golems[564]=true --Gold Golem/Fighter/Plate/Blunt

function M.CharacterOnField(User)

    -- dont harm dead chars anymore
    if (User:increaseAttrib("hitpoints", 0) == 0) then
        return
    end

    -- dont harm NPCs
    if User:getType() == Character.npc then
        return
    end

    -- Search for the falme on the field
    -- !!There might be some issues with multiple flames on the same field!!
    local Items = common.GetItemsOnField(User.pos)
    local FieldItem

    for _, item in pairs(Items) do
        if(item.id == 359) then
            FieldItem = item
            break
        end
    end

    if not FieldItem then   -- the flame doesn't exist anymore
        return
    end

    -- immune
    if not character.IsPlayer(User) then
        if checkFlameImmunity(User:getMonsterType()) then
            return
        elseif golems[User:getMonsterType()] and FieldItem:getData("meteroitFlame") == "true" then --Golems are immune to special flames
            return
        end
    end


    if (FieldItem.quality > 100) and User.pos.z ~= 40 and FieldItem:getData("illusion") ~= "true" then --no harmful flames in the working camp or if it is a magical illusion

        local resist = magicResistance.getMagicResistance(User)

        if resist < 1.9 then -- high rolled level 80 mobs and 90+ mobs delete flames. Players would need a very high willpower to reach this value if at all.
            local foundEffect = User.effects:find(110); -- firefield lte
            if not foundEffect then
                local myEffect = LongTimeEffect(110, 50) --5sec
                myEffect:addValue("quality", FieldItem.quality);

                local magicPen = FieldItem:getData("magicPenetration")
                if not common.IsNilOrEmpty(magicPen) then
                    magicPen = math.floor(tonumber(magicPen)*100)
                    myEffect:addValue("magicPenetration", magicPen)
                end

                User.effects:addEffect(myEffect)
            end
        else
            DeleteFlame(User, FieldItem)
        end
    else
        DeleteFlame(User, FieldItem);
        User:inform("Die Feuerflamme war nur eine Illusion und verpufft.",
                    "The fireflame was just an illusion and disappears.")
    end
end

return M
