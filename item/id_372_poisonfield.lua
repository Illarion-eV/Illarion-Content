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

function M.GMexclusion(user) -- For the purpose of both avoiding accidental deletion of traps with GM chara and easy clean up

    local questStatus = user:getQuestProgress(247)

    if user:isAdmin() and questStatus == 0 then
        return true
    end

    if not user:isAdmin() and questStatus == 1 then -- if for some reason a non admin should be immune to traps
        return true
    end


    return false

end

function M.CharacterOnField(user)

    if M.GMexclusion(user) then
        return
    end

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
        if resist < 1.9 then -- high rolled level 80 mobs and 90+ mobs delete flames. Players would need a very high willpower to reach this value if at all.
            local foundEffect = user.effects:find(112) -- poisoncloud lte
            if not foundEffect then
                local myEffect = LongTimeEffect(112, 50) --5sec
                local scaling = fieldItem:getData("scaling")

                if common.IsNilOrEmpty(scaling) then
                    scaling = math.floor(fieldItem.quality/100)+1
                end

                myEffect:addValue("quality", tonumber(scaling))

                local magicPen = fieldItem:getData("magicPenetration")
                if not common.IsNilOrEmpty(magicPen) then
                    magicPen = math.floor(tonumber(magicPen)*100)
                    myEffect:addValue("magicPenetration", magicPen)
                end

                local spell = fieldItem:getData("spell")
                if not common.IsNilOrEmpty(spell) then
                    spell = tonumber(spell)
                    myEffect:addValue("spell", spell)
                end

                local wandGemBonus = fieldItem:getData("wandGemBonus")

                if not common.IsNilOrEmpty(wandGemBonus) then
                    myEffect:addValue("wandGemBonus", tonumber(wandGemBonus))
                end

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
