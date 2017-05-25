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
local factions = require("base.factions")
local altars = require("item.altars")
local lookAt = require("base.lookat")
local money = require("base.money")
local itemLookAt = require("server.itemlookat")
local characterLua = require("base.character")



local M = {}
local MODE_STARE = 1;
local MODE_POLITE = 0;

local isFirstText = true;


function M.lookAtPlayer( SourceCharacter, TargetCharacter, mode)
local addtext = "";

    -- Generate the looking at value
    LookingAt = mode * 50; -- <== does it make sense anymore?
    LookingAt = LookingAt + SourceCharacter:increaseAttrib( "perception", 0 ) * 2;
    LookingAt = LookingAt + ( SourceCharacter:distanceMetric( TargetCharacter ) - 2 ) * ( -8 );

    common.TurnTo( SourceCharacter, TargetCharacter.pos );

    local lang = SourceCharacter:getPlayerLanguage();
    -- inform about stats
    local qual,dura=getClothesFactor(TargetCharacter);
    local output = "";
    
    if ( LookingAt > 40 ) then
        -- General overview.
        if ( TargetCharacter:increaseAttrib( "sex", 0 ) == 0 ) then
            output = ( lang == 0 and "Er ist " or "He is " );
        else
            output = ( lang == 0 and "Sie ist " or "She is " );
        end
        output = output .. getAgeDescriptor(TargetCharacter:getRace(),TargetCharacter:increaseAttrib("age",0),lang);
        output = output .. getClothesQualText(qual, lang);
        output = output .. ( lang == 0 and " und " or " and " ) .. getFigure(TargetCharacter, lang)
        output = output .. "."

--        output = output .. getText( "intro_health" , lang );
--        output = output .. getHPText(TargetCharacter:increaseAttrib("hitpoints",0),lang,SourceCharacter) .. " ";
-- health makes no sence since it is seen
    end

    -- what wears the char?
    isFirstText = true;
    addtext = "";
    if ( TargetCharacter:increaseAttrib( "sex", 0 ) == 0 ) then
        addtext = addtext .. ( lang == 0 and "\nEr trägt: " or "\nHe wears: " );
    else
        addtext = addtext .. ( lang == 0 and "\nSie trägt: " or "\nShe wears: " );
    end
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 11, LookingAt, 0 ); -- robe
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 3, LookingAt, 0 ); -- breast
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 1, LookingAt, 0 ); -- helmet
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 9, LookingAt, 0 ); -- legs
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 10, LookingAt, 0 ); -- feet
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 4, LookingAt, 0 ); -- hands
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 2, LookingAt, 0 ); -- neck
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 7, LookingAt, 0 ); -- left finger
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 8, LookingAt, 0 ); -- right finger

    if ( isFirstText == false ) then
        output = output .. addtext .. ". ";
    --else the char is naked, you see that!
    end

    if ( LookingAt > 40 ) then
        output = output .. getClothesText(qual, dura, lang, TargetCharacter:increaseAttrib( "sex", 0 ),SourceCharacter);
    end

    -- what is in the belt?
    isFirstText = true;
    addtext = "";
    addtext = addtext .. ( lang == 0 and "\nIm Gürtel erkennst du: " or "\nYou see in the belt: " );
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 12, LookingAt, 0 ); -- belt 1
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 13, LookingAt, 0 ); -- belt 2
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 14, LookingAt, 0 ); -- belt 3
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 15, LookingAt, 0 ); -- belt 4
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 16, LookingAt, 0 ); -- belt 5
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 17, LookingAt, 0 ); -- belt 6

    if ( isFirstText == false ) then
        output = output .. addtext .. ". ";
    --else belt is empty, nothing to tell!
    end

    if ( LookingAt > 40 ) then
        output = output .. getCharPurse( TargetCharacter, lang, LookingAt, 0);
    end
    
    -- what hold the char in hand?
    isFirstText = true;
    local addtext = "";
    if ( TargetCharacter:increaseAttrib( "sex", 0 ) == 0 ) then
        addtext = addtext .. ( lang == 0 and "\nIn seinen Händen hat er: " or "\nIn his hands he has: " );
    else
        addtext = addtext .. ( lang == 0 and "\nIn ihren Händen hat sie: " or "\nIn her hands she has: " );
    end
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 5, LookingAt, 0 ); -- left hand
    addtext = addtext .. getCharWears ( TargetCharacter, lang, 6, LookingAt, 0 ); -- right hand

    if ( isFirstText == false ) then
        output = output .. addtext .. ". ";
    --nothing, you see that!
    end

    output = output .. " ";
    -- no idea why that's necessary, maybe delete

    SourceCharacter:sendCharDescription( TargetCharacter.id , output );

    if (mode == MODE_STARE) then
        common.InformNLS(TargetCharacter, "Du fühlst dich beobachtet.", "You feel watched.");
    end
end


function getCharWears( TargetCharacter, lang, positionAtChar, currentLookingAt, limitLookingAt)
    local itemAtCharacter = TargetCharacter:getItemAt( positionAtChar );
    local text = "";
    local textdescription = "";
    if ( itemAtCharacter ~= nil ) and ( itemAtCharacter.id > 0 ) and (currentLookingAt > limitLookingAt) and ( isIgnoredItem(itemAtCharacter.id) == false) then
        if ( isFirstText == false ) then
            text = text .. "; "
        end
        isFirstText = false
        text = text .. world:getItemName( itemAtCharacter.id, lang );
        textdescription = ( lang == 0 and itemAtCharacter:getData("descriptionDe") or itemAtCharacter:getData("descriptionEn") )
-- I have no idea how to get the special description from the item data
        if ( common.IsNilOrEmpty(textdescription) == false ) then
            text = text .. " (" .. textdescription .. ")";
        end
    end
    return text;
end


function getCharPurse( TargetCharacter, lang, currentLookingAt, limitLookingAt)
    local copperAtChar = money.CharCoinsToMoney( TargetCharacter );
    local text = "";
    local TargetCharacterSex = TargetCharacter:increaseAttrib( "sex", 0 );
    
    if (currentLookingAt > limitLookingAt) then
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

function getText( identifier, language )
    local textModule={};
    textModule[0]={};
    textModule[1]={};
    textModule[0]["intro_attrib"]="sieht ";
    textModule[1]["intro_attrib"]="looks ";
    textModule[0]["outro_attrib"]="aus";
    textModule[1]["outro_attrib"]="";
    textModule[0]["strength_1"]="ziemlich schwach";
    textModule[1]["strength_1"]="rather weak";
    textModule[0]["strength_2"]="durchschnittlich kräftig";
    textModule[1]["strength_2"]="average strong";
    textModule[0]["strength_3"]="ziemlich stark";
    textModule[1]["strength_3"]="rather strong";
    textModule[0]["strength_4"]="sehr stark";
    textModule[1]["strength_4"]="really strong";
    textModule[0]["intro_items"]="trägt ";
    textModule[1]["intro_items"]="wears ";
    textModule[0]["genus_0"]="einen ";
    textModule[1]["genus_0"]="a ";
    textModule[0]["genus_1"]="eine ";
    textModule[1]["genus_1"]="a ";
    textModule[0]["genus_2"]="ein ";
    textModule[1]["genus_2"]="a ";
    textModule[0]["below_coat"]="und darunter ";
    textModule[1]["below_coat"]="and under it ";
    textModule[0]["intro_belt"]="am Gürtel: ";
    textModule[1]["intro_belt"]="at the belt: ";
    textModule[0]["money_found"]="ein Münzbeutel";
    textModule[1]["money_found"]="a moneybag";
    textModule[0]["nacked_breast"]="nichts auf dem Oberkörper";
    textModule[1]["nacked_breast"]="nothing at the upper part of the body";
    textModule[0]["and"]=" und ";
    textModule[1]["and"]=" and ";
    textModule[0]["intro_health"]=" und wirkt ";
    textModule[1]["intro_health"]=" and appears to be ";

    return textModule[language][identifier];
end

function getHPText(HP,language, char)
    local HPText={};
    HPText[0]={};
    HPText[1]={};
    HPText[0][6]="gesund.";
    HPText[1][6]="healthy.";
    HPText[0][5]="leicht verwundet.";
    HPText[1][5]="lightly wounded.";
    HPText[0][4]="verwundet.";
    HPText[1][4]="wounded.";
    HPText[0][3]="schwer verwundet.";
    HPText[1][3]="heavily wounded.";
    HPText[0][2]="sehr schwer verwundet.";
    HPText[1][2]="extremely heavily wounded.";
    HPText[0][1]="dem Tod nahe.";
    HPText[1][1]="nearly dead.";
    local interval=math.ceil(HP/1700);
    return HPText[language][interval];
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

function getAgeDescriptor(race,age, language)
    local ageList = { };
    local ageName = { };
    ageName[0] = { };
    ageName[1] = { };
    --                                                                                 human,dwarf,halfling, elf,orc,lizard,gnome,fairy,goblin,default
    ageName[0][1] = "sehr jung";          ageName[1][1] = "very young";   ageList[1] = {    14,   30,      20, 100, 14,    20,   30,   14,    20,     10 };
    ageName[0][2] = "jung";               ageName[1][2] = "young";        ageList[2] = {    18,   50,      25, 300, 20,    60,   50,   40,    23,     20 };
    ageName[0][3] = "";                   ageName[1][3] = "";             ageList[3] = {   nil,  nil,     nil, nil, nil,   nil,  nil,  nil,   nil,    30 };
    ageName[0][4] = "erwachsen";          ageName[1][4] = "grown up";     ageList[4] = {    25,   80,      40, 500, 30,   130,   80,   80,    28,     40 };
    ageName[0][5] = "im mittleren Alter"; ageName[1][5] = "in midlife";   ageList[5] = {    35,  125,      60, 1000, 45,   250,  125,  150,    38,     50 };
    ageName[0][6] = "etwas älter";        ageName[1][6] = "elderly";      ageList[6] = {    45,  175,      80, 2000, 65,   375,  175,  220,    47,     60 };
    ageName[0][7] = "alt";                ageName[1][7] = "old";          ageList[7] = {    55,  220,     100, 3000, 85,   500,  220,  280,    56,     70 };
    ageName[0][8] = "sehr alt";           ageName[1][8] = "very old";     ageList[8] = {    70,  260,     115, 4500,105,   600,  260,  340,    63,     80 };
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
    if( i ~= 3 )then
        return ageName[language][i]..", ";
    else
        return ageName[language][i];
    end
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

return M
