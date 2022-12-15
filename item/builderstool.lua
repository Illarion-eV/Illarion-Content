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


local M = {}

local function carpentrySelection(user)

    local callback = function(dialog)
        local success = dialog:getSuccess()

        if not success then
            return
        end

        local index = dialog:getSelectedIndex()+1

        if index == 1 then
            construction.showDialog(user, "carpentry", false)
        else
            construction.showDialog(user, "carpentry", true)
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user, "Auswahl", "Catalogue selection"), common.GetNLS(user, "Welche Schreinergegenstände möchtest du auswählen?", "Select which category of carpented items you want to access."), callback)

    dialog:addOption(0, common.GetNLS(user, "Normale Gegenstände", "Regular catalogue"))
    dialog:addOption(0, common.GetNLS(user, "Grundstücksgegenstände", "Estate catalogue"))

    user:requestSelectionDialog(dialog)
end


local function craftSelection(user)

    local skills = utility.getSkillsToShow(user)

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local index = dialog:getSelectedIndex()+1
            if skills[index].name == "carpentry" and utility.checkIfEstate(user) then
                carpentrySelection(user)
            else
                construction.showDialog(user, skills[index].name, nil)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"Handwerksauswahl","Skill Selection"), common.GetNLS(user,"Mit welchem Handwerk möchtest du Gegenstände herstellen?","Choose which skill you want to use to create items with."), callback)
    for _, skill in pairs(skills) do
        dialog:addOption(0,common.GetNLS(user,skill.displayDe,skill.displayEn))
    end
    dialog:setCloseOnMove()
    user:requestSelectionDialog(dialog)
end

local function destroySelection(user )

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
            else
                utility.deleteRoofItemOrTile(user, true)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"Abreißen","Destroy"), common.GetNLS(user,"Was möchtest du abreißen?","Choose type of destruction."), callback)
    dialog:addOption(0,common.GetNLS(user,"Gegenstände","Items"))
    dialog:addOption(0,common.GetNLS(user,"Schindeln","Tiles"))
    dialog:addOption(0,common.GetNLS(user,"Dachausrüstung","Roof Objects"))
    dialog:addOption(0,common.GetNLS(user,"Dachschindeln","Roof Tiles"))
    dialog:setCloseOnMove()
    user:requestSelectionDialog(dialog)
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
                    elseif selected == 4 and utility.checkIfEstate(user) then
                        utility.createLock(user)
                    elseif selected == 5 and utility.checkIfEstate(user) then
                        utility.createKey(user)
                    end
                else
                    user:inform("Du bist hierzu nicht berechtigt.","You do not have permission to do this.") -- This only happens if the user tries to cheat by turning while in dialog at property borders.
                end
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Sonstiges","Misc Menu"), common.GetNLS(user,"Was würdest du gerne tun?","Choose what to do."), callback)
    dialog:addOption(0,common.GetNLS(user,"Gegenstände haltbar machen","(Un)Make item static"))
    dialog:addOption(0,common.GetNLS(user,"Ein Hinweisschild beschriften","Write on Sign Post"))
    dialog:addOption(0,common.GetNLS(user,"Übers Wasser gehen","Make water walkable"))
    if utility.checkIfEstate(user) then
        dialog:addOption(0,common.GetNLS(user,"Schloss setzen","Create a lock"))
        dialog:addOption(0,common.GetNLS(user,"Schlüssel herstellen","Create a key"))
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

    local dialog = SelectionDialog(common.GetNLS(user,"Grundstücksverwaltung","Property Management"), common.GetNLS(user,"Was würdest du gerne tun?","Choose what to do below."), callback)

    dialog:addOption(0, common.GetNLS(user,"Füge einen Gast hinzu","Add Guest"))
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
        outlawRentDuration = common.GetNLS(user,"Du bist nun der Eigentümer für die nächsten "..utility.getRentDuration(user).." Monate. Ein Gamemaster muss während dieser Zeit die Frist verlängern oder das Grundstück wird wieder frei verfügbar.\n","You will remain the owner of this property for the next "..utility.getRentDuration(user).." months. A GM will have to renew your duration within that time or the property will be forfeit.\n")
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

    local dialog = SelectionDialog(common.GetNLS(user,"Menü","Menu"), common.GetNLS(user,"Was möchtest du gerne tun?",outlawRentDuration.."Choose what to do below."), callback)

    dialog:addOption(0,common.GetNLS(user,"Bauen","Build"))
    dialog:addOption(0,common.GetNLS(user,"Abreißen","Destroy"))
    dialog:addOption(0,common.GetNLS(user,"Sonstiges","Misc"))

    if Outlaw then
        dialog:addOption(0,common.GetNLS(user,"Grundstücksverwaltung","Property Management"))
    end

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)

end

function M.UseItem(user, sourceItem)

    local thePosition = common.GetFrontPosition(user)   --To prevent cheating by turning, the position is set at the very start(dialogue can only be set to close on movement)

    if not utility.checkIfIsInHand(user, sourceItem) then
        return
    end

    local propertyName = utility.fetchPropertyName(user)

    if not propertyName then
        user:inform("Du kannst nicht außerhalb eines Grundstückes bauen.","You can't build outside of property land.")
    elseif utility.allowBuilding(user) then
        mainDialog(user, sourceItem, thePosition)
    else
        user:inform("Du musst ein Bewohner sein, um hier bauen zu dürfen, oder eine Genehmigung haben.","To build here you must be the tenant of the property or have their permission.")
    end
end

return M
