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

local common = require("base.common")
local lookat = require("base.lookat")
local tutorial = require("content.tutorial")

local M = {}

local DEFAULT_WEAR = 20 -- default duration of one hour (57-60 min depending on when in the rot cycle it is lit)

local LightsOff = {}
local LightsOn = {}
-- torch
LightsOff[391] = { on = 392 }
LightsOn[392] = { off = 391, portable = true }
-- torch holder
LightsOff[401] = { on = 402, req = { id = 392, alternative = 391, num = 1 } } -- facing south
LightsOn[402] = { off = 401}
LightsOff[403] = { on = 404, req = { id = 392, alternative = 391, num = 1 } } -- facing west
LightsOn[404] = { off = 403}
-- candles
LightsOff[2853] = { on = 2851, req = { id = 43, num = 3 } } -- facing south
LightsOn[2851] = { off = 2853 }
LightsOff[2854] = { on = 2852, req = { id = 43, num = 3 } } -- facing west
LightsOn[2852] = { off = 2854 }
-- candle
LightsOff[399] = { on = 400, req = { id = 43, num = 1 } }
LightsOn[400] = { off = 399, portable = true }
-- oil lamp
LightsOff[92] = { on = 397, req = { id = 469, num = 1, remnant = 390} }
LightsOn[397] = { off = 92, portable = true }
-- oil lamp holder
LightsOff[395] = { on = 396, req = { id = 469, num = 1, remnant = 390 } }
LightsOn[396] = { off = 395 }
-- lantern
LightsOff[393] = { on = 394, req = { id = 43, num = 1 } } -- black, portable
LightsOn[394] = { off = 393, portable = true }
LightsOff[2856] = { on = 2855, req = { id = 43, num = 1 } } -- grey, static
LightsOn[2855] = { off = 2856 }

local ReqTexts = {}
ReqTexts.german = { [392] = "Fackeln", [43] = "Kerzen", [469] = "Lampenöl" }
ReqTexts.english = { [392] = "torches", [43] = "candles", [469] = "lamp oil" }


local function lightTheItem(theItem, newWear)

    theItem.id = LightsOff[theItem.id].on
    theItem.wear = newWear
    world:changeItem(theItem)
end

local function passesCheckForStackSizeAndPosition(user, sourceItem)

    if sourceItem.id == Item.torch and sourceItem:getType() ~= scriptItem.inventory then
        common.InformNLS(user,
            "Nimm die Lichtquelle in die Hand.",
            "Take the light source into your hand.")
        return false
    end
    if sourceItem:getType() == scriptItem.container then
        common.InformNLS(user,
            "Nimm die Lichtquelle in die Hand oder lege sie am Gürtel ab.",
            "Take the light source into your hand or put it on your belt.")
        return false
    end

    if sourceItem.number > 1 then
        user:inform("Du kannst immer nur eine Lichtquelle auf einmal anzünden. Um einen Stapel aufzuteilen, halte die Umschalttaste, während du den Stapel auf ein freies Inventarfeld ziehst.",
                    "You can only light up one light source at once. To split a stack, hold shift while dragging the item stack to a free inventory slot.")
        return false
    end

    return true
end

local function checkIfRequirementsAreMetAndConsumeUnlitItem(user, unlitItem)

    local litTorch = false

    if unlitItem.req then
        -- there's a requirement, check on body and belt

        local alternative = unlitItem.req.alternative

        local hasEnoughAlternativeItem = false

        if alternative then
            hasEnoughAlternativeItem = user:countItemAt("body", alternative) + user:countItemAt("belt", alternative) >= unlitItem.req.num
        end

        local hasEnoughOfRequiredItem = user:countItemAt("body", unlitItem.req.id) + user:countItemAt("belt", unlitItem.req.id) >= unlitItem.req.num

        local itemToTake = unlitItem.req.id

        if not hasEnoughOfRequiredItem and hasEnoughAlternativeItem then
            itemToTake = alternative
        end

        if hasEnoughOfRequiredItem or hasEnoughAlternativeItem then
            local myItem
            local itemRest = unlitItem.req.num
            for i=1,17 do
                myItem = user:getItemAt( i )
                if ( myItem.id == itemToTake ) then
                    world:erase( myItem, math.min( itemRest, myItem.number ) )
                    if itemToTake == 392 then
                        litTorch = myItem.wear
                    end
                    itemRest = itemRest - math.min( itemRest, myItem.number )
                    if itemRest == 0 then
                        break
                    end
                end
            end
            if unlitItem.req.remnant then
                common.CreateItem(user, unlitItem.req.remnant, unlitItem.req.num, 333, nil)
            end
        else
            return false, litTorch
        end
    end

    return true, litTorch
end

local function handleUsageQuests(user, sourceItem)  -- returns true if the quest handles the lighting process
    --Tutorial Quest 330: Lighting a torch with NPC Henry Cunnigan
    if user:getQuestProgress(330) == 2 and sourceItem.id == 391 and user:isInRangeToPosition((position (703,290,0)),20) then -- Only invoked if the user has the quest, has a torch and is in range of the NPC
        user:setQuestProgress(330,3) -- Quest advanced when torch lit
        common.InformNLS(user, tutorial.getTutorialInformDE("lights"), tutorial.getTutorialInformEN("lights"))
        local Henry = common.getNpc(position(703,290,0),1,"Henry Cunnigan")
        common.TalkNLS(Henry, Character.say, tutorial.getTutorialTalkDE("lights"), tutorial.getTutorialTalkEN("lights"))
        return false
    end

    --Quest 105: NPC Gregor Remethar "A light at the end of the tunnel"
    if sourceItem.id == 395 and (sourceItem.pos == position (873, 796, -3) or sourceItem.pos == position (873, 798, -3) ) and user:getQuestProgress(105) == 1 then
        common.InformNLS(user, "[Queststatus] Du entfachst die Ehrenfeuer von Runewick. Kehre zu Gregor Remethar zurück, um deine Belohnung einzufordern.", "[Quest status] You lit the lights of honour of Runewick. Return to Gregor Remethar to claim your reward.")
        user:setQuestProgress(105,2)
        lightTheItem(sourceItem, math.random(20,60)) --these lights burn quite long
        return true
    end

    return false
end

function M.UseItem(user, sourceItem)

    if not passesCheckForStackSizeAndPosition(user, sourceItem) then
        return
    end

    local unlitItem = LightsOff[sourceItem.id]
    local litItem = LightsOn[sourceItem.id]

    if unlitItem then
        local requirementsMet, litTorch = checkIfRequirementsAreMetAndConsumeUnlitItem(user, unlitItem)
        if requirementsMet then
            if not handleUsageQuests(user, sourceItem) then
                -- no quests that already lit the item, proceeding with default
                local wear = DEFAULT_WEAR

                if litTorch then
                    wear = litTorch
                end

                lightTheItem(sourceItem, wear)
            end
        elseif unlitItem.req then
            common.InformNLS(user,
                "Dafür brauchst du ".. ReqTexts.german[unlitItem.req.id] .. " in der Hand oder im Gürtel.",
                "You need ".. ReqTexts.english[unlitItem.req.id] .. " in your belt or hands to do that.")
        end
    elseif litItem then
        common.InformNLS(user,"Du verbrennst dir die Finger beim Versuch, das Feuer zu ersticken.","You burn your fingers while trying to extinguish the flames.")
    end
end

function M.MoveItemAfterMove(user, itemBefore, itemAfter)

    -- Quest 305: we burn a tobacco plantation
    if user:getQuestProgress(305) == 2 then
        if (itemAfter.pos.x >= 3) and (itemAfter.pos.x <= 6) and (itemAfter.pos.y >= 565) and (itemAfter.pos.y <= 571) and (itemAfter.pos.z <= 0) then
            if LightsOn[itemBefore.id] then
                local spawnFire = function(posi)
                    world:createItemFromId(359,1,posi,true,333,nil)
                end
                world:makeSound(7,position(5,568,0))
                world:createItemFromId(359,1,position(5,568,0),true,333,nil)
                common.CreateCircle(position(5,568,0), 1, spawnFire)
                common.CreateCircle(position(5,568,0), 2, spawnFire)
                user:setQuestProgress(305,3)
                user:inform("Du hast das Tabakfeld zerstört. Gut gemacht. Spreche nun mit Tobis Vunu.","You destroyed the tobacco field. Well done. Talk to Tobis Vunu now.")
            else
                user:inform("Du kannst das Feld vermutlich mit brennenden Dingen besser abfackeln.","It's much easier to burn down a field if you are using fire.")
            end
        end
    end

    --Tutorial Quest 330: Equipping a torch with NPC Henry Cunnigan
    if user:getQuestProgress(330)==1 and itemAfter.id==391 and user:isInRangeToPosition((position (703,290,0)),20) and itemAfter:getType() == 4 then -- Only invoked if the user has the quest, has a torch and is in range of the NPC
        user:setQuestProgress(330,2) --Quest advancement when torch equipped
        local NPCList=world:getNPCSInRangeOf(position(703,290,0),1) --Let's be tolerant, the NPC might move a tile.
        common.InformNLS(user, tutorial.getTutorialInformDE("lightsStart"), tutorial.getTutorialInformEN("lightsStart"))
        for i, Henry in pairs(NPCList) do
            common.TalkNLS(Henry, Character.say, tutorial.getTutorialTalkDE("lightsStart"), tutorial.getTutorialTalkEN("lightsStart"))
        end
    end

    return true --leave safely
end

function M.LookAtItem(user, sourceItem)

    if(LightsOn[sourceItem.id]) then
        local TimeLeftI = sourceItem.wear
        if(TimeLeftI == 255) then
            lookat.SetSpecialDescription(sourceItem, "Sie wird nie ausbrennen.", "It will never burn down.")
        elseif (TimeLeftI == 0) then
            lookat.SetSpecialDescription(sourceItem, "Sie wird sofort ausbrennen.", "It will burn down immediately.")
        elseif (TimeLeftI == 1) then
            lookat.SetSpecialDescription(sourceItem, "Sie wird demnächst ausbrennen.", "It will burn down anytime soon.")
        elseif (TimeLeftI == 2) then
            lookat.SetSpecialDescription(sourceItem, "Sie wird bald ausbrennen.", "It will burn down soon.")
        elseif (TimeLeftI <= 4) then
            lookat.SetSpecialDescription(sourceItem, "Sie wird nach einer Weile ausbrennen.", "It will burn down in a while.")
        elseif (TimeLeftI <= DEFAULT_WEAR) then
            lookat.SetSpecialDescription(sourceItem, "Sie wird nicht allzu bald ausbrennen.", "It will not burn down anytime soon.")
        elseif (TimeLeftI > DEFAULT_WEAR) then
            lookat.SetSpecialDescription(sourceItem, "Sie wird nach langer Zeit ausbrennen.", "It will burn down in a long time.")
        end
    elseif (LightsOff[sourceItem.id]) then
        lookat.SetSpecialDescription(sourceItem, "Sie ist nicht angezündet.", "It is not lit, yet.")
    end

    return lookat.GenerateLookAt(user, sourceItem, lookat.NONE)
end

return M
