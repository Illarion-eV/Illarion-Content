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

-- UPDATE items SET itm_script='item.bookrests' WHERE itm_id = 3104;
-- UPDATE items SET itm_script='item.bookrests' WHERE itm_id = 3105;
-- UPDATE items SET itm_script='item.bookrests' WHERE itm_id = 3106;
-- UPDATE items SET itm_script='item.bookrests' WHERE itm_id = 3107;
-- UPDATE items SET itm_script='item.bookrests' WHERE itm_id = 3108;

local common = require("base.common")
local seafaring = require("base.seafaring")
local townManagement = require("base.townManagement")
local factions = require("base.factions")
local vision = require("content.vision")
local lookat = require("base.lookat")
local money = require("base.money")


local M = {}

local FerryLookAt
local TMLookAt
local StaticTeleporterLookAt
local SalaveshLookAt
local AkaltutLookAt
local usingHomeTeleporter
local NecktieHomeTravel
local StaticTeleporter
local WonderlandTeleporter

local salaveshBookrest = position(741, 406, -3)
local akaltutBookrest = position(430, 815, -9)
local evilrockBookrest = position(975, 173, 0)
local wonderlandBookrest = position(864, 550, 0)
local ronaganBookrest = position(904, 585, -6)

function M.LookAtItem(User,Item)

    local lookAt
    -- Bookrest for the Salavesh dungeon
    if (Item.pos == salaveshBookrest) then
        lookAt = SalaveshLookAt(User, Item)
    end

    -- Bookrest for Akaltut dungeon
    if (Item.pos == akaltutBookrest) then
        lookAt = AkaltutLookAt(User, Item)
    end

        -- Bookrest for Ronagan dungeon
    if (Item.pos == ronaganBookrest) then
        lookAt = ronaganLookAt(User, Item)
    end

    -- Bookrest for townManagement
    local AmountTM = #townManagement.townManagmentItemPos
    for i = 1,AmountTM do
        if (Item.pos == townManagement.townManagmentItemPos[i]) then
            lookAt = TMLookAt(User, Item)
        end
    end

    -- Bookrest for ferry
    local Amountferry = #seafaring.ferrySourceItemPos
    for i = 1,Amountferry do
        if (Item.pos == seafaring.ferrySourceItemPos[i]) then
            lookAt = FerryLookAt(User, Item)
        end
    end

    -- static teleporter
    if Item:getData("staticTeleporter") ~= "" then
        lookAt = StaticTeleporterLookAt(User, Item)
    end

    if lookAt then
        return lookAt
    else
        return lookat.GenerateLookAt(User, Item, 0)
    end
end


function FerryLookAt(User, Item)
    local lookAt = ItemLookAt()
    if (User:getPlayerLanguage()==0) then
        lookAt.name = "F�hre"
        lookAt.description = "Wer bei der n�chsten Fahrt mit m�chte, sollte sich schnellstens hier innerhalb von f�nf Schritten sammeln. Preis: Zehn Silberst�cke f�r die ganze Gruppe."
    else
        lookAt.name = "Ferry"
        lookAt.description = "Anyone who would like to join for the next trip should gather here within five steps. Price: Ten silver pieces for the whole group."
    end
    return lookAt
end

function TMLookAt(User, Item)
    local lookAt = ItemLookAt()
    if (User:getPlayerLanguage()==0) then
        lookAt.name = "Stadtverwaltung"
        lookAt.description = "Instrument zur Verwaltung der Stadt. Nur f�r offizielle Vertreter."
    else
        lookAt.name = "Town Managment"
        lookAt.description = "Instrument for town management. Only for officials."
    end
    return lookAt
end

function StaticTeleporterLookAt(User, Item)
    local lookAt = ItemLookAt()
    lookAt.name = "Teleporter"
    return lookAt
end

function SalaveshLookAt(User, Item)
    local lookAt = ItemLookAt()
    lookAt.rareness = ItemLookAt.rareItem

    if (User:getPlayerLanguage()==0) then
        lookAt.name = "Tagebuch des Abtes Elzechiel"
        lookAt.description = "Dieses Buch ist von einer schaurigen Sch�nheit. Du bist versucht, es dennoch zu lesen..."
    else
        lookAt.name = "Journal of Abbot Elzechiel"
        lookAt.description = "This item has an evil presence. You are tempted to read it, though..."
    end
    return lookAt
end

function AkaltutLookAt(User, Item)
    local lookAt = ItemLookAt()
    lookAt.rareness = ItemLookAt.rareItem

    if (User:getPlayerLanguage()==0) then
        lookAt.name = "Infirmos magische Schriftrolle"
        lookAt.description = "Geschrieben in einer alten Sprache..."
    else
        lookAt.name = "Infirmo's magical scroll"
        lookAt.description = "Written in an old language..."
    end
    return lookAt
end

function ronaganLookAt(User, Item)
    local lookAt = ItemLookAt()
    lookAt.rareness = ItemLookAt.rareItem

    if (User:getPlayerLanguage()==0) then
        lookAt.name = "Pergament"
        lookAt.description = "Das Pergament tr�gt einen Stempel im Eck, der einen Fuchs darstellt."
    else
        lookAt.name = "Parchment"
        lookAt.description = "The parchment has a stamp of the fox on the corner."
    end
    return lookAt
end

function M.UseItem(User, SourceItem)
    -- Bookrest for the Salavesh dungeon
    if (SourceItem.pos == salaveshBookrest) then
        User:sendBook(201)
    end

        -- Bookrest for Akaltut dungeon
    if (SourceItem.pos == akaltutBookrest) then
        local foundEffect, myEffect = User.effects:find(120) -- monsterhunter_timer lte
        if User:getQuestProgress(529) == 3 and not foundEffect then
            User:inform("Der H�llenhund ist im S�dosten von hier.", "The hellhound is  southeast from here.")
            local myEffect = LongTimeEffect(120, 50) -- 5sec
            User.effects:addEffect(myEffect)
        elseif foundEffect then
            User:inform("Der H�llenhund ist im S�dosten von hier. Finde ihn!", "The hellhound is  southeast from here. Find it!")
        else
            User:inform("Die Schriftzeichen sagen dir nichts.", "You can't make any sense of the letters written here.")
        end
    end
    
            -- Bookrest for Ronagan dungeon
    if (SourceItem.pos == ronaganBookrest) then
        if User:getQuestProgress(543) == 4 then
            User:inform("Auf dem St�ck Papier stehen ein paar Worte. 'Sprich Fuchs und dr�ck gegen den Stein.' Du hast das mysteri�se Pergament f�r Brigette gefunden.", "The paper has a few words. 'Speak fox then push the rock.' You have found the mysterious parchment for Brigette.")
            User:setQuestProgress(543, 5) 
        else
            User:inform("Auf dem St�ck Papier stehen ein paar Worte. 'Sprich Fuchs und dr�ck gegen den Stein.' ", "The paper has a few words. 'Speak fox then push the rock.'")
        end
    end

    -- Bookrest for the Evilrock
    if (SourceItem.pos == evilrockBookrest) then
        local controlpannel = world:getPlayersInRangeOf(position(969,173,0), 8)
        if User:getQuestProgress(667) >= 25 then
            local AmountDarkColumnEvilrock = #vision.darkColumnEvilrock
            for i=1,AmountDarkColumnEvilrock do
                local DarkColumnEvilrockLightErase = world:getItemOnField(vision.darkColumnEvilrock[i])
                if DarkColumnEvilrockLightErase.id == 467 then
                    world:erase(DarkColumnEvilrockLightErase,DarkColumnEvilrockLightErase.number)
                    world:gfx(45,vision.darkColumnEvilrockLight[i])
                end
            end
            vision.beamMeDown(User, SourceItem)
            return
        else
            for i,player in ipairs(controlpannel) do
                player:inform("Du h�rst ein Klicken, aber nichts passiert.", "You hear a clicking but nothing happens.")

            end
            world:makeSound(22, evilrockBookrest)
        end

    end

    -- Bookrest for the Wonderland Area
    if (SourceItem.pos == wonderlandBookrest) then
        WonderlandTeleporter(User, SourceItem)
    end

    -- TownManagement
    local AmountTM = #townManagement.townManagmentItemPos
    for i = 1,AmountTM do
        if (SourceItem.pos == townManagement.townManagmentItemPos[i]) then
            townManagement.townManagmentUseItem(User, SourceItem)
        end
    end

    -- ferries
    local Amountferry = #seafaring.ferrySourceItemPos
    for i = 1,Amountferry do
        if (SourceItem.pos == seafaring.ferrySourceItemPos[i]) then
            seafaring.Ferry(User, SourceItem)
        end
    end

    -- static teleporter
    if SourceItem:getData("staticTeleporter") ~= "" then
        StaticTeleporter(User, SourceItem)
    end
end

function usingHomeTeleporter(User,factionNames,teleporterPos)
    local userFaction = factions.getMembershipByName(User)
    for i=1,#factionNames do
        if factionNames[i] == userFaction and User:distanceMetricToPosition(teleporterPos[i]) < 5 then
            return true
        end
    end
    return false
end

function NecktieHomeTravel(User,factionNames,teleporterPos,selected)
    local userFaction = factions.getMembershipByName(User)
    if (factionNames[selected]==userFaction and User:distanceMetricToPosition(teleporterPos[4]) < 5) or (selected == 4 and usingHomeTeleporter(User,factionNames,teleporterPos)) then
        return true
    end
    return false
end

local function akalutCadomyrBlockade(user)
    local foundValue, value = ScriptVars:find("akalutCadomyrBlockade")
    if not foundValue or tonumber(value) == 0 then
        return false
    end
    
    world:gfx(2, user.pos)
    user:increaseAttrib("hitpoints",-1000)
    user:inform("Ein Blitz kommt aus dem Teleporter geschossen.", "You are hit by a lightning coming from the teleporter.", Character.highPriority)
    
    return true
end

function StaticTeleporter(User, SourceItem)

    local names
    if  User:getPlayerLanguage() == Player.german then
        names = {"Runewick","Galmair","Cadomyr","Gasthof zur Hanfschlinge","Gef�ngnismine"}
    else
        names = {"Runewick","Galmair","Cadomyr","Hemp Necktie Inn","Prison Mine"}
    end
    local items = {105,61,2701,1909,466}
    local targetPos = {position(835,813,0), position(423,246,0),position(126,647,0),position(684,307,0),position(-484,-455,-40)}

    local callback = function(dialog)

        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex() + 1
            
            if selected == 3 or User:distanceMetricToPosition(targetPos[3]) <= 5 then
                if akalutCadomyrBlockade(User) then
                    return
                end
            end
            local userFaction = factions.getMembershipByName(User)
            -- Check wether the char has enough money or travels from necktie to hometown or vice versa
            if (money.CharHasMoney(User,500)) then 

                if User:distanceMetricToPosition(targetPos[selected]) < 5 then
                    User:inform("Ihr befindet euch bereits in " ..names[selected]..".", "You are already in "..names[selected]..".")
                else

                    User:inform("Ihr habt euch dazu entschlossen nach " ..names[selected].. " zu Reisen.", "You have chosen to travel to " ..names[selected]..".")
		    money.TakeMoneyFromChar(User,500)
                    world:gfx(46,User.pos)
                    world:makeSound(13,User.pos);

                    User:warp(targetPos[selected])
                    world:gfx(46,User.pos)
                    world:makeSound(13,User.pos);
                end
            else
                User:inform("Ihr habt nicht genug Geld f�r diese Reise. Die Reise kostet f�nf Silberst�cke.", "You don't have enough money for this journey. The journey costs five silver coins.")
            end

        end
    end

    local dialog
    if User:getPlayerLanguage() == Player.german then
        dialog = SelectionDialog("Teleporter", "Eine Reise kostet f�nf Silberst�cke. W�hle eine Ziel aus.", callback)
    else
        dialog = SelectionDialog("Teleporter", "A journey costs five silver coins. Choose a destination.", callback)
    end
    dialog:setCloseOnMove()

    for i=1,#items do
        dialog:addOption(items[i], names[i])
    end
    User:requestSelectionDialog(dialog)
end

function WonderlandTeleporter(User, SourceItem)
    local choices = {common.GetNLS(User, "Ja, nat�rlich!", "Yes, of course!"), common.GetNLS(User, "Nein, lieber nicht...", "No, better not...")}
    local callback = function(dialog)

        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex() + 1
            if selected == 1 then
                local wonderlandStart = position(900, 580, 0)
                User:inform("Ihr habt euch dazu entschlossen das Wunderland zu betreten.", "You have chosen to enter the Wonderland.")
                User:setQuestProgress(612,0)
                world:gfx(46, User.pos)
                world:makeSound(13, User.pos)

                User:warp(wonderlandStart)
                world:makeSound(25, User.pos)
                User:inform("Du h�rst ein Lachen und eine kr�chzende Stimme sagen: \"HAHA! Du geh�rst nun mir!\" Nach einer Weile h�rst du eine andere Stimme aus dem Nordwesten: \"Geh weg von mir!\"","You hear laughter and a croaking voice, saying: \"HAHA! You are mine now!\" After a while you hear another voice from the northwest: \"Get away from me!\"")
            end
        end
    end

    local dialogTitle = common.GetNLS(User, "Wunderland Teleporter", "Wonderland Teleporter")
    local dialogText = common.GetNLS(User, "M�chtet Ihr das Wunderland betreten?",
                                            "Do you wish to go to Wonderland?")
    local dialog = SelectionDialog(dialogTitle, dialogText, callback)

    dialog:setCloseOnMove()

    for i = 1, #choices do
        dialog:addOption(0, choices[i])
    end
    User:requestSelectionDialog(dialog)
end

return M
