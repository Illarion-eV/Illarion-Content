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

-- UPDATE items SET itm_script='item.drinks' WHERE itm_id IN (2189, 2188, 2187, 2186, 2059, 2058, 2057, 2056, 1910, 1909, 1907, 1906, 1861, 2502, 1841, 1842, 1843, 1844, 1853, 1854, 1855, 1856, 1857, 1859, 1860, 517, 1315, 1316, 1318,1319,1320,1321,1322,1323,3720,3721,3722);

local common = require("base.common")
local lookat = require("base.lookat")

local M = {}

-- item ID,  food value,  leftover item, alcohol strength
M.drinkList = {}
M.drinkList[2502] = {  800, 2498,   0} -- bottle with sheep milk
M.drinkList[1841] = {  100, 1840,   0} -- goblet with water
M.drinkList[1842] = {  800, 1840,  15} -- goblet with wine
M.drinkList[1843] = { 1000, 1840,  10} -- goblet with mead
M.drinkList[1844] = {  800, 1840,  20} -- goblet with cider
M.drinkList[1853] = { 1000, 1858,  10} -- goblet with mead
M.drinkList[1854] = {  100,  224,   0} -- goblet with water
M.drinkList[1855] = {  100, 1858,   0} -- goblet with water
M.drinkList[1856] = { 1000,  224,  10} -- goblet with mead
M.drinkList[1857] = {  800,  224,  15} -- goblet with wine
M.drinkList[1859] = {  800, 1858,  20} -- goblet with cider
M.drinkList[1860] = {  800, 1858,  15} -- goblet with wine
M.drinkList[1861] = {  800,  224,  20} -- goblet with cider
M.drinkList[1906] = {  200, 1908,  10} -- beer mug
M.drinkList[1907] = {  200, 1910,  10} -- beer mug
M.drinkList[1909] = {  200, 1907,  10} -- beer mug
M.drinkList[1910] = {  200, 1906,  10} -- beer mug
M.drinkList[2056] = {  500, 2055,  10} -- goblet with mead
M.drinkList[2057] = {  400, 2055,  15} -- goblet with wine
M.drinkList[2058] = {   50, 2055,   0} -- goblet with water
M.drinkList[2059] = {  400, 2055,  20} -- goblet with cider
M.drinkList[2186] = {  100, 2185,   0} -- mug with water
M.drinkList[2187] = {  800, 2185,  15} -- mug with wine
M.drinkList[2188] = { 1000, 2185,  10} -- mug with mead
M.drinkList[2189] = {  800, 2185,  20} -- mug with cider
M.drinkList[517] = {  400, 518,  35} -- bottle of rum
M.drinkList[1315] = {  400, 1317,  35} -- bottle of berry booze
M.drinkList[1316] = {  400, 1317,  35} -- bottle of bear slayer
M.drinkList[1318] = {  400, 1317,  35} -- bottle of elven wine
M.drinkList[1319] = {  400, 1317,  35} -- bottle of cherry schnapps
M.drinkList[783] = {500, 790, 0} -- bottle of blackberry juice
M.drinkList[784] = {500, 790, 0} -- bottle of tangerine juice
M.drinkList[785] = {500, 790, 0} -- bottle of banana juice
M.drinkList[786] = {500, 790, 0} -- bottle of cabbage juice
M.drinkList[787] = {500, 790, 0} -- bottle of virgings weed tea
M.drinkList[788] = {500, 790, 0} -- bottle of carrot juice
M.drinkList[789] = {500, 790, 0} -- bottle of strawberry juice
M.drinkList[791] = {500, 790, 0} -- bottle of grape juice
M.drinkList[3611] =  {500, 790, 0}  -- bottle of orange juice
M.drinkList[1320] = {  400, 1317,  35} -- bottle of stone face
M.drinkList[1321] = {  400, 1317,  35} -- bottle of absinthe
M.drinkList[1322] = {  400, 1317,  35} -- bottle of orange schnapps
M.drinkList[1323] = {  400, 1317,  35} -- bottle of mulled wine
M.drinkList[3720] = {500, 790, 0} -- bottle of fir needle tea
M.drinkList[3721] = {500, 790, 0} -- bottle of green tea
M.drinkList[3722] = {500, 790, 0} -- bottle of druids tea

function M.UseItem(user, SourceItem)


    if user.attackmode then
        common.InformNLS( user, "Du würdest alles verschütten.", "You'd spill everything.")
        return
    end


    -- item should not be static
    if SourceItem.wear == 255 then
        common.HighInformNLS(user,
            "Das kannst du nicht trinken.",
            "You can't drink that.")
        return
    end

    -- Prevent the drinking of quest item  -  Path of the Fox by Brigette Russ
    if SourceItem:getData("descriptionDe") == "Geheimnisvoller Violett Flasche" or SourceItem:getData("descriptionEn") == "Mysterious Violet Bottle" then
         common.HighInformNLS(user,
            "Das kannst du nicht trinken.",
            "You can't drink that.")
        return
    end

    local food = M.drinkList[SourceItem.id]
    if (food == nil) then
        user:inform("Unknown drinking Item: ID"..SourceItem.id.." Please Report this to a developer.")
        return
    end

    local customInformEN = SourceItem:getData("customInformEN")
    local customInformDE = SourceItem:getData("customInformDE")
    if customInformEN ~= "" and customInformDE ~= "" then
        common.InformNLS( user, customInformDE, customInformEN)
    end

    local foodLevel = user:increaseAttrib("foodlevel", 0) + food[1]
    world:makeSound(12, user.pos) -- drink sound

    if math.random(50) <= 1 then
        common.InformNLS( user, "Das alte Geschirr ist nicht mehr brauchbar.", "The old dishes are no longer usable.")
    else
        local dataCopy = {descriptionDe=SourceItem:getData("descriptionDe"), descriptionEn=SourceItem:getData("descriptionEn")}
        common.CreateItem(user, food[2], 1, 333, dataCopy) -- create the remnant item
    end
    world:erase(SourceItem, 1)

    if foodLevel > 40000 then
        common.InformNLS( user, "Du hast genug getrunken.", "You have had enough to drink.")
    elseif foodLevel > 40000 then
        common.InformNLS( user, "Du schaffst es nicht noch mehr zu trinken.", "You cannot drink anything else.")
        foodLevel = foodLevel - food[1]
    end

    if user:increaseAttrib("foodlevel", 0) ~= foodLevel then
        user:increaseAttrib("foodlevel",-(user:increaseAttrib("foodlevel",0) - foodLevel))
    end
end


function M.LookAtItem(user, Item)

    local food = M.drinkList[Item.id]

    if food == nil then
        user:inform("unknown drink item ID"..Item.id)
    end

    return lookat.GenerateLookAt(user, Item, lookat.NONE)
end

return M
