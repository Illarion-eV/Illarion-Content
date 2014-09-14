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

require("base.common")

module("item.id_359_firefield", package.seeall)

function CharacterOnField(User)

    -- dont harm dead chars anymore
    if (User:increaseAttrib("hitpoints", 0) == 0) then
        return
    end

    -- dont harm NPCs
    if User:getType() == Character.npc then
        return
    end

    -- immune
    if User:getType() == Character.monster then
        if User:getMonsterType() == 651 then -- undead firedragon
            return
        end
    end

    -- Flamme auf dem Feld suchen
    -- !!Eventuell gibt es Probleme, wenn sich mehrere Flammen auf einem Feld befinden!!
    local Items = base.common.GetItemsOnField(User.pos)
    local FieldItem

    for _, item in pairs(Items) do
        if(item.id == 359) then
            FieldItem = item
            break
        end
    end

    if (FieldItem.quality > 100) and User.pos.z ~= 100 and User.pos.z ~= 101 and User.pos.z ~= 40 then --no harmful flames on noobia or the working camp

        local resist = SpellResistence(User)
        if (resist < FieldItem.quality * 2) then   -- Qualität des Items --> Stärke mit Magie Resistenz vergleichen
            local damageLow = (3/100) * math.floor((math.max(10, FieldItem.quality - resist)) * 100)
            local damageHigh = (5/100) * math.floor((math.max(FieldItem.quality - resist)) * 100)
            local damageDealt = math.random(math.min(damageLow, damageHigh), math.max(damageLow, damageHigh))
            User:increaseAttrib("hitpoints", -damageDealt);

            User:inform("Du fühlst, wie das glühend heiße Feuer allmählich deine Haut verbrennt.",
                        "You feel the scorching fire gradually burn your skin.")
        else
            DeleteFlame(User, FieldItem)
        end
    else
        DeleteFlame(User, FieldItem);
        User:inform("Die Feuerflamme war nur eine Illusion und verpufft.",
                    "The fireflame was just an illusion and disappears.")
    end
end

function SpellResistence(TargetChar)
    local TInt=TargetChar:increaseAttrib("intelligence",0);
    local TEss=TargetChar:increaseAttrib("essence",0);
    local TSkill=TargetChar:getSkill(Character.magicResistance);
    local ResTry=(((TSkill*2)+(TEss*2)+TInt)/300)*999;
    return math.max(0,math.min(999,math.floor(ResTry*(math.random(8,12)/10))))
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
