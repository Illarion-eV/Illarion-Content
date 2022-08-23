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
-- UPDATE common SET com_script='alchemy.item.id_327_blue_bottle' WHERE com_itemid = 327;

-- Blue Potions
-- Explosives ("Bombs", etc)

local lookat = require("base.lookat")
local common = require("base.common")
local alchemy = require("alchemy.base.alchemy")
local missile = require("alchemy.base.missile")
local scheduledFunction = require("scheduled.scheduledFunction")
local customPotion = require("alchemy.base.customPotion")


local M = {}



local function Explode(user,TargetItem)
local Item = TargetItem
local potionEffectId = (tonumber(Item:getData("potionEffectId")))

    if (potionEffectId >= 300) and (potionEffectId <= 399) then    -- bombs

        if (potionEffectId == 301) then
            missile.effect_1( user, Item )
        elseif (potionEffectId == 302) then
            missile.effect_2( user, Item )
        elseif (potionEffectId == 303) then
            missile.effect_3( user, Item )
        elseif (potionEffectId == 304) then
            missile.effect_4( user, Item )
        elseif (potionEffectId == 305) then
            missile.effect_5( user, Item )
        elseif (potionEffectId == 306) then
            missile.effect_6( user, Item )
        elseif (potionEffectId == 307) then
            missile.effect_7( user, Item )
        elseif (potionEffectId == 308) then
            missile.effect_8( user, Item )
        elseif (potionEffectId == 309) then
            missile.effect_9( user, Item )
        elseif (potionEffectId == 310) then
            missile.effect_10( user, Item )
        elseif (potionEffectId == 311) then
            missile.effect_11( user, Item )
        elseif (potionEffectId == 312) then
            missile.effect_12( user, Item )
        elseif (potionEffectId == 313) then
            missile.effect_13( user, Item )
        elseif (potionEffectId == 314) then
            missile.effect_14( user, Item )
        elseif (potionEffectId == 315) then
            missile.effect_15( user, Item )
        elseif (potionEffectId == 316) then
            missile.effect_16( user, Item )
        elseif (potionEffectId == 317) then
            missile.effect_17( user, Item )
        elseif (potionEffectId == 318) then
            missile.effect_18( user, Item )
        elseif (potionEffectId == 320) then
            missile.weakenRedSkeletons(user, Item)
        end
        -- Deko-Effekte
        world:gfx(36,Item.pos)
        world:makeSound(5,Item.pos)
        world:erase(Item,1)
    end
end

local function Drop(user,TargetItem)
    if (math.random(1,user:increaseAttrib("dexterity",0)+7)==1) then
        Explode(user,TargetItem);
        user:talk(Character.say, "#me lässt eine Flasche fallen, welche explodiert.", "#me drops a bottle and it explodes.")
        common.InformNLS( user,
        "Der Wurfkörper rutscht dir aus den Händen und zerplatzt vor deinen Füßen.",
        "The missile slips out of your hands and burst asunder in front of you feets.");
    end;
end;

function M.MoveItemAfterMove(user, SourceItem, TargetItem)
    local missileStatus = (SourceItem:getData("missileStatus"));

    local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))
    if potionEffectId == nil then
        potionEffectId = 0
    end

    if not ((potionEffectId >= 300) and (potionEffectId <= 399)) then
        return true; -- no missile
    end

    if (missileStatus == "deactivated") or (missileStatus == "") then
        if potionEffectId == 319 then
            local itemPos = position(TargetItem.pos.x, TargetItem.pos.y, TargetItem.pos.z)
            local theField = world:getField(itemPos)
            if TargetItem:getType() == 3 and common.GetGroundType(theField:tile()) == common.GroundType.snow then
                local timeStamp = world:getTime("unix")
                TargetItem:setData("identifierTimeStamp", timeStamp)
                world:changeItem(TargetItem)
                local potionQuality = TargetItem.quality

                scheduledFunction.registerFunction(360, function()
                    local field = world:getField(itemPos)

                    if field:countItems() > 0 then
                        local deleted = common.DeleteItemFromStack(itemPos, {itemId = 327, quality = potionQuality, data = { {dataKey = "potionEffectId", dataValue = 319}, {dataKey = "identifierTimeStamp", dataValue = timeStamp}}})

                        if deleted then
                            world:createItemFromId(327, 1, itemPos, true, potionQuality, {potionEffectId = 320, filledWith = "potion"})
                            world:gfx(4, itemPos)
                        end
                    end
                end)
            else
                if TargetItem:getData("identifierTimeStamp") ~= "" then
                    TargetItem:setData("identifierTimeStamp", "")
                    world:changeItem(TargetItem)
                end
            end

        end

        return true; -- missile is deactivated
    end

    if (SourceItem:getType()~=4) then
        Drop(user,TargetItem);
        return true; -- not in the hand
    end

    if (TargetItem:getType()~=3) then
        Drop(user,TargetItem);
        return true; -- not thrown at the map
    end

    -- everything allright: explosion!
    Explode(user,TargetItem);
    user:talk(Character.say, "#me wirft eine Flasche, die zerplatzt.", "#me throws a bottle that splits.")
    user.movepoints=user.movepoints-30;
    return true
end;

function M.MoveItemBeforeMove( user, SourceItem, TargetItem )
    local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))
    if potionEffectId == nil then
        potionEffectId = 0
    end

    if not ((potionEffectId >= 300) and (potionEffectId <= 399)) then
        return true; -- no missile
    end

    if (TargetItem:getType()~=3) then
        return true; -- not thrown at the map
    end

    if (SourceItem:getType()~=4) and (SourceItem:getData("missileStatus") == "activated") then
        common.InformNLS( user,
        "Du musst den Wurfkörper aus der Hand werfen.",
        "You have to throw the missle out of your hand.");
        return false; -- not in the hand; only for activated missile
    end
    return true;
end

local function DrinkPotion(user,SourceItem)
-- no drink effect exists for bomb potions, yet
   common.InformNLS(user, "Du hast nicht das Gefühl, dass etwas passiert.",
        "You don't have the feeling that something happens.")
end

function M.UseItem(user, SourceItem, ltstate)
    if SourceItem:getData("customPotion") ~= "" then
        customPotion.drinkInform(user, SourceItem)
    end
    -- repair potion in case it's broken
    alchemy.repairPotion(SourceItem)
    -- repair end

    if SourceItem:getData("filledWith")=="meraldilised slime" then
        user:inform("Die Öffnung der Flasche ist von Klumpen verklebt, wodurch der zähflüssige Inhalt nicht ausfließen kann.",
                    "The opening of the bottle is clotted by gobs, so that its semifluid content cannot flow out.")
    end

    if not ((SourceItem:getData("filledWith")=="potion") or (SourceItem:getData("filledWith") =="essenceBrew")) then
        return -- no potion, no essencebrew, something else
    end

    local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))
    if potionEffectId == nil then
        potionEffectId = 0
    end

    local cauldron = alchemy.GetCauldronInfront(user)
    if cauldron then -- infront of a cauldron?
        alchemy.FillIntoCauldron(user,SourceItem,cauldron,ltstate)

    else -- not infront of a cauldron, therefore use it
        if (potionEffectId >= 300) and (potionEffectId <= 399) and potionEffectId ~= 319 then -- a bomb
            local missileStatus = SourceItem:getData("missileStatus")
            if (missileStatus == "deactivated") or (missileStatus == "") then -- potion deactivated or status not set --> activate
                common.InformNLS( user,
                "Du entsicherst des Wurfkörper. Vorsicht damit.",
                "You activate the missle. Careful with it.");
                SourceItem:setData("missileStatus","activated")
                world:changeItem( SourceItem );
            else
                common.InformNLS( user,
                "Du sicherst den Wurfkörper.",
                "You deactivate the missile.");
                SourceItem:setData("missileStatus","deactivated")
                world:changeItem( SourceItem );
            end
        else -- not a bomb
            user:talk(Character.say, "#me trinkt eine dunkelblaue Flüssigkeit.", "#me drinks a dark blue liquid.")
            user.movepoints=user.movepoints - 20
            DrinkPotion(user,SourceItem)
            alchemy.EmptyBottle(user,SourceItem)
        end
    end
end

function M.LookAtItem(user,Item)
    return lookat.GenerateLookAt(user, Item, 0)
end

return M

