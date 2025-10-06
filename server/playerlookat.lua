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
-- Character description

-- SourceCharacter - The Char who looks at someone
-- TargetCharacter - The Char who is the target of that gaze

-- mode
--      = 0 --> short description
--      = 1 --> long description

local common = require("base.common")
local gods = require("content.gods")


local M = {}
local MODE_MIRROR = 2

local function selectWhetherToStare(user, target, output)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local index = dialog:getSelectedIndex() +1

        if not isValidChar(target) then
            return
        end


        if index == 1 then
            common.InformNLS(target, "Du f�hlst dich beobachtet.", "You feel watched.")
            user:sendCharDescription( target.id , output )
        else
            user:sendCharDescription( target.id , " " )
        end
    end

    local dialog = SelectionDialog(
    common.GetNLS(user, "Ansehen", "Look At"),
    common.GetNLS(user, "W�hle, ob du starren m�chtest - was dir eine Beschreibung des Ziels gibt, aber sie auch wissen l�sst, dass sie beobachtet werden - oder ob du ihnen einfach einen Spitznamen geben willst.", "Choose whether to stare, giving you a description of the target but also letting them know they feel watched, or just to nickname them."), callback)

    dialog:addOption(0, common.GetNLS(user, "Starren", "Stare"))
    dialog:addOption(0, common.GetNLS(user, "Nur Spitzname", "Nickname only"))

    user:requestSelectionDialog(dialog)
end

function M.lookAtPlayer( SourceCharacter, TargetCharacter, mode)
    local output = ""

    if ( mode ~= MODE_MIRROR) then
        common.TurnTo( SourceCharacter, TargetCharacter.pos )
    end

    output = output .. M.getCharDescription( SourceCharacter, TargetCharacter, mode)

    if (mode == Player.stare) then
        selectWhetherToStare(SourceCharacter, TargetCharacter, output)
    else
        SourceCharacter:sendCharDescription( TargetCharacter.id , output )
    end
end

local function ignoreDescription(itemId)
    local itemList = {2745,3109,331,327,59,165,329,166,167,330}
    --2745:parchment;3109:open pell;content of alchemy\base\alchemy.bottleList
    return common.isInList(itemId, itemList)
end
--Return true if the item should be ignored during examine
local function isIgnoredItem(itemId)
    local itemList = {100,228,93,99,382}
    --100:trowel,228:NULL,93:medal,99:lockpicks,382:caeiling trowel
    return itemId == nil or itemId == 0 or  common.isInList(itemId, itemList)
end

local function getCharWears( TargetCharacter, lang, positionAtChar, currentLookingAt, bFirstText, withDetail)
    local itemAtCharacter = TargetCharacter:getItemAt( positionAtChar )
    local text = ""

    if ( itemAtCharacter ~= nil ) and ( itemAtCharacter.id > 0 ) and (currentLookingAt >= 0) and ( isIgnoredItem(itemAtCharacter.id) == false) then
        if ( bFirstText == false ) then
            text = text .. "; "
        end
        local specialname = ( lang == 0 and itemAtCharacter:getData("nameDe") or itemAtCharacter:getData("nameEn") )
        if ( common.IsNilOrEmpty(specialname) ) then
            text = text .. world:getItemName( itemAtCharacter.id, lang )
        else
            text = text .. specialname
        end
        if ignoreDescription(itemAtCharacter.id) == false and withDetail == true then
            local textdescription = ( lang == 0 and itemAtCharacter:getData("descriptionDe") or itemAtCharacter:getData("descriptionEn") )
            if ( common.IsNilOrEmpty(textdescription) == false ) then
                text = text .. " (" .. textdescription .. ")"
            end
        end
    end
    return text
end

local function getCharAtribute( TargetCharacter, lang, attribute, attributeLimit, textDe, textEn)
    local valueAttribute = TargetCharacter:increaseAttrib( attribute, 0 )
    local TargetCharacterSex = TargetCharacter:increaseAttrib( "sex", 0 )
    local text = ""
    if ( valueAttribute >= attributeLimit) then
        text = text .. ( lang == 0 and textDe .. (TargetCharacterSex == 0 and "r" or "") or textEn ) .. ", "
    end
    return text
end

local function getCharRace( TargetCharacter, lang)
    local raceName = { }
    local raceID = TargetCharacter:getRace() + 1
    local TargetCharacterSex = TargetCharacter:increaseAttrib( "sex", 0 )

    -- human,dwarf,halfling, elf,orc,lizard
    raceName[0] = {"man","dwarf","halfling", "elf","orc","lizard","strange looking person"}
    raceName[1] = {"Mann","Zwerg","Halbling","Elf","Ork","Echsenmann","seltsam aussehende Person"}
    raceName[2] = {"woman","dwarfess","halfling woman", "elfess","orcess","lizard woman","strange looking person"}
    raceName[3] = {"Frau","Zwergin","Halblingsfrau","Elfin","Orkin","Echsenfrau","seltsam aussehende Person"}

    if (raceID > 7) then
        raceID = 7
    end

    local text

    if (TargetCharacterSex == 0 ) then
        text = ( lang == 0 and raceName[1][raceID] or raceName[0][raceID] )
    else
        text = ( lang == 0 and raceName[3][raceID] or raceName[2][raceID] )
    end
    return text
end

local function getMaximumLoad(user)
    return user:increaseAttrib("strength", 0) * 500 + 5000 -- This calculation is the same the server uses.
end

local function getCharacterLoad(user)
    local totalLoad = 0

    local backPack
    if user:getItemAt(Character.backpack) then
        backPack = user:getBackPack()
    end

    if backPack then
        totalLoad = totalLoad + backPack:weight()
    end

    for i = 1, 17 do
        local currentItem = user:getItemAt(i)
        if currentItem then
            totalLoad = totalLoad +  world:getItemStats(currentItem).Weight
        end
    end

    return totalLoad
end

local function getCharLoad( TargetCharacter, lang, currentLookingAt)
    local text = ""
    local TargetCharacterSex = TargetCharacter:increaseAttrib( "sex", 0 )

    if (currentLookingAt >= 0) then
        local backpack = TargetCharacter:getItemAt(Character.backpack)
        if ( backpack ~= nil ) and ( backpack.id > 0 ) then
            if ( TargetCharacterSex == 0 ) then
                text = ( lang == 0 and "\nEr " or "\nHe " )
            else
                text = ( lang == 0 and "\nSie " or "\nShe " )
            end
            local weightRelation = getCharacterLoad(TargetCharacter) / getMaximumLoad(TargetCharacter)
            if (weightRelation > 0.99) then
                text = text .. ( lang == 0 and "ist v�llig �berladen. " or "is totally overloaded. " )
            elseif  (weightRelation > 0.74) then
                text = text .. ( lang == 0 and "sieht aus als ob " .. ( TargetCharacterSex == 0 and " er " or " sie " ) .. " kaum mehr tragen kann. " or "looks as if " .. ( TargetCharacterSex == 0 and " he " or " she " ) .. " is hardly able to carry much more. " )
            elseif  (weightRelation > 0.2) then
                text = ""
            else
                text = text .. ( lang == 0 and "scheint fast nichts zu tragen. " or "seems to carry almost nothing. " )
            end
        else
            if ( TargetCharacterSex == 0 ) then
                text = ( lang == 0 and "\nEr tr�gt keine Tasche. " or "\nHe has no bag. " )
            else
                text = ( lang == 0 and "\nSie tr�gt keine Tasche. " or "\nShe has no bag. " )
            end
        end
    end
    return text
end

local function getCharHairdresserState( Char, lang, currentLookingAt)
    local text = ""
    if (currentLookingAt >= 0) then
        if Char:getQuestProgress(229) > 0 then
            text = ( lang == 0 and "\nDie Haare sind frisch geschnitten." or "\nThe hair was cut not long ago." )
        elseif Char:getQuestProgress(230) > 0 then
            text = ( lang == 0 and "\nDer Kamm gl�nzt wie frisch poliert." or "\nThe comb is freshly polished, making it shine." )
        end
    end
    return text
end

function M.getClothesFactor(Char)
    local itCount=0
    local sumQual=0
    local sumDura=0
    local multi
    local iposList = {}
    --iposList[ipos] = {position at char, multiplicator}
    iposList[1] = {11,1}-- robe
    iposList[2] = {3,1}-- breast
    iposList[3] = {1,1}-- helmet
    iposList[4] = {9,1}-- legs
    iposList[5] = {10,1}-- feet
    iposList[6] = {4,1}-- hands
    iposList[7] = {2,2}-- neck
    iposList[8] = {7,2}-- left finger
    iposList[9] = {8,2}-- right finger

    for ipos=1, #iposList do
        local thisIt=Char:getItemAt(iposList[ipos][1])
        if thisIt ~= nil and thisIt.id > 0 then
            multi = iposList[ipos][2]
            itCount=itCount+multi
            local thisQual=math.floor(thisIt.quality/100)
            sumQual=sumQual+multi*thisQual
            local thisDura=thisIt.quality-100*thisQual
            sumDura=sumDura+multi*thisDura
        end
    end
    if itCount == 0 then
        return 3,33
    else
        return math.floor(sumQual/itCount), math.floor(sumDura/itCount)
    end
end

M.ClQualText={}
M.ClDuraText={}
M.sexText={}
M.clText={}
M.ClQualText[0]={"adelige","noble", "sehr feine", "feine", "sehr gute", "gute", "normale", "billige","sch�bige","lumpige"}
M.ClQualText[1]={"aristocratic","noble", "very fine",  "fine",  "very good", "good", "normal",  "cheap",  "shabby",  "lousy"}
M.ClDuraText[0]={"nagelneu" ,"neu", "leicht abgenutzt","gebraucht","abgenutzt","sehr abgenutzt","alt","dreckig", "kaputt", "zerschlissen"  }
M.ClDuraText[1]={"brand new", "new",  "slightly torn",    "used",      "torn",      "highly torn",    "old","dirty",  "tattered","threadbare"}
M.sexText[0]={}
M.sexText[1]={}
M.sexText[0][0]="Seine " --Kleidung wirkt "
M.sexText[0][1]="Ihre " --tr�gt "
M.sexText[1][0]="His "
M.sexText[1][1]="Her "
M.clText[0]=" Kleidung wirkt "
M.clText[1]=" clothes look "

function M.getClothesText(qual, dura, lang, sex)
    return M.sexText[lang][sex]..M.ClQualText[lang][10-qual]..M.clText[lang]..M.ClDuraText[lang][10-math.floor(dura/10)].."."
end

M.ClQQualText={}
M.clQText={}
M.ClQQualText[0]={"adelig", "nobel", "sehr fein", "fein", "sehr gut", "gut", "normal", "billig","sch�big","lumpig"}
M.ClQQualText[1]={"aristocratically", "nobly", "very finely", "finely", "very well", "well", "normally", "cheaply", "shabbily", "lousily"}
M.clQText[0]=" gekleidet"
M.clQText[1]=" dressed"

function M.getClothesQualText(qual, lang)

    return M.ClQQualText[lang][10-qual]..M.clQText[lang]
end

local function getAgeDescriptor(race,age,sex, language)
    local ageList = { }
    local ageName = { }
    ageName[0] = { }
    ageName[1] = { }
    -- human,dwarf,halfling, elf,orc,lizard,gnome,fairy,goblin,default
    ageName[0][1] = "sehr junge"; ageName[1][1] = "very young";ageList[1] = {18, 30, 20, 180, 18, 20, 30, 18, 18, 18 }
    ageName[0][2] = "junge"; ageName[1][2] = "young"; ageList[2] = { 20, 50, 25, 300, 20, 60, 50, 40, 23, 20 }
    ageName[0][3] = ""; ageName[1][3] = ""; ageList[3] = { nil, nil, nil, nil, nil, nil, nil, nil, nil, 22 }
    ageName[0][4] = "erwachsene"; ageName[1][4] = "grown up"; ageList[4] = { 25, 80, 40, 500, 30, 130, 80, 80, 28, 25 }
    ageName[0][5] = "mittelalte"; ageName[1][5] = "in midlife";ageList[5] = { 35, 125, 60, 1000, 45, 250, 125, 150, 38, 35 }
    ageName[0][6] = "etwas �ltere"; ageName[1][6] = "elderly"; ageList[6] = { 45, 175, 80, 2000, 65, 375, 175, 220, 47, 45 }
    ageName[0][7] = "alte"; ageName[1][7] = "old"; ageList[7] = { 55, 220, 100, 3000, 85, 500, 220, 280, 56, 55 }
    ageName[0][8] = "sehr alte"; ageName[1][8] = "very old"; ageList[8] = { 70, 260, 115, 4500,105, 600, 260, 340, 63, 70 }
    if ((race==34) or (race==35)) then
        race=3
    end
    if (race > 8 ) then
        race = 9
    end

    local i = 0
    repeat
        if( ageList[i+1][race+1] and age < ageList[i+1][race+1] )then
            break
        end
        i = i + 1
    until( i >= 8 )
    i = math.min(8,math.max(1,i))
    local output = ageName[language][i]
    if( i ~= 3 )then
        if language == 0 and sex == 0 then
            output = output .. "r"
        end
        output = output .. ", "
    end
    return output
end

function M.getCharDescription( SourceCharacter, TargetCharacter, mode)
    -- Generate the limits
    -- the related information is shown if limitToSeexxx is >= 0
    local factorPerception = SourceCharacter:increaseAttrib( "perception", 0 )
    local factorEssense = SourceCharacter:increaseAttrib( "essence", 0 )
    local factorDistance = SourceCharacter:distanceMetric( TargetCharacter )

    local bonusSex = (SourceCharacter:increaseAttrib( "sex", 0 ) == 0 and 10 or 20 )
    if ( mode == MODE_MIRROR) then
        factorDistance = 1
    end
    local limitToSeeAlways = 20 - factorDistance
    local limitToSeeGeneral = 1 * factorPerception - 1 * factorDistance
    local limitToSeeHand = 2 * factorPerception - 4 * factorDistance + bonusSex
    local limitToSeeBreast = 2 * factorPerception - 4 * factorDistance
    local limitToSeeShoe = 2 * factorPerception - 6 * factorDistance + bonusSex
    local limitToSeeLeg = 2 * factorPerception - 6 * factorDistance
    local limitToSeeJewels = 2 * factorPerception - 8 * factorDistance + bonusSex
    local limitToSeeBag = 2 * factorPerception - 3 * factorDistance
    local limitToSeeBelt = 1 * factorPerception - 3 * factorDistance
    local limitToSeeHairdresser = 2 * factorPerception - 6 * factorDistance + bonusSex
    local limitToSeeReligion = 1 * factorEssense - 2 * factorDistance

    local lang = SourceCharacter:getPlayerLanguage()
    -- inform about stats
    local qual,dura= M.getClothesFactor(TargetCharacter)
    local output = ""

    if ( mode == MODE_MIRROR) then
        output = output .. ( lang == 0 and "Im Spiegel siehst du eine Person, die dir �hnlich sieht.\n" or "In the mirror you see a person that looks like you.\n" )
    end

    if ( limitToSeeAlways >= 0 ) then
        -- General overview.
        if ( TargetCharacter:increaseAttrib( "sex", 0 ) == 0 ) then
            output = output .. ( lang == 0 and "Er ist ein " or "He is a " )
        else
            output = output .. ( lang == 0 and "Sie ist eine " or "She is a " )
        end
        output = output .. getAgeDescriptor(TargetCharacter:getRace(),TargetCharacter:increaseAttrib("age",0),TargetCharacter:increaseAttrib( "sex", 0 ),lang)
        if ( limitToSeeGeneral >= 0 ) then
            output = output .. getCharAtribute( TargetCharacter, lang, "strength", 14, "starke", "strong")
            output = output .. getCharAtribute( TargetCharacter, lang, "dexterity", 14, "geschickte", "dexterous")
            output = output .. getCharAtribute( TargetCharacter, lang, "agility", 14, "flinke", "agile")
            output = output .. getCharAtribute( TargetCharacter, lang, "constitution", 15, "robuste", "robust")
            output = output .. getCharAtribute( TargetCharacter, lang, "intelligence", 18, "wissende", "knowledgeable")
            output = output .. getCharAtribute( TargetCharacter, lang, "willpower", 18, "zielstrebige", "determined")
            output = output .. getCharAtribute( TargetCharacter, lang, "perception", 18, "aufmerksame", "attentive")
            output = output .. getCharAtribute( TargetCharacter, lang, "essence", 18, "magische", "spiritual")
        end
        output = string.sub ( output, 1, string.len(output) - 2) .. " " .. getCharRace( TargetCharacter, lang)
        if ( limitToSeeGeneral >= 0 ) then
            output = output .. ( lang == 0 and " und ist " or " and is " ) .. M.getClothesQualText(qual, lang) .. ". "
        else
            output = output .. "."
        end
    end

    -- what wears the char?
    local addtext = ""
    addtext = addtext .. getCharWears ( TargetCharacter, lang, Character.coat, limitToSeeBreast, common.IsNilOrEmpty(addtext) , true); -- robe
    addtext = addtext .. getCharWears ( TargetCharacter, lang, Character.breast, limitToSeeBreast, common.IsNilOrEmpty(addtext) , true); -- breast
    addtext = addtext .. getCharWears ( TargetCharacter, lang, Character.head, limitToSeeBreast, common.IsNilOrEmpty(addtext) , true); -- helmet
    addtext = addtext .. getCharWears ( TargetCharacter, lang, Character.legs, limitToSeeLeg, common.IsNilOrEmpty(addtext) , true); -- legs
    addtext = addtext .. getCharWears ( TargetCharacter, lang, Character.feet, limitToSeeShoe, common.IsNilOrEmpty(addtext) , true); -- feet
    addtext = addtext .. getCharWears ( TargetCharacter, lang, Character.hands, limitToSeeLeg, common.IsNilOrEmpty(addtext) , true); -- hands
    addtext = addtext .. getCharWears ( TargetCharacter, lang, Character.neck, limitToSeeJewels, common.IsNilOrEmpty(addtext) , true); -- neck
    addtext = addtext .. getCharWears ( TargetCharacter, lang, Character.finger_left_hand, limitToSeeJewels, common.IsNilOrEmpty(addtext) , true); -- left finger
    addtext = addtext .. getCharWears ( TargetCharacter, lang, Character.finger_right_hand, limitToSeeJewels, common.IsNilOrEmpty(addtext) , true); -- right finger

    if ( common.IsNilOrEmpty(addtext) == false ) then
        if ( TargetCharacter:increaseAttrib( "sex", 0 ) == 0 ) then
            addtext = ( lang == 0 and "\nEr tr�gt: " or "\nHe wears: " ) .. addtext
        else
            addtext = ( lang == 0 and "\nSie tr�gt: " or "\nShe wears: " ) .. addtext
        end
        output = output .. addtext .. ". "
    --else the char is naked, you see that!
    end

    if ( limitToSeeGeneral >= 0 ) then
        output = output .. M.getClothesText(qual, dura, lang, TargetCharacter:increaseAttrib( "sex", 0 ))
    end

    -- what is in the belt?
    addtext = ""
    addtext = addtext .. getCharWears ( TargetCharacter, lang, Character.belt_pos_1, limitToSeeBelt, common.IsNilOrEmpty(addtext),false); -- belt 1
    addtext = addtext .. getCharWears ( TargetCharacter, lang, Character.belt_pos_2, limitToSeeBelt, common.IsNilOrEmpty(addtext),false); -- belt 2
    addtext = addtext .. getCharWears ( TargetCharacter, lang, Character.belt_pos_3, limitToSeeBelt, common.IsNilOrEmpty(addtext),false); -- belt 3
    local cloak = TargetCharacter:getItemAt(Character.coat)
    if cloak then
        if cloak.id == 0 then
            addtext = addtext .. getCharWears ( TargetCharacter, lang, Character.belt_pos_4, limitToSeeBelt, common.IsNilOrEmpty(addtext),false); -- belt 4
            addtext = addtext .. getCharWears ( TargetCharacter, lang, Character.belt_pos_5, limitToSeeBelt, common.IsNilOrEmpty(addtext),false); -- belt 5
            addtext = addtext .. getCharWears ( TargetCharacter, lang, Character.belt_pos_6, limitToSeeBelt, common.IsNilOrEmpty(addtext),false); -- belt 6
        end
    end

    if ( common.IsNilOrEmpty(addtext) == false ) then
        output = output .. ( lang == 0 and "\nIm G�rtel erkennst du: " or "\nYou see in the belt: " ) .. addtext .. ". "
    --else belt is empty, nothing to tell!
    end

    -- weight of load
    output = output .. getCharLoad( TargetCharacter, lang, limitToSeeBag)

    -- what hold the char in hand?
    addtext = ""
    addtext = addtext .. getCharWears ( TargetCharacter, lang, Character.left_tool, limitToSeeHand, common.IsNilOrEmpty(addtext),true); -- left hand
    addtext = addtext .. getCharWears ( TargetCharacter, lang, Character.right_tool, limitToSeeHand, common.IsNilOrEmpty(addtext),true); -- right hand

    if ( common.IsNilOrEmpty(addtext) == false ) then
        if ( TargetCharacter:increaseAttrib( "sex", 0 ) == 0 ) then
            addtext = ( lang == 0 and "\nIn seinen H�nden hat er: " or "\nIn his hands he has: " ) .. addtext
        else
            addtext = ( lang == 0 and "\nIn ihren H�nden hat sie: " or "\nIn her hands she has: " ) .. addtext
        end
        output = output .. addtext .. ". "
    --nothing, you see that!
    end

    -- hairdresser recently
    addtext = getCharHairdresserState( TargetCharacter, lang, limitToSeeHairdresser)
    if ( common.IsNilOrEmpty(addtext) == false ) then
        output = output .. addtext
    end

    if ( limitToSeeReligion >= 0 ) then
        output = output .. "\n" .. gods.getReligionLookAt(TargetCharacter, SourceCharacter)
    end

    if ( common.IsNilOrEmpty(output) ) then
        output = ( lang == 0 and "Du kannst schwerlich erkennen wie die Person aussieht." or "You can barely make out the figure." )
    end

    return output
end

return M
