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
local factions = require("base.factions")

local M = {}


local licencePosCad = {position(105,550,0),position(105,595,0)} --Cadomyr
local licencePosRun = {position(932,801,0),position(790,800,0),position(870,890,0),position(932,801,1)} --Runewick
local licencePosGal = {position(360,235,0),position(345,280,0),position(390,330,-6),position(400,220,-6)} --Galmair

local licencerequired
local licenceQuestID

M.PERMISSION_NONE = 0    -- Permission for static tools is restricted
M.PERMISSION_ACTIVE = 1    -- Permission for static tools is granted

local function checkIfCharHasSpecialPermissions(char, townManagementItem)

    local status = townManagementItem:getData("licence"..char.id)

    if common.IsNilOrEmpty(status) then
        return nil
    elseif status == "granted" then
        return true
    elseif status == "restricted" then
        return false
    end

end

local function getTownManagementTool(town)

    local listOfTools = factions.townManagmentItemPos
    local location

    if town == "Cadomyr" then
        location = listOfTools[1]
    elseif town == "Runewick" then
        location = listOfTools[2]
    elseif town == "Galmair" then
        location = listOfTools[3]
    end

    if not location then
        return
    end

    local toolId = {3106, 3104, 3107}

    local field = world:getField(location)
    local itemsOnField = field:countItems()

    for i = 0, itemsOnField do
        local chosenItem = field:getStackItem(itemsOnField - i )
        for _, tool in pairs(toolId) do
            if tool == chosenItem.id then
                return chosenItem
            end
        end
    end

end

local function licenceCheck(char)

    local charIsOutlaw = factions.getMembership(char) == 0
    local charIsRank1 = factions.getRankAsNumber(char) == 1
    local charIsNewPlayer = char:isNewPlayer()
    local charIsNewbieProtected = false

    if charIsNewPlayer or (not charIsOutlaw and charIsRank1) then
        -- Newbie protection that is applied to those with new player status or rank 1 of a town.
        -- Does not protect against tool taxes if someone has applied them onto them specifically
        charIsNewbieProtected = true
    end

    local townName = factions.getTownNameByID(licencerequired)
    local townManagementItem = getTownManagementTool(townName)

    local char_has_special_permissions = checkIfCharHasSpecialPermissions(char, townManagementItem)
    local char_belongs_to_same_faction_as_tool = factions.getMembership(char) == licencerequired
    local char_has_purchased_license = char:getQuestProgress(licenceQuestID) > 0
    local town_has_activated_licence_requirement_for_chars_faction = M.GetLicenceByFaction(licencerequired, factions.getFaction(char).tid) == M.PERMISSION_NONE

    if not (char_belongs_to_same_faction_as_tool or char_has_purchased_license or char_has_special_permissions) and ((town_has_activated_licence_requirement_for_chars_faction and not charIsNewbieProtected) or char_has_special_permissions == false) then

        common.InformNLS(char,"Du besitzt keine Lizenz f�r die Verwendung der Werkzeuge dieser Stadt. Gehe ins Zensusb�ro, um dort eine zu erwerben und damit die Werkzeuge verwenden zu k�nnen oder werde B�rger dieser Stadt.","You do not have a licence for the use of static tools in this town. Go to the census office and purchase one in order to be able to use their static tools or become a citizen.") --player gets info to buy licence

        return true
    end

    return false

end

--- initialize the licence for all factions, only the current faction gets access
-- @param thisFaction The faction ID of the current faction
local function InitLicence(thisFaction)
    ScriptVars:set("Licence_".. thisFaction, 0)
    M.SetLicence(thisFaction, thisFaction, M.PERMISSIOM_ACTIVE)
    local factionNumbers = {0,1,2,3}
    for _,f in pairs(factionNumbers) do
        if (thisFaction ~= f) then
            M.SetLicence(thisFaction, f, M.PERMISSIOM_ACTIVE)
        end
    end
end

function M.licence(char)
        local AmountCad = #licencePosCad    --Cadomyr
        for i= 1,AmountCad do --loop for each tool-position (cadomyr)
            local licencePos = licencePosCad[i] --get coordinates from table
            local licenceDistance = char:distanceMetricToPosition (licencePos) --get distance from player
            if licenceDistance < 56 then --check if player is in range of tool
                licencerequired = 1 --set faction id for licenceCheck(char)
                licenceQuestID = 811 --set quest id for licenceCheck(char)
                return licenceCheck(char) --run licenceCheck(char) and return state to craft-id-script
            end
        end

        local AmountRun = #licencePosRun    --Runewick
        for i= 1,AmountRun do
            local licencePos = licencePosRun[i]
            local licenceDistance = char:distanceMetricToPosition (licencePos)
            if licenceDistance < 100 then
                licencerequired = 2
                licenceQuestID = 812
                return licenceCheck(char)
            end
        end

        local AmountGal = #licencePosGal    --Galmair
        for i= 1,AmountGal do
            local licencePos = licencePosGal[i]
            local licenceDistance = char:distanceMetricToPosition (licencePos)
            if licenceDistance < 81 then
                licencerequired = 3
                licenceQuestID = 813
                return licenceCheck(char)
            end
        end
end

--- get the licence for this faction by the other (hostile) faction
-- @param thisFaction The faction ID of the static tool
-- @param otherFaction The faction ID that is to be checked
function M.GetLicenceByFaction(thisFaction, otherFaction)
    local found, licence = ScriptVars:find("Licence_".. thisFaction)
    if not found then
        InitLicence(thisFaction)
        return M.GetLicenceByFaction(thisFaction, otherFaction)
    end
    licence = licence % (10^(otherFaction+1))
    licence = math.floor(licence / 10^otherFaction)
    return licence
end

--- set the licence for all guards of this faction
-- @param thisFaction The faction ID of the static tool
-- @param otherFaction The faction ID whose licence is to be changed
-- @param newLicence The new licence, e.g. PERMISSIOM_NONE
function M.SetLicence(thisFaction, otherFaction, newLicence)
    -- get licence for all factions
    local found, licenceAll = ScriptVars:find("Licence_".. thisFaction)
    local oldLicence
    if not found then
        InitLicence(thisFaction)
        M.SetLicence(thisFaction, otherFaction, newLicence)
        return
    else
        -- calculate the old licence for the otherFaction
        oldLicence = licenceAll % (10^(otherFaction+1))
        oldLicence = math.floor(oldLicence / 10^otherFaction)
    end
    -- subtract old licence
    licenceAll = licenceAll - (oldLicence * 10^(otherFaction))
    -- add new licence
    if newLicence == nil then --check if newLicence has a value and set it to 1 in case it does not. this will enable crafting then.
        newLicence = 1
    end
    licenceAll = licenceAll + (newLicence * 10^(otherFaction))
    -- set ScriptVar again
    licenceAll = math.max(0,math.min(9999, licenceAll)) -- must not be negative & exceed 9999 (3 towns + outcasts)
    ScriptVars:set("Licence_".. thisFaction, licenceAll)
end

return M
