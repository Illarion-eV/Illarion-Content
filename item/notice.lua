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
local money = require("base.money")
local factions = require("base.factions")
local M = {}

M.propertyTable = {
-- 1property name,2DE name, 3position, 4default rent, 5keyID, 6doorID, 7town, 8required rank, 9required rank name, 10DE rank name, 11 estate(boolean)
-- Some of the information is not used and was there for a fully automated version of housing. It is kept in case of future need.
--Cadomyr
{"Villa Annabeth", "Villa Annabeth",position(93,617,0),40000,3054,340, "Cadomyr","7","Knight","Ritter"},
{"Villa Edward", "Villa Edward",position(89,606,0),40000,3054,341, "Cadomyr","7","Knight","Ritter",""},
{"Villa Reginald", "Villa Reginald",position(94,561,0),30000,3054,342, "Cadomyr","6","Squire","Knappe"},
{"Flat Faith and Obedience", "Wohnung Glaube und Gehorsam",position(137,605,0),5000,2558,361, "Cadomyr","4","Yeoman","Freisasse"},
{"Flat Honour and Lineage", "Wohnung Ehre und Abstammung",position(138,603,1),5000,2558,362, "Cadomyr","4","Yeoman","Freisasse"},
{"Flat Truth and Justice", "Wohnung Ehrlichkeit und Gerechtigkeit",position(136,609,0),10000,2558,363, "Cadomyr","5","Page","Page"},
{"Flat Courage", "Wohnung Mut",position(137,609,1),15000,2558,364, "Cadomyr","5","Page","Page"},
{"Flat Patriarchy", "Wohnung Patriarchat",position(135,614,0),15000,2558,365, "Cadomyr","5","Page","Page"},
{"Flat Property", "Wohnung Besitz",position(136,616,1),20000,2558,366, "Cadomyr","6","Squire","Knappe"},
--Runewick
{"First Fire Apartment", "Erstes Feuerapartment",position(945,756,0),30000,2558,240, "Runewick","3","Student","Student"},
{"Second Fire Apartment", "Zweites Feuerapartment",position(950,756,0),30000,2558,241, "Runewick","3","Student","Student"},
{"Third Fire Apartment", "Drittes Feuerapartment",position(958,758,0),60000,2558,242, "Runewick","6","Doctor","Doktor"},
{"Fourth Fire Apartment", "Viertes Feuerapartment",position(957,756,1),80000,2558,243, "Runewick","7","Docent","Dozent"},
{"First Air Apartment", "Erstes Luftapartment",position(958,839,1),70000,2558,210, "Runewick","6","Doctor","Doktor"},
{"Second Air Apartment", "Zweites Luftapartment",position(956,835,1),50000,2558,211, "Runewick","5","Master","Magister"},
{"First Earth Apartment", "Erstes Erdapartment",position(901,762,1),30000,2558,230, "Runewick","4","Scholar","Gelehrter"},
{"Second Earth Apartment", "Zweites Erdapartment",position(902,763,1),30000,2558,231, "Runewick","4","Scholar","Gelehrter"},
{"Third Earth Apartment", "Drittes Erdapartment",position(899,759,-3),30000,2558,233, "Runewick","4","Scholar","Gelehrter"},
{"Fourth Earth Apartment", "Viertes Erdapartment",position(899,769,-3),20000,2558,234, "Runewick","3","Student","Student"},
{"Fifth Earth Apartment", "Fünftes Erdapartment",position(902,755,-3),20000,2558,235, "Runewick","3","Student","Student"},
{"Sixth Earth Apartment", "Sechstes Erdapartment",position(900,755,-3),20000,2558,236, "Runewick","3","Student","Student"},
{"Cottage", "Landhaus",position(791,795,0),30000,2558,251, "Runewick","5","Master","Magister"},
{"Quadruped Red Bird","Vierbeiniger Roter Vogel",position(745,803,0),100000,2558,250, "Runewick","7","Docent","Dozent"},
--Galmair
{"House of Malachite","Malachithaus",position(372,323,0), 100000, 3056, 110, "Galmair", "7", "Patrician","Patrizier"},
{"Villa Goldvein","Villa Goldader", position(300, 281, 0), 80000, 3055, 111, "Galmair", "7", "Patrician","Patrizier"},
{"Flat Irmorom","Wohnung Irmorom",position(373,216,-6), 30000,2558,120, "Galmair","4","Grocer","Krämer"},
{"Flat Elara","Wohnung Elara",position(384,219,-6), 30000,2558,121, "Galmair","4","Grocer","Krämer"},
{"Flat Adron","Wohnung Adron",position(383,230,-6), 20000,2558,122, "Galmair","3","Pedlar","Hausierer"},
{"Flat Malachin","Wohnung Malachín",position(382,240,-6),20000,2558,123, "Galmair","3","Pedlar","Hausierer"},
{"Flat Oldra","Wohnung Oldra",position(376,238,-6),30000,2558,124, "Galmair","4","Grocer","Krämer"},
{"Flat Nargun","Wohnung Nargùn",position(383,240,-5),20000,2558,125, "Galmair","3","Pedlar","Hausierer"},
{"Flat Ronagan","Wohnung Ronagan",position(384,228,-5),20000,2558,126, "Galmair","3","Pedlar","Hausierer"},
{"Flat Sirani","Wohnung Sirani",position(385,220,-5),30000,2558,127, "Galmair","4","Grocer","Krämer"},
{"Flat Zhambra","Wohnung Zhambra",position(373,215,-5),30000,2558,128, "Galmair","4","Grocer","Krämer"},
{"Lucky Copper","Glückskupfer",position(416,289,1),40000,2558,113, "Galmair","5","Merchant","Kaufmann"},
{"Silver Profit","Silberner Verdienst",position(419,294,1),50000,2558,114, "Galmair","5","Merchant","Kaufmann"},
{"Golden Deal","Goldener Abschluss",position(419,291,1),60000,2558,115, "Galmair","6","Financier","Finanzier"},
{"Flat Sapphire","Wohnung Saphir",position(400,222,1),50000,2558,131, "Galmair","6","Financier","Finanzier"},
{"Flat Diamond","Wohnung Diamant",position(406,222,1),60000,2558,132, "Galmair","6","Financier","Finanzier"},
{"Flat Obsidian","Wohnung Obsidian",position(428,216,1),60000,2558,133, "Galmair","6","Financier","Finanzier"},
--Estates, Galmair
{"Galmair Harbour Estate","Hafengrundstück in Galmair",position(447,124,0),200000, 2558, 134, "Galmair", "7", "Patrician", "Patrizier", true},
{"Galmair Roadside Estate","Grundstück Am Wegesrand in Galmair",position(462,175,0),200000, 2558, 135, "Galmair", "7", "Patrician", "Patrizier", true},
{"Galmair Mountainside Estate","Grundstück Bergblick in Galmair",position(565,168,0),200000, 2558, 136, "Galmair", "7", "Patrician", "Patrizier", true},
--Cadomyr
{"Cadomyr Harbour Estate", "Hafengrundstück in Cadomyr",position(106,769,0),200000, 2558,368, "Cadomyr","7","Knight","Ritter"},
{"Cadomyr Riverside Estate", "Grundstück am Flussufer in Cadomyr",position(173,674,0),200000, 2558,369, "Cadomyr","7","Knight","Ritter"},
{"Cadomyr Seaside Estate", "Grundstück Meerblick in Cadomyr",position(49,661,0),200000, 2558,370, "Cadomyr","7","Knight","Ritter"},
--Runewick
{"Runewick Harbour Estate", "Hafengrundstück in Runewick",position(758,778,0),200000, 2558,252, "Runewick","7","Docent","Dozent"},
{"Runewick Forest Estate", "Waldgrundstück in Runewick",position(869,889,0),200000, 2558,253, "Runewick","7","Docent","Dozent"},
{"Runewick Roadside Estate", "Grundstück Am Wegesrand in Runewick",position(834,728,0),200000, 2558,254, "Runewick","7","Docent","Dozent"},
--Outlaw
{"Outlaw Base One", "Erstes Lager der Vogelfreien",position(967,243,0),200000,2558,504,"Outlaw","0","None","None"}
}
M.max_guest_number = 20
M.max_builder_number = 20
-- List of the different depot IDs
M.depotList={100,101,102,103}
function M.checkForPropertyDeed(User)
local targetTile = common.GetFrontPosition(User)
    for i = 1, #M.propertyTable do
        if targetTile == M.propertyTable[i][3] then
            return true
        end
    end
return false
end
-- Fetches the town a property belongs to based on property deed position
function M.getTownName(Item, property)
    if property then
        for i = 1, #M.propertyTable do
            if property == M.propertyTable[i][1] then
                return M.propertyTable[i][7]
            end
        end
    else
        for i = 1, #M.propertyTable do
            if (Item.pos == M.propertyTable[i][3]) then
                return M.propertyTable[i][7]
            end
        end
    end
end
-- Checks if the user is a leader of the specified town
function M.checkIfLeaderOfTown(User, Town)
    if Town == "Outlaw" then
        return false
    end
local home = factions.getMembershipByName(User)
    if (User:getQuestProgress(200) >= 8) and (home == Town) then
        return true
    else
        return false
    end
end
--Fetches the name of a property based on property deed position
function M.getPropertyName(Item)
    for i = 1, #M.propertyTable do
        if (Item.pos == M.propertyTable[i][3]) then
            return M.propertyTable[i][1]
        end
    end
end
--Fetches the german name of a property
function M.getPropertyNameDE(Item)
    for i = 1, #M.propertyTable do
        if (Item.pos == M.propertyTable[i][3]) then
            return M.propertyTable[i][2]
        end
    end
end
-- Returns a default rent value for when no rent value has been set by a GM
function M.getDefaultRent(Item, property)
    if property then
        for i = 1, #M.propertyTable do
            if property == M.propertyTable[i][1] then
                return M.propertyTable[i][4]
            end
        end
    else
        for i = 1, #M.propertyTable do
            if (Item.pos == M.propertyTable[i][3]) then
                return M.propertyTable[i][4]
            end
        end
    end
end
-- The lookAt for the property deed
function M.propertyDeedLookAt(User, Item)
  local lookAt = ItemLookAt()
    lookAt.name = common.GetNLS(User, "Grundstücksurkunde", "Property Deed")
    lookAt.description = common.GetNLS(User, "Grundstücksurkunde von "..M.getPropertyNameDE(Item)..".", "The Property Deed of "..M.getPropertyName(Item)..".")
    return lookAt
end
-- shortens common.GetNLS into getText
function M.getText(User,deText,enText)
    return common.GetNLS(User,deText,enText)
end
-- puts owners and guests of property back to NIL, making the property unowned
function M.removeOwner(User, Item, property)
local propertyName
    if property == nil then
        propertyName = M.getPropertyName(Item)
    else
        propertyName = property
    end
ScriptVars:remove("ownerof"..propertyName)
    for i = 1, M.max_builder_number do
        ScriptVars:remove("builder"..i..propertyName)
    end
    for i = 1, M.max_guest_number do
        ScriptVars:remove("guest"..i..propertyName)
    end
ScriptVars:remove("rentDuration"..propertyName)
ScriptVars:save()
User:inform(M.getText(User,"Vorheriger Mieter entfernt.","Previous renter removed."))
end
-- sets an owner
function M.setOwner(User, Item, propertyName)
local property
    if propertyName == nil then
        property = M.getPropertyName(Item)
    else
        property = propertyName
    end
    local callback = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
            if (input == nil or input == '') then
                User:inform(M.getText(User,"Das Namensfeld darf nicht leer sein.","The name field can not be empty."))
            elseif M.checkIfOwnsProperty(input) and not M.checkIfEstate(property) then
                User:inform(M.getText(User,"Der Charakter mietet bereits ein Grundstück.","Character already rents a property."))
            else
                M.removeOwner(User, Item, propertyName)
                ScriptVars:set("rentDuration"..property,1)
                ScriptVars:set("ownerof"..property,input)
                ScriptVars:save()
                User:inform(M.getText(User,input.."wurde als neuer Mieter eingetragen.",input.." set as new renter."))
                M.setSignature(User,Item, propertyName)
            end
    end
    User:requestInputDialog(InputDialog(M.getText(User,"Mieter eintragen","Set Renter"),
    M.getText(User,"Trag hier den Namen des neuen Mieters ein.",
    "Write in the name of who you want to set as the new renter."),
    false, 255, callback))
end
function M.setBuilderOrGuest(User, Item, builderOrGuest, propertyName)
local property
    if propertyName == nil then
        property = M.getPropertyName(Item)
    else
        property = propertyName
    end
local builderOrGuestDe
local textDe
local textEn
    if builderOrGuest == "builder" then
        builderOrGuestDe = ""
        textDe = ""
        textEn = ""
    elseif builderOrGuest == "guest" then
        builderOrGuestDe = ""
        textDe = "Schlüssel die diese Person hat, werden nicht länger von den Wachen konfisziert."
        textEn = "Keys they have will no longer be confiscated by the guards."
    end
    local callback = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (input == nil or input == '') then
            User:inform(M.getText(User,"Das Namensfeld darf nicht leer sein.","The name field can not be empty."))
        else
            for i = 1, M["max_"..builderOrGuest.."_number"] do
                local foundBuilderOrGuest = ScriptVars:find(builderOrGuest..i..property)
                if not foundBuilderOrGuest then
                    ScriptVars:set(builderOrGuest..i..property,input)
                    ScriptVars:save()
                    User:inform(M.getText(User,input..""..builderOrGuestDe.."."..textDe,input.." set as a "..builderOrGuest..". "..textEn))
                    return
                elseif i == M["max_"..builderOrGuest.."_number"] then
                    User:inform(M.getText(User,"","You may only have "..M["max_"..builderOrGuest.."_number"].." "..builderOrGuest.."s at a time. You must remove one if you want to add another." ))
                end
            end
        end
    end
    User:requestInputDialog(InputDialog(M.getText(User,"","Set "..builderOrGuest),
    M.getText(User,"",
    "Write in the name of who you want to set as a "..builderOrGuest),
    false, 255, callback))
end
function M.removeBuilderOrGuest(User, Item, builderOrGuest, propertyName)
local guestOrBuildersExist = false
local property
    if propertyName == nil then
        property = M.getPropertyName(Item)
    else
        property = propertyName
    end
local builderOrGuestDe
local dialogNameEn
local dialogNameDe
local skippedGuestSlots = 0
    if builderOrGuest == "builder" then
        builderOrGuestDe = ""
        dialogNameEn = "Builder's list"
        dialogNameDe = ""
    elseif builderOrGuest == "guest" then
        builderOrGuestDe = ""
        dialogNameEn = "Guest List"
        dialogNameDe = "Gästeliste"
    end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            for i = 1, M["max_"..builderOrGuest.."_number"] do
                local foundBuilderOrGuest, currentBuilderOrGuest = ScriptVars:find(builderOrGuest..i..property)
                if foundBuilderOrGuest then
                    if selected == i-skippedGuestSlots then
                        ScriptVars:remove(builderOrGuest..i..property)
                        ScriptVars:save()
                        User:inform(M.getText(User,currentBuilderOrGuest.." wurde von der Liste entfernt.",currentBuilderOrGuest.." has been removed from the list."))
                    end
                else
                    skippedGuestSlots = skippedGuestSlots+1
                end
            end
        end
    end
    local dialog = SelectionDialog(M.getText(User,dialogNameDe,dialogNameEn) ,
    M.getText(User,"Wähle einen Namen aus, der von der Liste entfernt werden soll.",
    "Select a name to remove them from the list.") , callback)
    for i = 1, M["max_"..builderOrGuest.."_number"] do
        local foundBuilderOrGuest, currentBuilderOrGuest = ScriptVars:find(builderOrGuest..i..property)
        if foundBuilderOrGuest then
            dialog:addOption(0, currentBuilderOrGuest)
            guestOrBuildersExist = true
        end
    end
    if guestOrBuildersExist then
        User:requestSelectionDialog(dialog)
    else
        User:inform(""..builderOrGuestDe.."","There are no "..builderOrGuest.."s to remove.")
    end
end

-- Fetches who the owner is
function M.checkOwner(Item)
local propertyName = M.getPropertyName(Item)
local foundOwner, currentOwner = ScriptVars:find("ownerof"..propertyName)
    if foundOwner then
        return currentOwner
    else
        return "Unowned"
    end
end
-- Overwrites the default required english name rank for a property
function M.setReqRank(User, Item, propertyName)
local property
    if propertyName == nil then
        property = M.getPropertyName(Item)
    else
        property = propertyName
    end
local town = M.getTownName(Item, propertyName)
    if town == "Outlaw" then
        User:inform("","Can't set required rank for non-town properties")
        return
    end
    local callback1 = function (dialogGalmair)
    local success = dialogGalmair:getSuccess()
        if success then
            local selected = dialogGalmair:getSelectedIndex()+1
            if selected == 1 then
                ScriptVars:set("nameEN"..property,"Patrician")
                ScriptVars:set("nameDE"..property,"Patrizier")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Patrizier gesetzt.","Required rank has been set to Patrician."))
            elseif selected == 2 then
                ScriptVars:set("nameEN"..property,"Financier")
                ScriptVars:set("nameDE"..property,"Finanzier")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Finanzier gesetzt.","Required rank has been set to Financier."))
            elseif selected == 3 then
                ScriptVars:set("nameEN"..property,"Merchant")
                ScriptVars:set("nameDE"..property,"Kaufmann")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Kaufmann gesetzt.","Required rank has been set to Merchant."))
            elseif selected == 4 then
                ScriptVars:set("nameEN"..property,"Grocer")
                ScriptVars:set("nameDE"..property,"Krämer")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Kr?r gesetzt.","Required rank has been set to Grocer."))
            elseif selected == 5 then
                ScriptVars:set("nameEN"..property,"Pedlar")
                ScriptVars:set("nameDE"..property,"Hausierer")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Hausierer gesetzt.","Required rank has been set to Pedlar."))
            elseif selected == 6 then
                ScriptVars:set("nameEN"..property,"Assistant")
                ScriptVars:set("nameDE"..property,"Gehilfe")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Gehilfe gesetzt.","Required rank has been set to Assistant."))
            else
                ScriptVars:set("nameEN"..property,"Tramp")
                ScriptVars:set("nameDE"..property,"Rumtreiber")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Rumtreiber gesetzt.","Required rank has been set to Tramp."))
            end
        end
    end
    local callback2 = function (dialogRunewick)
    local success = dialogRunewick:getSuccess()
        if success then
            local selected = dialogRunewick:getSelectedIndex()+1
            if selected == 1 then
                ScriptVars:set("nameEN"..property,"Docent")
                ScriptVars:set("nameDE"..property,"Dozent")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Dozent gesetzt.","Required rank has been set to Docent."))
            elseif selected == 2 then
                ScriptVars:set("nameEN"..property,"Doctor")
                ScriptVars:set("nameDE"..property,"Doktor")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Doktor gesetzt.","Required rank has been set to Doctor."))
            elseif selected == 3 then
                ScriptVars:set("nameEN"..property,"Master")
                ScriptVars:set("nameDE"..property,"Magister")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Magister gesetzt.","Required rank has been set to Master."))
            elseif selected == 4 then
                ScriptVars:set("nameEN"..property,"Scholar")
                ScriptVars:set("nameDE"..property,"Gelehrter")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Gelehrter gesetzt.","Required rank has been set to Scholar."))
            elseif selected == 5 then
                ScriptVars:set("nameEN"..property,"Student")
                ScriptVars:set("nameDE"..property,"Student")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Student gesetzt.","Required rank has been set to Student."))
            elseif selected == 6 then
                ScriptVars:set("nameEN"..property,"Apprentice")
                ScriptVars:set("nameDE"..property,"Anw?er")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Anw?er gesetzt.","Required rank has been set to Apprentice."))
            else
                ScriptVars:set("nameEN"..property,"Novice")
                ScriptVars:set("nameDE"..property,"Novize")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Novize gesetzt.","Required rank has been set to Novice."))
            end
        end
    end
    local callback3 = function (dialogCadomyr)
    local success = dialogCadomyr:getSuccess()
        if success then
            local selected = dialogCadomyr:getSelectedIndex()+1
            if selected == 1 then
                ScriptVars:set("nameEN"..property,"Knight")
                ScriptVars:set("nameDE"..property,"Ritter")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Ritter gesetzt.","Required rank has been set to Knight."))
            elseif selected == 2 then
                ScriptVars:set("nameEN"..property,"Squire")
                ScriptVars:set("nameDE"..property,"Knappe")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Knappe gesetzt.","Required rank has been set to Squire."))
            elseif selected == 3 then
                ScriptVars:set("nameEN"..property,"Page")
                ScriptVars:set("nameDE"..property,"Page")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Page gesetzt.","Required rank has been set to Page."))
            elseif selected == 4 then
                ScriptVars:set("nameEN"..property,"Yeoman")
                ScriptVars:set("nameDE"..property,"Freisasse")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Freisasse gesetzt.","Required rank has been set to Yeoman."))
            elseif selected == 5 then
                ScriptVars:set("nameEN"..property,"Servant")
                ScriptVars:set("nameDE"..property,"Diener")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Diener gesetzt.","Required rank has been set to Servant."))
            elseif selected == 6 then
                ScriptVars:set("nameEN"..property,"Bondsman")
                ScriptVars:set("nameDE"..property,"Höriger")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Höriger gesetzt.","Required rank has been set to Bondsman."))
            else
                ScriptVars:set("nameEN"..property,"Serf")
                ScriptVars:set("nameDE"..property,"Leibeigener")
                ScriptVars:save()
                User:inform(M.getText(User,"Der benötigte Rang wurde zu Leibeigener gesetzt.","Required rank has been set to Serf."))
            end
        end
    end
    local dialogGalmair = SelectionDialog(M.getText(User,
    "Benötigten Rang einstellen",
    "Set required rank"),
    M.getText(User,
    "Bestimme welcher Rang benötigt werden soll, um dieses Grundstück zu mieten.",
    "Choose which rank should be required to rent this property."),
    callback1)
    local dialogRunewick = SelectionDialog(M.getText(User,
    "Benötigten Rang einstellen",
    "Set required rank"),
    M.getText(User,
    "Bestimme welcher Rang benötigt werden soll, um dieses Grundstück zu mieten.",
    "Choose which rank should be required to rent this property."),
    callback2)
    local dialogCadomyr = SelectionDialog(M.getText(User,
    "Benötigten Rang einstellen",
    "Set required rank"),
    M.getText(User,
    "Bestimme welcher Rang benötigt werden soll, um dieses Grundstück zu mieten.",
    "Choose which rank should be required to rent this property."),
    callback3)
    dialogGalmair:addOption(0, M.getText(User,"Patrizier","Patrician"))
    dialogGalmair:addOption(0, M.getText(User,"Finanzier","Financier"))
    dialogGalmair:addOption(0, M.getText(User,"Kaufmann","Merchant"))
    dialogGalmair:addOption(0, M.getText(User,"Krämer","Grocer"))
    dialogGalmair:addOption(0, M.getText(User,"Hausierer","Pedlar"))
    dialogGalmair:addOption(0, M.getText(User,"Gehilfe","Assistant"))
    dialogGalmair:addOption(0, M.getText(User,"Rumtreiber","Tramp"))
    dialogRunewick:addOption(0, M.getText(User,"Dozent","Docent"))
    dialogRunewick:addOption(0, M.getText(User,"Doktor","Doctor"))
    dialogRunewick:addOption(0, M.getText(User,"Magister","Master"))
    dialogRunewick:addOption(0, M.getText(User,"Gelehrter","Scholar"))
    dialogRunewick:addOption(0, M.getText(User,"Student","Student"))
    dialogRunewick:addOption(0, M.getText(User,"Anw?er","Apprentice"))
    dialogRunewick:addOption(0, M.getText(User,"Novize","Novice"))
    dialogCadomyr:addOption(0, M.getText(User,"Ritter","Knight"))
    dialogCadomyr:addOption(0, M.getText(User,"Knappe","Squire"))
    dialogCadomyr:addOption(0, M.getText(User,"Page","Page"))
    dialogCadomyr:addOption(0, M.getText(User,"Freisasse","Yeoman"))
    dialogCadomyr:addOption(0, M.getText(User,"Diener","Servant"))
    dialogCadomyr:addOption(0, M.getText(User,"Höriger","Bondsman"))
    dialogCadomyr:addOption(0, M.getText(User,"Leibeigener","Serf"))
    if town == "Galmair" then
        User:requestSelectionDialog(dialogGalmair)
    elseif town == "Runewick" then
        User:requestSelectionDialog(dialogCadomyr)
    elseif town == "Cadomyr" then
        User:requestSelectionDialog(dialogCadomyr)
    end
end
-- Changes the rent of a property based on input
function M.setRent(User, Item, property)
local propertyName
    if property == nil then
        propertyName = M.getPropertyName(Item)
    else
        propertyName = property
    end
local rentEN = M.getRent(Item, propertyName)
local rentDE = M.getRentDE(Item, propertyName)
    local newRent = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"") ~= nil) then
            if tonumber(input) == nil then
                User:inform(M.getText(User,"Hier muss eine Zahl eingetragen werden.","Input must be a number."))
            elseif tonumber(input) <= 0 then
                User:inform(M.getText(User,"Die Zahl muss grösser als 0 sein.","You must set a number higher than 0."))
            else
                ScriptVars:set("rentfor"..propertyName,input)
                User:inform(M.getText(User,"Mietpreis auf "..input.." gesetzt.","Rent set to "..input))
                ScriptVars:save()
                M.setSignature(User,Item, propertyName)
            end
        else
            User:inform(M.getText(User,"Hier muss eine Zahl eingetragen werden.","Input must be a number."))
        end
    end
    User:requestInputDialog(InputDialog(M.getText(User,"Miete einstellen.","Set rent."), M.getText(User,"Aktuelle Miete: "..rentDE.."\nStelle eine neue monatliche Miete in Kupferstücken ein.","Current rent: "..rentEN.."\nSet a new monthly rent in coppers."), false, 255, newRent))
end
-- Returns the rent value divided into gold, silver and copper coins
function M.getRent(Item, property)
local propertyName
    if property == nil then
        propertyName = M.getPropertyName(Item)
    else
        propertyName = property
    end
local defaultRent = M.getDefaultRent(Item, property)
local foundRent, currentRent = ScriptVars:find("rentfor"..propertyName)
    if foundRent then
        local coins = tonumber(currentRent)
        local gCoins, sCoins, cCoins = money.MoneyToCoins(coins)
        if gCoins > 0 and sCoins == 0 and cCoins == 0 then
            return(gCoins.." gold coins per month.")
        elseif gCoins > 0 and sCoins > 0 and cCoins == 0 then
            return(gCoins.." gold and "..sCoins.." silver coins per month.")
        elseif gCoins > 0 and sCoins == 0 and cCoins > 0 then
            return(gCoins.." gold and "..cCoins.." copper coins per month.")
        elseif gCoins == 0 and sCoins > 0 and cCoins == 0 then
            return(sCoins.." silver coins per month.")
        elseif gCoins == 0 and sCoins > 0 and cCoins > 0 then
            return(sCoins.." silver and "..cCoins.." copper coins per month.")
        elseif gCoins == 0 and sCoins == 0 and cCoins > 0 then
            return(cCoins.." copper coins per month.")
        elseif gCoins > 0 and sCoins > 0 and cCoins > 0 then
            return(gCoins.." gold, "..sCoins.." silver and "..cCoins.." copper coins per month.")
        end
    else
        local coins = tonumber(defaultRent)
        local gCoins, sCoins, cCoins = money.MoneyToCoins(coins)
        if gCoins > 0 and sCoins == 0 and cCoins == 0 then
            return(gCoins.." gold coins per month.")
        elseif gCoins > 0 and sCoins > 0 and cCoins == 0 then
            return(gCoins.." gold and "..sCoins.." silver coins per month.")
        elseif gCoins > 0 and sCoins == 0 and cCoins > 0 then
            return(gCoins.." gold and "..cCoins.." copper coins per month.")
        elseif gCoins == 0 and sCoins > 0 and cCoins == 0 then
            return(sCoins.." silver coins per month.")
        elseif gCoins == 0 and sCoins > 0 and cCoins > 0 then
            return(sCoins.." silver and "..cCoins.." copper coins per month.")
        elseif gCoins == 0 and sCoins == 0 and cCoins > 0 then
            return(cCoins.." copper coins per month.")
        elseif gCoins > 0 and sCoins > 0 and cCoins > 0 then
            return(gCoins.." gold, "..sCoins.." silver and "..cCoins.." copper coins per month.")
        end
    end
end
function M.getRentDE(Item, property)
local propertyName
    if property == nil then
        propertyName = M.getPropertyName(Item)
    else
        propertyName = property
    end
local defaultRent = M.getDefaultRent(Item, property)
local foundRent, currentRent = ScriptVars:find("rentfor"..propertyName)
    if foundRent then
        local coins = tonumber(currentRent)
        local gCoins, sCoins, cCoins = money.MoneyToCoins(coins)
        if gCoins > 0 and sCoins == 0 and cCoins == 0 then
            return(gCoins.." Goldstücke pro Monat.")
        elseif gCoins > 0 and sCoins > 0 and cCoins == 0 then
            return(gCoins.." Gold- und "..sCoins.." Silberstücke pro Monat.")
        elseif gCoins > 0 and sCoins == 0 and cCoins > 0 then
            return(gCoins.." Gold- und "..cCoins.." Kupferstücke pro Monat.")
        elseif gCoins == 0 and sCoins > 0 and cCoins == 0 then
            return(sCoins.." Silberstücke pro Monat.")
        elseif gCoins == 0 and sCoins > 0 and cCoins > 0 then
            return(sCoins.." Silber- und "..cCoins.." Kupferstücke pro Monat.")
        elseif gCoins == 0 and sCoins == 0 and cCoins > 0 then
            return(cCoins.." Kupferstücke pro Monat.")
        elseif gCoins > 0 and sCoins > 0 and cCoins > 0 then
            return(gCoins.." Gold-, "..sCoins.." Silber- und "..cCoins.." Kupferstücke pro Monat..")
        end
    else
        local coins = tonumber(defaultRent)
        local gCoins, sCoins, cCoins = money.MoneyToCoins(coins)
        if gCoins > 0 and sCoins == 0 and cCoins == 0 then
            return(gCoins.." Goldstücke pro Monat.")
        elseif gCoins > 0 and sCoins > 0 and cCoins == 0 then
            return(gCoins.." Gold- und "..sCoins.." Silberstücke pro Monat.")
        elseif gCoins > 0 and sCoins == 0 and cCoins > 0 then
            return(gCoins.." Gold- und "..cCoins.." Kupferstücke pro Monat.")
        elseif gCoins == 0 and sCoins > 0 and cCoins == 0 then
            return(sCoins.." Silberstücke pro Monat.")
        elseif gCoins == 0 and sCoins > 0 and cCoins > 0 then
            return(sCoins.." Silber- und "..cCoins.." Kupferstücke pro Monat.")
        elseif gCoins == 0 and sCoins == 0 and cCoins > 0 then
            return(cCoins.." Kupferstücke pro Monat.")
        elseif gCoins > 0 and sCoins > 0 and cCoins > 0 then
            return(gCoins.." Gold-, "..sCoins.." Silber- und "..cCoins.." Kupferstücke pro Monat..")
        end
    end
end

function M.checkIfEstate(propertyName)
    for i = 1, #M.propertyTable do
        if propertyName == M.propertyTable[i][1] then
            if M.propertyTable[i][11] then
                return true
            end
        end
    end
return false
end
function M.checkIfOwnsProperty(Input)
    for i = 1, #M.propertyTable do
        local propertyName = M.propertyTable[i][1]
        local foundOwner, currentOwner = ScriptVars:find("ownerof"..propertyName)
        if foundOwner then
            if currentOwner == Input then
                if not M.checkIfEstate(propertyName) then
                    return true
                end
            end
        end
    end
return false
end

function M.checkIfPlayerIsGuest(User, property)
    for i = 1, M.max_guest_number do
        local foundGuest, currentGuest = ScriptVars:find("guest"..i..property)
        if foundGuest then
            if currentGuest == User.name then
                return true
            end
        end
    end
return false
end
-- Returns how many rent months remain
function M.getRentDuration(Item)
local propertyName = M.getPropertyName(Item)
local foundCurrentRentDuration, currentRentDuration = ScriptVars:find("rentDuration"..propertyName)
    if foundCurrentRentDuration then
        return currentRentDuration
    else
        return "No rent duration found."
    end
end
--On a monthly cooldown in scheduled scripts, reduces all properties rentduration by 1
function M.reduceRentTimer()
    for i = 1, #M.propertyTable do
        local foundCurrentRentDuration, currentRentDuration = ScriptVars:find("rentDuration"..(M.propertyTable[i][1]))
        if foundCurrentRentDuration == true and tonumber(currentRentDuration) > 0 then
            ScriptVars:set("rentDuration"..(M.propertyTable[i][1]), (tonumber(currentRentDuration)-1))
        end
    end
ScriptVars:save()
end
-- Returns how many keys a character has in their depot
function M.charOwnedDepotKeys(char)
    for i = 1, #M.depotList do
    local depNr = M.depotList[i]
    local depot = char:getDepot(depNr)
        if depot then
            local ownedDepotKeys = (depot:countItem(2558))+(depot:countItem(3054))+(depot:countItem(3055))+(depot:countItem(3056))
            if ownedDepotKeys >= 1 then
                return ownedDepotKeys
            else
                return "0"
            end
        end
    end
end
-- Returns how many keys a character has on them
function M.charOwnedKeys(char)
    return ((char:countItem(2558))+(char:countItem(3054))+(char:countItem(3055))+(char:countItem(3056)))
end
-- Deletes keys where appropriate
function M.deleteKeys(char)
    for i = 1, #M.propertyTable do --Go through all properties
    local town = M.propertyTable[i][7]
        if not M.checkIfLeaderOfTown(char, town) then --Check if leader of town
            local propertyName = M.propertyTable[i][1] -- Fetch name of property
            local foundOwner, currentOwner = ScriptVars:find("ownerof"..propertyName) --Fetch owner of property
            if foundOwner then --Check if there is an owner of the property
                if not (char.name == currentOwner) and not M.checkIfPlayerIsGuest(char, propertyName) then -- Check if the character is the owner or guest of the property the key belongs to
                    local keyID = M.propertyTable[i][6] --Fetch what lock the key belongs to
                    local keyType = M.propertyTable[i][5] -- Fetch what type of key item it is
                    local keyAmount = char:countItemAt("all",keyType,{["lockId"]=keyID}) -- Fetch how many keys character has in inventory
                    local depotKeyAmount = M.charOwnedDepotKeys(char) -- Fetch how many keys character has in depot
                    for y = 1, keyAmount do
                        char:eraseItem(keyType,1,{["lockId"]=keyID})
                    end
                    for x = 1, #M.depotList do
                    local depNr = M.depotList[x]
                    local depot = char:getDepot(depNr)
                        if depot then
                            if depotKeyAmount ~= nil then
                                for z = 1, depotKeyAmount do
                                depot:eraseItem(keyType,1,{["lockId"]=keyID})
                                end
                            end
                        end
                    end
                end
            else
                local keyID = M.propertyTable[i][6]
                local keyType = M.propertyTable[i][5]
                local keyAmount = char:countItemAt("all",keyType,{["lockId"]=keyID})
                local depotKeyAmount = M.charOwnedDepotKeys(char)
                for y = 1, keyAmount do
                    char:eraseItem(keyType,1,{["lockId"]=keyID})
                end
                for x = 1, #M.depotList do
                local depNr = M.depotList[x]
                local depot = char:getDepot(depNr)
                    if depot then
                        if depotKeyAmount ~= nil then
                            for z = 1, depotKeyAmount do
                                depot:eraseItem(keyType,1,{["lockId"]=keyID})
                            end
                        end
                    end
                end
            end
        end
    end
end
-- Used in login script to retrieve keys a character should not possess
function M.keyRetrieval(char)
    -- check if character owns any keys
    if (M.charOwnedKeys(char) == 0) and (M.charOwnedDepotKeys(char) == nil) then
        return
    elseif char:isAdmin() then
        return
    else
        M.deleteKeys(char)
    end
end
-- Fetch the name of the required rank for the property in English
function M.getRequiredRankName(Item, language)
local property = M.getPropertyName(Item)
local foundDE, getDE = ScriptVars:find("nameDE"..property)
local foundEN, getEN = ScriptVars:find("nameEN"..property)
    for i = 1, #M.propertyTable do
        if (Item.pos == M.propertyTable[i][3]) then
            if (language == "DE") and foundDE then
                return getDE
            elseif (language == "EN") and foundEN then
                return getEN
            elseif language == "DE" then
                return M.propertyTable[i][10]
            elseif language == "EN" then
                return M.propertyTable[i][9]
            end
        end
    end
end
-- Message dialog that show information about property
function M.getRankTitle(player, language)
local Faction = factions.getFaction(player);
    if player:isAdmin() then
        return
    end
    if (player:increaseAttrib("sex",0) == 0) then --male Ranks
        if language == "DE" then
            return factions.townRanks[Faction.tid][Faction.rankTown].gRank;
        elseif language == "EN" then
            return factions.townRanks[Faction.tid][Faction.rankTown].eRank;
        end
    elseif language == "DE" then
        return factions.townRanks[tonumber(Faction.tid)+3][Faction.rankTown].gRank;
    elseif language == "EN" then
        return factions.townRanks[tonumber(Faction.tid)+3][Faction.rankTown].eRank;
    end
end
function M.setSignature(User,Item, propertyName)
local property
    if propertyName == nil then
        property = M.getPropertyName(Item)
    else
        property = propertyName
    end
local rankTitleEN = M.getRankTitle(User, "EN")
local rankTitleDE = M.getRankTitle(User, "DE")
local name = User.name
    if User:isAdmin() then
        ScriptVars:set("signatureEN"..property, "The Quartermaster")
        ScriptVars:set("signatureDE"..property, "der Quartiermeister")
        ScriptVars:save()
    else
        ScriptVars:set("signatureEN"..property, rankTitleEN.." "..name)
        ScriptVars:set("signatureDE"..property, rankTitleDE.." "..name)
        ScriptVars:save()
    end
end
function M.getSignature(Item, language)
local property = M.getPropertyName(Item)
local foundSignatureEN, signatureEN = ScriptVars:find("signatureEN"..property)
local foundSignatureDE, signatureDE = ScriptVars:find("signatureDE"..property)
    if (language == "DE") and foundSignatureEN then
        return signatureDE
    elseif (language == "EN") and foundSignatureDE then
        return signatureEN
    elseif (language == "DE") then
        return "der Quartiermeister"
    else
        return "the Quartermaster"
    end
end
function M.getTownLeaderTitle(town, language)
    if (town == "Galmair") and (language == "DE") then
        return "Kanzler"
    elseif (town == "Galmair") and (language == "EN") then
        return "Chancellor"
    elseif (town == "Runewick") and (language == "DE") then
        return "Ratsmitglied"
    elseif (town == "Runewick") and (language == "EN") then
        return "Councillor"
    elseif (town == "Cadomyr") and (language == "DE") then
        return "Adeligen"
    elseif (town == "Cadomyr") and (language == "EN") then
        return "Noble"
    end
end
function M.propertyInformation(User, Item)
local town = M.getTownName(Item)
local rent = M.getRent(Item)
local rentDE = M.getRentDE(Item)
local property = M.getPropertyName(Item)
local propertyDE = M.getPropertyNameDE(Item)
local rank = M.getRequiredRankName(Item, "EN")
local rankDE = M.getRequiredRankName(Item, "DE")
local remainingDuration = M.getRentDuration(Item)
local owner = M.checkOwner(Item)
local signatureEN = M.getSignature(Item, "EN")
local signatureDE = M.getSignature(Item, "DE")
local townLeaderTitle = M.getTownLeaderTitle(town, "EN")
local townLeaderTitleDE = M.getTownLeaderTitle(town, "DE")
    if M.checkOwner(Item) == "Unowned" then -- Shows info specific for when property is unowned
        local propertyInfo = MessageDialog(M.getText(User,"Notiz des Quartiermeisters","Quartermaster's notice"),
        M.getText(User,
        "Bürger von "..town..
        ",\nihr könnt nun die "..propertyDE..
        " zum Preis von "..rentDE..
        " mieten. Um dieses Grundstück mieten zu können, müsst ihr zumindest "..rankDE..
        " sein. Solltest du dieses Grundstück mieten wollen, wende dich an den Quartiermeister oder melde \z
        dich bei einem "..townLeaderTitleDE..
        "~Unterzeichnet, "..signatureDE,
        "Citizen of "..town..
        ",\nit is now possible to rent the "..property..
        " at a price of "..rent..
        " Renting this property requires at minimum the rank of "..rank..
        ". Should you seek to rent this property, please seek out the quartermaster or one of your "..townLeaderTitle..
        "s.\n~Signed, "..signatureEN),
        function() end)
        User:requestMessageDialog(propertyInfo)
    elseif M.checkOwner(Item) == User.name then -- Shows info specific for when property is owned by user
        local propertyInfo = MessageDialog(M.getText(User,"Notiz des Quartiermeisters","Quartermaster's notice"),
        M.getText(User,
        "An den aktuell Bewohner von"..propertyDE..
        ",\n,es wird von Euch erwartet, dass Ihr die Miete von "..rentDE..
        " bezahlt.\n Ohne zusätzliche Zahlungen, läuft das aktuelle Mietverhältnis in "..remainingDuration..
        " Monaten aus.\nFür weitere Fragen oder Anmerkungen, wende dich an den Quartiermeister oder melde dich \z
        bei einem  "..townLeaderTitleDE..
        ".\n~Unterzeichnet, "..signatureDE,
        "To the current inhabitant of "..property..
        ",\nLet it be known that you are expected to pay a rent of "..rent..
        " Without additional payments, your current lease expires in "..remainingDuration..
        " months.\nFor additional questions or concerns, please seek out the quartermaster or one of \z
        your "..townLeaderTitle..
        "s.\n~Signed, "..signatureEN),
        function() end)
        User:requestMessageDialog(propertyInfo)
    else -- Shows info specific for when property is owned but not by user.
         local propertyInfo = MessageDialog(M.getText(User,"Notiz des Quartiermeisters","Quartermaster's notice"),
         M.getText(User,
        "Bürger von "..town..
        ",\n dieses Grundstück ist aktuell gemietet von "..owner..
        ". Solltest du irgendwelche Bedenken haben oder ein freies Grundstück mieten wollen, wende dich bitte an \z
        den Quartiermeister oder melde dich bei einem "..townLeaderTitleDE..
        ".\nUnterzeichnet, "..signatureDE,
        "Citizen of "..town..
        ",\nThis property is currently being leased to "..owner..
        ". Should you have any concerns, or wish to rent a property that is currently available, please \z
        seek out the quartermaster or one of your "..townLeaderTitle..
        "s.\n~Signed, "..signatureEN),
        function() end)
        User:requestMessageDialog(propertyInfo)
    end
end
-- Remove user as tenant at users own volition
function M.abandonPropertyDialog(User, Item)
    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                M.abandonProperty(User, Item)
                User:inform(M.getText(User,"Nachdem du dem Quartiermeister den Schlüssel zurückgegeben hast, verabschiedest du dich von deinem alten Heim. Wo wirst du nun schlafen?","Having returned the key to the Quartermaster, you bid farewell to your old home. Now where will you sleep?"))
            else
                User:inform(M.getText(User,"Du hast dich entschieden das Mietverhältnis nicht zu beenden. ","You decide against giving up on your lease for the property."))
            end
        end
    end
    local dialog = SelectionDialog(M.getText(User,"Mietverhältnis beenden","Abandon property"),M.getText(User,"Bist du dir sicher, dass du das bestehende Mietverhältnis kündigen möchtest? Überschüssiges Geld wird nicht ausgezahlt.","Are you sure you want to abandon your lease on the property? Any remaining rent money will not be returned."),callback)
    dialog:addOption(0, M.getText(User,"Ja, Mietverhältnis beenden","Yes, abandon it"))
    dialog:addOption(0, M.getText(User,"Nein, ich habe meine Meinung ge?ert","No, I changed my mind"))
    User:requestSelectionDialog(dialog)
end
function M.abandonProperty(User, Item)
    local propertyName = M.getPropertyName(Item)
    ScriptVars:remove("ownerof"..propertyName)
    for i = 1, M.max_builder_number do
        ScriptVars:remove("builder"..i..propertyName)
    end
    for i = 1, M.max_guest_number do
        ScriptVars:remove("guest"..i..propertyName)
    end
    ScriptVars:remove("rentDuration"..propertyName)
    M.keyRetrieval(User)
    ScriptVars:save()
end
-- GM/PL extend rent at no cost option
function M.extendRent(User, Item, property)
local propertyName
    if property == nil then
        propertyName = M.getPropertyName(Item)
    else
        propertyName = property
    end
local foundCurrentRentDuration, currentRentDuration = ScriptVars:find("rentDuration"..propertyName)
    if not foundCurrentRentDuration then
        return
    end
    local extendRent = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"") ~= nil) then
            if tonumber(input) == nil then
                User:inform(M.getText(User,"Hier muss eine Zahl eingetragen werden.","Input must be a number."))
            elseif tonumber(input) <= 0 then
                User:inform(M.getText(User,"Die Zahl muss grösser als 0 sein.","You must set a number higher than 0."))
            elseif (tonumber(input)+currentRentDuration) > 48 then
                User:inform(M.getText(User,"Die Mietdauer darf 48 Monate nicht überschreiten.","Rent duration can not exceed 48 months."))
            else
                ScriptVars:set("rentDuration"..propertyName,(currentRentDuration+input))
                User:inform(M.getText(User,"Mietdauer verlängert um"..input.." Monate","Rent duration extended by "..input.." months"))
                ScriptVars:save()
            end
        else
            User:inform(M.getText(User,"Hier muss eine Zahl eingetragen werden.","Input must be a number."))
        end
    end
    User:requestInputDialog(InputDialog(M.getText(User,"Miete verlängern","Extend rent"), M.getText(User,"Mietdauer für den aktuellen Mieter umsonst verlängern.\n Derzeit betr? die Mietdauer noch "..currentRentDuration.." Monate.","Extend rent for current renter at no charge.\n There's currently "..currentRentDuration.." months left on the lease."), false, 255, extendRent))
end
-- If rent duration is up, the renter gets removed
function M.removeRentalIfDurationIsUp()
    for i = 1, #M.propertyTable do
        local propertyName = M.propertyTable[i][1]
        local foundDuration, currentDuration = ScriptVars:find("rentDuration"..propertyName)
        if foundDuration then
            if currentDuration == nil then
                ScriptVars:remove("ownerof"..propertyName)
                for number = 1, M.max_builder_number do
                    ScriptVars:remove("builder"..number..propertyName)
                end
                for number = 1, M.max_guest_number do
                    ScriptVars:remove("guest"..number..propertyName)
                end
                ScriptVars:remove("rentDuration"..propertyName)
                ScriptVars:save()
            elseif currentDuration == 0 then
                ScriptVars:remove("ownerof"..propertyName)
                for number = 1, M.max_builder_number do
                    ScriptVars:remove("builder"..number..propertyName)
                end
                for number = 1, M.max_guest_number do
                    ScriptVars:remove("guest"..number..propertyName)
                end
                ScriptVars:remove("rentDuration"..propertyName)
                ScriptVars:save()
            else
                return
            end
        end
    end
end

-- Removes you as renter if you change citizenship
function M.removeRentalOfPropertiesOfOtherTowns(User)
    for i = 1, #M.propertyTable do
        local propertyName = M.propertyTable[i][1]
        local propertyNameDE = M.propertyTable[i][2]
        local foundOwner, currentOwner = ScriptVars:find("ownerof"..propertyName)
        local town = M.propertyTable[i][7]
        if foundOwner then
            if currentOwner == User.name then
                ScriptVars:remove("ownerof"..propertyName)
                for number = 1, M.max_builder_number do
                    ScriptVars:remove("builder"..number..propertyName)
                end
                for number = 1, M.max_guest_number do
                    ScriptVars:remove("guest"..number..propertyName)
                end
                ScriptVars:remove("rentDuration"..propertyName)
                M.keyRetrieval(User)
                ScriptVars:save()
                if town == "Outlaw" then
                    User:inform("","Having become a citizen of a town, you are no longer eligible to keep former properties that do not belong to the town.")
                else
                    User:inform("Nachdem du nicht länger Bürger von "..town.." bist, hast du das Recht auf deinen Mietanspruch auf die "..propertyNameDE.." verloren und wirst gezwungen die Schlüssel zurückzugeben.","Because you are no longer a citizen of "..town.." you have forfeited the lease on the "..propertyName.." and been made to return your keys.")
                end
            end
        end
    end
end
--Inform user about their keys being confiscated upon login
function M.informUserOfKeyRetrieval(User)
    for i = 1, #M.propertyTable do
        local propertyName = M.propertyTable[i][1]
        local foundOwner, currentOwner = ScriptVars:find("ownerof"..propertyName)
        local town = M.propertyTable[i][7]
        for number = 1, M.max_guest_number do
            local foundGuest, currentGuest = ScriptVars:find("guest"..number..propertyName)
            if foundGuest then
                if currentGuest == User.name then
                    return
                end
            end
        end
        if foundOwner then
            if currentOwner ~= User.name then
                if M.checkIfLeaderOfTown(User, town) or User:isAdmin() then
                    return
                else
                local keyID = M.propertyTable[i][6]
                local keyType = M.propertyTable[i][5]
                local keyAmount = User:countItemAt("all",keyType,{["lockId"]=keyID})
                local depotKeyAmount = M.charOwnedDepotKeys(User)
                    if tonumber(keyAmount) > 0 and town ~= "Outlaw" then
                        User:inform(M.getText(User,"Bei deinem letzten Besuch in "..town.." wurden bei einer routinem?gen Taschenkontrolle durch die Wachen Schlüssel, die du nicht besitzen solltest, gefunden und konfisziert.","Upon your latest visit to "..town.." some keys you were not supposed to have were confiscated by the guards in a random bag check at the gates."))
                        return
                    elseif depotKeyAmount ~= nil then
                        if tonumber(depotKeyAmount) > 0 and town ~= "Outlaw"  then
                            User:inform(M.getText(User,"Bei deinem letzten Besuch in "..town.." wurden bei einer routinem?gen Taschenkontrolle durch die Wachen Schlüssel, die du nicht besitzen solltest, gefunden und konfisziert.","Upon your latest visit to "..town.." some keys you were not supposed to have were confiscated by the guards in a random bag check at the gates."))
                            return
                        end
                    end
                end
            end
        elseif M.checkIfLeaderOfTown(User, town) or User:isAdmin() then
            return
        else
        local keyID = M.propertyTable[i][6]
        local keyType = M.propertyTable[i][5]
        local keyAmount = User:countItemAt("all",keyType,{["lockId"]=keyID})
        local depotKeyAmount = M.charOwnedDepotKeys(User)
            if tonumber(keyAmount) > 0 and town ~= "Outlaw"  then
                User:inform(M.getText(User,"Bei deinem letzten Besuch in "..town.." wurden bei einer routinem?gen Taschenkontrolle durch die Wachen Schlüssel, die du nicht besitzen solltest, gefunden und konfisziert.","Upon your latest visit to "..town.." some keys you were not supposed to have were confiscated by the guards in a random bag check at the gates."))
                return
            elseif depotKeyAmount ~= nil and town ~= "Outlaw"  then
                if tonumber(depotKeyAmount) > 0 then
                    User:inform(M.getText(User,"Bei deinem letzten Besuch in "..town.." wurden bei einer routinem?gen Taschenkontrolle durch die Wachen Schlüssel, die du nicht besitzen solltest, gefunden und konfisziert.","Upon your latest visit to "..town.." some keys you were not supposed to have were confiscated by the guards in a random bag check at the gates."))
                    return
                end
            end
        end
    end
end
-- Main lookAt function
function M.LookAtItem(User,Item)

    local lookAt
    -- Property Deeds
    for i = 1, #M.propertyTable do
        if (Item.pos == M.propertyTable[i][3]) then
            lookAt = M.propertyDeedLookAt(User, Item)
        end
    end

    if lookAt then
        return lookAt
    else
        return lookat.GenerateLookAt(User, Item, 0)
    end
end
-- Use item
function M.UseItem(User, SourceItem)
    for i = 1, #M.propertyTable do
        if (SourceItem.pos == M.propertyTable[i][3]) then
            local town = M.propertyTable[i][7]
            local property = M.propertyTable[i][1]
            local callback1 = function(dialogUnowned)
                local success = dialogUnowned:getSuccess()
                if success then
                    local selected = dialogUnowned:getSelectedIndex()+1
                    if selected == 1 then
                        M.propertyInformation(User, SourceItem)
                    elseif selected == 2 then
                        M.setOwner(User, SourceItem)
                    elseif selected == 3 then
                        M.setRent(User, SourceItem)
                    else
                        M.setReqRank(User, SourceItem)
                    end
                end
            end
            local callback2 = function(dialogOwnedByUser)
                local success = dialogOwnedByUser:getSuccess()
                if success then
                    local selected = dialogOwnedByUser:getSelectedIndex()+1
                    if selected == 1 then
                        M.propertyInformation(User, SourceItem)
                    elseif selected == 2 then
                        M.abandonPropertyDialog(User, SourceItem)
                    elseif selected == 3 then
                        M.setBuilderOrGuest(User, SourceItem, "builder")
                    elseif selected == 4 then
                        M.removeBuilderOrGuest(User, SourceItem, "builder")
                    elseif selected == 5 then
                        M.setGuest(User, SourceItem)
                    elseif selected == 6 then
                        M.removeGuest(User, SourceItem)
                    elseif selected == 7 then
                        M.setOwner(User, SourceItem)
                    elseif selected == 8 then
                        M.removeOwner(User, SourceItem)
                    elseif selected == 9 then
                        M.setRent(User, SourceItem)
                    elseif selected == 10 then
                        M.extendRent(User, SourceItem)
                    elseif selected == 11 then
                        M.setReqRank(User, SourceItem)
                    end
                end
            end
            local callback3 = function(dialogOwnedNotByUser)
                local success = dialogOwnedNotByUser:getSuccess()
                if success then
                    local selected = dialogOwnedNotByUser:getSelectedIndex()+1
                    if selected == 1 then
                        M.propertyInformation(User, SourceItem)
                    elseif selected == 2 then
                        M.setBuilderOrGuest(User, SourceItem, "guest")
                    elseif selected == 3 then
                        M.removeBuilderOrGuest(User, SourceItem, "guest")
                    elseif selected == 4 then
                        M.setOwner(User, SourceItem)
                    elseif selected == 5 then
                        M.removeOwner(User, SourceItem)
                    elseif selected == 6 then
                        M.setRent(User, SourceItem)
                    elseif selected == 7 then
                        M.extendRent(User, SourceItem)
                    else
                        M.setReqRank(User, SourceItem)
                    end
                end
            end
            local dialogUnowned = SelectionDialog(M.getText(User,M.getPropertyNameDE(SourceItem),M.getPropertyName(SourceItem)) , M.getText(User,"Wähle aus, was du machen willst.","Select what you want to do.") , callback1)
            local dialogOwnedByUser = SelectionDialog(M.getText(User,M.getPropertyNameDE(SourceItem),M.getPropertyName(SourceItem)) , M.getText(User,"Wähle aus, was du machen willst.","Select what you want to do.") , callback2)
            local dialogOwnedNotByUser = SelectionDialog(M.getText(User,M.getPropertyNameDE(SourceItem),M.getPropertyName(SourceItem)) , M.getText(User,"Wähle aus, was du machen willst.","Select what you want to do.") , callback3)
            dialogUnowned:addOption(0, M.getText(User,"Betrachte 'Notiz des Quartiermeisters'","Inspect 'Notice from the Quartermaster'"))
            dialogOwnedByUser:addOption(0, M.getText(User,"Betrachte 'Notiz des Quartiermeisters'","Inspect 'Notice from the Quartermaster'"))
            dialogOwnedByUser:addOption(0, M.getText(User,"Mietverhältnis beenden","Abandon Property"))
            dialogOwnedByUser:addOption(0, M.getText(User,"","Give Builder Permission"))
            dialogOwnedByUser:addOption(0, M.getText(User,"","Remove Builder Permission"))
            dialogOwnedNotByUser:addOption(0, M.getText(User,"Betrachte 'Notiz des Quartiermeisters'","Inspect 'Notice from the Quartermaster'"))
            if M.checkIfEstate(property) then
                dialogOwnedByUser:addOption(0, M.getText(User,"Gast hinzufügen","Add Guest"))
                dialogOwnedByUser:addOption(0, M.getText(User,"Gast entfernen","Remove Guest"))
            end
            if M.checkIfLeaderOfTown(User, town) or User:isAdmin() then
                dialogUnowned:addOption(0, M.getText(User,"Mieter eintragen","Set Renter"))
                dialogUnowned:addOption(0, M.getText(User,"Miete anpassen","Change Rent"))
                dialogUnowned:addOption(0, M.getText(User,"Miete anpassen","Change Required Rank"))
                if not M.checkIfEstate(property) then
                    dialogOwnedByUser:addOption(0, M.getText(User,"Gast hinzufügen","Add Guest"))
                    dialogOwnedByUser:addOption(0, M.getText(User,"Gast entfernen","Remove Guest"))
                end
                dialogOwnedByUser:addOption(0, M.getText(User,"Mieter eintragen","Set Renter"))
                dialogOwnedByUser:addOption(0, M.getText(User,"Mieter entfernen","Remove Renter"))
                dialogOwnedByUser:addOption(0, M.getText(User,"Miete anpassen","Change Rent"))
                dialogOwnedByUser:addOption(0, M.getText(User,"Miete verlängern","Extend Rent"))
                dialogOwnedByUser:addOption(0, M.getText(User,"Miete anpassen","Change Required Rank"))
                dialogOwnedNotByUser:addOption(0, M.getText(User,"Gast hinzufügen","Add Guest"))
                dialogOwnedNotByUser:addOption(0, M.getText(User,"Gast entfernen","Remove Guest"))
                dialogOwnedNotByUser:addOption(0, M.getText(User,"Mieter eintragen","Set Renter"))
                dialogOwnedNotByUser:addOption(0, M.getText(User,"Mieter entfernen","Remove Renter"))
                dialogOwnedNotByUser:addOption(0, M.getText(User,"Miete anpassen","Change Rent"))
                dialogOwnedNotByUser:addOption(0, M.getText(User,"Miete verlängern","Extend Rent"))
                dialogOwnedNotByUser:addOption(0, M.getText(User,"Miete anpassen","Change Required Rank"))
            end
            if M.checkOwner(SourceItem) == "Unowned" then
                User:requestSelectionDialog(dialogUnowned)
            elseif M.checkOwner(SourceItem) == User.name then
                User:requestSelectionDialog(dialogOwnedByUser)
            else
                User:requestSelectionDialog(dialogOwnedNotByUser)
            end
        end
    end
end
return M
