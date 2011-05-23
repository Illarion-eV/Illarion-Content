-- Alle Funktionen geben >nur< die Stichwoerter zurueck.
-- Zum größten Teil ueberarbeitet von playerlookat.lua

module("content.chardescription", package.seeall)

function getFigureText(height, mass, str, lang)
    if iniFig==nil then
        lowStr={};
        normalStr={};
        highStr={};
        lowStr[0]={"sehr mager", "sehr zierlich", "zierlich", nil, "mollig", "dick", "fett"};
        lowStr[1]={"skinny", "very petite", "petite", nil, "chubby", "plump", "fat"};
        normalStr[0]={"schmächtig", "dünn", "schlank", nil, "mollig", "dick", "fett"};
        normalStr[1]={"lank", "thin", "slim", nil, "chubby", "plump", "fat"};
        highStr[0]={"drahtig", "sehr drahtig", nil, "athletisch", "muskulös", "kräftig", "stämmig"} -- schmächtig, muskulös, hager, dürr, stämmig, stattlich, gedrungen
        highStr[1]={"wiry", "very wiry", nil, "athletic", "muscular", "robust", "sturdy" };
        iniFig=1;
    end
    height=height*2.54/100
    mass=mass/100
    BMI=mass/(height*height); -- 18.5, 24.9, 29.9, 
    -- str= 12 average
    if mass==0 then
        BMI=22;
    end
    Idx=math.ceil((BMI-15)/3)+1
    Idx=math.max(Idx,1);
    Idx=math.min(Idx,7);

    -- sehr mager, dünn, schlank, (normal), mollig, dick, fett
    -- athletisch, drahtig, zierlich, kräftig
    if str<12 then
        return lowStr[lang][Idx];
    elseif str<17 then
        return normalStr[lang][Idx];
    else
        return highStr[lang][Idx];
    end
end

function getAgeText(race,age, language)
    if ageList==nil then
        ageList = { };
        ageName = { };
        ageName[0] = { };
        ageName[1] = { };
        --                                                                                 human,dwarf,halfling, elf,orc,lizard,gnome,fairy,goblin,default
        ageName[0][1] = "sehr jung";          ageName[1][1] = "very young";   ageList[1] = {    14,   30,      20, nil, 14,    20,   30,   14,    20,     10 };
        ageName[0][2] = "jung";               ageName[1][2] = "young";        ageList[2] = {    18,   50,      25, 100, 20,    60,   50,   40,    23,     20 };
        ageName[0][3] = "";                   ageName[1][3] = "";             ageList[3] = {   nil,  nil,     nil, 180,nil,   nil,  nil,  nil,   nil,     30 };
        ageName[0][4] = "erwachsen";          ageName[1][4] = "grown up";     ageList[4] = {    25,   80,      40, nil, 30,   130,   80,   80,    28,     40 };
        ageName[0][5] = "im mittleren Alter"; ageName[1][5] = "in midlife";   ageList[5] = {    35,  125,      60, nil, 45,   250,  125,  150,    38,     50 };
        ageName[0][6] = "etwas älter";        ageName[1][6] = "elderly";      ageList[6] = {    45,  175,      80, nil, 65,   375,  175,  220,    47,     60 };
        ageName[0][7] = "alt";                ageName[1][7] = "old";          ageList[7] = {    55,  220,     100, nil, 85,   500,  220,  280,    56,     70 };
        ageName[0][8] = "sehr alt";           ageName[1][8] = "very old";     ageList[8] = {    70,  260,     115, nil,105,   600,  260,  340,    63,     80 };
    end
    if ((race==34) or (race==35)) then -- Drows = Elfen
        race=3;
    end
    if (race > 8 ) then
        race = 9;
    end
    
    i = 0;
    repeat
        if( ageList[i+1][race+1] and age < ageList[i+1][race+1] )then
            break;
        end
        i = i + 1;
    until( i >= 8 );
    i = math.min(8,math.max(1,i));
    return ageName[language][i];
end

function getClothesQualText(qual, lang)
    if initClQText==nil then
        ClQQualText={};
        ClQQualText[0]={"adelig",     "nobel", "sehr fein", "fein", "sehr gut", "gut", "normal", "billig","schäbig","lumpig"};
        ClQQualText[1]={"aristocraticly","nobly", "very fine",  "fine",  "very well", "well", "normaly",  "cheaply",  "shabbyly",  "measly"};
        initClQText=1;
    end
    return ClQQualText[lang][10-qual];
end

function getClothesDuraText(dura, lang)
    if initClText==nil then
        ClDuraText={};
        ClDuraText[0]={"nagelneu" ,"neu", "leicht abgenutzt","gebraucht","abgenutzt","sehr abgenutzt","alt","dreckig", "kaputt", "zerschlissen"  };
        ClDuraText[1]={"brand new", "new",  "slightly torn",    "used",      "torn",      "highly torn",    "old","dirty",  "tattered","haggled"};
        initClText=1;
    end
	return ClDuraText[lang][10-math.floor(dura/10)];
end

function getHPText(HP,language)
    if iniHPT==nil then
        HPText={};
        HPText[0]={};
        HPText[1]={};
        HPText[0][6]="gesund";
        HPText[1][6]="healthy";
        HPText[0][5]="leicht verwundet";
        HPText[1][5]="lightly wounded";
        HPText[0][4]="verwundet";
        HPText[1][4]="wounded";
        HPText[0][3]="schwer verwundet";
        HPText[1][3]="heavily wounded";
        HPText[0][2]="sehr schwer verwundet";
        HPText[1][2]="extremely heavily wounded";
        HPText[0][1]="dem Tod nahe";
        HPText[1][1]="nearly dead";
        iniHPT=1;
    end
    interval=math.ceil(HP/1700);
    return HPText[language][interval];
end

function getClothesFactor(Char)
    itCount=0;
    sumQual=0;
    sumDura=0;
    for ipos=1, 11 do
        thisIt=Char:getItemAt(ipos);
                -- also count empty slots!!!
        if ((ipos==2) or (ipos==7) or (ipos==8)) then
            multi=2;
        else
            multi=1;
        end
        if (((ipos==5) or (ipos==6)) and thisIt.quality==0) then
            multi=0;
        end
        itCount=itCount+multi;
        thisQual=math.floor(thisIt.quality/100);
        sumQual=sumQual+multi*thisQual;
        thisDura=thisIt.quality-100*thisQual;
        sumDura=sumDura+multi*thisDura;
    end
    return math.floor(sumQual/itCount), math.floor(sumDura/itCount);
end
