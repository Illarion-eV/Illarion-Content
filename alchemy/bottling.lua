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

-- UPDATE items SET itm_script='item.id_164_emptybottle' WHERE itm_id IN (164);

local common = require("base.common")
local alchemy = require("alchemy.base.alchemy")
local licence = require("base.licence")
local granorsHut = require("content.granorsHut")

local M = {}

function M.CheckWaterEmpty(user, SourceItem, cauldron)

    if (cauldron:getData("filledWith") == "water") then -- water belongs into a bucket, not a potion bottle!
    common.InformNLS( user,
        "Es ist zu viel Wasser im Kessel, als dass es in die Flaschen passen würde. Ein Eimer wäre hilfreicher.",
        "There is too much water in the cauldron to bottle it. Better use a bucket.")
    return nil ;
    -- no stock, no potion, not essence brew -> nothing we could fil into the bottle
    elseif cauldron:getData("filledWith") == "" then
        common.InformNLS( user,
            "Es befindet sich nichts zum Abfüllen im Kessel.",
            "There is nothing to be bottled in the cauldron.")
        return nil;
    end
    return true
end

local function GetSlimeFromTree(user, SourceItem, ltstate)

    if ( ltstate == Action.abort ) then
        return
    end

    if (ltstate == Action.none) then
        user:startAction(50,21,5,0,0);
        return
    end

    if SourceItem.number > 1 then
        local data = {}
        data.filledWith="meraldilised slime"
        common.CreateItem(user, 327, 1, 333, data)
        user:eraseItem(SourceItem.id, 1)
    else
        SourceItem.id = 327
        SourceItem:setData("filledWith","meraldilised slime")
        world:changeItem(SourceItem)
    end
end

function M.UseItem(user, SourceItem, ltstate)

    -- alchemy
    -- infront of a cauldron?
    local cauldron = alchemy.GetCauldronInfront(user)
    if cauldron then

        if cauldron:getData("granorsHut") ~= "" then
            granorsHut.fillingFromCauldron(user, ltstate)
            return
        end

        if licence.licence(user) then --checks if user is citizen or has a licence
            return -- avoids crafting if user is neither citizen nor has a licence
        end

        if not M.CheckWaterEmpty(user, SourceItem, cauldron) then
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

        local brewResult = M.FillIntoBottle(user, SourceItem, cauldron)

        if brewResult.wrongBottle then
            user:inform("Das ist die falsche Art von Flasche für diese Art von Flüssigkeit. Du brauchst eine Flasche vom Typ "..brewResult.wrongBottle.german..".", "That's the wrong type of bottle for this kind of liquid. You need a "..brewResult.wrongBottle.english..".")
        end

        alchemy.lowerFood(user)
    end

    -- The Glutinous Tree
    local frontItem = common.GetFrontItem(user)
    if frontItem and frontItem.id == 589 and frontItem.pos == position(376,288,0) then
        GetSlimeFromTree(user, SourceItem, ltstate)
    end
end

function M.FillIntoBottle(user, sourceItem, cauldron)

    local result = {}
    result.ilynApplied = false

    local _, _, _, reBottle = alchemy.GemDustBottleCauldron(cauldron.id, sourceItem.id)

    local filledWith = cauldron:getData("filledWith")

    if filledWith == "stock" or filledWith == "essenceBrew" and sourceItem.id ~= Item.emptyPotion then
        local commonItem =  world:getItemStatsFromId(Item.emptyPotion)
        result.wrongBottle = {english = commonItem.English, german = commonItem.German}
        return result
    end

    local data = {}
    if filledWith == "stock" then
        local substances = {"Adrazin", "Illidrium", "Caprazin", "Hyperborelium", "Echolon", "Dracolin", "Orcanol", "Fenolin"}
        for _, substance in pairs(substances) do
            data[substance.."Concentration"] = cauldron:getData(substance.."Concentration")
        end
        data.filledWith="stock"
    elseif filledWith == "essenceBrew" then
        for i = 1, 8 do
            data["essenceHerb"..i] = cauldron:getData("essenceHerb"..i)
        end
        data.filledWith="essenceBrew"
    elseif filledWith == "potion" then
        data.potionEffectId = cauldron:getData("potionEffectId")
        local requiredId = alchemy.isBombOrSalve(tonumber(data.potionEffectId))
        if requiredId and sourceItem.id ~= requiredId then
            local commonItem =  world:getItemStatsFromId(requiredId)
            result.wrongBottle = {english = commonItem.English, german = commonItem.German}
            return result
        end
        data.filledWith="potion"
        data.creator=user.name
    end

    if sourceItem.number > 1 then
        common.CreateItem(user, reBottle, 1, tonumber(cauldron:getData("potionQuality")) or 333, data)
        world:erase(sourceItem,1)
    else
        sourceItem.id = reBottle
        alchemy.FillFromTo(cauldron,sourceItem)
        world:changeItem(sourceItem)
    end

    if cauldron:getData("ilyn") == "true" then -- In order to duplicate the potion, we have there be enough liquid in the cauldron for two potions
        result.ilynApplied = true
        cauldron:setData("ilyn", "false")
    else
        alchemy.RemoveAll(cauldron)
    end

    world:changeItem(cauldron)
    world:makeSound(10,cauldron.pos)
    return result
end

return M
