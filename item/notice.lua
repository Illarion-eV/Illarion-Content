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
-- 1property name, 2DE name, 3position, 4default rent, 5keyID, 6doorID, 7town, 8required rank, 9required rank name, 10DE rank name, 11 estate(boolean)
-- Some of the information is not used and was there for a fully automated version of housing. It is kept in case of future need.
--Cadomyr
{"Villa Annabeth", "Villa Annabeth",position(93,617,0),40000,3054,340, "Cadomyr","7",factions.CadomyrRankListMale[7]["eRank"],factions.CadomyrRankListMale[7]["gRank"]},
{"Villa Edward", "Villa Edward",position(89,606,0),40000,3054,341, "Cadomyr","7",factions.CadomyrRankListMale[7]["eRank"],factions.CadomyrRankListMale[7]["gRank"]},
{"Villa Reginald", "Villa Reginald",position(94,561,0),30000,3054,342, "Cadomyr","6",factions.CadomyrRankListMale[6]["eRank"],factions.CadomyrRankListMale[6]["gRank"]},
{"Flat Faith and Obedience", "Wohnung Glaube und Gehorsam",position(137,605,0),5000,2558,361, "Cadomyr","4",factions.CadomyrRankListMale[4]["eRank"],factions.CadomyrRankListMale[4]["gRank"]},
{"Flat Honour and Lineage", "Wohnung Ehre und Abstammung",position(138,603,1),5000,2558,362, "Cadomyr","4",factions.CadomyrRankListMale[4]["eRank"],factions.CadomyrRankListMale[4]["gRank"]},
{"Flat Truth and Justice", "Wohnung Ehrlichkeit und Gerechtigkeit",position(136,609,0),10000,2558,363, "Cadomyr","5",factions.CadomyrRankListMale[5]["eRank"],factions.CadomyrRankListMale[5]["gRank"]},
{"Flat Courage", "Wohnung Mut",position(137,609,1),15000,2558,364, "Cadomyr","5",factions.CadomyrRankListMale[5]["eRank"],factions.CadomyrRankListMale[5]["gRank"]},
{"Flat Patriarchy", "Wohnung Patriarchat",position(135,614,0),15000,2558,365, "Cadomyr","5",factions.CadomyrRankListMale[5]["eRank"],factions.CadomyrRankListMale[5]["gRank"]},
{"Flat Property", "Wohnung Besitz",position(136,616,1),20000,2558,366, "Cadomyr","6",factions.CadomyrRankListMale[6]["eRank"],factions.CadomyrRankListMale[6]["gRank"]},
--Runewick
{"First Fire Apartment", "Erstes Feuerapartment",position(945,756,0),30000,2558,240, "Runewick","3",factions.RunewickRankListMale[3]["eRank"],factions.RunewickRankListMale[3]["gRank"]},
{"Second Fire Apartment", "Zweites Feuerapartment",position(950,756,0),30000,2558,241, "Runewick","3",factions.RunewickRankListMale[3]["eRank"],factions.RunewickRankListMale[3]["gRank"]},
{"Third Fire Apartment", "Drittes Feuerapartment",position(958,758,0),60000,2558,242, "Runewick","6",factions.RunewickRankListMale[6]["eRank"],factions.RunewickRankListMale[6]["gRank"]},
{"Fourth Fire Apartment", "Viertes Feuerapartment",position(957,756,1),80000,2558,243, "Runewick","7",factions.RunewickRankListMale[7]["eRank"],factions.RunewickRankListMale[7]["gRank"]},
{"First Air Apartment", "Erstes Luftapartment",position(958,839,1),70000,2558,210, "Runewick","6",factions.RunewickRankListMale[6]["eRank"],factions.RunewickRankListMale[6]["gRank"]},
{"Second Air Apartment", "Zweites Luftapartment",position(956,835,1),50000,2558,211, "Runewick","5",factions.RunewickRankListMale[5]["eRank"],factions.RunewickRankListMale[5]["gRank"]},
{"First Earth Apartment", "Erstes Erdapartment",position(901,762,1),30000,2558,230, "Runewick","4",factions.RunewickRankListMale[4]["eRank"],factions.RunewickRankListMale[4]["gRank"]},
{"Second Earth Apartment", "Zweites Erdapartment",position(902,763,1),30000,2558,231, "Runewick","4",factions.RunewickRankListMale[4]["eRank"],factions.RunewickRankListMale[4]["gRank"]},
{"Third Earth Apartment", "Drittes Erdapartment",position(899,759,-3),30000,2558,233, "Runewick","4",factions.RunewickRankListMale[4]["eRank"],factions.RunewickRankListMale[4]["gRank"]},
{"Fourth Earth Apartment", "Viertes Erdapartment",position(899,769,-3),20000,2558,234, "Runewick","3",factions.RunewickRankListMale[3]["eRank"],factions.RunewickRankListMale[3]["gRank"]},
{"Fifth Earth Apartment", "Fünftes Erdapartment",position(902,755,-3),20000,2558,235, "Runewick","3",factions.RunewickRankListMale[3]["eRank"],factions.RunewickRankListMale[3]["gRank"]},
{"Sixth Earth Apartment", "Sechstes Erdapartment",position(900,755,-3),20000,2558,236, "Runewick","3",factions.RunewickRankListMale[3]["eRank"],factions.RunewickRankListMale[3]["gRank"]},
{"Cottage", "Landhaus",position(791,795,0),30000,2558,251, "Runewick","5",factions.RunewickRankListMale[5]["eRank"],factions.RunewickRankListMale[5]["gRank"]},
{"Quadruped Red Bird","Vierbeiniger Roter Vogel",position(745,803,0),100000,2558,250, "Runewick","7",factions.RunewickRankListMale[7]["eRank"],factions.RunewickRankListMale[7]["gRank"]},
--Galmair
{"House of Malachite","Malachithaus",position(372,323,0), 100000, 3056, 110, "Galmair", "7",factions.GalmairRankListMale[7]["eRank"],factions.GalmairRankListMale[7]["gRank"]},
{"Villa Goldvein","Villa Goldader", position(300, 281, 0), 80000, 3055, 111, "Galmair", "7",factions.GalmairRankListMale[7]["eRank"],factions.GalmairRankListMale[7]["gRank"]},
{"Flat Irmorom","Wohnung Irmorom",position(373,216,-6), 30000,2558,120, "Galmair","4",factions.GalmairRankListMale[4]["eRank"],factions.GalmairRankListMale[4]["gRank"]},
{"Flat Elara","Wohnung Elara",position(384,219,-6), 30000,2558,121, "Galmair","4",factions.GalmairRankListMale[4]["eRank"],factions.GalmairRankListMale[4]["gRank"]},
{"Flat Adron","Wohnung Adron",position(383,230,-6), 20000,2558,122, "Galmair","3",factions.GalmairRankListMale[3]["eRank"],factions.GalmairRankListMale[3]["gRank"]},
{"Flat Malachin","Wohnung Malachín",position(382,240,-6),20000,2558,123, "Galmair","3",factions.GalmairRankListMale[3]["eRank"],factions.GalmairRankListMale[3]["gRank"]},
{"Flat Oldra","Wohnung Oldra",position(376,238,-6),30000,2558,124, "Galmair","4",factions.GalmairRankListMale[4]["eRank"],factions.GalmairRankListMale[4]["gRank"]},
{"Flat Nargun","Wohnung Nargùn",position(383,240,-5),20000,2558,125, "Galmair","3",factions.GalmairRankListMale[3]["eRank"],factions.GalmairRankListMale[3]["gRank"]},
{"Flat Ronagan","Wohnung Ronagan",position(384,228,-5),20000,2558,126, "Galmair","3",factions.GalmairRankListMale[3]["eRank"],factions.GalmairRankListMale[3]["gRank"]},
{"Flat Sirani","Wohnung Sirani",position(385,220,-5),30000,2558,127, "Galmair","4",factions.GalmairRankListMale[4]["eRank"],factions.GalmairRankListMale[4]["gRank"]},
{"Flat Zhambra","Wohnung Zhambra",position(373,215,-5),30000,2558,128, "Galmair","4",factions.GalmairRankListMale[4]["eRank"],factions.GalmairRankListMale[4]["gRank"]},
{"Lucky Copper","Glückskupfer",position(416,289,1),40000,2558,113, "Galmair","5",factions.GalmairRankListMale[5]["eRank"],factions.GalmairRankListMale[5]["gRank"]},
{"Silver Profit","Silberner Verdienst",position(419,294,1),50000,2558,114, "Galmair","5",factions.GalmairRankListMale[5]["eRank"],factions.GalmairRankListMale[5]["gRank"]},
{"Golden Deal","Goldener Abschluss",position(419,291,1),60000,2558,115, "Galmair","6",factions.GalmairRankListMale[6]["eRank"],factions.GalmairRankListMale[6]["gRank"]},
{"Flat Sapphire","Wohnung Saphir",position(400,222,1),50000,2558,131, "Galmair","6",factions.GalmairRankListMale[6]["eRank"],factions.GalmairRankListMale[6]["gRank"]},
{"Flat Diamond","Wohnung Diamant",position(406,222,1),60000,2558,132, "Galmair","6",factions.GalmairRankListMale[6]["eRank"],factions.GalmairRankListMale[6]["gRank"]},
{"Flat Obsidian","Wohnung Obsidian",position(428,216,1),60000,2558,133, "Galmair","6",factions.GalmairRankListMale[6]["eRank"],factions.GalmairRankListMale[6]["gRank"]},
--Estates, Galmair
{"Galmair Harbour Estate","Hafengrundstück in Galmair",position(447,124,0),200000, 2558, 134, "Galmair", "7", factions.GalmairRankListMale[7]["eRank"],factions.GalmairRankListMale[7]["gRank"], true},
{"Galmair Roadside Estate","Grundstück Am Wegesrand in Galmair",position(462,175,0),200000, 2558, 135, "Galmair", "7", factions.GalmairRankListMale[7]["eRank"],factions.GalmairRankListMale[7]["gRank"], true},
{"Galmair Mountainside Estate","Grundstück Bergblick in Galmair",position(565,168,0),200000, 2558, 136, "Galmair", "7", factions.GalmairRankListMale[7]["eRank"],factions.GalmairRankListMale[7]["gRank"], true},
--Cadomyr
{"Cadomyr Harbour Estate", "Hafengrundstück in Cadomyr",position(106,769,0),200000, 2558,368, "Cadomyr","7",factions.CadomyrRankListMale[7]["eRank"],factions.CadomyrRankListMale[7]["gRank"], true},
{"Cadomyr Riverside Estate", "Grundstück am Flussufer in Cadomyr",position(173,674,0),200000, 2558,369, "Cadomyr","7",factions.CadomyrRankListMale[7]["eRank"],factions.CadomyrRankListMale[7]["gRank"], true},
{"Cadomyr Seaside Estate", "Grundstück Meerblick in Cadomyr",position(49,661,0),200000, 2558,370, "Cadomyr","7",factions.CadomyrRankListMale[7]["eRank"],factions.CadomyrRankListMale[7]["gRank"], true},
--Runewick
{"Runewick Harbour Estate", "Hafengrundstück in Runewick",position(758,778,0),200000, 2558,252, "Runewick","7",factions.RunewickRankListMale[7]["eRank"],factions.RunewickRankListMale[7]["gRank"], true},
{"Runewick Forest Estate", "Waldgrundstück in Runewick",position(869,889,0),200000, 2558,253, "Runewick","7",factions.RunewickRankListMale[7]["eRank"],factions.RunewickRankListMale[7]["gRank"], true},
{"Runewick Roadside Estate", "Grundstück Am Wegesrand in Runewick",position(834,728,0),200000, 2558,254, "Runewick","7",factions.RunewickRankListMale[7]["eRank"],factions.RunewickRankListMale[7]["gRank"], true},
--Outlaw
{"Outlaw Base One", "Erstes Lager der Vogelfreien",position(967,243,0),200000,2558,504,"Outlaw","0","None","None", true}
}
M.max_guest_number = 20
M.max_builder_number = 20
-- List of the different depot IDs
M.depotList={100,101,102,103}
function M.checkForPropertyDeed(user)
local targetTile = common.GetFrontPosition(user)
    for i = 1, #M.propertyTable do
        if targetTile == M.propertyTable[i][3] then
            return true
        end
    end
return false
end
-- Fetches the town a property belongs to based on property deed position
function M.getTownName(item, property)
    if property then
        for i = 1, #M.propertyTable do
            if property == M.propertyTable[i][1] then
                return M.propertyTable[i][7]
            end
        end
    else
        for i = 1, #M.propertyTable do
            if (item.pos == M.propertyTable[i][3]) then
                return M.propertyTable[i][7]
            end
        end
    end
end
-- Checks if the user is a leader of the specified town
function M.checkIfLeaderOfTown(user, Town)
    if Town == "Outlaw" then
        return false
    end
local home = factions.getMembershipByName(user)
    if (user:getQuestProgress(200) >= 8) and (home == Town) then
        return true
    else
        return false
    end
end
--Fetches the name of a property based on property deed position
function M.getPropertyName(item)
    for i = 1, #M.propertyTable do
        if (item.pos == M.propertyTable[i][3]) then
            return M.propertyTable[i][1]
        end
    end
end
--Fetches the german name of a property
function M.getPropertyNameDE(item)
    for i = 1, #M.propertyTable do
        if (item.pos == M.propertyTable[i][3]) then
            return M.propertyTable[i][2]
        end
    end
end
-- Returns a default rent value for when no rent value has been set by a GM
function M.getDefaultRent(item, property)
    if property then
        for i = 1, #M.propertyTable do
            if property == M.propertyTable[i][1] then
                return M.propertyTable[i][4]
            end
        end
    else
        for i = 1, #M.propertyTable do
            if (item.pos == M.propertyTable[i][3]) then
                return M.propertyTable[i][4]
            end
        end
    end
end
-- The lookAt for the property deed
function M.propertyDeedLookAt(user, item)
  local lookAt = ItemLookAt()
    lookAt.name = common.GetNLS(user, "Grundstücksurkunde", "Property Deed")
    lookAt.description = common.GetNLS(user, "Grundstücksurkunde von "..M.getPropertyNameDE(item)..".", "The Property Deed of "..M.getPropertyName(item)..".")
    return lookAt
end
-- shortens common.GetNLS into getText
function M.getText(user,deText,enText)
    return common.GetNLS(user,deText,enText)
end
-- puts owners and guests of property back to NIL, making the property unowned
function M.removeOwner(user, item, property)
local propertyName
    if property == nil then
        propertyName = M.getPropertyName(item)
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
user:inform(M.getText(user,"Vorheriger Mieter entfernt.","Previous renter removed."))
end
-- sets an owner
function M.setOwner(user, item, propertyName)
local property
    if propertyName == nil then
        property = M.getPropertyName(item)
    else
        property = propertyName
    end
    local callback = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
            if (input == nil or input == '') then
                user:inform(M.getText(user,"Das Namensfeld darf nicht leer sein.","The name field can not be empty."))
            elseif M.checkIfOwnsProperty(input) and not M.checkIfEstate(property) then
                user:inform(M.getText(user,"Der Charakter mietet bereits ein Grundstück.","Character already rents a property."))
            else
                M.removeOwner(user, item, propertyName)
                ScriptVars:set("rentDuration"..property,1)
                ScriptVars:set("ownerof"..property,input)
                ScriptVars:save()
                user:inform(M.getText(user,input.." wurde als neuer Mieter eingetragen.",input.." set as new renter."))
                M.setSignature(user, item, propertyName)
            end
    end
    user:requestInputDialog(InputDialog(M.getText(user,"Mieter eintragen","Set Renter"),
    M.getText(user,"Trag hier den Namen des neuen Mieters ein.",
    "Write in the name of who you want to set as the new renter."),
    false, 255, callback))
end
function M.setBuilderOrGuest(user, item, builderOrGuest, propertyName)
local property
    if propertyName == nil then
        property = M.getPropertyName(item)
    else
        property = propertyName
    end
local builderOrGuestDe
local builderOrGuestDePlural
local textDe
local textEn
    if builderOrGuest == "builder" then
        builderOrGuestDe = "Erbauer"
        builderOrGuestDePlural = "Erbauer"
        textDe = "Er/sie darf jetzt auf deinem Grundstück bauen."
        textEn = "They will now be permitted to build on your property."
    elseif builderOrGuest == "guest" then
        builderOrGuestDe = "Gast"
        builderOrGuestDePlural = "Gäste"
        textDe = "Schlüssel, die diese Person hat, werden nicht länger von den Wachen konfisziert."
        textEn = "Keys they have will no longer be confiscated by the guards."
    end
    local callback = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (input == nil or input == '') then
            user:inform(M.getText(user,"Das Namensfeld darf nicht leer sein.","The name field can not be empty."))
        else
            for i = 1, M["max_"..builderOrGuest.."_number"] do
                local foundBuilderOrGuest = ScriptVars:find(builderOrGuest..i..property)
                if not foundBuilderOrGuest then
                    ScriptVars:set(builderOrGuest..i..property,input)
                    ScriptVars:save()
                    user:inform(M.getText(user,input.." hat nun die Rechte als "..builderOrGuestDe.."."..textDe,input.." set as a "..builderOrGuest..". "..textEn))
                    return
                elseif i == M["max_"..builderOrGuest.."_number"] then
                    user:inform(M.getText(user,"Du kannst nur "..M["max_"..builderOrGuest.."_number"].." "..builderOrGuestDePlural.." gleichzeitig haben. Du musst einen von der List entfernen, bevor du jemanden Neues ernennen kannst.","You may only have "..M["max_"..builderOrGuest.."_number"].." "..builderOrGuest.."s at a time. You must remove one if you want to add another." ))
                end
            end
        end
    end
    user:requestInputDialog(InputDialog(M.getText(user,"Ernenne "..builderOrGuestDe,"Set "..builderOrGuest),
    M.getText(user,"Wen möchtest du als "..builderOrGuestDe.." benennen?",
    "Write in the name of who you want to set as a "..builderOrGuest),
    false, 255, callback))
end
function M.removeBuilderOrGuest(user, item, builderOrGuest, propertyName)
local guestOrBuildersExist = false
local property
    if propertyName == nil then
        property = M.getPropertyName(item)
    else
        property = propertyName
    end
local builderOrGuestDe
local dialogNameEn
local dialogNameDe
local skippedGuestSlots = 0
    if builderOrGuest == "builder" then
        builderOrGuestDe = "Erbauer"
        dialogNameEn = "Builder's list"
        dialogNameDe = "Liste der Erbauer"
    elseif builderOrGuest == "guest" then
        builderOrGuestDe = "Gäste"
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
                        user:inform(M.getText(user,currentBuilderOrGuest.." wurde von der Liste entfernt.",currentBuilderOrGuest.." has been removed from the list."))
                    end
                else
                    skippedGuestSlots = skippedGuestSlots+1
                end
            end
        end
    end
    local dialog = SelectionDialog(M.getText(user,dialogNameDe,dialogNameEn) ,
    M.getText(user,"Wähle einen Namen aus, der von der Liste entfernt werden soll.",
    "Select a name to remove them from the list.") , callback)
    for i = 1, M["max_"..builderOrGuest.."_number"] do
        local foundBuilderOrGuest, currentBuilderOrGuest = ScriptVars:find(builderOrGuest..i..property)
        if foundBuilderOrGuest then
            dialog:addOption(0, currentBuilderOrGuest)
            guestOrBuildersExist = true
        end
    end
    if guestOrBuildersExist then
        user:requestSelectionDialog(dialog)
    else
        user:inform("Die Liste der "..builderOrGuestDe.." ist leer.","There are no "..builderOrGuest.."s to remove.")
    end
end

-- Fetches who the owner is
function M.checkOwner(item)
local propertyName = M.getPropertyName(item)
local foundOwner, currentOwner = ScriptVars:find("ownerof"..propertyName)
    if foundOwner then
        return currentOwner
    else
        return "Unowned"
    end
end

local function getRentNumeral(item)
    local propertyName = M.getPropertyName(item)
    local defaultRent = M.getDefaultRent(item)
    local foundRent, currentRent = ScriptVars:find("rentfor"..propertyName)

    if foundRent then
        return currentRent
    else
        return defaultRent
    end
end

local function addRent(town, rent)

    local foundAmount, currentAmount = ScriptVars:find("rentBelongingTo"..town)

    if foundAmount then
        ScriptVars:set("rentBelongingTo"..town, (tonumber(currentAmount)+tonumber(rent)))
    else
        ScriptVars:set("rentBelongingTo"..town, tonumber(rent))
    end
    ScriptVars:save()
end

local function payRent(user, item)
    local propertyName = M.getPropertyName(item)
    local town = M.getTownName(item)
       local callback = function (dialog)
            if (not dialog:getSuccess()) then
                return
            end
            local input = dialog:getInput()
                if tonumber(input) == nil then
                    user:inform(M.getText(user,"GERMAN TRANSLATION HERE","Input must be a number."))
                elseif tonumber(input) <= 0 then
                    user:inform(M.getText(user,"GERMAN TRANSLATION HERE","The number of months to rent has to be more than 0."))
                else
                    local rent_cost = (tonumber(getRentNumeral(item))*tonumber(input))
                    local foundCurrentRentDuration, currentRentDuration = ScriptVars:find("rentDuration"..propertyName)
                    if (input == nil or input == "") then
                        user:inform(M.getText(user,"GERMAN TRANSLATION HERE","Input field can't be left empty."))
                    elseif not money.CharHasMoney(user, rent_cost) then--check money
                        user:inform(M.getText(user,"GERMAN TRANSLATION HERE","You can't afford that."))
                    else
                        if (foundCurrentRentDuration == true) then
                            if ((tonumber(input)+tonumber(currentRentDuration)) > 48)  then
                                user:inform(M.getText(user,"GERMAN TRANSLATION HERE","Duration increase can not exceed the maximum of 48 months rent."))
                            else
                                money.TakeMoneyFromChar(user, rent_cost)
                                addRent(town, rent_cost)
                                ScriptVars:set("rentDuration"..propertyName, (tonumber(input)+tonumber(currentRentDuration)) )
                                ScriptVars:set("ownerof"..propertyName,user.name)
                                ScriptVars:save()
                                user:inform(M.getText(user,"GERMAN TRANSLATION HERE","After another visit to the quartermaster's office, your purse may feel lighter, but you rest comfortably in the knowledge that the residence before you is now yours for an additional "..input.." months."))
                            end
                        end

                    end
                end
        end
        if M.checkOwner(item) == user.name then
            local foundCurrentRentDuration, currentRentDuration = ScriptVars:find("rentDuration"..propertyName)
            if foundCurrentRentDuration then
                user:requestInputDialog(InputDialog(M.getText(user,"Miete","Rent"), M.getText(user,
                "GERMAN TRANSLATION HERE"..M.getRentDE(item)..
                "GERMAN TRANSLATION HERE"..currentRentDuration..
                "GERMAN TRANSLATION HERE",
                "The current rental fee is "..M.getRent(item)..
                "\n You currently have "..currentRentDuration..
                " months left on your lease. \nHow many months do you want to extend your rent by?"),
                false, 255, callback))
            end
        else
        user:requestInputDialog(InputDialog(M.getText(user,"Miete","Rent"), M.getText(user,
        "GERMAN TRANSLATION HERE"..M.getRentDE(item)..
        "GERMAN TRANSLATION HERE",
        "The current rental fee is "..M.getRent(item)..
        "\n The first month paid for only counts until the start of next month. \nHow many months do you want to rent for?"), false, 255, callback))
        end
    end

function M.allowAllAutomaticRentExtension(user, realm)

    local state = 1

    for i = 1, #M.propertyTable do
        local property = M.propertyTable[i][1]
        local town = M.propertyTable[i][7]

        if town == realm then
            local found, result = ScriptVars:find("automaticRentExtension"..property)

            if not found then
                result = 0
            end

            state = math.min(state, tonumber(result))

            if state == 0 then
                break
            end
        end
    end

    local newState

    if state == 0 then
        newState = 1
    else
        newState = 0
    end

    local title = {english = "Enable/Disable automatic rent", german = "GERMAN TRANSLATION HERE"}
    local texts = {
        {english = "Do you want to let the residents of all properties pay to extend their rent duration without your supervision?",
        german = "GERMAN TRANSLATION HERE",
        identifier = 1,
        informText = {
            english = "The residents of all properties will now be able to pay to extend their rent duration on their own. The resulting rent money can be collected at the town management instrument.",
            german = "GERMAN TRANSLATION HERE"}
        },
        {english = "Do you want to no longer let the residents any properties pay to extend their rent duration without your supervision?",
        german = "GERMAN TRANSLATION HERE",
        identifier = 0,
        informText = {
            english = "No residents will be able to pay to extend their rent duration without your supervision anymore.",
            german = "GERMAN TRANSLATION HERE"}
        }
    }

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if not success then
            return
        end
        local selected = dialog:getSelectedIndex()+1

        if selected == 1 then
            for i = 1, #M.propertyTable do
                local property = M.propertyTable[i][1]
                local town = M.propertyTable[i][7]
                if town == realm then
                    ScriptVars:set("automaticRentExtension"..property, newState)
                end
            end
            ScriptVars:save()
            for _, text in pairs(texts) do
                if text.identifier == newState then
                    user:inform(text.informText.german, text.informText.english)
                    break
                end
            end
        end
    end

    local dialog

    for _, text in pairs(texts) do
        if text.identifier == newState then
            dialog = SelectionDialog(M.getText(user, title.german, title.english), M.getText(user, text.german, text.english), callback)
            dialog:addOption(0, M.getText(user, "Ja", "Yes"))
            break
        end
    end

    user:requestSelectionDialog(dialog)


end


function M.allowAutomaticRentExtension(user, item, propertyName)
    local property

    if propertyName == nil then
        property = M.getPropertyName(item)
    else
        property = propertyName
    end

    local currentState

    local found, result = ScriptVars:find("automaticRentExtension"..property)

    if not found then
        currentState = 0
    else
        currentState = tonumber(result)
    end

    local newState

    if currentState == 1 then
        newState = 0
    else
        newState = 1
    end

    local title = {english = "Enable/Disable automatic rent extension", german = "GERMAN TRANSLATION HERE"}
    local texts = {
        {english = "Do you want to let the resident of "..property.." pay to extend their rent duration without your supervision?",
        german = "GERMAN TRANSLATION HERE",
        identifier = 1,
        informText = {
            english = "The resident of "..property.." will now be able to pay to extend their rent duration on their own. The resulting rent money can be collected at the town management instrument.",
            german = "GERMAN TRANSLATION HERE"}
        },
        {english = "Do you want to no longer let the resident of "..property.." pay to extend their rent duration without your supervision?",
        german = "GERMAN TRANSLATION HERE",
        identifier = 0,
        informText = {
            english = "The resident of "..property.." will no longer be able to pay to extend their rent duration without your supervision.",
            german = "GERMAN TRANSLATION HERE"}
        }
    }

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if not success then
            return
        end
        local selected = dialog:getSelectedIndex()+1

        if selected == 1 then
            ScriptVars:set("automaticRentExtension"..property, newState)
            ScriptVars:save()
            for _, text in pairs(texts) do
                if text.identifier == newState then
                    user:inform(text.informText.german, text.informText.english)
                    break
                end
            end
        end
    end

    local dialog

    for _, text in pairs(texts) do
        if text.identifier == newState then
            dialog = SelectionDialog(M.getText(user, title.german, title.english), M.getText(user, text.german, text.english), callback)
            dialog:addOption(0, M.getText(user, "Ja", "Yes"))
            break
        end
    end

    user:requestSelectionDialog(dialog)

end


function M.setIndefiniteRent(user, item, propertyName)
    local property

    if propertyName == nil then
        property = M.getPropertyName(item)
    else
        property = propertyName
    end

    local currentState

    local found, result = ScriptVars:find("indefiniteRent"..property)

    if not found then
        currentState = 0
    else
        currentState = tonumber(result)
    end

    local newState

    if currentState == 1 then
        newState = 0
    else
        newState = 1
    end

    local title = {english = "Enable/Disable rent", german = "GERMAN TRANSLATION HERE"}
    local texts = {
        {english = "Do you want to let the resident of "..property.." live rent free?",
        german = "GERMAN TRANSLATION HERE",
        identifier = 1,
        informText = {
            english = "The resident of "..property.." will now live rent free.",
            german = "GERMAN TRANSLATION HERE"}
        },
        {english = "Do you want to no longer let the resident of "..property.." live rent free?",
        german = "GERMAN TRANSLATION HERE",
        identifier = 0,
        informText = {
            english = "The resident of "..property.." will no longer live rent free.",
            german = "GERMAN TRANSLATION HERE"}
        }
    }

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if not success then
            return
        end
        local selected = dialog:getSelectedIndex()+1

        if selected == 1 then
            ScriptVars:set("indefiniteRent"..property, newState)
            ScriptVars:save()
            for _, text in pairs(texts) do
                if text.identifier == newState then
                    user:inform(text.informText.german, text.informText.english)
                    break
                end
            end
        end
    end

    local dialog

    for _, text in pairs(texts) do
        if text.identifier == newState then
            dialog = SelectionDialog(M.getText(user, title.german, title.english), M.getText(user, text.german, text.english), callback)
            dialog:addOption(0, M.getText(user, "Ja", "Yes"))
            break
        end
    end

    user:requestSelectionDialog(dialog)

end

-- Overwrites the default required rank for a property
function M.setReqRank(user, item, propertyName)
local property
    if propertyName == nil then
        property = M.getPropertyName(item)
    else
        property = propertyName
    end
local town = M.getTownName(item, propertyName)
    if town == "Outlaw" then
        user:inform("Bei Grundstücken außerhalb des Einflussbereiches einer Stadt kann kein Rang erforderlich gemacht werden.","Can't set required rank for non-town properties.")
        return
    end
    local callback1 = function (dialogGalmair)
    local success = dialogGalmair:getSuccess()
        if success then
            local selected = dialogGalmair:getSelectedIndex()+1
            for i = 1,7 do
                if selected == i then
                    ScriptVars:set("nameEN"..property,factions.GalmairRankListMale[i]["eRank"])
                    ScriptVars:set("nameDE"..property, factions.GalmairRankListMale[i]["gRank"])
                    ScriptVars:save()
                    user:inform(M.getText(user,"Der benötigte Rang wurde auf "..factions.GalmairRankListMale[i]["gRank"].." gesetzt.","Required rank has been set to "..factions.GalmairRankListMale[i]["eRank"].."."))
                end
            end
        end
    end
    local callback2 = function (dialogRunewick)
    local success = dialogRunewick:getSuccess()
        if success then
            local selected = dialogRunewick:getSelectedIndex()+1
            for i = 1,7 do
                if selected == i then
                    ScriptVars:set("nameEN"..property,factions.RunewickRankListMale[i]["eRank"])
                    ScriptVars:set("nameDE"..property, factions.RunewickRankListMale[i]["gRank"])
                    ScriptVars:save()
                    user:inform(M.getText(user,"Der benötigte Rang wurde auf "..factions.RunewickRankListMale[i]["gRank"].." gesetzt.","Required rank has been set to "..factions.RunewickRankListMale[i]["eRank"].."."))
                end
            end
        end
    end
    local callback3 = function (dialogCadomyr)
    local success = dialogCadomyr:getSuccess()
        if success then
            local selected = dialogCadomyr:getSelectedIndex()+1
            for i = 1,7 do
                if selected == i then
                    ScriptVars:set("nameEN"..property,factions.CadomyrRankListMale[i]["eRank"])
                    ScriptVars:set("nameDE"..property, factions.CadomyrRankListMale[i]["gRank"])
                    ScriptVars:save()
                    user:inform(M.getText(user,"Der benötigte Rang wurde auf "..factions.CadomyrRankListMale[i]["gRank"].." gesetzt.","Required rank has been set to "..factions.CadomyrRankListMale[i]["eRank"].."."))
                end
            end
        end
    end

    local dialogGalmair = SelectionDialog(M.getText(user,
    "Benötigten Rang einstellen",
    "Set required rank"),
    M.getText(user,
    "Bestimme welcher Rang benötigt werden soll, um dieses Grundstück zu mieten.",
    "Choose which rank should be required to rent this property."),
    callback1)
    local dialogRunewick = SelectionDialog(M.getText(user,
    "Benötigten Rang einstellen",
    "Set required rank"),
    M.getText(user,
    "Bestimme welcher Rang benötigt werden soll, um dieses Grundstück zu mieten.",
    "Choose which rank should be required to rent this property."),
    callback2)
    local dialogCadomyr = SelectionDialog(M.getText(user,
    "Benötigten Rang einstellen",
    "Set required rank"),
    M.getText(user,
    "Bestimme welcher Rang benötigt werden soll, um dieses Grundstück zu mieten.",
    "Choose which rank should be required to rent this property."),
    callback3)
    for i = 1,7 do
        dialogGalmair:addOption(0, M.getText(user,factions.GalmairRankListMale[i]["gRank"],factions.GalmairRankListMale[i]["eRank"]))
        dialogRunewick:addOption(0, M.getText(user,factions.RunewickRankListMale[i]["gRank"],factions.RunewickRankListMale[i]["eRank"]))
        dialogCadomyr:addOption(0, M.getText(user,factions.CadomyrRankListMale[i]["gRank"],factions.CadomyrRankListMale[i]["eRank"]))
    end

    if town == "Galmair" then
        user:requestSelectionDialog(dialogGalmair)
    elseif town == "Runewick" then
        user:requestSelectionDialog(dialogCadomyr)
    elseif town == "Cadomyr" then
        user:requestSelectionDialog(dialogCadomyr)
    end
end
-- Changes the rent of a property based on input
function M.setRent(user, item, property)
local propertyName
    if property == nil then
        propertyName = M.getPropertyName(item)
    else
        propertyName = property
    end
local rentEN = M.getRent(item, propertyName)
local rentDE = M.getRentDE(item, propertyName)
    local newRent = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"") ~= nil) then
            if tonumber(input) == nil then
                user:inform(M.getText(user,"Hier muss eine Zahl eingetragen werden.","Input must be a number."))
            elseif tonumber(input) <= 0 then
                user:inform(M.getText(user,"Die Zahl muss grösser als 0 sein.","You must set a number higher than 0."))
            else
                ScriptVars:set("rentfor"..propertyName,input)
                user:inform(M.getText(user,"Mietpreis auf "..input.." gesetzt.","Rent set to "..input))
                ScriptVars:save()
                M.setSignature(user, item, propertyName)
            end
        else
            user:inform(M.getText(user,"Hier muss eine Zahl eingetragen werden.","Input must be a number."))
        end
    end
    user:requestInputDialog(InputDialog(M.getText(user,"Miete festsetzen.","Set rent."), M.getText(user,"Aktuelle Miete: "..rentDE.."\nSetze eine neue monatliche Miete in Kupferstücken fest.","Current rent: "..rentEN.."\nSet a new monthly rent in coppers."), false, 255, newRent))
end
-- Returns the rent value divided into gold, silver and copper coins
function M.getRent(item, property)
local propertyName
    if property == nil then
        propertyName = M.getPropertyName(item)
    else
        propertyName = property
    end
local defaultRent = M.getDefaultRent(item, property)
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
function M.getRentDE(item, property)
local propertyName
    if property == nil then
        propertyName = M.getPropertyName(item)
    else
        propertyName = property
    end
local defaultRent = M.getDefaultRent(item, property)
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
            return(gCoins.." Gold-, "..sCoins.." Silber- und "..cCoins.." Kupferstücke pro Monat.")
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
            return(gCoins.." Gold-, "..sCoins.." Silber- und "..cCoins.." Kupferstücke pro Monat.")
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

function M.checkIfPlayerIsGuest(user, property)
    for i = 1, M.max_guest_number do
        local foundGuest, currentGuest = ScriptVars:find("guest"..i..property)
        if foundGuest then
            if currentGuest == user.name then
                return true
            end
        end
    end
return false
end
-- Returns how many rent months remain
function M.getRentDuration(item)
local propertyName = M.getPropertyName(item)
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
        local property = M.propertyTable[i][1]
        local foundCurrentRentDuration, currentRentDuration = ScriptVars:find("rentDuration"..property)
        if foundCurrentRentDuration == true and tonumber(currentRentDuration) > 0 then
            local foundRentExemption, rentExemption = ScriptVars:find("indefiniteRent"..property)
            if not foundRentExemption then
                rentExemption = 0
            end

            if tonumber(rentExemption) ~= 1 then
                ScriptVars:set("rentDuration"..(M.propertyTable[i][1]), (tonumber(currentRentDuration)-1))
            end
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
function M.getRequiredRankName(item, language)
local property = M.getPropertyName(item)
local foundDE, getDE = ScriptVars:find("nameDE"..property)
local foundEN, getEN = ScriptVars:find("nameEN"..property)
    for i = 1, #M.propertyTable do
        if (item.pos == M.propertyTable[i][3]) then
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
function M.setSignature(user, item, propertyName)
local property
    if propertyName == nil then
        property = M.getPropertyName(item)
    else
        property = propertyName
    end
local rankTitleEN = M.getRankTitle(user, "EN")
local rankTitleDE = M.getRankTitle(user, "DE")
local name = user.name
    if user:isAdmin() then
        ScriptVars:set("signatureEN"..property, "The Quartermaster")
        ScriptVars:set("signatureDE"..property, "Der Quartiermeister")
        ScriptVars:save()
    else
        ScriptVars:set("signatureEN"..property, rankTitleEN.." "..name)
        ScriptVars:set("signatureDE"..property, rankTitleDE.." "..name)
        ScriptVars:save()
    end
end
function M.getSignature(item, language)
local property = M.getPropertyName(item)
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
function M.propertyInformation(user, item)
local town = M.getTownName(item)
local rent = M.getRent(item)
local rentDE = M.getRentDE(item)
local property = M.getPropertyName(item)
local propertyDE = M.getPropertyNameDE(item)
local rank = M.getRequiredRankName(item, "EN")
local rankDE = M.getRequiredRankName(item, "DE")
local remainingDuration = M.getRentDuration(item)
local owner = M.checkOwner(item)
local signatureEN = M.getSignature(item, "EN")
local signatureDE = M.getSignature(item, "DE")
local townLeaderTitle = M.getTownLeaderTitle(town, "EN")
local townLeaderTitleDE = M.getTownLeaderTitle(town, "DE")
    if M.checkOwner(item) == "Unowned" then -- Shows info specific for when property is unowned
        local propertyInfo = MessageDialog(M.getText(user,"Notiz des Quartiermeisters","Quartermaster's notice"),
        M.getText(user,
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
        user:requestMessageDialog(propertyInfo)
    elseif M.checkOwner(item) == user.name then -- Shows info specific for when property is owned by user
        local propertyInfo = MessageDialog(M.getText(user,"Notiz des Quartiermeisters","Quartermaster's notice"),
        M.getText(user,
        "An den aktuellen Bewohner von"..propertyDE..
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
        user:requestMessageDialog(propertyInfo)
    else -- Shows info specific for when property is owned but not by user.
         local propertyInfo = MessageDialog(M.getText(user,"Notiz des Quartiermeisters","Quartermaster's notice"),
         M.getText(user,
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
        user:requestMessageDialog(propertyInfo)
    end
end
-- Remove user as tenant at users own volition
function M.abandonPropertyDialog(user, item)
    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                M.abandonProperty(user, item)
                user:inform(M.getText(user,"Nachdem du dem Quartiermeister den Schlüssel zurückgegeben hast, verabschiedest du dich von deinem alten Heim. Wo wirst du nun schlafen?","Having returned the key to the Quartermaster, you bid farewell to your old home. Now where will you sleep?"))
            else
                user:inform(M.getText(user,"Du hast dich entschieden das Mietverhältnis nicht zu beenden. ","You decide against giving up on your lease for the property."))
            end
        end
    end
    local dialog = SelectionDialog(M.getText(user,"Mietverhältnis beenden","Abandon property"),M.getText(user,"Bist du dir sicher, dass du das bestehende Mietverhältnis kündigen möchtest? Überschüssiges Geld wird nicht ausgezahlt.","Are you sure you want to abandon your lease on the property? Any remaining rent money will not be returned."),callback)
    dialog:addOption(0, M.getText(user,"Ja, Mietverhältnis beenden.","Yes, abandon it."))
    dialog:addOption(0, M.getText(user,"Nein, ich habe meine Meinung geändert.","No, I changed my mind."))
    user:requestSelectionDialog(dialog)
end
function M.abandonProperty(user, item)
    local propertyName = M.getPropertyName(item)
    ScriptVars:remove("ownerof"..propertyName)
    for i = 1, M.max_builder_number do
        ScriptVars:remove("builder"..i..propertyName)
    end
    for i = 1, M.max_guest_number do
        ScriptVars:remove("guest"..i..propertyName)
    end
    ScriptVars:remove("rentDuration"..propertyName)
    M.keyRetrieval(user)
    ScriptVars:save()
end
-- GM/PL extend rent at no cost option
function M.extendRent(user, item, property)
local propertyName
    if property == nil then
        propertyName = M.getPropertyName(item)
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
                user:inform(M.getText(user,"Hier muss eine Zahl eingetragen werden.","Input must be a number."))
            elseif tonumber(input) <= 0 then
                user:inform(M.getText(user,"Die Zahl muss grösser als 0 sein.","You must set a number higher than 0."))
            elseif (tonumber(input)+currentRentDuration) > 48 then
                user:inform(M.getText(user,"Die Mietdauer darf 48 Monate nicht überschreiten.","Rent duration can not exceed 48 months."))
            else
                ScriptVars:set("rentDuration"..propertyName,(currentRentDuration+input))
                user:inform(M.getText(user,"Mietdauer um"..input.." Monate verlängert.","Rent duration extended by "..input.." months."))
                ScriptVars:save()
            end
        else
            user:inform(M.getText(user,"Hier muss eine Zahl eingetragen werden.","Input must be a number."))
        end
    end
    user:requestInputDialog(InputDialog(M.getText(user,"Miete verlängern","Extend rent"), M.getText(user,"Mietdauer für den aktuellen Mieter umsonst verlängern.\n Derzeit beträgt die Mietdauer noch "..currentRentDuration.." Monate.","Extend rent for current renter at no charge.\n There's currently "..currentRentDuration.." months left on the lease."), false, 255, extendRent))
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
function M.removeRentalOfPropertiesOfOtherTowns(user)
    for i = 1, #M.propertyTable do
        local propertyName = M.propertyTable[i][1]
        local propertyNameDE = M.propertyTable[i][2]
        local foundOwner, currentOwner = ScriptVars:find("ownerof"..propertyName)
        local town = M.propertyTable[i][7]
        if foundOwner then
            if currentOwner == user.name then
                ScriptVars:remove("ownerof"..propertyName)
                for number = 1, M.max_builder_number do
                    ScriptVars:remove("builder"..number..propertyName)
                end
                for number = 1, M.max_guest_number do
                    ScriptVars:remove("guest"..number..propertyName)
                end
                ScriptVars:remove("rentDuration"..propertyName)
                M.keyRetrieval(user)
                ScriptVars:save()
                if town == "Outlaw" then
                    user:inform("Als Bürger einer Stadt kannst du keine Grundstücke außerhalb des Einflussbereiches einer Stadt behalten.","Having become a citizen of a town, you are no longer eligible to keep former properties that do not belong to the town.")
                else
                    user:inform("Nachdem du nicht länger Bürger von "..town.." bist, hast du das Recht auf deinen Mietanspruch auf "..propertyNameDE.." verloren und wirst gezwungen die Schlüssel zurückzugeben.","Because you are no longer a citizen of "..town.." you have forfeited the lease on the "..propertyName.." and been made to return your keys.")
                end
            end
        end
    end
end
--Inform user about their keys being confiscated upon login
function M.informUserOfKeyRetrieval(user)
    for i = 1, #M.propertyTable do
        local propertyName = M.propertyTable[i][1]
        local foundOwner, currentOwner = ScriptVars:find("ownerof"..propertyName)
        local town = M.propertyTable[i][7]
        for number = 1, M.max_guest_number do
            local foundGuest, currentGuest = ScriptVars:find("guest"..number..propertyName)
            if foundGuest then
                if currentGuest == user.name then
                    return
                end
            end
        end
        if foundOwner then
            if currentOwner ~= user.name then
                if M.checkIfLeaderOfTown(user, town) or user:isAdmin() then
                    return
                else
                local keyID = M.propertyTable[i][6]
                local keyType = M.propertyTable[i][5]
                local keyAmount = user:countItemAt("all",keyType,{["lockId"]=keyID})
                local depotKeyAmount = M.charOwnedDepotKeys(user)
                    if tonumber(keyAmount) > 0 and town ~= "Outlaw" then
                        user:inform(M.getText(user,"Bei deinem letzten Besuch in "..town.." wurden bei einer routinemäßigen Taschenkontrolle durch die Wachen Schlüssel, die du nicht besitzen solltest, gefunden und konfisziert.","Upon your latest visit to "..town.." some keys you were not supposed to have were confiscated by the guards in a random bag check at the gates."))
                        return
                    elseif depotKeyAmount ~= nil then
                        if tonumber(depotKeyAmount) > 0 and town ~= "Outlaw"  then
                            user:inform(M.getText(user,"Bei deinem letzten Besuch in "..town.." wurden bei einer routinemäßigen Taschenkontrolle durch die Wachen Schlüssel, die du nicht besitzen solltest, gefunden und konfisziert.","Upon your latest visit to "..town.." some keys you were not supposed to have were confiscated by the guards in a random bag check at the gates."))
                            return
                        end
                    end
                end
            end
        elseif M.checkIfLeaderOfTown(user, town) or user:isAdmin() then
            return
        else
        local keyID = M.propertyTable[i][6]
        local keyType = M.propertyTable[i][5]
        local keyAmount = user:countItemAt("all",keyType,{["lockId"]=keyID})
        local depotKeyAmount = M.charOwnedDepotKeys(user)
            if tonumber(keyAmount) > 0 and town ~= "Outlaw"  then
                user:inform(M.getText(user,"Bei deinem letzten Besuch in "..town.." wurden bei einer routinemäßigen Taschenkontrolle durch die Wachen Schlüssel, die du nicht besitzen solltest, gefunden und konfisziert.","Upon your latest visit to "..town.." some keys you were not supposed to have were confiscated by the guards in a random bag check at the gates."))
                return
            elseif depotKeyAmount ~= nil and town ~= "Outlaw"  then
                if tonumber(depotKeyAmount) > 0 then
                    user:inform(M.getText(user,"Bei deinem letzten Besuch in "..town.." wurden bei einer routinemäßigen Taschenkontrolle durch die Wachen Schlüssel, die du nicht besitzen solltest, gefunden und konfisziert.","Upon your latest visit to "..town.." some keys you were not supposed to have were confiscated by the guards in a random bag check at the gates."))
                    return
                end
            end
        end
    end
end

local function isAutomaticRentEnabled(property)
    local found, result = ScriptVars:find("automaticRentExtension"..property)

    if found then
        if tonumber(result) == 1 then
            return true
        end
    end

    return false
end

-- Main lookAt function
function M.LookAtItem(user, item)

    local lookAt
    -- Property Deeds
    for i = 1, #M.propertyTable do
        if (item.pos == M.propertyTable[i][3]) then
            lookAt = M.propertyDeedLookAt(user, item)
        end
    end

    if lookAt then
        return lookAt
    else
        return lookat.GenerateLookAt(user, item, 0)
    end
end
-- Use item
function M.UseItem(user, SourceItem)
    for i = 1, #M.propertyTable do
        if (SourceItem.pos == M.propertyTable[i][3]) then
            local town = M.propertyTable[i][7]
            local property = M.propertyTable[i][1]
            local callback1 = function(dialogUnowned)
                local success = dialogUnowned:getSuccess()
                if success then
                    local selected = dialogUnowned:getSelectedIndex()+1
                    if selected == 1 then
                        M.propertyInformation(user, SourceItem)
                    elseif selected == 2 then
                        M.setOwner(user, SourceItem)
                    elseif selected == 3 then
                        M.setRent(user, SourceItem)
                    else
                        M.setReqRank(user, SourceItem)
                    end
                end
            end
            local callback2 = function(dialogOwnedByuser)
                local success = dialogOwnedByuser:getSuccess()
                if success then
                    local count = 0
                    local selected = dialogOwnedByuser:getSelectedIndex()+1

                    if isAutomaticRentEnabled(property) then
                        if selected == 1 then
                            payRent(user, SourceItem)
                        end
                        count = count + 1
                    end

                    if selected == 1+count then
                        M.propertyInformation(user, SourceItem)
                    elseif selected == 2+count then
                        M.abandonPropertyDialog(user, SourceItem)
                    elseif selected == 3+count then
                        M.setBuilderOrGuest(user, SourceItem, "builder")
                    elseif selected == 4+count then
                        M.removeBuilderOrGuest(user, SourceItem, "builder")
                    elseif selected == 5+count then
                        M.setBuilderOrGuest(user, SourceItem, "guest")
                    elseif selected == 6+count then
                        M.removeBuilderOrGuest(user, SourceItem, "guest")
                    elseif selected == 7+count then
                        M.setOwner(user, SourceItem)
                    elseif selected == 8+count then
                        M.removeOwner(user, SourceItem)
                    elseif selected == 9+count then
                        M.setRent(user, SourceItem)
                    elseif selected == 10+count then
                        M.extendRent(user, SourceItem)
                    elseif selected == 11+count then
                        M.setReqRank(user, SourceItem)
                    elseif selected == 12+count then
                        M.setIndefiniteRent(user, SourceItem)
                    elseif selected == 13+count then
                        M.allowAutomaticRentExtension(user, SourceItem)
                    end
                end
            end
            local callback3 = function(dialogOwnedNotByuser)
                local success = dialogOwnedNotByuser:getSuccess()
                if success then
                    local selected = dialogOwnedNotByuser:getSelectedIndex()+1
                    if selected == 1 then
                        M.propertyInformation(user, SourceItem)
                    elseif selected == 2 then
                        M.setBuilderOrGuest(user, SourceItem, "guest")
                    elseif selected == 3 then
                        M.removeBuilderOrGuest(user, SourceItem, "guest")
                    elseif selected == 4 then
                        M.setOwner(user, SourceItem)
                    elseif selected == 5 then
                        M.removeOwner(user, SourceItem)
                    elseif selected == 6 then
                        M.setRent(user, SourceItem)
                    elseif selected == 7 then
                        M.extendRent(user, SourceItem)
                    elseif selected == 8 then
                        M.setReqRank(user, SourceItem)
                    elseif selected == 9 then
                        M.setIndefiniteRent(user, SourceItem)
                    else
                        M.allowAutomaticRentExtension(user, SourceItem)
                    end
                end
            end
            local dialogUnowned = SelectionDialog(M.getText(user,M.getPropertyNameDE(SourceItem),M.getPropertyName(SourceItem)) , M.getText(user,"Wähle aus, was du machen willst.","Select what you want to do.") , callback1)
            local dialogOwnedByuser = SelectionDialog(M.getText(user,M.getPropertyNameDE(SourceItem),M.getPropertyName(SourceItem)) , M.getText(user,"Wähle aus, was du machen willst.","Select what you want to do.") , callback2)
            local dialogOwnedNotByuser = SelectionDialog(M.getText(user,M.getPropertyNameDE(SourceItem),M.getPropertyName(SourceItem)) , M.getText(user,"Wähle aus, was du machen willst.","Select what you want to do.") , callback3)
            dialogUnowned:addOption(0, M.getText(user,"Betrachte 'Notiz des Quartiermeisters'","Inspect 'Notice from the Quartermaster'"))
            if isAutomaticRentEnabled(property) then
                dialogOwnedByuser:addOption(0, M.getText(user, "GERMAN TRANSLATION HERE", "Pay to extend rent duration"))
            end
            dialogOwnedByuser:addOption(0, M.getText(user,"Betrachte 'Notiz des Quartiermeisters'","Inspect 'Notice from the Quartermaster'"))
            dialogOwnedByuser:addOption(0, M.getText(user,"Mietverhältnis beenden","Abandon Property"))
            dialogOwnedByuser:addOption(0, M.getText(user,"Erteile Rechte als Erbauer","Give Builder Permission"))
            dialogOwnedByuser:addOption(0, M.getText(user,"","Remove Builder Permission"))
            dialogOwnedNotByuser:addOption(0, M.getText(user,"Betrachte 'Notiz des Quartiermeisters'","Inspect 'Notice from the Quartermaster'"))
            if M.checkIfEstate(property) then --Renters are allowed to set guests themselves on estate properties
                dialogOwnedByuser:addOption(0, M.getText(user,"Gast hinzufügen","Add Guest"))
                dialogOwnedByuser:addOption(0, M.getText(user,"Gast entfernen","Remove Guest"))
            end
            if M.checkIfLeaderOfTown(user, town) or user:isAdmin() then
                dialogUnowned:addOption(0, M.getText(user,"Mieter eintragen","Set Renter"))
                dialogUnowned:addOption(0, M.getText(user,"Miete anpassen","Change Rent"))
                dialogUnowned:addOption(0, M.getText(user,"Erforderlichen Rang anpassen","Change Required Rank"))
                if not M.checkIfEstate(property) then --Only admins/player leaders can set who can have keys to the property if not an estate
                    dialogOwnedByuser:addOption(0, M.getText(user,"Gast hinzufügen","Add Guest"))
                    dialogOwnedByuser:addOption(0, M.getText(user,"Gast entfernen","Remove Guest"))
                end
                dialogOwnedByuser:addOption(0, M.getText(user,"Mieter eintragen","Set Renter"))
                dialogOwnedByuser:addOption(0, M.getText(user,"Mieter entfernen","Remove Renter"))
                dialogOwnedByuser:addOption(0, M.getText(user,"Miete anpassen","Change Rent"))
                dialogOwnedByuser:addOption(0, M.getText(user,"Miete verlängern","Extend Rent"))
                dialogOwnedByuser:addOption(0, M.getText(user,"Erforderlichen Rang anpassen","Change Required Rank"))
                dialogOwnedByuser:addOption(0, M.getText(user,"GERMAN TRANSLATION HERE","Manage rent-free living"))
                dialogOwnedByuser:addOption(0, M.getText(user,"GERMAN TRANSLATION HERE","(Dis)Allow Unsupervised Rent Extension"))
                dialogOwnedNotByuser:addOption(0, M.getText(user,"Gast hinzufügen","Add Guest"))
                dialogOwnedNotByuser:addOption(0, M.getText(user,"Gast entfernen","Remove Guest"))
                dialogOwnedNotByuser:addOption(0, M.getText(user,"Mieter eintragen","Set Renter"))
                dialogOwnedNotByuser:addOption(0, M.getText(user,"Mieter entfernen","Remove Renter"))
                dialogOwnedNotByuser:addOption(0, M.getText(user,"Miete anpassen","Change Rent"))
                dialogOwnedNotByuser:addOption(0, M.getText(user,"Miete verlängern","Extend Rent"))
                dialogOwnedNotByuser:addOption(0, M.getText(user,"Miete anpassen","Change Required Rank"))
                dialogOwnedNotByuser:addOption(0, M.getText(user,"GERMAN TRANSLATION HERE","Manage rent-free living"))
                dialogOwnedNotByuser:addOption(0, M.getText(user,"GERMAN TRANSLATION HERE","(Dis)Allow Unsupervised Rent Extension"))
            end
            if M.checkOwner(SourceItem) == "Unowned" then
                user:requestSelectionDialog(dialogUnowned)
            elseif M.checkOwner(SourceItem) == user.name then
                user:requestSelectionDialog(dialogOwnedByuser)
            else
                user:requestSelectionDialog(dialogOwnedNotByuser)
            end
        end
    end
end
return M
