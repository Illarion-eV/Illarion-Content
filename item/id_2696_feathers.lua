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

local VISION_KEY = "vision"
local NAME_KEY = "visionTarget"

local M = {}

local function inscribeName(user,item)
    local titleText
    local descriptionText
    local cbDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local index = dialog:getSelectedIndex()
        if index == 0 then
            item:setData(VISION_KEY,"2")
            item:setData(NAME_KEY,user.name)
            world:changeItem(item)
            common.InformNLS(user,"Du prägst deinen Namen in die Federn ein.",
                                  "You inscribe your name into the feathers.")
        end
    end
    titleText = common.GetNLS(user,"Federn der Visionen", "Vision Feathers")
    descriptionText = common.GetNLS(user,"Möchtest du deinen Namen in die Feder einprägen? Jemand anderes kann dir dann mit diesen Federn eine Nachricht schicken.",
                                         "Do you want to inscribe your name into the feathers? Anybody else will be able to send you a message using the feathers then.")
    local sdDialog = SelectionDialog(titleText, descriptionText, cbDialog)
    sdDialog:addOption(2696, common.GetNLS(user,"Ja","Yes"))
    sdDialog:addOption(228, common.GetNLS(user,"Nein","No"))
    user:requestSelectionDialog(sdDialog)
end

local function sendMessage(user, item, player)
    local titleText
    local descriptionText
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        
        local inputText = dialog:getInput()
        if not common.IsNilOrEmpty(inputText) then
            if player == nil then
                common.InformNLS(user,"Die Federn entwinden sich deinem Griff und kehren schnell zu dir zurück. Sie können die Zielperson nicht finden.",
                                      "The feathers unwind your fingers but return to you soon. Maybe they cannot find the target person.")
            else
                common.InformNLS(player,"In einer Vision plötzlich das Gesicht von "..user.name.." vor deinen Augen erscheint.\n"..
                                        user.name.." sagt: "..inputText,
                                        "Before your eyes a vision of the face of "..user.name.." appears.\n"..
                                        user.name.." says: "..inputText)
                common.InformNLS(user,"Die Federn entwinden sich deinem Griff und sind kurze Zeit später in alle Himmelsrichtungen verschwunden.",
                                      "The feathers unwind your fingers and fly in every direction. Within a blink of an eye they weren't seen anymore.")
                world:erase(item,1)
            end
        end
        
    end
    titleText = common.GetNLS(user,"Federn der Visionen", "Vision Feathers")
    descriptionText = common.GetNLS(user,"Welche Nachricht möchtest du an "..player.name.." schicken?",
                                         "Please enter the message you want to send to "..player.name..".")
    user:requestInputDialog(InputDialog(titleText, descriptionText ,false, 255, cbInputDialog))
end

local function findTarget(user,item)
    local searchedPlayer = item:getData(NAME_KEY)

    if searchedPlayer ~= user.name then
        local players = world:getPlayersOnline()
        for _, player in pairs(players) do
            if searchedPlayer == player.name then
                sendMessage(user, item, player)
                return
            end
        end
        common.InformNLS(user,"Die Federn entziehen sich deinem Griff. Vielleicht können sie zur Zeit nicht erkennen, wo sich die Zielperson aufhält?",
                              "You cannot catch the feathers due to their random movements. Maybe they don't know where to find the target person?")
    end
end

function M.LookAtItem(user, item)
    local visionLevel = item:getData(VISION_KEY)

    if visionLevel == "1" then
        lookat.SetSpecialDescription(item, "Auf den Federn findest du keinen Namen.", "You cannot see a name on the feathers.")
        lookat.SetSpecialName(item, "Federn der Visionen", "Vision Feathers")
    elseif visionLevel == "2" then
        local visionTarget = item:getData(NAME_KEY)
        if visionTarget == user.name then
            lookat.SetSpecialDescription(item, "Auf den Federn steht dein Name.", "You name is on the feathers.")
        else
            lookat.SetSpecialDescription(item, "Auf den Federn steht: '"..visionTarget.."'", "You read on the feathers: '"..visionTarget.."'")
        end
        lookat.SetSpecialName(item, "Federn der Visionen", "Vision Feathers")
    end
    return lookat.GenerateLookAt(user, item)
end

function M.UseItem(user, item, ltstate)
    local visionLevel = item:getData(VISION_KEY)
    if visionLevel == "1" then
        inscribeName(user,item)
    elseif visionLevel == "2" then
        findTarget(user,item)
    end
end

return M
