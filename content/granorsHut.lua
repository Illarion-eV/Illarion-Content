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

local lookat = require("base.lookat")

local M = {}

local function getNpc(npcName)
    local npcs = world:getNPCSInRangeOf(position(15, 685, 1), 5)
    for _, candidateNpc in pairs(npcs) do
        if candidateNpc.name == npcName then
            return candidateNpc
        end
    end
end

-- Hook for the bottle script; trying to fill up Granor's potion in the cauldron
function M.fillingFromCauldron(user, ltstate)
    
    if ltstate == Action.abort then
        uer:inform("Du brichst deine Arbeit ab.", "You abort your work.")
    end
	
    if ltstate == Action.none then
       local granorBergenhieb = getNpc("Granor Bergenhieb")
       granorBergenhieb:talk(Character.say, "#me spricht mit düsterer Stimme: 'Mach weiter und du erlebst, wenn Egon einen seiner Momente hat., Dreckssau.'", "#me whispers in a dark voice: 'Keep going and you will experience one of Egon's special momenets, shit-head.'")
       user:startAction(50,21,5,15,25)
    end
    
    if ltstate == Action.success then
        local egon = getNpc("Egon")
        egon:talk(Character.say, "#me kreischt laut auf und wirft in einer sehr schnellen Bewegungen einen schweren Stein in Richtung Kessel.", "#me cries out very loudly and throws a heavy stone into the direction of the cauldron.")
        user:talk(Character.say, "#me wirf von einem Stein am Kopf getroffen.", "#me's head is hit by a stone.")
        world:gfx(13, user.pos)
        user:increaseAttrib("hitpoints",-3000)
    end
end

local closeTheDoorMessages = {}
closeTheDoorMessages[1] = {[Player.german] = "Mach gefälligst die Tür du, Holzkopf!", [Player.english] = "Close the door, pinhead!"}
closeTheDoorMessages[2] = {[Player.german] = "Faule Sau! Türen kann man auch wieder zu machen!", [Player.english] = "Lazy pig! Doors are there for a reason!"}
closeTheDoorMessages[3] = {[Player.german] = "Ey, du Gossenkind, schließ die Tür!", [Player.english] = "Ey, urchin, close the door!"}
closeTheDoorMessages[4] = {[Player.german] = "Zu faul die Tür zu schließen! Wo sind wir denn hier?!", [Player.english] = "Too lazy to close a door! Where do you think we are"}
closeTheDoorMessages[5] = {[Player.german] = "Dumm wie Mist und frech wie Scheiße. Zu fein Türen zu schließen, was?!", [Player.english] = "Stupid like dung and insolent like shit. Are we too fine to close doors or what?!"}

local timeLastMessage

-- Hook for triggerfield infront of the door; tell player to close the door
function M.doorCheck(user)
    if user:getFaceTo() == Character.south and world:getItemOnField(position(13, 689, 1)).id ~= 3314 then
        if (not timeLastMessage) or world:getTime("unix") - timeLastMessage > 60 then
            local granorBergenhieb = getNpc("Granor Bergenhieb")
            local messageNumber = Random.uniform(1, #closeTheDoorMessages)
            granorBergenhieb:talk(Character.yell, closeTheDoorMessages[messageNumber][Player.german], closeTheDoorMessages[messageNumber][Player.english])
        end
    end
end

-- Hook for looking at hedge item
function M.lookingAtHedge(user, item)

    if user:getQuestProgress(505) == 0 then
        lookat.SetSpecialDescription(item, "Die Hecke ist voll von Löchern. In einem der Löcher blitzt etwas auf.", "There are a lot of holes in the hedge. In one of the holes, something flashes up.")
    else
        lookat.SetSpecialDescription(item, "Die Hecke ist voll von Löchern.", "There are a lot of holes in the hedge.")
    end
    
end

-- Hook for using hedge item
function M.searchInHedge(user)
    if user:getQuestProgress(505) == 0 then
        user:inform("Du findet in der Hecke eine Sichel mit einem scheinbar angeknabberten Griff, an dem noch ein bißchen Sabber hängt.", "As you search through the hedge, you find a sickle with a seemingly nibbled on handle. There is even some salvia still on it.")
        local notCreated = user:createItem(126, 1, 666, {descriptionDe = "Der Holzgriff der Sichel wurde angeknabbert.", descriptionEn = "The wodden handle of the sickle has been nibbled at."})
        if notCreated > 0 then
            world:createItemFromId(126, 1, user.pos, true, 666, {descriptionDe = "Der Holzgriff der Sichel wurde angeknabbert.", descriptionEn = "The wodden handle of the sickle has been nibbled at."})
        end
        user:setQuestProgress(505, 1)
    end
end

return M