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

local crafts = require("craft.base.crafts")
local shared = require("magic.nature.shared")

local M = {}

local staffList = {Item.noviceCorStaff, Item.corStaff, Item.bloomCorStaff, Item.deepCorStaff, Item.wildCorStaff, Item.witherCorStaff, Item.stoneCorStaff}

local product
local catId

local deepweaving = crafts.Craft:new{
                      craftEN = "Deepweaving",
                      craftDE = "Tiefenweben",
                      handTool = staffList,
                      leadSkill = Character.deepweave,
                      sfx = 0,
                      sfxDuration = 0,
                    }

deepweaving:addTool(Item.deepweaversStump)

local deepweaveSigils = {
    {tier = 1, ingredients = {{id = Item.blankSigil, amount = 1}, {id = Item.bulbspongeMushroom, amount = 10}}, id = Item.basicDeepweaveSigil, name = {english = "Basic Deepweave Sigil", german = "Einfache Tiefenweb-Siegel"}}
}

catId = deepweaving:addCategory("Sigils", "Siegel")

for _, sigil in pairs(deepweaveSigils) do
    product = deepweaving:addProduct(catId, sigil.id, 1, {sigilTier = sigil.tier, nameEn = sigil.name.english, nameDe = sigil.name.german})
    for _, ingredient in pairs(sigil.ingredients) do
        product:addIngredient(ingredient.id, ingredient.amount)
    end
end

local bloomweaving = crafts.Craft:new{
                      craftEN = "Bloomweaving",
                      craftDE = "Blühweben",
                      handTool = staffList,
                      leadSkill = Character.bloomweave,
                      sfx = 0,
                      sfxDuration = 0,
                    }

bloomweaving:addTool(Item.bloomweaversStump)

local bloomweaveSigils = {
    {tier = 1, ingredients = {{id = Item.blankSigil, amount = 1}, {id = Item.fourleafedOneberry, amount = 10}}, id = Item.basicBloomweaveSigil, name = {english = "Basic Bloomweave Sigil", german = "Einfache Blütenweb-Siegel"}}
}

catId = bloomweaving:addCategory("Sigils", "Siegel")

for _, sigil in pairs(bloomweaveSigils) do
    product = bloomweaving:addProduct(catId, sigil.id, 1, {sigilTier = sigil.tier, nameEn = sigil.name.english, nameDe = sigil.name.german})
    for _, ingredient in pairs(sigil.ingredients) do
        product:addIngredient(ingredient.id, ingredient.amount)
    end
end

local stoneweaving = crafts.Craft:new{
                      craftEN = "Stoneweaving",
                      craftDE = "Steinweben",
                      handTool = staffList,
                      leadSkill = Character.stoneweave,
                      sfx = 0,
                      sfxDuration = 0,
                    }

stoneweaving:addTool(Item.stoneweaversStump)

local stoneweaveSigils = {
    {tier = 1, ingredients = {{id = Item.blankSigil, amount = 1}, {id = Item.rottenTreeBark, amount = 10}}, id = Item.basicStoneweaveSigil, name = {english = "Basic Stoneweave Sigil", german = "Einfache Steinweb-Siegel"}}
}

catId = stoneweaving:addCategory("Sigils", "Siegel")

for _, sigil in pairs(stoneweaveSigils) do
    product = stoneweaving:addProduct(catId, sigil.id, 1, {sigilTier = sigil.tier, nameEn = sigil.name.english, nameDe = sigil.name.german})
    for _, ingredient in pairs(sigil.ingredients) do
        product:addIngredient(ingredient.id, ingredient.amount)
    end
end

local wildweaving = crafts.Craft:new{
                      craftEN = "Wildweaving",
                      craftDE = "Wildeweben",
                      handTool = staffList,
                      leadSkill = Character.wildweave,
                      sfx = 0,
                      sfxDuration = 0,
                    }

wildweaving:addTool(Item.wildweaversStump)

local wildweaveSigils = {
    {tier = 1, ingredients = {{id = Item.blankSigil, amount = 1}, {id = Item.firTreeSprout, amount = 10}}, id = Item.basicWildweaveSigil, name = {english = "Basic Wildweave Sigil", german = "Einfache Wildeweb-Siegel"}}
}

catId = wildweaving:addCategory("Sigils", "Siegel")

for _, sigil in pairs(wildweaveSigils) do
    product = wildweaving:addProduct(catId, sigil.id, 1, {sigilTier = sigil.tier, nameEn = sigil.name.english, nameDe = sigil.name.german})
    for _, ingredient in pairs(sigil.ingredients) do
        product:addIngredient(ingredient.id, ingredient.amount)
    end
end

local witherweaving = crafts.Craft:new{
                      craftEN = "Witherweaving",
                      craftDE = "Welkenweben",
                      handTool = staffList,
                      leadSkill = Character.witherweave,
                      sfx = 0,
                      sfxDuration = 0,
                    }

witherweaving:addTool(Item.witherweaversStump)

local witherweaveSigils = {
    {tier = 1, ingredients = {{id = Item.blankSigil, amount = 1}, {id = Item.marshFlower, amount = 10}}, id = Item.basicWitherweaveSigil, name = {english = "Basic Witherweave Sigil", german = "Einfache Welkweb-Siegel"}}
}

catId = witherweaving:addCategory("Sigils", "Siegel")

for _, sigil in pairs(witherweaveSigils) do
    product = witherweaving:addProduct(catId, sigil.id, 1, {sigilTier = sigil.tier, nameEn = sigil.name.english, nameDe = sigil.name.german})
    for _, ingredient in pairs(sigil.ingredients) do
        product:addIngredient(ingredient.id, ingredient.amount)
    end
end

local stumps = {
    {stump = Item.deepweaversStump, script = deepweaving, quest = 695},
    {stump = Item.bloomweaversStump, script = bloomweaving, quest = 693},
    {stump = Item.stoneweaversStump, script = stoneweaving, quest = 697},
    {stump = Item.wildweaversStump, script = wildweaving, quest = 696},
    {stump = Item.witherweaversStump, script = witherweaving, quest = 694}
}

M.stumps = stumps

function M.UseItem(user, sourceItem, ltstate)

    if not shared.isDruid(user) then
        return
    end

    for _, weave in pairs(stumps) do
        if sourceItem.id == weave.stump then

            if user:getQuestProgress(weave.quest) == 5 then
                user:setQuestProgress(weave.quest, 6)
            end

            if user:getQuestProgress(weave.quest) >= 5 then
                weave.script:showDialog(user, sourceItem)
            else
                user:inform("Du weißt im Moment nicht, was du mit diesem Baumstumpf anfangen sollst, obwohl du den leisen Verdacht hast, dass du es mit dem richtigen Wissen können wirst. Versuche, Fianna in Troll's Haven aufzusuchen, um Rat zu erhalten.", "You do not presently know what to do with this stump, even though you have the sneaking suspicion you will be able to with the correct knowledge. Try seeking out Fianna in Troll's Haven for guidance.")
            end

            return
        end
    end
end

return M
