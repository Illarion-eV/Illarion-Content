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

-- This script handles all the small features of the alchemy hut of Granor Bergenhieb.
-- The functions are hooked in the various scripts with the actual entry points.

local common = require("base.common")
local lookat = require("base.lookat")
local scheduledFunction = require("scheduled.scheduledFunction")

local M = {}

-- Hook for the bottle script; trying to fill up Granor's potion in the cauldron
function M.fillingFromCauldron(user, ltstate)

    if ltstate == Action.abort then
        user:inform("Du brichst deine Arbeit ab.", "You abort your work.")
    end

    if ltstate == Action.none then
       granorBergenhieb = common.getNpc(position(15, 685, 1), 5, "Granor Bergenhieb")
       granorBergenhieb:talk(Character.say, "#me spricht mit d�sterer Stimme: 'Mach weiter und du erlebst, wenn Egon einen seiner Momente hat, Drecksau.'", "#me whispers in a dark voice: 'Keep going and you will experience one of Egon's special moments, shit-head.'")
       user:startAction(50,21,5,15,25)
    end

    if ltstate == Action.success then
        egon = common.getNpc(position(15, 685, 1), 5, "Egon")
        egon:talk(Character.say, "#me kreischt laut auf und wirft in einer sehr schnellen Bewegungen einen schweren Stein in Richtung Kessel.", "#me cries out very loudly and throws a heavy stone into the direction of the cauldron.")
        user:talk(Character.say, "#me wird von einem Stein am Kopf getroffen.", "#me's head is hit by a stone.")
        world:gfx(13, user.pos)
        user:increaseAttrib("hitpoints", -3000)
    end
end

local closeTheDoorMessages = {}
closeTheDoorMessages[1] = {[Player.german] = "Mach gef�lligst die T�r du, Holzkopf!", [Player.english] = "Close the door, pinhead!"}
closeTheDoorMessages[2] = {[Player.german] = "Faule Sau! T�ren kann man auch wieder zu machen!", [Player.english] = "Lazy pig! Doors are there for a reason!"}
closeTheDoorMessages[3] = {[Player.german] = "Ey, du Gossenkind, schlie� die T�r!", [Player.english] = "Ey, urchin, close the door!"}
closeTheDoorMessages[4] = {[Player.german] = "Zu faul die T�r zu schlie�en! Wo sind wir denn hier?!", [Player.english] = "Too lazy to close a door! Where do you think we are?"}
closeTheDoorMessages[5] = {[Player.german] = "Dumm wie Mist und frech wie Schei�e. Zu fein T�ren zu schlie�en, was?!", [Player.english] = "Stupid like dung and insolent like shit. Are we too fine to close doors or what?!"}

local timeLastMessage

-- Hook for triggerfield infront of the door; tell player to close the door
function M.doorCheck(user)
    if user:getFaceTo() == Character.south and world:getItemOnField(position(13, 689, 1)).id ~= 3314 then
        if (not timeLastMessage) or world:getTime("unix") - timeLastMessage > 60 then
            granorBergenhieb = common.getNpc(position(15, 685, 1), 5, "Granor Bergenhieb")
            local messageNumber = Random.uniform(1, #closeTheDoorMessages)
            granorBergenhieb:talk(Character.yell, closeTheDoorMessages[messageNumber][Player.german], closeTheDoorMessages[messageNumber][Player.english])
            timeLastMessage = world:getTime("unix")
        end
    end
end

-- Hook for looking at hedge item
function M.lookingAtHedge(user, item)

    if user:getQuestProgress(505) == 0 then
        lookat.SetSpecialDescription(item, "Die Hecke ist voll von L�chern. In einem der L�cher blitzt etwas auf.", "There are a lot of holes in the hedge. In one of the holes, something flashes up.")
    else
        lookat.SetSpecialDescription(item, "Die Hecke ist voll von L�chern.", "There are a lot of holes in the hedge.")
    end

end

-- Hook for using hedge item
function M.searchInHedge(user)
    if user:getQuestProgress(505) == 0 then
        user:inform("Du findet in der Hecke eine Sichel mit einem scheinbar angeknabberten Griff, an dem noch ein bi�chen Sabber h�ngt.", "As you search through the hedge, you find a sickle with a seemingly nibbled on handle. There is even some saliva still on it.")
        local notCreated = user:createItem(126, 1, 666, {descriptionDe = "Der Holzgriff der Sichel wurde angeknabbert.", descriptionEn = "The wooden handle of the sickle has been nibbled at."})
        if notCreated > 0 then
            world:createItemFromId(126, 1, user.pos, true, 666, {descriptionDe = "Der Holzgriff der Sichel wurde angeknabbert.", descriptionEn = "The wooden handle of the sickle has been nibbled at."})
        end
        user:setQuestProgress(505, 1)
    end
end

-- Hook for schedule script; spawn spawn clouds in the area
function M.spawnPoisonClouds()
    for i = 1, 4 do
        local randomPosition = position(Random.uniform(3, 40), Random.uniform(675, 700), 0)
        if world:getField(randomPosition):isPassable() then
            world:gfx(8, randomPosition)
        end
    end
end

-- Hook for analyzing script; hand over message of potion analysis
function M.granorsPotion()
return "Du erkennst, dass eine Vielzahl an essenzierten Kr�uter verarbeitet wurden. Wirkstoffe in den h�chsten Konzentrationen schimmern auch durch. Doch du siehst auch seltsame, gr�uliche Flecken, die du nicht erkl�ren kannst.", "You recognize that a lot of essence herbs have been used. Active agents in the highest concentrations gleam. But you also see strange grey spots which you are unable to explain."
end

local function cleanTable(tablePos, potionId)

    if #(world:getPlayersInRangeOf(tablePos, 15)) > 0 then
        return false, false
    end

    local counter = 0
    while counter < 20 do
        local checkItem = world:getItemOnField(tablePos)
        if checkItem.id == 320 then
            return false, true
        elseif checkItem.id == potionId and checkItem.wear == 255 then
            return true, false
        else
            world:erase(checkItem, checkItem.number)
            counter = counter + 1
        end
    end

    return false, false

end

-- Hook for potion scripts; replace map potion that were drunk
function M.potionReplacer()

    local redPotionPos = position(14, 683, 1)
    local pinkPotionPos = position(15, 683, 1)

    local repeatReplacer

    local pinkPotionThere, emptyTable = cleanTable(pinkPotionPos, 166)
    if pinkPotionThere then
        repeatReplacer = false
    elseif emptyTable then
        repeatReplacer = false
        world:createItemFromId(166, 1, pinkPotionPos, true, 111, {filledWith = "potion", potionEffectId = "35555555", granorsHut = "true"})
    else
        repeatReplacer = true
    end

    local redPotionThere, emptyTable = cleanTable(redPotionPos, 166)
    if redPotionThere then
        repeatReplacer = false
    elseif emptyTable then
        repeatReplacer = false
        world:createItemFromId(59, 1, redPotionPos, true, 111, {filledWith = "potion", potionEffectId = "44444444", granorsHut = "true"})
    else
        repeatReplacer = true
    end

    if repeatReplacer then
        scheduledFunction.registerFunction(30, function() M.potionReplacer() end)
    end
end

-- Hook for using Granor's book
function M.readingBook(user)
    local foundEffect = user.effects:find(6)
    if foundEffect then
        return
    end
    user.effects:addEffect(LongTimeEffect(6, 18000))
    user:inform("Als du das Buch aufschl�gst, leuchten die Buchstaben gar gr��lich grellend auf. Du bist vollkommen geblendet und die Welt um dich herum, wird zu einem kaum wahrnehmbaren milchigen Schleier. Deine Wahrnehmung hat sich radikal verschlechtert.","As you open the book, the letters glare horribly brightly. You are completely blinded and the world around your becomes a barely visible foggy veil. Your perception got a lot worse.")

    granorBergenhieb = common.getNpc(position(15, 685, 1), 5, "Granor Bergenhieb")
    granor:talk(Character.say, "#me lacht dreckig auf. 'Sowas passiert, wenn man ungefragt anderer Leute Dinge anf�sst. Aber h�lt ja nur leider 'ne halbe Stunde an...'", "#me laughs maliciously. 'Well, that happens to those who touch other peoples' things without being allowed. Yet, it will only last half an hour...'")
end

return M
