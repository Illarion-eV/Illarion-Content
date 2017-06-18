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

local genus = require("content.genus")
local common = require("base.common")
local lookAt = require("base.lookat")
local money = require("base.money")
local itemLookAt = require("server.itemlookat")
local characterLua = require("base.character")



local M = {}
local MODE_POLITE = 0;
local MODE_STARE = 1;
local MODE_MIRROR = 2;



function M.lookAtPlayer( SourceCharacter, TargetCharacter, mode)
    local output = "";

    if ( mode ~= MODE_MIRROR) then
        common.TurnTo( SourceCharacter, TargetCharacter.pos );
    end
    
    output = output .. M.getCharDescription( SourceCharacter, TargetCharacter, mode);

    SourceCharacter:sendCharDescription( TargetCharacter.id , output );

    if (mode == MODE_STARE) then
        common.InformNLS(TargetCharacter, "Du fühlst dich beobachtet.", "You feel watched.");
    end    
end

function M.getCharDescription( SourceCharacter, TargetCharacter, mode)
    local addtext = "";

    -- Generate the limits
    -- the related information is shown if limitToSeexxx is >= 0
    local factorPerception = SourceCharacter:increaseAttrib( "perception", 0 );
    local factorDistance = SourceCharacter:distanceMetric( TargetCharacter );
    local bonusSex = (SourceCharacter:increaseAttrib( "sex", 0 ) == 0 and 10 or 20 );
    if ( mode == MODE_MIRROR) then
        factorDistance = 1;
    end
    local limitToSeeAlways = 20 - factorDistance
    local limitToSeeGeneral = 1 * factorPerception - 1 * factorDistance;
    local limitToSeeHand = 2 * factorPerception - 4 * factorDistance + bonusSex;
    local limitToSeeBreast = 2 * factorPerception - 4 * factorDistance;
    local limitToSeeShoe = 2 * factorPerception - 6 * factorDistance + bonusSex;
    local limitToSeeLeg = 2 * factorPerception - 6 * factorDistance;
    local limitToSeeJewels = 2 * factorPerception - 8 * factorDistance + bonusSex;
    local limitToSeeBag = 2 * factorPerception - 3 * factorDistance;
    local limitToSeePurse = 1 * factorPerception - 3 * factorDistance;
    local limitToSeeBelt = 1 * factorPerception - 3 * factorDistance;

    local lang = SourceCharacter:getPlayerLanguage();
    -- inform about stats
    local qual,dura=getClothesFactor(TargetCharacter);
    local output = "";
    
    if ( mode == MODE_MIRROR) then
        output = output .. ( lang == 0 and "Im Spiegel siehst du eine Person, die dir ähnlich sieht.\n" or "In the mirror you see a person that looks like you.\n" );
    end
    
    if ( limitToSeeAlways >= 0 ) then
        -- General overview.
        if ( TargetCharacter:increaseAttrib( "sex", 0 ) == 0 ) then
            output = output .. ( lang == 0 and "Er ist ein " or "He is a " );
        else
            output = output .. ( lang == 0 and "Sie ist eine " or "She is a " );
        end
        output = output .. getAgeDescriptor(TargetCharacter:getRace(),TargetCharacter:increaseAttrib("age",0),TargetCharacter:increaseAttrib( "sex", 0 ),lang);
        if ( limitToSeeGeneral >= 0 ) then
            output = output .. getCharAtribute( TargetCharacter, lang, "strength", 14, "starke", "strong");
            output = output .. getCharAtribute( TargetCharacter, lang, "dexterity", 14, "geschickte", "nimble");
            output = output .. getCharAtribute( TargetCharacter, lang, "agility", 14, "flinke", "agile");
            output = output .. getCharAtribute( TargetCharacter, lang, "constitution", 15, "robuste", "sturdy");
            output = output .. getCharAtribute( TargetCharacter, lang, "intelligence", 18, "wissende", "knowingly");
            output = output .. getCharAtribute( TargetCharacter, lang, "willpower", 18, "zielstrebige", "determined");
            output = output .. getCharAtribute( TargetCharacter, lang, "perception", 18, "aufmerksame", "attentively");
            output = output .. getCharAtribute( TargetCharacter, lang, "essence", 18, "magische", "magic");
        end
        output = string.sub ( output, 1, string.len(output) - 2) .. " " .. getCharRace( TargetCharacter, lang);
        if ( limitToSeeGeneral >= 0 ) then
            output = output .. ( lang == 0 and " und ist " or " and is " ) .. getClothesQualText(qual, lang) .. ". ";
        else
            output = output .. "."
        end
    end

    -- what wears the char?
    addtext = "";
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 11, limitToSeeBreast, common.IsNilOrEmpty(addtext) ); -- robe
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 3, limitToSeeBreast, common.IsNilOrEmpty(addtext) ); -- breast
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 1, limitToSeeBreast, common.IsNilOrEmpty(addtext) ); -- helmet
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 9, limitToSeeLeg, common.IsNilOrEmpty(addtext) ); -- legs
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 10, limitToSeeShoe, common.IsNilOrEmpty(addtext) ); -- feet
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 4, limitToSeeLeg, common.IsNilOrEmpty(addtext) ); -- hands
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 2, limitToSeeJewels, common.IsNilOrEmpty(addtext) ); -- neck
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 7, limitToSeeJewels, common.IsNilOrEmpty(addtext) ); -- left finger
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 8, limitToSeeJewels, common.IsNilOrEmpty(addtext) ); -- right finger

    if ( common.IsNilOrEmpty(addtext) == false ) then
        if ( TargetCharacter:increaseAttrib( "sex", 0 ) == 0 ) then
            addtext = ( lang == 0 and "\nEr trägt: " or "\nHe wears: " ) .. addtext;
        else
            addtext = ( lang == 0 and "\nSie trägt: " or "\nShe wears: " ) .. addtext;
        end
        output = output .. addtext .. ". ";
    --else the char is naked, you see that!
    end

    if ( limitToSeeGeneral >= 0 ) then
        output = output .. getClothesText(qual, dura, lang, TargetCharacter:increaseAttrib( "sex", 0 ),SourceCharacter);
    end

    -- what is in the belt?
    addtext = "";
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 12, limitToSeeBelt, common.IsNilOrEmpty(addtext) ); -- belt 1
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 13, limitToSeeBelt, common.IsNilOrEmpty(addtext) ); -- belt 2
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 14, limitToSeeBelt, common.IsNilOrEmpty(addtext) ); -- belt 3
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 15, limitToSeeBelt, common.IsNilOrEmpty(addtext) ); -- belt 4
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 16, limitToSeeBelt, common.IsNilOrEmpty(addtext) ); -- belt 5
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 17, limitToSeeBelt, common.IsNilOrEmpty(addtext) ); -- belt 6

    if ( common.IsNilOrEmpty(addtext) == false ) then
        output = output .. ( lang == 0 and "\nIm Gürtel erkennst du: " or "\nYou see in the belt: " ) .. addtext .. ". ";
    --else belt is empty, nothing to tell!
    end

    -- weight of load
    output = output .. getCharLoad( TargetCharacter, lang, limitToSeeBag)
    
    -- amount of money
--    output = output .. getCharPurse( TargetCharacter, lang, limitToSeePurse);
    
    -- what hold the char in hand?
    local addtext = "";
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 5, limitToSeeHand, common.IsNilOrEmpty(addtext) ); -- left hand
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 6, limitToSeeHand, common.IsNilOrEmpty(addtext) ); -- right hand

    if ( common.IsNilOrEmpty(addtext) == false ) then
        if ( TargetCharacter:increaseAttrib( "sex", 0 ) == 0 ) then
            addtext = ( lang == 0 and "\nIn seinen Händen hat er: " or "\nIn his hands he has: " ) .. addtext;
        else
            addtext = ( lang == 0 and "\nIn ihren Händen hat sie: " or "\nIn her hands she has: " ) .. addtext;
        end
        output = output .. addtext .. ". ";
    --nothing, you see that!
    end

    return output;
end


function getCharWears( TargetCharacter, lang, positionAtChar, currentLookingAt, bFirstText)
    local itemAtCharacter = TargetCharacter:getItemAt( positionAtChar );
    local text = "";
    local textdescription = "";
    if ( itemAtCharacter ~= nil ) and ( itemAtCharacter.id > 0 ) and (currentLookingAt >= 0) and ( isIgnoredItem(itemAtCharacter.id) == false) then
        if ( bFirstText == false ) then
            text = text .. "; "
        end
        text = text .. world:getItemName( itemAtCharacter.id, lang );
        textdescription = ( lang == 0 and itemAtCharacter:getData("descriptionDe") or itemAtCharacter:getData("descriptionEn") );
        if ( common.IsNilOrEmpty(textdescription) == false ) then
            text = text .. " (" .. textdescription .. ")";
        end
    end
    return text;
end

function getCharAtribute( TargetCharacter, lang, attribute, attributeLimit, textDe, textEn)
    local valueAttribute = TargetCharacter:increaseAttrib( attribute, 0 );
    local TargetCharacterSex = TargetCharacter:increaseAttrib( "sex", 0 );
    local text = "";
    if ( valueAttribute >= attributeLimit) then
        text = text .. ( lang == 0 and textDe .. (TargetCharacterSex == 0 and "r" or "") or textEn ) .. ", ";
    end
    return text;
end

function getCharRace( TargetCharacter, lang)
    local raceName = { };
    local raceID = TargetCharacter:getRace() + 1;
    local TargetCharacterSex = TargetCharacter:increaseAttrib( "sex", 0 );
    text = "";
    -- human,dwarf,halfling, elf,orc,lizard
    raceName[0] = {"man","dwarf","halfling", "elf","orc","lizard","strange looking person"};
    raceName[1] = {"Mann","Zwerg","Halbling","Elf","Ork","Echsenmann","seltsam aussehende Person"};
    raceName[2] = {"women","dwarfes","halfling women", "elfess","orcess","lizard women","strange looking person"};
    raceName[3] = {"Frau","Zwergin","Halblingsfrau","Elfin","Orkin","Echsenfrau","seltsam aussehende Person"};

    if (raceID > 7) then
        raceID = 7
    end
    
    if (TargetCharacterSex == 0 ) then
        text = ( lang == 0 and raceName[1][raceID] or raceName[0][raceID] );
    else
        text = ( lang == 0 and raceName[3][raceID] or raceName[2][raceID] );
    end
    return text;
end

function getCharPurse( TargetCharacter, lang, currentLookingAt)
    local copperAtChar = money.CharCoinsToMoney( TargetCharacter );
    local text = "";
    local TargetCharacterSex = TargetCharacter:increaseAttrib( "sex", 0 );
    
    if (currentLookingAt >= 0) then
        if (copperAtChar == 0) then
            if ( TargetCharacterSex == 0 ) then
                text = ( lang == 0 and "\nEr trägt keine Geldkatze. " or "\nHe has no purse. " );
            else
                text = ( lang == 0 and "\nSie trägt keine Geldkatze. " or "\nShe has no purse. " );
            end
        else
            if ( TargetCharacterSex == 0 ) then
                text = ( lang == 0 and "\nSeine Geldkatze ist " or "\nHis purse is " );
            else
                text = ( lang == 0 and "\nIhre Geldkatze ist " or "\nHer purse is " );
            end
            if (copperAtChar < 1000) then
                text = text .. ( lang == 0 and "nahzu leer. " or "almost empty. " );
            elseif (copperAtChar < 5000) then
                text = text .. ( lang == 0 and "leicht. " or "light. " );
            elseif (copperAtChar < 20000) then
                text = text .. ( lang == 0 and "gefüllt. " or "filled. " );
            else
                text = text .. ( lang == 0 and "prall gefüllt. " or "tightly filled. " );
            end
        end
    end
    return text;
end

function getCharLoad( TargetCharacter, lang, currentLookingAt)
    local weightRelation = 0;
    local text = "";
    local TargetCharacterSex = TargetCharacter:increaseAttrib( "sex", 0 );
    
    if (currentLookingAt >= 0) then
        local backpack = TargetCharacter:getItemAt(Character.backpack)
        if ( backpack ~= nil ) and ( backpack.id > 0 ) then
            if ( TargetCharacterSex == 0 ) then
                text = ( lang == 0 and "\nEr " or "\nHe " );
            else
                text = ( lang == 0 and "\nSie " or "\nShe " );
            end
            weightRelation = getCharacterLoad(TargetCharacter) / getMaximumLoad(TargetCharacter);
            if (weightRelation > 0.99) then
                text = text .. ( lang == 0 and "ist völlig überladen. " or "is totally overloaded. " );
            elseif  (weightRelation > 0.74) then
                text = text .. ( lang == 0 and "sieht aus als ob " .. ( TargetCharacterSex == 0 and "\ner " or "\nsie " ) .. " kaum mehr tragen kann. " or "looks as if " .. ( TargetCharacterSex == 0 and "\nhe " or "\nshe " ) .. " is hardly able to carry much more. " );
            elseif  (weightRelation > 0.2) then
                text = "";
            else
                text = text .. ( lang == 0 and "scheint fast nichts zu tragen. " or "seems to carry almost nothing. " );
            end
        else
            if ( TargetCharacterSex == 0 ) then
                text = ( lang == 0 and "\nEr trägt keine Tasche. " or "\nHe has no bag. " );
            else
                text = ( lang == 0 and "\nSie trägt keine Tasche. " or "\nShe has no bag. " );
            end
        end
    end
    return text;
end

function getClothesFactor(Char)
    local itCount=0;
    local sumQual=0;
    local sumDura=0;
    local multi;
    for ipos=1, 11 do
        local thisIt=Char:getItemAt(ipos);
        -- also count empty slots!!!
        -- What are these item slots? Constants please!
        if ((ipos==2) or (ipos==7) or (ipos==8)) then
            multi=2;
        else
            multi=1;
        end
        if (((ipos==5) or (ipos==6)) and thisIt.quality==0) then
            multi=0;
        end
        itCount=itCount+multi;
        local thisQual=math.floor(thisIt.quality/100);
        sumQual=sumQual+multi*thisQual;
        local thisDura=thisIt.quality-100*thisQual;
        sumDura=sumDura+multi*thisDura;
    end
    return math.floor(sumQual/itCount), math.floor(sumDura/itCount);
end

function getClothesText(qual, dura, lang, sex,char)
    local ClQualText={};
    local ClDuraText={};
    local sexText={};
    local clText={};
    ClQualText[0]={"adelige",     "noble", "sehr feine", "feine", "sehr gute", "gute", "normale", "billige","schäbige","lumpige"};
    ClQualText[1]={"aristocratic","noble", "very fine",  "fine",  "very good", "good", "normal",  "cheap",  "shabby",  "measly"};

    ClDuraText[0]={"nagelneu" ,"neu", "leicht abgenutzt","gebraucht","abgenutzt","sehr abgenutzt","alt","dreckig", "kaputt", "zerschlissen"  };
    ClDuraText[1]={"brand new", "new",  "slightly torn",    "used",      "torn",      "highly torn",    "old","dirty",  "tattered","haggled"};

    sexText[0]={}
    sexText[1]={}
    sexText[0][0]="Seine " --Kleidung wirkt ";
    sexText[0][1]="Ihre " --trägt ";
    sexText[1][0]="His ";
    sexText[1][1]="Her ";

    clText[0]=" Kleidung wirkt "
    clText[1]=" clothes look "
    return sexText[lang][sex]..ClQualText[lang][10-qual]..clText[lang]..ClDuraText[lang][10-math.floor(dura/10)]..".";
end


function getClothesQualText(qual, lang)
    local ClQQualText={};
    local clQText={};
    local initClQText=1;
    ClQQualText[0]={"adelig",     "nobel", "sehr fein", "fein", "sehr gut", "gut", "normal", "billig","schäbig","lumpig"};
    ClQQualText[1]={"aristocraticly","nobly", "very finely",  "finely",  "very well", "well", "normaly",  "cheaply",  "shabbily",  "measly"};

    clQText[0]=" gekleidet"
    clQText[1]=" dressed"
    return ClQQualText[lang][10-qual]..clQText[lang];
end

function getAgeDescriptor(race,age,sex, language)
    local output = "";
    local ageList = { };
    local ageName = { };
    ageName[0] = { };
    ageName[1] = { };
    --                                                                                 human,dwarf,halfling, elf,orc,lizard,gnome,fairy,goblin,default
    ageName[0][1] = "sehr junge";         ageName[1][1] = "very young";   ageList[1] = {    14,   30,      20, 100, 14,    20,   30,   14,    20,     10 };
    ageName[0][2] = "junge";              ageName[1][2] = "young";        ageList[2] = {    18,   50,      25, 300, 20,    60,   50,   40,    23,     20 };
    ageName[0][3] = "";                   ageName[1][3] = "";             ageList[3] = {   nil,  nil,     nil, nil, nil,   nil,  nil,  nil,   nil,    30 };
    ageName[0][4] = "erwachsene";         ageName[1][4] = "grown up";     ageList[4] = {    25,   80,      40, 500, 30,   130,   80,   80,    28,     40 };
    ageName[0][5] = "mittelalte";         ageName[1][5] = "in midlife";   ageList[5] = {    35,  125,      60, 1000, 45,   250,  125,  150,    38,     50 };
    ageName[0][6] = "etwas ältere";       ageName[1][6] = "elderly";      ageList[6] = {    45,  175,      80, 2000, 65,   375,  175,  220,    47,     60 };
    ageName[0][7] = "alte";               ageName[1][7] = "old";          ageList[7] = {    55,  220,     100, 3000, 85,   500,  220,  280,    56,     70 };
    ageName[0][8] = "sehr alte";           ageName[1][8] = "very old";     ageList[8] = {    70,  260,     115, 4500,105,   600,  260,  340,    63,     80 };
    if ((race==34) or (race==35)) then
        race=3;
    end
    if (race > 8 ) then
        race = 9;
    end

    local i = 0;
    repeat
        if( ageList[i+1][race+1] and age < ageList[i+1][race+1] )then
            break;
        end
        i = i + 1;
    until( i >= 8 );
    i = math.min(8,math.max(1,i));
    output = ageName[language][i]
    if( i ~= 3 )then
        if language == 0 and sex == 0 then
            output = output .. "r"
        end
        output = output .. ", ";
    end
    return output
end

function getFigure(TargetCharacter, lang)
    local str = TargetCharacter:increaseAttrib( "strength", 0 );
    local height = TargetCharacter:increaseAttrib("body_height",0)
    local mass = TargetCharacter:increaseAttrib("weight",0)
    local lowStr={};
    local normalStr={};
    local highStr={};
    lowStr[0]={"sehr mager", "sehr zierlich", "zierlich", "durchschnittlich", "mollig", "dick", "fett"};
    lowStr[1]={"skinny", "very petite", "petite", "average", "chubby", "plump", "fat"};
    normalStr[0]={"schmächtig", "dünn ", "schlank", "durchschnittlich", "mollig", "dick", "fett"};
    normalStr[1]={"lank", "thin", "slim", "average", "chubby", "plump", "fat"};
    highStr[0]={"drahtig", "sehr drahtig", "durchschnittlich", "athletisch", "muskulös", "kräftig", "stämmig"}
    highStr[1]={"wiry", "very wiry", "average", "athletic", "muscular", "robust", "sturdy" };

    height=height*2.54/100
    mass=mass/100
    local BMI=mass/(height*height); -- 18.5, 24.9, 29.9,
    -- str= 10 average
    if mass==0 then
        BMI=22;
    end
    local Idx=math.ceil((BMI-16)/3)+1
    Idx=math.max(Idx,1);
    Idx=math.min(Idx,7);

    -- sehr mager, dünn, schlank, (normal), mollig, dick, fett
    -- athletisch, drahtig, zierlich, kräftig
    if str<7 then
        return lowStr[lang][Idx];
    elseif str<14 then
        return normalStr[lang][Idx];
    else
        return highStr[lang][Idx];
    end
end

--Return true if the item should be ignored during examine
function isIgnoredItem(itemId)

    local TROWEL_ID = 100;
    local NULL_ID = 228;
    local MEDAL_ID = 93;
    local LOCKPICKS_ID = 99;
    local CEILING_TROWEL_ID = 382;
    return itemId == nil or itemId == 0 or  itemId == TROWEL_ID or itemId == NULL_ID or itemId == MEDAL_ID
            or itemId == LOCKPICKS_ID or itemId == CEILING_TROWEL_ID;
end

function getMaximumLoad(user)
    return user:increaseAttrib("strength", 0) * 500 + 5000 -- This calculation is the same the server uses.
end

function getCharacterLoad(user)
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

return M
