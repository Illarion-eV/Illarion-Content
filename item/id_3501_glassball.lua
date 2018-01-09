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
local lookat = require("base.lookat")
local common = require("base.common")
local globalvar = require("base.globalvar")

local M = {}

local CHAR_FOUND_KEY = "person"
local CHAR_FOUND_MAX = "personMax"
local handOrBelt = {5,6,12,13,14,15,16,17}
local ID_TREASURE_MAP = 505
local TREASURE_FINDER_KEY = "treasureFinder"
local maxDistanceToTreasure = 10

local function findPersonFromList(user, item, players, charFoundNo, remainingChars)
    local titleText
    local descriptionText = ""
    local dialogOption = {}
    local cbDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialogOption[dialog:getSelectedIndex() + 1]
        if index == -1 then
            item:setData(CHAR_FOUND_KEY..tostring(charFoundNo + 1), user.name)
            item:setData(CHAR_FOUND_KEY,tostring(charFoundNo + 1))
            world:changeItem(item)
            world:gfx(globalvar.gfxCLAW,user.pos)
            common.InformNLS(user,"Dein Bild erscheint in der Glaskugel.",
                                  "Your picture is seen in the glass ball.")
        else
            local chosenPlayer = players[index]
            if not isValidChar(chosenPlayer) then
                common.InformNLS(user,"Die Glaskugel zeigt nur Rauschen.", "The glass ball shows noise only.")
                return
            end
            if chosenPlayer.id == user.id then
                common.InformNLS(user,"Die Glaskugel vibriert und zerspringt fast in deinen Händen. Vielleicht ist es besser, nicht sich selbst zu suchen.",
                                      "The glass ball vibrated and breaks almost in your hand. Maybe you shouldn't try to find yourself.")
                return
            end
            local targetPos = position(chosenPlayer.pos.x, chosenPlayer.pos.y, user.pos.z)
            local directionInfo = common.getDistanceHint(user, targetPos)
            common.InformNLS(user,"Die Person scheint sich " .. directionInfo.distance.de .. " im " .. directionInfo.direction.de .. " aufzuhalten.",
                                  "The person seems to be " .. directionInfo.distance.en .. " in the " .. directionInfo.direction.en .. ".")
            world:erase(item, 1)
            world:gfx(globalvar.gfxSPELL,user.pos)
        end
    end
    --Dialog to choose the player
    titleText = common.GetNLS(user,"Personensucher", "Person finder")
    if #players == 1 then
        descriptionText = common.GetNLS(user,"Du erkennst das Bild einer Person in der Glaskugel. Tippe das Bild der Person an, wenn du mehr über deren Aufentaltsort erfahren möchtest.",
                                             "You see pictures of one person in the glass ball. Tap the picture of the person to know more about.")
    elseif #players > 1 then
        descriptionText = common.GetNLS(user,"Du erkennst die Bilder einiger Personen in der Glaskugel. Tippe das Bild der Person an, über denen Aufentaltsort, du mehr erfahren möchtest.",
                                             "You see pictures of some persons in the glass ball. Tap the picture of the person you want to know more about.")
    end
    if  #players > 0 and remainingChars > 0 then
        descriptionText = descriptionText .. "\n"
    end
    if remainingChars > 0 then
        descriptionText = descriptionText .. common.GetNLS(user,"Tippe den freien Bereich der Glaskugel an, um dein Bild hier erscheinen zu lassen.",
                                                                "Tap the free space of the glas ball to see your picture here too.")
    end
    local sdDialog = SelectionDialog(titleText, descriptionText, cbDialog)
    if  #players > 0 then
        for i, player in ipairs(players) do
            sdDialog:addOption(3501, common.GetNLS(user,"Bild von ","Picture of ") .. player.name)
            table.insert(dialogOption, i)
        end
    end
    if remainingChars > 0 then
        sdDialog:addOption(463, common.GetNLS(user,"Hier könnte dein Bild sein.","This could be your picture."))
        table.insert(dialogOption, -1)
    end
    user:requestSelectionDialog(sdDialog)

end

local function findChar(user, item, charFoundNo)
    local players = {}
    local charFoundMax = tonumber(item:getData(CHAR_FOUND_MAX)) or 1
    local remainingChars = charFoundMax - charFoundNo
    
    if charFoundNo > 0 then
        local playersTmp = world:getPlayersOnline()
        for i=1, charFoundNo do
            local playerName = item:getData(CHAR_FOUND_KEY..tostring(i))
            for _, player in pairs(playersTmp) do
                if (player.name == playerName) then
                    table.insert(players, player)
                    if player.id == user.id then
                        remainingChars = 0
                    end
                end
            end
        end
    end

    if remainingChars < 1 and #players == 0 then
        common.HighInformNLS(user,"Die Glaskugel zeigt nichts als Rauschen. Du kannst niemanden finden.",
                                  "The glass ball shows nothing than a noise. You cannot find anybody.")
    else
        findPersonFromList(user, item, players, charFoundNo, remainingChars)
    end
end

local function findTreasure(user, item)
    for _, positionAtChar in pairs(handOrBelt) do
        local itemAtCharacter = user:getItemAt( positionAtChar )
        if ( itemAtCharacter ~= nil ) and ( itemAtCharacter.id == ID_TREASURE_MAP ) then
            local mapTargetX = tonumber(itemAtCharacter:getData("MapPosX"))
            local mapTargetY = tonumber(itemAtCharacter:getData("MapPosY"))
            local mapTargetZ = tonumber(itemAtCharacter:getData("MapPosZ"))
            if mapTargetX ~= nil and mapTargetY ~= nil and mapTargetZ ~= nil then
                local mapTarget = position(mapTargetX, mapTargetY, mapTargetZ)
                if user:distanceMetricToPosition(mapTarget) <= maxDistanceToTreasure then
                    common.InformNLS(user,"Die Glaskugel zerspringt ohne Scherben zu hinterlassen und verschwindet in deiner Nähe als magisches Licht im Boden.",
                                          "The glass ball breaks without any remaining shard and disappears as magic light nearby in the earth.")
                    world:gfx(globalvar.gfxSUN,mapTarget)
                    world:erase(item, 1)
                    return
                end
            end
        end
    end
    common.InformNLS(user,"Die Glaskugel zeigt nur Rauschen.", "The glass ball shows noise only.")
end

function M.LookAtItem(user, item)
    local lookAt = lookat.GenerateLookAt(user, item)
    local charFoundNo = tonumber(item:getData(CHAR_FOUND_KEY))
    if charFoundNo ~= nil then
        local charFoundMax = tonumber(item:getData(CHAR_FOUND_MAX)) or 1
        local shownText = ""
        for i=1, charFoundMax do
            local charText = item:getData(CHAR_FOUND_KEY..tostring(i))
            if common.IsNilOrEmpty(charText) then
                shownText = shownText .. common.GetNLS(user, "Platz für ein weiteres Bild","Space for another picture")
            else
                shownText = shownText .. common.GetNLS(user, "Bild von ","Picture of ") .. charText
            end
            if i < charFoundMax then
                shownText = shownText .. "\n"
            end
        end
        lookAt.description = shownText
    end

    return lookAt
end

function M.UseItem(user, item)
    local charFoundNo = tonumber(item:getData(CHAR_FOUND_KEY))
    if charFoundNo ~= nil then
        findChar(user, item, charFoundNo)
    end

    if item:getData(TREASURE_FINDER_KEY) == "true" then
        findTreasure(user, item)
    end
end

return M

