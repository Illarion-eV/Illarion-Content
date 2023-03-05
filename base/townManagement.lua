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

local factions = require("base.factions")
local character = require("base.character")
local common = require("base.common")
local licence = require("base.licence")
local collectionchest = require("content.collectionchest")
local money = require("base.money")
local utility = require("housing.utility")

local M = {}

 -- Cadomyr, Runewick, Galmair
M.townManagmentItemPos = utility.townManagmentItemPos

local TownAnnouncement
local TownAnnouncementShow
local TownAnnouncementInput
local TownGuard
local TownLicence
local TownKey
local TownMaterial
local townProperties

function M.townManagmentUseItem(User, SourceItem)

    local toolTown
    for j = 1, #M.townManagmentItemPos do
        if (SourceItem.pos == M.townManagmentItemPos[j]) then
            toolTown = j
        end
    end

    local requiredRank = {8, 8, 8}
    local allowed = User:getQuestProgress(199) == toolTown and User:getQuestProgress(200) >= requiredRank[toolTown] and User:getQuestProgress(202) >= 600 or User:isAdmin() == true
    if not allowed then
        -- common.InformNLS(User, "Du hast keine Befugnis hierzu.", "You are not supposed to use this.")
        TownAnnouncementShow(User,toolTown)
        return
    end

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local selected = dialog:getSelectedIndex() + 1
        if selected == 1 then
            TownAnnouncement(User,toolTown)
        elseif selected == 2 then
            TownGuard(User,toolTown)
        elseif selected == 3 then
            TownLicence(User,toolTown)
        elseif selected == 4 then
            TownKey(User,toolTown)
        elseif selected == 5 then
            townProperties(User, toolTown, SourceItem)
        elseif selected == 6 then
            TownMaterial(User,toolTown)
        end
    end

    local dialogTitle = common.GetNLS(User, "Stadtmanagement", "Town Management")
    local dialogText = common.GetNLS(User, "Instrument zur Verwaltung der Stadt und Ankündigungen.", "Instrument for town management and announcements.")
    local dialog = SelectionDialog(dialogTitle, dialogText, callback)

    local toolUse
    if collectionchest.isCollectionChestExists(toolTown) then
        toolUse = common.GetNLS(User, {"Ankündigung", "Verbannung", "Lizenz", "Schlüssel","Grundstücksverwaltung", "Materialsammlung"}, {"Announcement", "Ban a character", "Licence", "Key","Property Management", "Material collection"})
    else
        toolUse = common.GetNLS(User, {"Ankündigung", "Verbannung", "Lizenz", "Schlüssel", "Grundstücksverwaltung"}, {"Announcement", "Ban a character", "Licence", "Key", "Property Management"})
    end

    for i = 1, #toolUse do
        dialog:addOption(0, toolUse[i])
    end

    dialog:setCloseOnMove()
    User:requestSelectionDialog(dialog)
end

local function getTown(toolTown)
    if toolTown == 1 then
        return "Cadomyr"
    elseif toolTown == 2 then
        return "Runewick"
    elseif toolTown == 3 then
        return "Galmair"
    end
end

local function getRentAmount(toolTown, SourceItem)
    local rent = SourceItem:getData("rent")
    if rent ~= "" then
        return tonumber(rent)
    else
        return 0
    end
end
local function collectedRentIntoMoney(toolTown, SourceItem)
local coins = getRentAmount(toolTown, SourceItem)
local gCoins, sCoins, cCoins = money.MoneyToCoins(coins)
    if gCoins > 0 and sCoins == 0 and cCoins == 0 then
        return(gCoins.." gold coins.")
    elseif gCoins > 0 and sCoins > 0 and cCoins == 0 then
        return(gCoins.." gold and "..sCoins.." silver coins")
    elseif gCoins > 0 and sCoins == 0 and cCoins > 0 then
        return(gCoins.." gold and "..cCoins.." copper coins")
    elseif gCoins == 0 and sCoins > 0 and cCoins == 0 then
        return(sCoins.." silver coins ")
    elseif gCoins == 0 and sCoins > 0 and cCoins > 0 then
        return(sCoins.." silver and "..cCoins.." copper coins")
    elseif gCoins == 0 and sCoins == 0 and cCoins > 0 then
        return(cCoins.." copper coins ")
    elseif gCoins > 0 and sCoins > 0 and cCoins > 0 then
        return(gCoins.." gold, "..sCoins.." silver and "..cCoins.." copper coins")
    else
        return("no money")
    end
end
local function collectedRentIntoMoneyDE(toolTown, SourceItem)
local coins = getRentAmount(toolTown, SourceItem)
local gCoins, sCoins, cCoins = money.MoneyToCoins(coins)
    if gCoins > 0 and sCoins == 0 and cCoins == 0 then
        return(gCoins.." Goldstücke")
    elseif gCoins > 0 and sCoins > 0 and cCoins == 0 then
        return(gCoins.." Gold- and "..sCoins.." Silberstücke")
    elseif gCoins > 0 and sCoins == 0 and cCoins > 0 then
        return(gCoins.." Gold- and "..cCoins.." Kupferstücke")
    elseif gCoins == 0 and sCoins > 0 and cCoins == 0 then
        return(sCoins.." Silberstücke ")
    elseif gCoins == 0 and sCoins > 0 and cCoins > 0 then
        return(sCoins.." Silber- and "..cCoins.." Kupferstücke")
    elseif gCoins == 0 and sCoins == 0 and cCoins > 0 then
        return(cCoins.." Kupferstücke ")
    elseif gCoins > 0 and sCoins > 0 and cCoins > 0 then
        return(gCoins.." Gold-, "..sCoins.." Silber- and "..cCoins.." Kupferstücke")
    else
        return("kein Geld")
    end
end

local function withdrawRent(User, toolTown, SourceItem)
local rent = getRentAmount(toolTown, SourceItem)
local town = getTown(toolTown)
local _
    local callback = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if string.find(input,"(%d+)") ~= nil then
            _, _, input = string.find(input,"(%d+)")
            input = tonumber(input)
            if input <= 0 then
                User:inform(common.GetNLS(User,"Die Zahl muss größer als 0 sein.","You must set a number higher than 0."))
            elseif input > rent then
                User:inform(common.GetNLS(User,"Die Zahl kann nicht größer sein als die Anzahl der Münzen in der Schatzkiste.","The amount can not be larger than the amount in the treasury."))
            else
                local coins = input
                local gCoins, sCoins, cCoins = money.MoneyToCoins(coins)
                money.GiveCoinsToChar(User, gCoins, sCoins, cCoins)
                SourceItem:setData("rent", (rent - input))
                world:changeItem(SourceItem)
                local inputIntoMoneyDe, inputIntoMoneyEn = money.MoneyToString(input)
                User:inform(common.GetNLS(User,"Du entnimmst "..inputIntoMoneyDe.." aus der Schatzkiste der Stadt.","You withdraw "..inputIntoMoneyEn.." from the town's treasury."))
                log(User.name.." withdrew "..inputIntoMoneyEn.." from the "..town.." rent treasury.")
            end
        else
            User:inform(common.GetNLS(User,"Hier muss eine Zahl eingetragen werden.","Input must be a number."))
        end
    end
    User:requestInputDialog(InputDialog(common.GetNLS(User,"Mietenentnahme","Rent Withdrawal"),common.GetNLS(User,"Gib an, wie viele Kupfermünzen du entnehmen möchtest.","Type in how much money you want to withdraw in copper coins."), false, 255, callback))
end
local function rentCollection(User,toolTown, SourceItem)
local rent = collectedRentIntoMoney(toolTown, SourceItem)
local rentDE = collectedRentIntoMoneyDE(toolTown, SourceItem)
    local callback = function(dialog)
        if getRentAmount(toolTown, SourceItem) ~= 0 then --the below code only matters for selectionDialog and not messageDialog
            if not dialog:getSuccess() then
                return
            end
            local selected = dialog:getSelectedIndex() + 1
            if selected == 1 then
                withdrawRent(User, toolTown, SourceItem)
            else
                User:inform(common.GetNLS(User,"Du entscheidest dich gegen das Entnehmen der Miete für den Augenblick.","You decide against withdrawing any rent for now."))
            end
        end
    end
    if getRentAmount(toolTown, SourceItem) == 0 then
        local dialog = MessageDialog(common.GetNLS(User,"Grundstücksmiete","Property Rent"), common.GetNLS(User,"Es sind keine Mieteinnahmen in der Schatzkiste.","There is currently no rental payment available for collection."), callback)
        User:requestMessageDialog(dialog)
    else
        local dialog = SelectionDialog(common.GetNLS(User,"Grundstücksmiete","Property Rent") , common.GetNLS(User,"Derzeit sind Mieteinnahmen von "..rentDE.." in der Schatzkiste. Möchtest du sie entnehmen?","There's currently "..rent.." in the treasury for rental payments.\nDo you want to withdraw any?") , callback)
        dialog:addOption(0,common.GetNLS(User,"Geld entnehmen","Withdraw money"))
        dialog:addOption(0,common.GetNLS(User,"Nichts entnehmen","Do not withdraw any"))
        User:requestSelectionDialog(dialog)
    end
end

function townProperties(user, toolTown, SourceItem)

    local town = getTown(toolTown)

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        if selected == 1 then
            rentCollection(user, toolTown, SourceItem)
        else
            utility.allowAllAutomaticRentExtension(user, town)
        end
    end

    local title = {
        english = "Property Management",
        german = "Grundstücksverwaltung"
    }

    local text = {
        english = "Select what you want to do",
        german = "Was möchtest du tun?"
    }

    local dialog = SelectionDialog(common.GetNLS(user, title.german, title.english), common.GetNLS(user, text.german, text.english), callback)

    dialog:addOption(0, common.GetNLS(user, "Miete abkassieren", "Collect Rent"))
    dialog:addOption(0, common.GetNLS(user, "Unbeaufsichtigte Mietverlängerung für alle Grundstücke zulassen", "Allow Unsupervised Rent Extension for All properties"))
    user:requestSelectionDialog(dialog)
end

function TownAnnouncement(User,toolTown)

    -- selection dialog
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local selected = dialog:getSelectedIndex() + 1
        if selected == 1 then
            TownAnnouncementShow(User,toolTown)
        elseif selected == 2 then
            TownAnnouncementInput(User,toolTown)
        end
    end

    local dialogTitle = common.GetNLS(User, "Ankündigung", "Announcement")
    local dialogText = common.GetNLS(User, "Wähle eine Option.", "Chose an option.")
    local dialog = SelectionDialog(dialogTitle, dialogText, callback)

    local options = common.GetNLS(User, {"Ankündigung lesen", "Ankündigung schreiben"}, {"Read announcement", "Write new announcement"})

    for i = 1, #options do
        dialog:addOption(0, options[i])
    end

    dialog:setCloseOnMove()
    User:requestSelectionDialog(dialog)

end

function TownAnnouncementShow(User,toolTown)

    -- message dialog
    local callback = function() end --empty callback
    local title = common.GetNLS(User, "Derzeitige Ankündigung", "Current announcement")

    --read
    local options = {"announcementCadomyr", "announcementRunewick", "announcementGalmair"}
    local text

    if options[toolTown] then
        local found, value = ScriptVars:find(options[toolTown])
        if found then
            text = value
        else
            text = common.GetNLS(User, "Keine Ankündigungen.", "No current announcement.")
        end
    else
        text = common.GetNLS(User,"Fehler. Bitte informiere einen Entwickler.","Error. Please inform a developer.")
    end

    local dialog = MessageDialog(title, text, callback)
    User:requestMessageDialog(dialog)

end

function TownAnnouncementInput(User,toolTown)

    -- input dialog
    local title = common.GetNLS(User, "Ankündigung schreiben", "Write new announcement")
    local text = common.GetNLS(User, "Schreibe deine neue Ankündigung. Abbruch führt dazu, dass die derzeitige Ankündigung beibehalten wird.", "Write your new annoucement. Cancel to keep current announcement.")

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        else
            local writtenText = dialog:getInput()
            if string.len (writtenText) > 986 then
                User:inform("Deine Ankündigung ist zu lang.","The announcement is too long.",Character.highPriority)
            else
                --write
                local options = {"announcementCadomyr", "announcementRunewick", "announcementGalmair"}
                local townNames = {"Cadomyr", "Runewick", "Galmair"}

                if options[toolTown] then
                    ScriptVars:set(options[toolTown], writtenText)
                    ScriptVars:save()
                    world:broadcast("In "..townNames[toolTown].." wurde eine neue Ankündigung veröffentlicht.", "A new announcement has been published in "..townNames[toolTown]..".")
                else
                    common.InformNLS(User,"Ungültige Stadt. Bitte informiere einen Entwickler.","Invalid town. Please report to a developer.")
                end
            end
        end
    end
    local dialog = InputDialog(title, text, false, 986, callback)
    User:requestInputDialog(dialog)

end

function TownGuard(User,toolTown)

    local callback = function(dialog)
        if not dialog:getSuccess() then
            common.InformNLS(User,"Abbruch. Niemand wurde gebannt.","Aborted. No one was banned.")
            return
        end

        local myString = dialog:getInput()
        local myCharId
        local myCharName
        local allFound = false
        local a, b, _
        if string.find(myString,"(%d+)") then
            _, _, myCharId = string.find(myString,"(%d+)")
            myCharId = tonumber(myCharId)
            allFound = true
        elseif string.find(myString,".*") then
            a,b = string.find(myString,".*")
            myCharName=string.sub (myString, a,b)
            allFound = true
        end
        if allFound then
            local onlineChars = world:getPlayersOnline()
            local theChar
            for i = 1, #onlineChars do
                local checkChar = onlineChars[i]
                if myCharId then
                    if checkChar.id == myCharId then
                        theChar = checkChar
                        break
                    end
                else
                    if checkChar.name == myCharName then
                        theChar = checkChar
                        break
                    end
                end
            end
            if not theChar then
                common.InformNLS(User,"Charakter wurde nicht gefunden.","Character was not found.")
            else
                local townId = toolTown
                factions.setIndividualPlayerRelation(theChar, townId, factions.RELATION_HOSTILE, 3);
                common.InformNLS(User,theChar.name.." ist für einen Zwergentag gebannt.",theChar.name.." is banned for one dwarven day.")
                User:logAdmin("bans " .. theChar.name .. " for one day from " .. factions.getTownNameByID(townId));
                log(string.format("[Town Management] %s bans %s for one day from " .. factions.getTownNameByID(townId),
                    character.LogText(User), theChar.name));
            end
        else
            common.InformNLS(User,"Du hast nicht alle notwendige Information angegeben.","You haven't put in all necessary information.")
        end
    end

    local dialogTitle = common.GetNLS(User, "Charakter bannen", "Ban a character")
    local dialogText = common.GetNLS(User, "Um einen Charakter einen Zwergentag zu bannen, gib folgendes an: [Name|ID] Beispiel: Max Mustermann", "To ban a character for one dwarven day, please insert: [Name|ID] Example: John Doe")
    local dialog = InputDialog(dialogTitle, dialogText, false, 255, callback)

    User:requestInputDialog(dialog)
end

function TownLicence(User,toolTown)

    local factionIds = {0,1,2,3}
    local FirstLicence = toolTown
    local licenceStrings = {}
    licenceStrings[licence.PERMISSION_NONE] = common.GetNLS(User, "Benutzung von statischen Werkzeugen ist verboten.", "Permission for static tools is restricted.")
    licenceStrings[licence.PERMISSION_ACTIVE] = common.GetNLS(User, "Benutzung von statischen Werkzeugen ist erlaubt.", "Permission for static tools is granted.")
    local TextWithRespctToA = common.GetNLS(User, " für ", " with respect to ")
    local TextWithRespctToB = common.GetNLS(User, " für ...", " with respect to ...")
    local TextSetLicenceOf = common.GetNLS(User, "Setze die Lizenz von ", "Set licence of ")
    local TextTo = common.GetNLS(User, " auf ...", " to ...")
    local TextLicence = common.GetNLS(User, "Lizenz", "Licence")
    local TextSetLicence = common.GetNLS(User, "Setze Lizenz", "Set licence")

    local licenceValues = {licence.PERMISSION_NONE, licence.PERMISSION_ACTIVE}
    local cbSecondLicence = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local SecondLicence = factionIds[dialog:getSelectedIndex() + 1]
        local cbSetLicence = function (subdialog)
            if not subdialog:getSuccess() then
                return
            end
            local newLicence = licenceValues[subdialog:getSelectedIndex() + 1]
            licence.SetLicence(FirstLicence, SecondLicence, newLicence)
            licenceStrings[licence.PERMISSION_NONE] = "restricted"
            licenceStrings[licence.PERMISSION_ACTIVE] = "granted"
            User:logAdmin("sets license of " .. factions.getTownNameByID(FirstLicence) .. " with respect to " .. factions.getTownNameByID(SecondLicence) .. " to " .. licenceStrings[newLicence] )
            log(string.format("[Town Management] %s sets license of %s with respect to %s to " .. licenceStrings[newLicence],
                character.LogText(User), factions.getTownNameByID(FirstLicence), factions.getTownNameByID(SecondLicence)));
        end
        local sd = SelectionDialog(TextSetLicence, TextSetLicenceOf .. factions.getTownNameByID(FirstLicence) .. TextWithRespctToA .. factions.getTownNameByID(SecondLicence) .. TextTo, cbSetLicence)
        for _,m in ipairs(licenceValues) do
            sd:addOption(0, licenceStrings[m])
        end

        sd:setCloseOnMove()
        User:requestSelectionDialog(sd)
    end
    local sd = SelectionDialog(TextLicence, TextSetLicenceOf .. factions.getTownNameByID(FirstLicence) .. TextWithRespctToB, cbSecondLicence)
    for _,f in ipairs(factionIds) do
        sd:addOption(0,factions.getTownNameByID(f) .. ": " .. licenceStrings[licence.GetLicenceByFaction(FirstLicence, f)])
    end

    sd:setCloseOnMove()
    User:requestSelectionDialog(sd)
end


local keyID = {}
keyID[1]={3054,3054,3054,2558,2558,2558,2558,2558,2558,2558,2558}
keyID[2]={2558,2558,2558,2558,2558,2558,2558,2558,2558,2558,2558,2558,2558}
keyID[3]={3056,3055,2558,2558,2558,2558,2558,2558,2558,2558,2558,2558,2558,2558,2558,2558,2558}

local keydoorsID = {}
keydoorsID[1]={340,341,342,343,361,362,363,364,365,366,367}
keydoorsID[2]={240,241,242,251,211,210,236,233,235,234,230,231,243}
keydoorsID[3]={110,111,120,121,122,123,124,125,126,127,128,113,114,115,131,132,133}

local keydoorsnameDE = {}
local keydoorsnameEN = {}
keydoorsnameDE[1]={"Villa Annabeth","Villa Edward","Villa Reginald","Villa Annabeth Keller","Wohnungsquartier - Glaube & Gehorsam","Wohnungsquartier - Ehre & Abstammung","Wohnungsquartier - Ehrlichkeit & Gerechtigkeit","Wohnungsquartier - Courage","Wohnungsquartier - Patriarchat","Wohnungsquartier - Besitz","Schlangenturm"}
keydoorsnameEN[1]={"Villa Annabeth","Villa Edward","Villa Reginald","Villa Annabeth Basement","Flat quarter - Faith & Obedience","Flat quarter - Honour & Lineage","Flat quarter - Truth & Justice","Flat quarter - Courage","Flat quarter - Patriarchy","Flat quarter - Property","Serpent Tower"}
keydoorsnameDE[2]={"Insel des Feuers Appartement 1","Insel des Feuers Appartement 2","Insel des Feuers Appartement 3","Landhaus","Insel der Luft Appartement 2","Insel der Luft Appartement 1","Insel der Erde Appartement 6","Insel der Erde Appartement 3","Insel der Erde Appartement 5","Insel der Erde Appartement 4","Insel der Erde Appartement 1","Insel der Erde Appartement 2","Insel des Feuers Appartement 4"}
keydoorsnameEN[2]={"Island of Fire Apartment 1","Island of Fire Apartment 2","Island of Fire Apartment 3","Cottage","Island of Air Apartment 2","Island of Air Apartment 1","Island of Earth Apartment 6","Island of Earth Apartment 3","Island of Earth Apartment 5","Island of Earth Apartment 4","Island of Earth Apartment 1","Island of Earth Apartment 2","Island of Fire Apartment 4"}
keydoorsnameDE[3]={"Malachite Haus","Villa Goldader","Wohnung Irmorom","Wohnung Elara","Wohnung Adron","Wohnung Malachin","Wohnung Oldra","Wohnung Nargun","Wohnung Ronagan","Wohnung Sirani","Wohnung Zhambra", "Glückskupfer", "Silberner Verdienst", "Goldener Abschluss","Wohnung Saphir","Wohnung Diamant","Wohnung Obsidian"}
keydoorsnameEN[3]={"House of Malachite","Villa Goldvein","Flat Irmorom","Flat Elara","Flat Adron","Flat Malachin","Flat Oldra","Flat Nargun","Flat Ronagan","Flat Sirani","Flat Zhambra", "Lucky Copper", "Silver Profit", "Golden Deal","Flat Sapphire", "Flat Diamond", "Flat Obisidian"}


function TownKey(User,toolTown)
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1
        common.CreateItem(User, keyID[toolTown][selected], 1, 999, {["lockId"]=keydoorsID[toolTown][selected],["descriptionDe"]=keydoorsnameDE[toolTown][selected],["descriptionEn"]=keydoorsnameEN[toolTown][selected]})
        User:logAdmin("creates a key for " .. keydoorsnameEN[toolTown][selected])
        log(string.format("[Town Management] %s creates a key for %s ",
            character.LogText(User) , keydoorsnameEN[toolTown][selected]));
    end

    local dialogTitle = common.GetNLS(User, "Schlüsselgenerator", "Key-Generator")
    local dialogText = common.GetNLS(User, "Erstelle einen Schlüssel für folgende TÃ¼ren.", "Create a key for following doors.")
    local dialog = SelectionDialog(dialogTitle, dialogText, callback)

    local keydoorsname = common.GetNLS(User, keydoorsnameDE[toolTown], keydoorsnameEN[toolTown])
    for i = 1, #keydoorsname do
        dialog:addOption(0, keydoorsname[i])
    end

    dialog:setCloseOnMove()
    User:requestSelectionDialog(dialog)
end

function TownMaterial(User, townId)
    collectionchest.manageCollections(User, townId)
end
return M
