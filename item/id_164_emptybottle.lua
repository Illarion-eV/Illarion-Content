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

        M.FillIntoBottle(user, SourceItem, cauldron)
        alchemy.lowerFood(user)
    end

    -- The Glutinous Tree
    local frontItem = common.GetFrontItem(user)
    if frontItem and frontItem.id == 589 and frontItem.pos == position(376,288,0) then
        GetSlimeFromTree(user, SourceItem, ltstate)
    end
end

function M.FillIntoBottle(user, SourceItem, cauldron)

    if cauldron:getData("filledWith") == "salve" then
        user:inform("GERMAN TRANSLATION", "The liquid in the cauldron is way too thick. You'll need an empty salve jar here, not a potion bottle.")
        return
    end

    -- stock, essence brew or potion; fill it up
   if (cauldron:getData("filledWith") == "stock") or (cauldron:getData("filledWith") == "essenceBrew") or (cauldron:getData("filledWith") == "potion") then
        local _, _, _, reBottle = alchemy.GemDustBottleCauldron(nil, nil, cauldron.id, nil, user)
        if SourceItem.number > 1 then -- stack!
            if cauldron:getData("filledWith") == "stock" then
                local data = {}
                data.AdrazinConcentration=cauldron:getData("AdrazinConcentration")
                data.IllidriumConcentration=cauldron:getData("IllidriumConcentration")
                data.CaprazinConcentration=cauldron:getData("CaprazinConcentration")
                data.HyperboreliumConcentration=cauldron:getData("HyperboreliumConcentration")
                data.EcholonConcentration=cauldron:getData("EcholonConcentration")
                data.DracolinConcentration=cauldron:getData("DracolinConcentration")
                data.OrcanolConcentration=cauldron:getData("OrcanolConcentration")
                data.FenolinConcentration=cauldron:getData("FenolinConcentration")
                data.filledWith="stock"
                common.CreateItem(user, reBottle, 1, 333, data)

            elseif cauldron:getData("filledWith") == "essenceBrew" then
                local data = {}
                data.essenceHerb1=cauldron:getData("essenceHerb1")
                data.essenceHerb2=cauldron:getData("essenceHerb2")
                data.essenceHerb3=cauldron:getData("essenceHerb3")
                data.essenceHerb4=cauldron:getData("essenceHerb4")
                data.essenceHerb5=cauldron:getData("essenceHerb5")
                data.essenceHerb6=cauldron:getData("essenceHerb6")
                data.essenceHerb7=cauldron:getData("essenceHerb7")
                data.essenceHerb8=cauldron:getData("essenceHerb8")
                data.filledWith="essenceBrew"
                common.CreateItem(user, reBottle, 1, 333, data)

            elseif cauldron:getData("filledWith") == "potion" then
                    local data = {}
                    data.potionEffectId=cauldron:getData("potionEffectId")
                    data.filledWith="potion"
                    data.creator=user.name
                    common.CreateItem(user, reBottle, 1, tonumber(cauldron:getData("potionQuality")), data)
            end
            world:erase(SourceItem,1)
        else
            SourceItem.id = reBottle
            alchemy.FillFromTo(cauldron,SourceItem)
            world:changeItem(SourceItem)
        end
        alchemy.RemoveAll(cauldron)
    end
    world:changeItem(cauldron)
    world:makeSound(10,cauldron.pos)
end

return M
