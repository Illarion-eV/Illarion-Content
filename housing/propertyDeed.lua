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
local propertyList = require("housing.propertyList")
local utility = require("housing.utility")

local M = {}

function M.LookAtItem(user, item)

    local lookAt

    for i = 1, #propertyList.propertyTable do
        if (item.pos == propertyList.propertyTable[i][3]) then
            lookAt = utility.propertyDeedLookAt(user, item)
        end
    end

    if lookAt then
        return lookAt
    else
        return lookat.GenerateLookAt(user, item, 0)
    end
end

function M.UseItem(user, SourceItem)
    for i = 1, #propertyList.propertyTable do
        if (SourceItem.pos == propertyList.propertyTable[i][3]) then
            local town = propertyList.propertyTable[i][7]
            local property = propertyList.propertyTable[i][1]
            local callback1 = function(dialogUnowned)
                local success = dialogUnowned:getSuccess()
                if success then
                    local selected = dialogUnowned:getSelectedIndex()+1
                    if selected == 1 then
                        utility.setOwner(user, SourceItem)
                    elseif selected == 2 then
                        utility.setRent(user, SourceItem)
                    else
                        utility.setReqRank(user, SourceItem)
                    end
                end
            end
            local callback2 = function(dialogOwnedByuser)
                local success = dialogOwnedByuser:getSuccess()
                if success then
                    local count = 0
                    local selected = dialogOwnedByuser:getSelectedIndex()+1

                    if utility.isAutomaticRentEnabled(property) then
                        if selected == 1 then
                            utility.payRent(user, SourceItem)
                        end
                        count = count + 1
                    end

                    if selected == 1+count then
                        utility.abandonPropertyDialog(user, SourceItem)
                    elseif selected == 2+count then
                        utility.setBuilderOrGuest(user, SourceItem, "builder")
                    elseif selected == 3+count then
                        utility.removeBuilderOrGuest(user, SourceItem, "builder")
                    elseif selected == 4+count then
                        utility.setBuilderOrGuest(user, SourceItem, "guest")
                    elseif selected == 5+count then
                        utility.removeBuilderOrGuest(user, SourceItem, "guest")
                    elseif selected == 6+count then
                        utility.setOwner(user, SourceItem)
                    elseif selected == 7+count then
                        utility.removeOwner(user, SourceItem)
                    elseif selected == 8+count then
                        utility.setRent(user, SourceItem)
                    elseif selected == 9+count then
                        utility.extendRent(user, SourceItem)
                    elseif selected == 10+count then
                        utility.setReqRank(user, SourceItem)
                    elseif selected == 11+count then
                        utility.setIndefiniteRent(user, SourceItem, property)
                    elseif selected == 12+count then
                        utility.allowAutomaticRentExtension(user, SourceItem)
                    end
                end
            end
            local callback3 = function(dialogOwnedNotByuser)
                local success = dialogOwnedNotByuser:getSuccess()
                if success then
                    local selected = dialogOwnedNotByuser:getSelectedIndex()+1
                    if selected == 1 then
                        utility.setBuilderOrGuest(user, SourceItem, "guest")
                    elseif selected == 2 then
                        utility.removeBuilderOrGuest(user, SourceItem, "guest")
                    elseif selected == 3 then
                        utility.setOwner(user, SourceItem)
                    elseif selected == 4 then
                        utility.removeOwner(user, SourceItem)
                    elseif selected == 5 then
                        utility.setRent(user, SourceItem)
                    elseif selected == 6 then
                        utility.extendRent(user, SourceItem)
                    elseif selected == 7 then
                        utility.setReqRank(user, SourceItem)
                    elseif selected == 8 then
                        utility.setIndefiniteRent(user, SourceItem, property)
                    else
                        utility.allowAutomaticRentExtension(user, SourceItem)
                    end
                end
            end
            local dialogUnowned = SelectionDialog(utility.getText(user,utility.getPropertyNameDE(SourceItem),utility.getPropertyName(SourceItem)) , utility.propertyInformation(user, SourceItem).."\n\n"..utility.getText(user,"Wähle aus, was du machen willst.","Select what you want to do.") , callback1)
            local dialogOwnedByuser = SelectionDialog(utility.getText(user,utility.getPropertyNameDE(SourceItem),utility.getPropertyName(SourceItem)) , utility.propertyInformation(user, SourceItem).."\n\n"..utility.getText(user,"Wähle aus, was du machen willst.","Select what you want to do.") , callback2)
            local dialogOwnedNotByuser = SelectionDialog(utility.getText(user,utility.getPropertyNameDE(SourceItem),utility.getPropertyName(SourceItem)) , utility.propertyInformation(user, SourceItem).."\n\n"..utility.getText(user,"Wähle aus, was du machen willst.","Select what you want to do.") , callback3)
            if utility.isAutomaticRentEnabled(property) then
                dialogOwnedByuser:addOption(0, utility.getText(user, "Miete zahlen", "Pay to extend rent duration"))
            end
            dialogOwnedByuser:addOption(0, utility.getText(user,"Mietverhältnis beenden","Abandon Property"))
            dialogOwnedByuser:addOption(0, utility.getText(user,"Erteile Rechte als Bauherr","Give Builder Permission"))
            dialogOwnedByuser:addOption(0, utility.getText(user,"Entziehe Rechte als Bauherr","Remove Builder Permission"))
            dialogOwnedByuser:addOption(0, utility.getText(user,"Gast hinzufügen","Add Guest"))
            dialogOwnedByuser:addOption(0, utility.getText(user,"Gast entfernen","Remove Guest"))
            if utility.checkIfLeaderOfTown(user, town) or user:isAdmin() then
                dialogUnowned:addOption(0, utility.getText(user,"Mieter eintragen","Set Tenant"))
                dialogUnowned:addOption(0, utility.getText(user,"Miete anpassen","Change Rent"))
                dialogUnowned:addOption(0, utility.getText(user,"Erforderlichen Rang anpassen","Change Required Rank"))
                dialogOwnedByuser:addOption(0, utility.getText(user,"Mieter eintragen","Set Tenant"))
                dialogOwnedByuser:addOption(0, utility.getText(user,"Mieter entfernen","Remove Tenant"))
                dialogOwnedByuser:addOption(0, utility.getText(user,"Miete anpassen","Change Rent"))
                dialogOwnedByuser:addOption(0, utility.getText(user,"Miete verlängern","Extend Rent"))
                dialogOwnedByuser:addOption(0, utility.getText(user,"Erforderlichen Rang anpassen","Change Required Rank"))
                dialogOwnedByuser:addOption(0, utility.getText(user,"Verwalte mietfreies Wohnen","Manage rent-free living"))
                dialogOwnedByuser:addOption(0, utility.getText(user,"Verwalte unbeaufsichtigte Mietverlängerung","(Dis)Allow Unsupervised Rent Extension"))
                dialogOwnedNotByuser:addOption(0, utility.getText(user,"Gast hinzufügen","Add Guest"))
                dialogOwnedNotByuser:addOption(0, utility.getText(user,"Gast entfernen","Remove Guest"))
                dialogOwnedNotByuser:addOption(0, utility.getText(user,"Mieter eintragen","Set Tenant"))
                dialogOwnedNotByuser:addOption(0, utility.getText(user,"Mieter entfernen","Remove Tenant"))
                dialogOwnedNotByuser:addOption(0, utility.getText(user,"Miete anpassen","Change Rent"))
                dialogOwnedNotByuser:addOption(0, utility.getText(user,"Miete verlängern","Extend Rent"))
                dialogOwnedNotByuser:addOption(0, utility.getText(user,"Miete anpassen","Change Required Rank"))
                dialogOwnedNotByuser:addOption(0, utility.getText(user,"Verwalte mietfreies Wohnen","Manage rent-free living"))
                dialogOwnedNotByuser:addOption(0, utility.getText(user,"Verwalte unbeaufsichtigte Mietverlängerung","(Dis)Allow Unsupervised Rent Extension"))
            end
            if utility.checkOwner(SourceItem) == "Unowned" then
                user:requestSelectionDialog(dialogUnowned)
            elseif utility.checkOwner(SourceItem) == user.id then
                user:requestSelectionDialog(dialogOwnedByuser)
            else
                user:requestSelectionDialog(dialogOwnedNotByuser)
            end
        end
    end
end
return M
