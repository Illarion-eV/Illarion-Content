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

-- UPDATE items SET itm_script='item.bottles' WHERE itm_id IN (2500, 2496, 2497, 2501, 2499);

local common = require("base.common")
local lookat = require("base.lookat")
local evilrock = require("triggerfield.evilrock")

local M = {}

-- nameDE, nameEN, leftover item, { {empty target container, filled target container}, ...}
local drinkList = {}
drinkList[2500] = {  "Weinflasche", "bottle of wine", 2498,
    {{1858, 1860}, {224, 1857}, {2055, 2057}, {1840, 1842}, {2185, 2187}} } -- Kelch, Goldkelch, Glas, Kupferkelch, Holzbecher

drinkList[2496] = {  "Wasserflasche", "bottle of water", 2498,
    { {1858, 1855}, {224, 1854}, {2055, 2058},{1840, 1841}, {2185, 2186} } }

drinkList[2497] = {  "Metflasche", "bottle of mead", 2498,
    { {1858, 1853}, {224, 1856}, {2055, 2056},{1840, 1843}, {2185, 2188} } }

drinkList[2501] = {  "Bierflasche", "bottle of dark beer", 2498,
    { {1908, 1909} } } -- Krug

drinkList[2499] = {  "Ciderflasche", "bottle of cider", 2498,
    { {1858, 1859}, {224, 1861},{2055, 2059},{1840, 1844}, {2185, 2189} } }

local BottleQualDe = {"Randvolle ", "Volle ", "Halbvolle ", "Fast leere "}
local BottleQualEn = {"Brimfull ", "Full ", "Half full ", "Almost empty "}
local BottleQualLm = {8, 6, 3, 1}

local function getEvilrockBucket(User)
    local Radius = 1
    for  x = -Radius, Radius do
        for y = -Radius, Radius do
            local targetPos = position(User.pos.x + x, User.pos.y + y, User.pos.z)
            if (world:isItemOnField(targetPos)) then
                local item = world:getItemOnField(targetPos)
                if (item.id == 51 and item:getData("evilrockBucket") == "true") then
                    return item
                end
            end
        end
    end
    return nil
end

local function Evilrockentrance(User, SourceItem, ltstate)
    local evilrockBucket =  getEvilrockBucket(User)
    if evilrockBucket ~= nil and SourceItem.id == 2496 then
        common.TurnTo(User, evilrockBucket.pos) -- turn if necessary

        if ( ltstate == Action.none ) then
            User:startAction( 20, 21, 5, 10, 25)
            User:talk(Character.say, "#me beginnt den Eimer zu befüllen.", "#me starts to fill bucket.")
            return true
        end

        if ( ltstate == Action.abort ) then
            common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
            return true
        end

        world:swap(evilrockBucket, 52, 999)

        world:erase(SourceItem, 1)
        common.CreateItem(User, 2498, 1, 333, nil)

        for xx = 992, 996 do
            local EntranceTrap = world:getItemOnField(position(xx,195,0))
            if EntranceTrap.id == 3097 then
                world:erase(EntranceTrap,EntranceTrap.number)
                world:makeSound(4,User.pos)
                world:makeSound(5,User.pos)
            end
        end
        common.InformNLS(User, "Du hörst ein seltsames Geräusch von unten.", "You hear a strange noise from below.")
        return true
    end
    return false
end

function M.UseItem(User, SourceItem, ltstate)

    local food = drinkList[ SourceItem.id ];
    if (food ~= nil ) then
        if Evilrockentrance(User, SourceItem, ltstate) == true then
            return
        end

        local TargetItems = {}
        for _, combo in pairs(food[4]) do
            table.insert(TargetItems,combo[1])
        end
        local foundVessels, vesselItem = common.GetTargetItemAnywhere(User,TargetItems)
        
        if foundVessels == 0 then
            common.InformNLS( User, "Dir fällt auf, dass du gar kein Gefäß hast, welches du füllen könntest.",
                                    "You notice that you do not have a vessel which you could fill.")
        elseif foundVessels == 1 then
            for _, combo in pairs(food[4]) do
                if combo[1] == vesselItem.id then
                    -- fill drink
                    if (vesselItem.number > 1) then
                        world:erase(vesselItem, 1)
                        common.CreateItem(User, combo[2], 1, 333, nil)
                    else
                        vesselItem.id = combo[2]
                        world:changeItem(vesselItem)
                    end
                    world:makeSound(10,User.pos)

                    -- create leftovers
                    if( SourceItem.quality > 199 ) then
                        -- reduce one portion
                        SourceItem.quality = SourceItem.quality-100
                        world:changeItem(SourceItem)
                        --world:changeQuality( SourceItem, -100 );
                    else
                        if( math.random( 50 ) <= 1 ) then
                            common.InformNLS( User,
                            "Die leere Flasche ist angeschlagen und unbrauchbar.",
                            "The empty bottle is broken and no longer usable.");
                        else
                            local dataCopy = {descriptionDe=SourceItem:getData("descriptionDe"), descriptionEn=SourceItem:getData("descriptionEn")};
                            common.CreateItem(User, food[3], 1, 333, dataCopy)
                        end
                        world:erase(SourceItem, 1)
                    end

                    -- cancel after one found item
                    break;
                end -- found item
            end
        else
            common.InformNLS( User, "Du bist dir nicht ganz sicher, welches Gefäß du füllen willst. Vielleicht nimmst du es in die Hand?",
                                    "You are not sure what vessel you want to fill. Perhaps you could hold one in your hand?")
        end
    else
        --User:inform("unkown bottle item ");
    end
end

function M.LookAtItem(User, Item)
    local lookAt = lookat.GenerateLookAt(User, Item)
    local food = drinkList[ Item.id ];
    if food == nil then
        return lookAt
    end

    -- decode item quality, extract duration
    local itemDura=math.fmod(Item.quality,100);
    local itemQual=(Item.quality-itemDura)/100;
    --User:inform("portions "..itemQual);

    -- build description

    local DisplayText="";

    -- build quality text
    for i,qualLimit in pairs(BottleQualLm) do
        if (itemQual>=qualLimit ) then
            DisplayText = common.GetNLS( User, BottleQualDe[i], BottleQualEn[i] );
            break;
        end
    end

    DisplayText = DisplayText..common.GetNLS( User, food[1], food[2] );
    if lookAt.description ~= nil then -- append the label
        DisplayText = DisplayText..". "..lookAt.description;
    end
    lookAt.description = DisplayText

    return lookAt
end

return M
