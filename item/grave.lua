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

-- UPDATE items SET itm_script='item.grave' WHERE itm_id IN (337, 519, 520, 521);

local common = require("base.common")
local transformation_dog = require("alchemy.teaching.transformation_dog")
local lookat = require("base.lookat")
local magicSphere = require("item.magicSphere")

local texts = magicSphere.puzzles

local M = {}

local graveItemNumbers = {337, 519, 520, 521}

local dragonCaveCoffinPos = {
    position(695, 612, -3),
    position(696, 612, -3),
    position(697, 612, -3),
    position(698, 612, -3),
    position(699, 612, -3),
    position(700, 612, -3),
    position(701, 612, -3),
    position(702, 612, -3),
    position(703, 612, -3),
    position(704, 612, -3),
    position(706, 621, -3),
    position(706, 623, -3),
    position(706, 625, -3),
    position(707, 621, -3),
    position(707, 623, -3),
    position(707, 625, -3),
    position(708, 621, -3),
    position(708, 623, -3),
    position(708, 625, -3),
    position(709, 621, -3),
    position(709, 623, -3),
    position(709, 625, -3),
    position(709, 623, -3),
    position(809, 651, -3),
    position(810, 651, -3),
}

local CoffinContents
local letmaCoffin

local function fhanPuzzlePos(user, item)

    for _, coffin in pairs(texts.fhanPuzzle.coffins) do
        if coffin.location == item.pos then
            local lookAt = lookat.GenerateLookAt(user, item)
            lookAt.description = common.GetNLS(user, coffin.german, coffin.english)
            return lookAt
        end
    end

    return false
end

function M.LookAtItem(User, Item)

    local lookAt = lookat.GenerateLookAt(User, Item, lookat.NONE)

    if fhanPuzzlePos(User, Item) then
        return fhanPuzzlePos(User, Item)
    end

    if Item:getData("teachDogTransformationPotion") == "true" then
        return transformation_dog.LookAtGrave(User,Item)
    end

    return lookAt
end

local findPlayersForGems={}
local graveSourceItemPos={position(958,238,0),position(968,226,0),position(970,219,0)}
local typoOfGem={3519,3522,3523}

local gemColourDE1={"Lila","Blau","Gr�n"}
local gemColourDE2={"Amethysten","Saphire","Smaragde"}
local gemColourEN1={"purple","blue","green"}
local gemColourEN2={"Amethysts","Sapphires","Emeralds"}
local gemsAlreadyFound={}
gemsAlreadyFound[1]={197,242,481,526}
gemsAlreadyFound[2]={284,329,481,526}
gemsAlreadyFound[3]={45,242,329,526}

function M.UseItem(User, SourceItem)

    if fhanPuzzlePos(User, Item) then
        return
    end

    if SourceItem:getData("teachDogTransformationPotion") == "true" then
        transformation_dog.UseGrave(User, SourceItem)
        return
    end

    if SourceItem.pos == position (447,785,-9) then -- kindness tombstone in Akaltut's Chambers
        local queststatus = User:getQuestProgress(531) -- here, we save which events were triggered
        local queststatuslist = common.Split_number(queststatus, 6) -- reading the digits of the queststatus as table
        if queststatuslist[1] == 0 then -- gem, only triggered once by each char
            common.InformNLS(User, "Du entdeckst einen glitzernden Edelstein bei der Leiche.", "You discover a shiny gem with the corpse.")
            common.CreateItem(User, 3525, 1, 333, {["gemLevel"] = 1})
            queststatuslist[1] = 1
            User:setQuestProgress(531, queststatuslist[1]*100000+queststatuslist[2]*10000+queststatuslist[3]*1000+queststatuslist[4]*100+queststatuslist[5]*10+queststatuslist[6]*1) --saving the new queststatus
        end
        return
    end

        -- check for grave
    for t=1,4 do
        local TargetItem = common.GetItemInArea(User.pos, graveItemNumbers[t])
        if (TargetItem ~= nil) then
            common.TurnTo( User, TargetItem.pos) -- turn if necessary
        end
    end

    local AmountGrave = #graveSourceItemPos
    local UserHasAlreadyThisGame=false
    for i = 1,AmountGrave do
        if (SourceItem.pos == graveSourceItemPos[i]) then
            local AmountGemsAlreadyFound = #gemsAlreadyFound[i]
            for j = 1,AmountGemsAlreadyFound do
                if User:getQuestProgress(669) == gemsAlreadyFound[i][j] then
                    UserHasAlreadyThisGame=true
                end
            end
            if UserHasAlreadyThisGame ~= true then
                User:talk(Character.say, "#me wischt Staub vom Grabstein und pl�tzlich beginnt die Hand zu schimmern in einem latenten " .. gemColourDE1[i],
                    "#me waves over the tombstone and suddenly the hand glimmers in a latent ".. gemColourEN1[i] .. " light.")
                common.CreateItem(User, typoOfGem[i], 2, 999, {["gemLevel"]="1"})
                common.InformNLS(User,"~Im Staub finden sich zwei latente magische " .. gemColourDE2[i] .. ".",
                    "~The dust in your hand bears two latent magical " .. gemColourEN2[i] .. ".")
                findPlayersForGems[User.name] = world:getPlayersInRangeOf(User.pos, 20)
                for _, player in ipairs(findPlayersForGems[User.name]) do
                    local playersCurrentStatus = player:getQuestProgress(669)
                    player:setQuestProgress(669,playersCurrentStatus+typoOfGem[i])
                end
            else
                User:talk(Character.say, "#me wischt Staub vom Grabstein, der zu Boden f�llt.", "#me waves over the tombstone and dust drops to the ground.")
                common.InformNLS(User,"Du findest nichts au�er Staub am Grabstein.", "You do not find anything except for dust on the tombstone.")
            end
        end
    end

    if (User:getQuestProgress(510) == 21) and  SourceItem.pos == position(703, 612, -3) then --OK, the player does the quest at dragon cave
        User:inform("Im Sarg findest du die �berreste des Zwerges aus deiner Vision. Du nimmst den losgel�sten Sch�del als Beweis f�r Obsidimine.",
            "Inside the coffin you find the remains of the dwarf from the vision.  You take the detached skull as proof for Obsidimine.")
        User:setQuestProgress(510, 22)
        return
    end

    if SourceItem.pos == position(742, 252, 0) then --OK, the player found entrance to Ushara Garden
        User:inform("Du f�hlst eine bes�nftigende Pr�senz und pl�tzlich findest du dich in einem Ort g�ttlicher Ruhe wieder.",
            "You feel a calming presence and suddenly find yourself in a place of divine tranquility.")
        world:gfx(41, User.pos)
        world:makeSound(13, User.pos)
        User:warp(position(785, 280, -3)) -- landing in restored garden
        world:gfx(41, User.pos)
        world:makeSound(13, User.pos)
        return
    end
    for i = 1, #dragonCaveCoffinPos do
        if (SourceItem.pos == dragonCaveCoffinPos[i]) then
            CoffinContents(User, SourceItem)
            return
        end
    end

    local isletmaCoffin = (SourceItem:getData("letmaCoffin") == "true")
    if (isletmaCoffin) then
        letmaCoffin(User, SourceItem)
        return
    end
end

function CoffinContents(User, coffinItem)

    -- skip if already tripped in the last 30 minutes
    local serverTime = world:getTime("unix")
    local trippingTime = coffinItem:getData("tripping_time")

    if (trippingTime ~= "" and ((tonumber(trippingTime) + 1800) > serverTime)) then
        User:inform("Du findest nichts in diesem Sarg.","You find nothing inside this coffin.")
        return
    end
    -- safe tripping time
    coffinItem:setData("tripping_time", serverTime)
    world:changeItem(coffinItem)

    local random_number = math.random(1,100)
    if random_number >= 0 and random_number <= 35 then
        User:inform("Bevor du hineischauen kannst, schl�gt dir �bler Geruch entgegen. Du schlie�t den Deckel, unf�hig ihn wieder zu �ffnen.",
            "The smell hits your nose before you can see inside, you drop the lid unable to open it any further.")
    elseif random_number >= 36 and random_number <= 70 then
        User:inform("Die �berreste im Sarg sind uralt und mumifiziert. Wer oder was es mal war ist unbekannt.",
            "The remains in the coffin are ancient and mummified.  Who or what they once were is unknown.")
    elseif random_number >= 71 and random_number <= 90 then
        User:inform("Du blickst kurz in den Sarg und entdeckst einen einfachen Dolch, den du f�r dich mitnimmst.",
            "You quickly glance in the coffin and discover a simple dagger which you take for your own.")
        common.CreateItem(User, 27, 1, 333, nil) -- simple dagger
    elseif random_number >= 91 and random_number <=100 then
        local monPos = common.getFreePos(coffinItem.pos, 2) -- radius 2 around vase
        world:createMonster(754, monPos, -20)
        world:gfx(41, monPos) -- swirly
        User:inform("Die st�rst die Ruhe der �berreste im Sarg und pl�tzlich greifen sie dich an!",
            "You disturb the remains in the coffin and they attack!")
    end
end

function letmaCoffin(User, letmaCoffinItem)

    -- skip if already tripped in the last 30 minutes
    local serverTime = world:getTime("unix")
    local trippingTime = letmaCoffinItem:getData("tripping_time")

    if (trippingTime ~= "" and ((tonumber(trippingTime) + 1800) > serverTime)) then
        User:inform("Du findest nichts in diesem Sarg.",
                    "You find nothing inside this coffin.")
        return
    end
    -- safe tripping time
    letmaCoffinItem:setData("tripping_time", serverTime)
    world:changeItem(letmaCoffinItem)

    local random_number = math.random(1,100)
    if random_number >= 0 and random_number <= 70 then
        User:inform("Im Sarg findest du einen verfallenen K�rper. Warum hast du es erneut ge�ffnet?", "Inside the coffin you find a decayed corpse. Why did you open this again?")
    elseif random_number >= 71 and random_number <=90 then
        local monPos = common.getFreePos(letmaCoffinItem.pos, 2) -- radius 2 around chest
        world:createMonster(981, monPos, -20)
        world:gfx(41, monPos) -- swirly
        User:inform("Ein Leichenfresser springt aus dem offenen Sarg und greift dich an.",
            "A corpse eater jumps from an opened coffin and attacks you.")
    elseif random_number >= 91 and random_number <= 100 then
        User:inform("Im Sarg findest du einen Rubinring an einem Knochenfinger. Jetzt ist er dein.","On a bony finger inside the coffin you find a ruby ring. It's yours now.")
        common.CreateItem(User, 68, 1, 666, nil) -- gold ruby ring
    end
end

return M
