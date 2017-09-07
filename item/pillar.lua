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
local vision = require("content.vision")
local altars = require("item.altars")

local M = {}

-- UPDATE items SET itm_script='item.pillar' WHERE itm_id IN (272, 440, 441, 442, 443, 464, 467, 692, 693, 694, 695, 2805);

local function RosalineLookAt(User, Item)
    local itemLookat = lookat.GenerateLookAt(User, Item, lookat.NONE)
    itemLookat.name = common.GetNLS(User, "Königin Rosaline", "Queen Rosaline")
    itemLookat.description = common.GetNLS(User,
        "Dieses Monument zeigt die junge Königin Rosaline. Eine Auflistung der Herrscher von Cadomyr ist auf einer Messingtafel am Sockel den Monuments zu lesen.",
        "This monument shows young Queen Rosaline. A register of the rulers of Cadomyr is engraved upon a brass plate at the bottom of the pedestal.")
    return itemLookat
end

local function ReginaldLookAt(User, Item)
    local itemLookat = lookat.GenerateLookAt(User, Item, lookat.NONE)
    itemLookat.name = common.GetNLS(User, "Sir Reginald", "Sir Reginald")
    itemLookat.description = common.GetNLS(User,
        "Dieses Monument zeigt Sir Reginald Edwards, den verstorbenen König Cadomyrs und Vater von Königin Rosaline. Die Sitten Cadomyrs sind auf einer Messingtafel am Sockel den Monuments zu lesen.",
        "This monument shows Sir Reginald Edwards, the departed king of Cadomyr and father of Queen Rosaline. The customs of Cadomyr are engraved upon a brass plate at the bottom of the pedestal.")
    return itemLookat
end

local function Chancellor1LookAt(User, Item)
    local itemLookat = lookat.GenerateLookAt(User, Item, lookat.NONE)
    itemLookat.name = common.GetNLS(User, "Kanzler Statue #1", "Chancellor Statue #1")
    itemLookat.description = common.GetNLS(User,
        "Die Namen der Kanzler Galmairs sind auf die Statue graviert.",
        "The names of the Galmairian Chancellors are engraved on the statue.")
    return itemLookat
end

local function Chancellor2LookAt(User, Item)
    local itemLookat = lookat.GenerateLookAt(User, Item, lookat.NONE)
    itemLookat.name = common.GetNLS(User, "Kanzler Statue #2", "Chancellor Statue #2")
    itemLookat.description = common.GetNLS(User,
        "Die Namen der Kanzler Galmairs sind auf die Statue graviert.",
        "The names of the Galmairian Chancellors are engraved on the statue.")
    return itemLookat
end

local function Chancellor3LookAt(User, Item)
    local itemLookat = lookat.GenerateLookAt(User, Item, lookat.NONE)
    itemLookat.name = common.GetNLS(User, "Kanzler Statue #3", "Chancellor Statue #3")
    itemLookat.description = common.GetNLS(User,
        "Die Namen der Kanzler Galmairs sind auf die Statue graviert.",
        "The names of the Galmairian Chancellors are engraved on the statue.")
    return itemLookat
end

local function PillarLookAt(User, Item)
    local itemLookat = lookat.GenerateLookAt(User, Item, lookat.NONE)
    itemLookat.name = common.GetNLS(User, "Zzarn'K'Ska Pfeiler", "Zzarn'K'Ska Pillar")
    itemLookat.description = common.GetNLS(User,
        "Der Griff einer Waffe schaut aus der Säule raus.",
        "The handle of a weapon can be seen sticking out from the pillar.")
    return itemLookat
    end
local function BridgeCanalLookAt(User, Item)
    local itemLookat = lookat.GenerateLookAt(User, Item, lookat.NONE)
    itemLookat.name = common.GetNLS(User, "Kanaldenkmal.", "Canal Monument")
    itemLookat.description = common.GetNLS(User,
        "Die Namer derer, die am Bau beteiligt waren, sind in den Sockel eingraviert.",
        "The names of those who contributed are engraved on the statue.")
    return itemLookat
end

function M.LookAtItem(User, Item)

    if Item:getData("elaraStatueRunewick") == "true" then
        return altars.LookAtItem(User, Item)
    end

    -- Endurance Cave Quest
    if Item.pos == position(7, 11, -15) then
        local stage = User:getQuestProgress(204)

        if stage >= 9 then
            common.InformNLS(User,
                "Die Frau sieht dich diesmal mit stechendem irren Blick an, ihre Augen blutunterlaufen. Ihr Haar zu roten Flammen gewandelt.",
                "This time the woman leers at you with madness in her bloodshot eyes. Her hair has turned to crimson flames.")
        end
        return
    end

    local itemLookat

    -- Statue of Queen Rosaline
    if Item.pos == position(118, 566, 0) then
        itemLookat = RosalineLookAt(User, Item)
    end

    -- Statue of Sir Reginald Edwards
    if Item.pos == position(125, 566, 0) then
        itemLookat = ReginaldLookAt(User, Item)
    end

    -- Chancellor Statue 1
    if Item.pos == position(371, 266, 0) then
        itemLookat = Chancellor1LookAt(User, Item)
    end

    -- Chancellor Statue 2
    if Item.pos == position(359, 266, 0) then
        itemLookat = Chancellor2LookAt(User, Item)
    end

    -- Chancellor Statue 3
    if Item.pos == position(371, 277, 0) then
        itemLookat = Chancellor3LookAt(User, Item)
    end

    -- Zzarn'K'Ska Pillar
    if Item.pos == position(563, 260, 0) then
        itemLookat = PillarLookAt(User, Item)
    end

    -- Service Recognition Statues Canal, Ferry, Bridge
    if Item.pos == position(596, 150, 0) or Item.pos == position(607, 150, 0) or Item.pos == position(588, 182, 0) or Item.pos == position(600, 183, 0) or Item.pos == position(755, 252, 1) or Item.pos == position(760, 338, 1) then
        itemLookat = BridgeCanalLookAt(User, Item)
    end

    if itemLookat then
        return itemLookat --Send the custom lookAt
    else
        return lookat.GenerateLookAt(User, Item)
    end
end


function M.UseItem(User, SourceItem, ltstate)

    if SourceItem:getData("elaraStatueRunewick") == "true" then
        altars.UseItem(User, SourceItem)
        return
    end

    vision.UseDarkColumnsPuzzle(User, SourceItem, ltstate)
    vision.UseDarkColumns(User, SourceItem, ltstate)

    if SourceItem.pos == position(125, 566, 0) then --Sir Reginald's statue

        --Dialog
        local dialogTitle = common.GetNLS(User, "Sitten Cadomyrs", "Customs of Cadomyr")
        local dialogText = common.GetNLS(User,
            "I. Glaube: Ehre die Götter. Nur sie alleine sind wahrhaftig allmächtig.\nII. Gehorsam: Sei loyal und folgsam. Dein Monarch verkörpert den Willen der Götter.\nIII. Ehre: Handle stets ehrenhaft. Deine Ehre zu verteidigen ist dein Recht und deine Pflicht.\nIV. Abstammung: Kenne deinen Platz. Deine Geburt zählt mehr als dein Leben oder dein Tod.\nV. Ehrlichkeit: Halte dein Wort und gib kein falsches Zeugnis ab. Du wirst an deinen Worten gemessen.\nVI. Gerechtigkeit: Sei gerecht zu jedem. Stehle nicht, gib deine Freundschaft dem Freund und dein Schwert dem Feind.\nVII. Courage: Fürchte nicht. Stehe für deinen Herrscher und dein Ehre ein. Kein Rückzug, niemals aufgeben.\nVIII. Patriarchat: Gehorche dem Vater. Gehorche dem Ehemann. Aber gehorche nicht dem Sohn.\nIX. Besitz: Was dein ist, soll auch dein bleiben, sei es Getreide, Hund oder Mann.\nX. Verantwortung: Deine Taten hängen dir nach. Nur du bist ihr Ursprung.",
            "I. Faith: Worship the gods, they alone are true and almighty.\nII. Obedience: Be loyal and obedient, your monarch represents the will of the gods.\nIII. Honour: In all things act with honour. Defending it is your right and duty.\nIV. Lineage: Know your place. Your birth matters more than your life or death.\nV. Truth: Keep your word and give no false testimony. The strength of your word measures your worth.\nVI. Justice: In all things be fair and just; never steal, offer your friendship freely, but do not spare your enemy the sword.\nVII. Courage: Fear is not permissible. Stand for your honour and sovereign. Never retreat, never surrender.\nVIII. Patriarchy: Obey your father, obey your husband, but never your son.\nIX. Property: What is yours will remain yours, be it crop, dog, or man.\nX. Responsibility: In all things you are bound to your deeds. You are their origin.")
        local callbackReginald = function(nothing) end --empty callback
        local dialogReginald = MessageDialog(dialogTitle, dialogText, callbackReginald)

        User:requestMessageDialog(dialogReginald)

        --Quest
        if User:getQuestProgress(111) == 1 then --change when quest is ready!

            User:setQuestProgress(111, 2); --the player read all laws
            common.InformNLS(User, "[Queststatus] Du hast nun die Sitten Cadomyrs gelesen.", "[Quest progress] You read the Cadomyrian customs.")

        end

    elseif SourceItem.pos == position(118, 566, 0) then --Queen Rosaline's statue

        --Dialog
        local dialogTitle = common.GetNLS(User, "Herrscher Cadomyrs", "Sovereigns of Cadomyr")
        local dialogText = common.GetNLS(User,
            "1. König Edward - 16 BS\n\n2. König Reginald - 0 AS\n\n3. Königin Rosaline Edwards - 32 AS",
            "1. Sir Edward - 16 BS\n\n2. Sir Reginald - 0 AS\n\n3. Queen Rosaline Edwards - 32 AS")
        local callbackRosaline = function(nothing) end --empty callback
        local dialogRosaline = MessageDialog(dialogTitle, dialogText, callbackRosaline)

        User:requestMessageDialog(dialogRosaline)

    elseif SourceItem.pos == position(371, 266, 0) then -- Chancellor Statue 1

        --Dialog
        local dialogTitle = common.GetNLS(User, "Liste der Galmarianischen Kanzler", "List of Galmairian Chancellors")
        local dialogText = common.GetNLS(User,
            "Evie Pryler im Jahr 51\nEvie Pryler im Jahr 50\nUnbesetzt im Jahr 49\nEvie Pryler (Dranis) im Jahr 47\nEvie Pryler im Jahr 46\nArtimer Fault im Jahr 45\nArcia im Jahr 44\nEvie Pryler im Jahr 43\nUhuru Pryler im Jahr42\nOxiana im Jahr 41",
            "Evie Pryler in the year 51\nEvie Pryler in the year 50\nVacant in the year 49\nEvie Pryler (Dranis) in the year 47\nEvie Pryler in the year 46\nArtimer Fault in the year 45\nArcia in the year 44\nEvie Pryler in the year 43\nUhuru Pryler in the year 42\nOxiana in the year 41")
        local callbackChancellor1 = function(nothing) end --empty callback
        local dialogChancellor1 = MessageDialog(dialogTitle, dialogText, callbackChancellor1)

        User:requestMessageDialog(dialogChancellor1)

    elseif SourceItem.pos == position(359, 266, 0) then --Chancellor Statue 2

        --Dialog
        local dialogTitle = common.GetNLS(User, "Liste der Galmarianischen Kanzler", "List of Galmairian Chancellors")
        local dialogText = common.GetNLS(User,
            "Kyre im Jahr 51\nArtimer Fault im Jahr 50\nBernie Bottoms im Jahr 49\nRaina Narethil im Jahr 47\nKyre im Jahr 46\nKyre im Jahr 45\nKyre im Jahr 44\nVelisai im Jahr 43\nKyre im Jahr42\nKyre im Jahr 41",
            "Kyre in the year 51\nArtimer Fault in the year 50\nBernie Bottoms in the year 49\nRaina Narethil in the year 47\nKyre in the year 45\nKyre in the year 44\nVelisai in the year 43\nKyre in the year 42\nKyre in the year 41")
        local callbackChancellor2 = function(nothing) end --empty callback
        local dialogChancellor2 = MessageDialog(dialogTitle, dialogText, callbackChancellor2)

        User:requestMessageDialog(dialogChancellor2)

    elseif SourceItem.pos == position(371, 277, 0) then --Chancellor Statue 3

        --Dialog
        local dialogTitle = common.GetNLS(User, "Liste der Galmarianischen Kanzler", "List of Galmairian Chancellors")
        local dialogText = common.GetNLS(User,
            "Caswir im Jahr 51\nBanduk Robberhauf el Luastelay im Jahr 50\nBanduk Robberhauf el Luastelay im Jahr 49\nArtimer Fault im Jahr 47\nUlquiorra Dreadhart im Jahr 46\nTialdin im Jahr 45\nSarangerel (Ufedhin Copperhand) im Jahr 44\nSarangerel im Jahr 43\nOxiana im Jahr42\nPurple im Jahr 41",
            "Caswir in the year 51\nBanduk Robberhauf el Luastelay in the year 50\nBanduk Robberhauf el Luastelay in the year 49\nArtimer Fault in the year 47\nUlquiorra Dreadhart in the year 46\nTialdin in the year 45\nSarangerel (Ufedhin Copperhand) in the year 44\nSarangerel in the year 43\nOxiana in the year 42\nPurple in the year 41")
        local callbackChancellor3 = function(nothing) end --empty callback
        local dialogChancellor3 = MessageDialog(dialogTitle, dialogText, callbackChancellor3)

        User:requestMessageDialog(dialogChancellor3)

    elseif SourceItem.pos == position(563, 260, 0) then --Zzarn'K'Ska Pillar
      --Quest
        if User:getQuestProgress(503) == 0 then -- start the quest
            User:setQuestProgress(503, 1); -- get an inform
            User:setQuestProgress(507, 6); -- set cooldown
            User:inform("Nimm diese Waffe und schließe dich uns an oder sterbe sogleich.", "Take this weapon to join us, or die where you stand.")

        elseif User:getQuestProgress(503) == 1 then -- taking the weapon
            local queststatus = User:getQuestProgress(506) -- here, we save which events were triggered
            local queststatuslist = {}
            queststatuslist = common.Split_number(queststatus, 6) -- reading the digits of the queststatus as table
            if queststatuslist[1] == 0 then -- sword, only triggered once by each char
            User:inform("Du nimmst das Schwert an dich und schließt sich dem Zzarn'K'Ska an.", "You take the sword and join the Zzarn'K'Ska.")
            common.CreateItem(User, 2655, 1, 866, {descriptionEn = "Holy Sword of the Zzarn'K'Ska of Zelphia", descriptionDe = "Das heilige Schwert der ZzarnK'Ska von Zelphia", rareness = "4"})
            queststatuslist[1] = 1
            User:setQuestProgress(506, queststatuslist[1]*100000+queststatuslist[2]*10000+queststatuslist[3]*1000+queststatuslist[4]*100+queststatuslist[5]*10+queststatuslist[6]*1) --saving the new queststatus
            User:setQuestProgress(503, 2)
            User:setQuestProgress(507, 0)
        end

        elseif User:getQuestProgress(503) == 2 then -- you already took the sword.
            User:inform("Du haben das Schwert an dich und schließt sich dem Zzarn'K'Ska an.", "You took the sword and joined the Zzarn'K'Ska.")

        elseif User:getQuestProgress(503) == 3 then -- you lost your chance.
            User:inform("Du hast darin versagt, das Schwert an dich zu nehmen und dem Zzarn'K'Ska Zelphias beizutreten.","You failed to take the sword and join the Zzarn'K'Ska of Zelphia.")
        end
    elseif SourceItem.pos == position(246, 778, -8) then -- Letma Pillar one
        if User:getQuestProgress(513) == 20 then -- have the quest to find the name
            User:setQuestProgress(513, 21) -- Found the first pillar
            User:inform("Du hast eine Säule gefunden, auf dieser steht ein 'P'.", "You have found the first pillar, so far you have found 'P'.")
        elseif User:getQuestProgress(513) > 20 then -- already been here
            User:inform("Du hast diese Säule schon zuvor gefunden, probiere dein Glück mit einer anderen.", "You previously found this pillar, try your luck with another one.")
        end
    elseif SourceItem.pos == position(238, 782, -6) then -- Letma Pillar two
        if User:getQuestProgress(513) == 21 then 
            User:setQuestProgress(513, 22) -- Found the second pillar
            User:inform("Du hast eine Säule gefunden, auf dieser steht ein 'PR'.", "You have found the second pillar, so far you have found 'PR'.")
        elseif User:getQuestProgress(513) > 22 then -- already been here
            User:inform("Du hast diese Säule schon zuvor gefunden, probiere dein Glück mit einer anderen.", "You previously found this pillar, try your luck with another one.")
        elseif User:getQuestProgress(513) >= 20 and User:getQuestProgress(513) < 21 then -- already been here
            User:inform("Es scheint nicht die richtige Zeit zu sein um diese Säule zu benutzen.", "It does not appear that it is the appropriate time to use this column.")
        end
    elseif SourceItem.pos == position(300, 755, -3) then -- Letma Pillar three
        if User:getQuestProgress(513) == 22 then 
            User:setQuestProgress(513, 23) -- Found the third pillar
            User:inform("Du hast eine Säule gefunden, auf dieser steht ein 'PRE'.", "You have found the third pillar, so far you have found 'PRE'.")
        elseif User:getQuestProgress(513) > 23 then -- already been here
            User:inform("Du hast diese Säule schon zuvor gefunden, probiere dein Glück mit einer anderen.", "You previously found this pillar, try your luck with another one.")
        elseif User:getQuestProgress(513) >= 20 and User:getQuestProgress(513) < 22 then -- already been here
            User:inform("Es scheint nicht die richtige Zeit zu sein um diese Säule zu benutzen.", "It does not appear that it is the appropriate time to use this column.")
        end
    elseif SourceItem.pos == position(295, 755, -3) then -- Letma Pillar four
        if User:getQuestProgress(513) == 23 then 
            User:setQuestProgress(513, 24) -- Found the fourth pillar
            User:inform("Du hast eine Säule gefunden, auf dieser steht ein 'PREA'.", "You have found the fourth pillar, so far you have found 'PREA'.")
        elseif User:getQuestProgress(513) > 24 then -- already been here
            User:inform("Du hast diese Säule schon zuvor gefunden, probiere dein Glück mit einer anderen.", "You previously found this pillar, try your luck with another one.")
        elseif User:getQuestProgress(513) >= 20 and User:getQuestProgress(513) < 23 then -- already been here
            User:inform("Es scheint nicht die richtige Zeit zu sein um diese Säule zu benutzen.", "It does not appear that it is the appropriate time to use this column.")
        end
    elseif SourceItem.pos == position(212, 820, -6) then -- Letma Pillar five
        if User:getQuestProgress(513) == 24 then 
            User:setQuestProgress(513, 25) -- Found the fifth pillar
            User:inform("Du hast eine Säule gefunden, auf dieser steht ein 'PREAC'.", "You have found the fifth pillar, so far you have found 'PREAC'.")
        elseif User:getQuestProgress(513) > 25 then -- already been here
            User:inform("Du hast diese Säule schon zuvor gefunden, probiere dein Glück mit einer anderen.", "You previously found this pillar, try your luck with another one.")
        elseif User:getQuestProgress(513) >= 20 and User:getQuestProgress(513) < 24 then -- already been here
            User:inform("Es scheint nicht die richtige Zeit zu sein um diese Säule zu benutzen.", "It does not appear that it is the appropriate time to use this column.")
        end
    elseif SourceItem.pos == position(280, 808, -3) then -- Letma Pillar six
        if User:getQuestProgress(513) == 25 then 
            User:setQuestProgress(513, 26) -- Found the sixth pillar
            User:inform("Du hast eine Säule gefunden, auf dieser steht ein 'PREACE'.", "You have found the sixth pillar, so far you have found 'PREACE'.")
        elseif User:getQuestProgress(513) > 26 then -- already been here
            User:inform("Du hast diese Säule schon zuvor gefunden, probiere dein Glück mit einer anderen.", "You previously found this pillar, try your luck with another one.")
        elseif User:getQuestProgress(513) >= 20 and User:getQuestProgress(513) < 25 then -- already been here
            User:inform("Es scheint nicht die richtige Zeit zu sein um diese Säule zu benutzen.", "It does not appear that it is the appropriate time to use this column.")
        end
    elseif SourceItem.pos == position(277, 804, -3) then -- Letma Pillar seven
        if User:getQuestProgress(513) == 26 then 
            User:setQuestProgress(513, 27) -- Found the seventh pillar
            User:inform("Du hast eine Säule gefunden, auf dieser steht ein 'PREACER'.", "You have found the seventh pillar, so far you have found 'PREACER'.")
        elseif User:getQuestProgress(513) > 27 then -- already been here
            User:inform("Du hast diese Säule schon zuvor gefunden, probiere dein Glück mit einer anderen.", "You previously found this pillar, try your luck with another one.")
        elseif User:getQuestProgress(513) >= 20 and User:getQuestProgress(513) < 26 then -- already been here
            User:inform("Es scheint nicht die richtige Zeit zu sein um diese Säule zu benutzen.", "It does not appear that it is the appropriate time to use this column.")
        end
     elseif SourceItem.pos == position(262, 750, -3) then -- Letma Pillar eight
        if User:getQuestProgress(513) == 27 then 
            User:setQuestProgress(513, 28) -- Found the eighth pillar
            User:inform("Du hast eine Säule gefunden, auf dieser steht ein 'PREACERD'.", "You have found the eighth pillar, so far you have found 'PREACERD'.")
        elseif User:getQuestProgress(513) > 28 then -- already been here
            User:inform("Du hast diese Säule schon zuvor gefunden, probiere dein Glück mit einer anderen.", "You previously found this pillar, try your luck with another one.")
        elseif User:getQuestProgress(513) >= 20 and User:getQuestProgress(513) < 27 then -- already been here
            User:inform("Es scheint nicht die richtige Zeit zu sein um diese Säule zu benutzen.", "It does not appear that it is the appropriate time to use this column.")
        end
    elseif SourceItem.pos == position(226, 780, -8) then -- Letma Pillar nine
        if User:getQuestProgress(513) == 28 then 
            User:setQuestProgress(513, 29) -- Found the ninth pillar
            User:inform("Du hast eine Säule gefunden, auf dieser steht ein 'PREACERDH'.", "You have found the ninth pillar, so far you have found 'PREACERDH'.")
        elseif User:getQuestProgress(513) > 29 then -- already been here
            User:inform("Du hast diese Säule schon zuvor gefunden, probiere dein Glück mit einer anderen.", "You previously found this pillar, try your luck with another one.")
        elseif User:getQuestProgress(513) >= 20 and User:getQuestProgress(513) < 28 then -- already been here
            User:inform("Es scheint nicht die richtige Zeit zu sein um diese Säule zu benutzen.", "It does not appear that it is the appropriate time to use this column.")
        end
    elseif SourceItem.pos == position(233, 816, -6) then -- Letma Pillar ten
        if User:getQuestProgress(513) == 29 then 
            User:setQuestProgress(513, 30) -- Found the tenth pillar
            User:inform("Du hast eine Säule gefunden, auf dieser steht ein 'PREACERDHA'.", "You have found the tenth pillar, so far you have found 'PREACERDHA'.")
        elseif User:getQuestProgress(513) > 30 then -- already been here
            User:inform("Du hast diese Säule schon zuvor gefunden, probiere dein Glück mit einer anderen.", "You previously found this pillar, try your luck with another one.")
        elseif User:getQuestProgress(513) >= 20 and User:getQuestProgress(513) < 29 then -- already been here
            User:inform("Es scheint nicht die richtige Zeit zu sein um diese Säule zu benutzen.", "It does not appear that it is the appropriate time to use this column.")
        end
    elseif SourceItem.pos == position(244, 749, -3) then -- Letma Pillar eleven
        if User:getQuestProgress(513) == 30 then 
            User:setQuestProgress(513, 31) -- Found the  eleventh pillar
            User:inform("Du hast die letzte Säule gefunden und einen Dämonenstab entdeckt.", "You have found the last pillar and discover a Demon's Wand.")
            common.CreateItem(User, 2783, 1, 999, {descriptionEn = "The wand is carved with demonic runes and the name Preacerdhal.", descriptionDe = "In den Stab sind dämonische Runen und der Name Praecerdhal eingeritzt.",nameEn = "Demon's Wand", nameDe = "Dämonischer Zauberstab", rareness = "4"})
        elseif User:getQuestProgress(513) > 31 then -- already been here
            User:inform("Du hast diese Säule schon zuvor gefunden, probiere dein Glück mit einer anderen.", "You have already solved the mystery of the columns.")
        elseif User:getQuestProgress(513) >= 20 and User:getQuestProgress(513) < 30 then -- already been here
            User:inform("Es scheint nicht die richtige Zeit zu sein um diese Säule zu benutzen.", "It does not appear that it is the appropriate time to use this column.")
        end
    elseif SourceItem.pos == position(596, 150, 0) or SourceItem.pos == position(607, 150, 0) or SourceItem.pos == position(588, 182, 0) or SourceItem.pos == position(600, 183, 0) or SourceItem.pos == position(755, 252, 1) or SourceItem.pos == position(760, 338, 1) then -- statues of recognition
            --Dialog
        local dialogTitle = common.GetNLS(User, "Kanaldenkmal", "Canal Monument")
        local dialogText = common.GetNLS(User,
            "In Anerkennung seiner & ihrer Dienste für Kanal, Brücke und Fähre:\nSarangerel\nEvie Pryler & ihr Clan\nRakaya & ihre Träger\nJulia da Silva\nJerem Elessar\nBanduk Robberhauf el Luastelay\nAlrik Grimler\nSammy Goldlieb\nArtimer Fault",
            "In recognition of his & her services for Canal, Bridge and Ferry:\nSarangerel\nEvie Pryler & Her Clan\nRakaya & Her Bearer\nJulia da Silva\nJerem Elessar\nBanduk Robberhauf el Luastelay\nAlrik Grimler\nSammy Goldlieb\nArtimer Fault")
        local callbackBridgeCanal = function(nothing) end --empty callback
        local dialogBridgeCanal = MessageDialog(dialogTitle, dialogText, callbackBridgeCanal)

        User:requestMessageDialog(dialogBridgeCanal)

    end
end

return M
