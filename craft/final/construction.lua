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
local itemList = require("craft.base.itemList")
local propertyList = require("base.propertyList")

local M = {}
local product
local catId

local function addIngredients(User, item, tile)
    if item then
        for i = 1,4 do
            if item["ingredient"..i] then
                product:addIngredient(item["ingredient"..i], item["ingredient"..i.."Amount"])
                if item["ingredient"..i] == 52 then -- Water bucket
                    product:addRemnant(51, 1) -- bucket
                end
            end
        end
    elseif tile then
        for i = 1,4 do
            if tile["ingredient"..i] then
                product:addIngredient(tile["ingredient"..i], tile["ingredient"..i.."Amount"])
            end
        end
    end
end

local function addProducts(craft, category, User, item, tile)
    if item then
        if item.category == category.categoryEn and item.skill == craft then
            if item.typeOf == "Estate" then
                if propertyList.checkIfEstate(User) then
                    product = M[tostring(category)..craft]:addProduct(catId, item.itemId, 1, {}, true)
                    addIngredients(User, item, nil)
                end
            else
                product = M[tostring(category)..craft]:addProduct(catId, item.itemId, 1, {}, true)
                addIngredients(User, item, nil)
            end
        end
    elseif tile then
        if tile.category == category.categoryEn and tile.skill == craft then
            if tile.typeOf == "Estate" then
                if propertyList.checkIfEstate(User) then
                    product = M[tostring(category)..craft]:addProduct(catId, tile.tileId, 1, {}, true, true)
                    addIngredients(User, product, nil, tile)
                end
            else
                product = M[tostring(category)..craft]:addProduct(catId, tile.tileId, 1, {}, true, true)
                addIngredients(User, product, nil, tile)
            end
        end
    end
end

local function addItems(cat, craft, isTile, User)
    for _, category in ipairs(itemList.categories) do
        if category.categoryEn == cat and not isTile then
            catId = M[tostring(category)..craft]:addCategory(category.categoryEn, category.categoryDe)
            for _, item in ipairs(itemList.items) do
                addProducts(craft, category, User, item, nil)
            end
        elseif category.categoryEn == cat then
            catId = M[tostring(category)..craft]:addCategory(category.categoryEn, category.categoryDe)
            for _, tile in ipairs(itemList.tiles) do
                addProducts(craft, category, User, nil, tile)
            end
        end
    end
end
local function createCategory(cat, craft, sfxNumber, sfxDur, isTile, User)
local checkIfNoSkill = true
local skill = 0
    if craft ~= "misc" then
        checkIfNoSkill = false
        skill = Character[craft]
    end
    for _, category in ipairs(itemList.categories) do
        if category.categoryEn == cat then
            M[tostring(category)..craft] = crafts.Craft:new{
                            craftEN = cat,
                            craftDE = category.categoryDe,
                            handTool = 2697,
                            leadSkill = skill,
                            npcCraft = checkIfNoSkill,
                            sfx = sfxNumber,
                            sfxDuration = sfxDur,
                            houseCraft = checkIfNoSkill
                            }
            addItems(cat, craft, isTile, User)
        end
    end
end
function M.makeAllCategories(User)
local sfx
    for _, item in ipairs(itemList.items) do
        for _, category in ipairs(itemList.categories) do
            if item.category == category.categoryEn then
                if not M[tostring(category)..item.skill] then
                    for _, skill in ipairs(itemList.skills) do
                        if item.skill == skill.name then
                            sfx = skill.sfx
                        end
                    end
                    createCategory(item.category, item.skill, sfx, 25, false, User)
                end
            end
        end
    end
    for _, tile in ipairs(itemList.tiles) do
        for _, category in ipairs(itemList.categories) do
            if tile.category == category.categoryEn then
                if not M[tostring(category)..tile.skill] then
                    for _, skill in ipairs(itemList.skills) do
                        if tile.skill == skill.name then
                            sfx = skill.sfx
                        end
                    end
                    createCategory(tile.category, tile.skill, sfx, 25, true, User)
                end
            end
        end
    end
end
return M
