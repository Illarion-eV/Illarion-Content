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

local utility = require("housing.utility")
local construction = require("housing.construction")
local common = require("base.common")
local metal = require("item.general.metal")


local M = {}

M.LookAtItem = metal.LookAtItem

local function overloadedSelection(user, skill)

    local isEstate = utility.checkIfEstate(user)

    local callback = function(dialog)
        local success = dialog:getSuccess()

        if not success then
            return
        end

        local index = dialog:getSelectedIndex()+1

        if index == 1 then
            construction.showDialog(user, skill, false, false)
        elseif index == 2 and skill ~= "mining" then
            construction.showDialog(user, skill, false, true)
        elseif (index == 3 or (index == 2 and skill == "mining")) and isEstate then
            construction.showDialog(user, skill, true, false)
        elseif (index == 4 or (index == 3 and skill == "mining")) and isEstate then
            construction.showDialog(user, skill, true, true)
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user, "Auswahl", "Catalogue selection"), common.GetNLS(user, "Welche Schreinergegenst�nde m�chtest du ausw�hlen?", "Select which category of carpented items you want to access."), callback)

    dialog:addOption(0, common.GetNLS(user, "Normale Gegenst�nde", "Regular catalogue"))
    if skill ~= "mining" then
        dialog:addOption(0, common.GetNLS(user, "Normale Gegenst�nde 2", "Regular catalogue 2"))
    end
    dialog:addOption(0, common.GetNLS(user, "Grundst�cksgegenst�nde", "Estate catalogue"))
    dialog:addOption(0, common.GetNLS(user, "Grundst�cksgegenst�nde 2", "Estate catalogue 2"))

    user:requestSelectionDialog(dialog)
end

local function assistBuilding(user)

    local propertyName = utility.fetchPropertyName(user)
    local deed = utility.getPropertyDeed(propertyName)

    local callback = function(dialog)

        local success = dialog:getSuccess()

        if not success then
            utility.removeHelper(user, deed)
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Beim Bauen helfen","Assist building"), common.GetNLS(user,"Solange dieses Dialogfenster ge�ffnet ist, stehst du nahegelegenen Spielern zur Verf�gung, um ihnen beim Bau gr��erer Projekte wie statischen Werkzeugen und Depots zu helfen.","While this dialog is open you will be available to nearby players to assist them in the building of larger projects such as static tools and depots."), callback)

    dialog:setCloseOnMove()
    user:requestSelectionDialog(dialog)
    utility.addHelper(user, deed)
end

local function craftSelection(user)

    local skills = utility.getSkillsToShow(user)

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local index = dialog:getSelectedIndex()
            if index == 0 then
                assistBuilding(user)
            elseif (skills[index].name == "carpentry" or skills[index].name == "mining") then --Carpentry and mining have too many items to display in one crafting menu alone, so they are separated into estate and shell housing categories
                overloadedSelection(user, skills[index].name)
            else
                construction.showDialog(user, skills[index].name, nil)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"Handwerksauswahl","Skill Selection"), common.GetNLS(user,"Mit welchem Handwerk m�chtest du Gegenst�nde herstellen?","Choose which skill you want to use to create items with."), callback)
    dialog:addOption(0,common.GetNLS(user,"Beim Bauen helfen","Assist building"))
    for _, skill in pairs(skills) do
        dialog:addOption(0,common.GetNLS(user,skill.displayDe,skill.displayEn))
    end
    dialog:setCloseOnMove()
    user:requestSelectionDialog(dialog)
end

local function destroySelection(user)

    local propertyName = utility.fetchPropertyName(user)

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                utility.destroyItem(user)
            elseif selected == 2 then
                utility.destroyTile(user)
            elseif selected == 3 then
                utility.deleteRoofItemOrTile(user, false)
            elseif selected == 4 then
                utility.deleteRoofItemOrTile(user, true)
            elseif selected == 5 then
                utility.demolishConfirmation(user, propertyName)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"Abrei�en","Destroy"), common.GetNLS(user,"Was m�chtest du abrei�en?","Choose type of destruction."), callback)
    dialog:addOption(0,common.GetNLS(user,"Gegenst�nde","Items"))
    dialog:addOption(0,common.GetNLS(user,"Schindeln","Tiles"))
    dialog:addOption(0,common.GetNLS(user,"Dachausr�stung","Roof Objects"))
    dialog:addOption(0,common.GetNLS(user,"Dachschindeln","Roof Tiles"))
    dialog:addOption(0, common.GetNLS(user, "Alles auf dem Grundst�ck abrei�en", "Demolish the entire estate"))
    dialog:setCloseOnMove()

    if utility.checkIfEstate(user) then
        user:requestSelectionDialog(dialog)
    else
        utility.destroyItem(user)
    end
end

local function miscDialog(user)
    local propertyName = utility.fetchPropertyName(user)

    local callback = function(dialog)

        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if propertyName then
                if utility.allowBuilding(user) then
                    if selected == 1 then
                        utility.makeStatic(user)
                    elseif selected == 2 then
                        utility.writeOnSignPost(user)
                    elseif selected == 3 then
                        utility.makeWaterWalkable(user)
                    elseif selected == 4 then
                        utility.setElevation(user)
                    elseif selected == 5 and utility.checkIfEstate(user) then
                        utility.createLock(user)
                    elseif selected == 6 and utility.checkIfEstate(user) then
                        utility.createKey(user)
                    end
                else
                    user:inform("Du bist hierzu nicht berechtigt.","You do not have permission to do this.") -- This only happens if the user tries to cheat by turning while in dialog at property borders.
                end
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Sonstiges","Misc Menu"), common.GetNLS(user,"Was w�rdest du gerne tun?","Choose what to do."), callback)
    dialog:addOption(0,common.GetNLS(user,"Gegenst�nde haltbar machen","(Un)Make item static"))
    dialog:addOption(0,common.GetNLS(user,"Ein Hinweisschild beschriften","Write on Sign Post"))
    dialog:addOption(0,common.GetNLS(user,"�bers Wasser gehen","Make water walkable"))
    dialog:addOption(0,common.GetNLS(user,"H�he einstellen","Set elevation"))
    if utility.checkIfEstate(user) then
        dialog:addOption(0,common.GetNLS(user,"Schloss setzen","Create a lock"))
        dialog:addOption(0,common.GetNLS(user,"Schl�ssel herstellen","Create a key"))
    end
    dialog:setCloseOnMove()
    user:requestSelectionDialog(dialog)
end

function M.propertyManagement(user)

    local property = utility.fetchPropertyName(user)

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if utility.allowBuilding(user) then
                if selected == 1 then
                    utility.setBuilderOrGuest(user, nil, "guest", property)
                elseif selected == 2 then
                    utility.removeBuilderOrGuest(user, nil, "guest", property)
                elseif selected == 3 then
                    utility.setBuilderOrGuest(user, nil, "builder", property)
                elseif selected == 4 then
                    utility.removeBuilderOrGuest(user, nil, "builder", property)
                end
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Grundst�cksverwaltung","Property Management"), common.GetNLS(user,"Was w�rdest du gerne tun?","Choose what to do below."), callback)

    dialog:addOption(0, common.GetNLS(user,"F�ge einen Gast hinzu","Add Guest"))
    dialog:addOption(0, common.GetNLS(user,"Entferne einen Gast","Remove Guest"))
    dialog:addOption(0, common.GetNLS(user,"Erteile Baugenehmigung","Give Builder's Permission"))
    dialog:addOption(0, common.GetNLS(user,"Entziehe Baugenehmigung","Remove Builder's Permission"))

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)
end

local function mainDialog(user, sourceItem)

    local outlawRentDuration = ""

    local Outlaw

    if utility.checkIfOutlaw(user) then
        Outlaw = true
        outlawRentDuration = common.GetNLS(user,"Du bist nun der Eigent�mer f�r die n�chsten "..utility.getRentDurationByUser(user).." Monate. Ein Gamemaster muss w�hrend dieser Zeit die Frist verl�ngern oder das Grundst�ck wird wieder frei verf�gbar.\n","You will remain the owner of this property for the next "..utility.getRentDurationByUser(user).." months. A GM will have to renew your duration within that time or the property will be forfeit.\n")
    end

    local propertyName = utility.fetchPropertyName(user)

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if propertyName then
                if utility.allowBuilding(user) then
                    if selected == 1 then
                        craftSelection(user, sourceItem)
                    elseif selected == 2 and utility.checkIfEstate(user) then
                        destroySelection(user)
                    elseif selected == 2 then
                        utility.destroyItem(user)
                    elseif selected == 3 then
                        miscDialog(user)
                    elseif selected == 4 then
                        M.propertyManagement(user)
                    end
                end
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Men�","Menu"), common.GetNLS(user,"Was m�chtest du gerne tun?",outlawRentDuration.."Choose what to do below."), callback)

    dialog:addOption(0,common.GetNLS(user,"Bauen","Build"))
    dialog:addOption(0,common.GetNLS(user,"Abrei�en","Destroy"))
    dialog:addOption(0,common.GetNLS(user,"Sonstiges","Misc"))

    if Outlaw then
        dialog:addOption(0,common.GetNLS(user,"Grundst�cksverwaltung","Property Management"))
    end

    dialog:setCloseOnMove()

    if utility.isTenant(user) then

        user:requestSelectionDialog(dialog)

    elseif utility.isBuilder(user) then

        craftSelection(user, sourceItem)

    end

end

function M.UseItem(user, sourceItem)

    if not utility.checkIfIsInHand(user, sourceItem) then
        return
    end

    local propertyName = utility.fetchPropertyName(user)

    if not propertyName then
        user:inform("Du kannst nicht au�erhalb eines Grundst�ckes bauen.","You can't build outside of property land.")
    else
        local allowed, informAlreadySent = utility.allowBuilding(user)

        if allowed then
            mainDialog(user, sourceItem)
        elseif not informAlreadySent then
            user:inform("Du musst ein Bewohner sein, um hier bauen zu d�rfen, oder eine Genehmigung haben.","To build here you must be the tenant of the property or have their permission.")
        end
    end
end

return M
