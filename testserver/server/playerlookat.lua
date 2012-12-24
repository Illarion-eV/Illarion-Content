-- Character description

-- SourceCharacter - The Char who looks at someone
-- TargetCharacter - The Char who is the target of that gaze

-- mode
--      = 0 --> short description
--      = 1 --> long description

require("content.genus")
require("base.common")
require("base.factions")
require("content.lookat.custom")
require("content.uniquechardescription")
require("item.altars")

module("server.playerlookat", package.seeall)

function lookAtPlayer( SourceCharacter, TargetCharacter, mode)
	debug(SourceCharacter.name .. " is looking at " .. TargetCharacter.name);
  content.uniquechardescription.InitPlayerDesc();
    -- here we go the lookat
    -- Generate the looking at value
    LookingAt = mode * 50;
    LookingAt = LookingAt + SourceCharacter:increaseAttrib( "perception", 0 ) * 2;
    LookingAt = LookingAt + ( SourceCharacter:distanceMetric( TargetCharacter ) - 2 ) * ( -8 );
    -- Looking at value is ready
    -- get the language value
    
    --SourceCharacter:inform("mode= "..mode.." lookingat= "..LookingAt);
    
    if not base.common.IsLookingAt( SourceCharacter, TargetCharacter.pos ) then
        base.common.TurnTo( SourceCharacter, TargetCharacter.pos );
    end
    
	if not CustomLookAt then
		content.lookat.custom.InitCustomLookAt();
		CustomLookAt = content.lookat.custom.CustomLookAt;
	end
	
	if mode == 1 then
		createDevotionInform(SourceCharacter, TargetCharacter);
	end
	
    local lang = SourceCharacter:getPlayerLanguage();
    -- inform about stats
    qual,dura=getClothesFactor(TargetCharacter);
    output = "";
    if ( LookingAt > 40 ) then
        -- Er ist |alt, |sehr kr�ftig |und |tr�gt |noble |Kleidung, |ein Serinjah-Schwert| und |ein Schild.
        if ( TargetCharacter:increaseAttrib( "sex", 0 ) == 0 ) then
            output = ( lang == 0 and "Er ist " or "He is " );
        else
            output = ( lang == 0 and "Sie ist " or "She is " );
        end
        output=output .. getAge(TargetCharacter:getRace(),TargetCharacter:increaseAttrib("age",0),lang);
        --output=output .. " ! ";
        output=output .. getClothesQualText(qual, lang);
        --output=output .. " ! ";
        strength = TargetCharacter:increaseAttrib( "strength", 0 );
        --output = output .. getText( "intro_attrib", lang );
        --[[ if ( LookingAt < 45 and strength < 10 ) then
            output = output .. getText( "strength_2", lang ) .. " ";
        elseif ( LookingAt < 45 ) then
            output = output .. getText( "strength_3", lang ) .. " ";
        elseif ( strength < 6 ) then
            output = output .. getText( "strength_1", lang ) .. " ";
        elseif ( strength < 11 ) then
            output = output .. getText( "strength_2", lang ) .. " ";
        elseif ( strength < 16 ) then
            output = output .. getText( "strength_3", lang ) .. " ";
        else
            output = output .. getText( "strength_4", lang ) .. " ";
        end--]]
        h=TargetCharacter:increaseAttrib("body_height",0)
        m=TargetCharacter:increaseAttrib("weight",0)
        output=output..getFigure(h,m,strength,lang)
        
        --output = output .. getText( "outro_attrib", lang );
        output = output .. getText( "intro_health" , lang );
        output = output .. getHPText(TargetCharacter:increaseAttrib("hitpoints",0),lang,SourceCharacter) .. " ";   
    end

    if ( TargetCharacter:increaseAttrib( "sex", 0 ) == 0 ) then
        output = output .. ( lang == 0 and "Er " or "He " );
    else
        output = output .. ( lang == 0 and "Sie " or "She " );
    end
    -- Er/Sie | tr�gt | [ einen | gr�nen Mantel | ] 
    output = output .. getText( "intro_items", lang );
    -- Lets check for a coat
    if checkCoat( TargetCharacter, lang, SourceCharacter ) then
        -- coat hides the things below, but not for everyone.
		if checkArmor( TargetCharacter, lang, 45, true, SourceCharacter ) then
            checkBelt( TargetCharacter, lang, 45, true, SourceCharacter );
        else    -- no armor
            checkBelt( TargetCharacter, lang, 45, false, SourceCharacter );
        end
    else    -- kein coat!
        if not checkArmor( TargetCharacter, lang, 0, false, SourceCharacter ) then
            -- No coat? No armor? He is nacked! p0rn! xD
            output = output .. getText( "nacked_breast", lang );
        end
        --output=output..getText();
        checkBelt( TargetCharacter, lang, 0, true, SourceCharacter );
    end
    output=output..". "; --..getClothesText(qual, dura, lang, TargetCharacter:increaseAttrib( "sex", 0 ),SourceCharacter);
    output=output..getWeaponText( TargetCharacter, lang, SourceCharacter );
    
		--faction additions
	Faction = base.factions.get(TargetCharacter);
	if Faction.rankTown == 0 then
		factiontext = ( lang ==0 and " ("..base.factions.TownRankList[Faction.rankTown].gRank..")" or " ("..base.factions.TownRankList[Faction.rankTown].eRank..")" );
	else
		factiontext = ( (lang ==0 and " ("..base.factions.TownRankList[Faction.rankTown].gRank.." "..base.factions.TownNameGList[Faction.tid][1].."s)" ) 
				or 	" ("..base.factions.TownRankList[Faction.rankTown].eRank.." of "..base.factions.TownNameEList[Faction.tid][1]..")" );
	end
	output = output .. factiontext;
	
    checkCustomInventory(TargetCharacter, SourceCharacter);
	  
    SourceCharacter:sendCharDescription( TargetCharacter.id , output );
    --SourceCharacter:inform("now checking diseaseeeee:");
    --found,diseaseEffect = TargetCharacter.effects:find(28);
    --if found then
        --SourceCharacter:talk(Character.say,"found!");
        --fndStr,disStr=diseaseEffect:findValue("diseaseStr");
        --SourceCharacter:talk(Character.say,"Char infiziert. Str="..disStr);
    --end

    if (mode == 1) then
        if (TargetCharacter:getPlayerLanguage() == 0) then
            TargetCharacter:inform( "Du fühlst dich beobachtet.",Player.mediumPriority );
            if base.common.IsLookingAt( TargetCharacter, SourceCharacter.pos ) then
                if ( SourceCharacter:increaseAttrib( "sex", 0 ) == 0 ) then
                    TargetCharacter:sendCharDescription( SourceCharacter.id , "Er scheint dich anzustarren." );
                else
                    TargetCharacter:sendCharDescription( SourceCharacter.id , "Sie scheint dich anzustarren." );
                end
            end
        else
            TargetCharacter:inform( "You feel watched.",Player.mediumPriority );
            if base.common.IsLookingAt( TargetCharacter, SourceCharacter.pos ) then
                if ( SourceCharacter:increaseAttrib( "sex", 0 ) == 0 ) then
                    TargetCharacter:sendCharDescription( SourceCharacter.id , "He appears to stare at you." );
                else
                    TargetCharacter:sendCharDescription( SourceCharacter.id , "She appears to stare at you." );
                end
            end
        end
    end
	if(content.uniquechardescription.PlayerDescriptionsDE[TargetCharacter.id] ~= nil) then
		for i,v in pairs(content.uniquechardescription.PlayerDescriptionsDE[TargetCharacter.id]) do
			base.common.InformNLS(SourceCharacter, content.uniquechardescription.PlayerDescriptionsDE[TargetCharacter.id][i], content.uniquechardescription.PlayerDescriptionsEN[TargetCharacter.id][i]);
		end
	end
end

function checkCoat( TargetCharacter, lang, SourceCharacter )
    local coat = TargetCharacter:getItemAt( Character.coat );
    if ( coat ~= nil ) and ( coat.id > 0 ) then
        -- The dude has a coat!
        output = output .. getText( "genus_"..content.genus.GenusData( coat.id ), lang );
        output = output .. world:getItemName( coat.id, lang );
		handleCustomLookat( TargetCharacter, SourceCharacter, coat );
        return true;
    end
    return false;
end

function checkArmor( TargetCharacter, lang, modify, belowcoat, SourceCharacter )
    if ( LookingAt > modify ) then
        local breast = TargetCharacter:getItemAt( Character.breast );
        if ( breast ~= nil ) and ( breast.id > 0 ) then
            if belowcoat then
                output = output .. " " .. getText( "below_coat", lang );
            end
            output = output .. getText( "genus_"..content.genus.GenusData( breast.id ), lang );
            output = output .. world:getItemName( breast.id, lang );
			handleCustomLookat( TargetCharacter, SourceCharacter, breast );
            return true;
        end
    end
    return false;
end

function checkBelt( TargetCharacter, lang, modify, withend, SourceCharacter )
    if ( LookingAt > ( 25 + modify ) ) then
        -- now lets check the bloody belt
        got_money = false;
        first_item = true;
        for i=12,17 do
            item = TargetCharacter:getItemAt( i );
			handleCustomLookat( TargetCharacter, SourceCharacter, item );
            item = ( item == nil and 0 or item.id );
            if ( item ~= 0 and item ~= 228 and item ~= 93 and item ~= 99 and item ~= 100 and item ~= 382 ) then
                if first_item then
                    output = output .. " ";
                    if withend then
                        output = output .. getText( "and", lang );
                    end
                    output = output .. getText( "intro_belt", lang );
                end
            
                if (( item == 62 ) or ( item == 3076 ) or ( item == 3077 )) then
                    if not got_money then
                        got_money = true;
                        if not first_item then
                            output = output .. ", ";
                        end
                        output = output .. getText( "money_found", lang );
                    end
                elseif ( item ~= 0 ) then
                    if not first_item then
                        output = output .. ", ";
                    end
                    --output = output .. getText( "genus_"..content.genus.GenusData( item.id ), lang );
                    output = output .. world:getItemName( item, lang ).."";
                end
                if first_item then
                    first_item = false;
                end
            end
        end
    end
end

function getText( identifier, language )
    if initMod==nil then
        textModule={};
        textModule[0]={};
        textModule[1]={};
        textModule[0]["intro_attrib"]="sieht ";
        textModule[1]["intro_attrib"]="looks ";
        textModule[0]["outro_attrib"]="aus";
        textModule[1]["outro_attrib"]="";
        textModule[0]["strength_1"]="ziemlich schwach";
        textModule[1]["strength_1"]="rather weak";
        textModule[0]["strength_2"]="durchschnittlich kr�ftig";
        textModule[1]["strength_2"]="average strong";
        textModule[0]["strength_3"]="ziemlich stark";
        textModule[1]["strength_3"]="rather strong";
        textModule[0]["strength_4"]="sehr stark";
        textModule[1]["strength_4"]="really strong";
        textModule[0]["intro_items"]="tr�gt ";
        textModule[1]["intro_items"]="wears ";
        textModule[0]["genus_0"]="einen ";
        textModule[1]["genus_0"]="a ";
        textModule[0]["genus_1"]="eine ";
        textModule[1]["genus_1"]="a ";
        textModule[0]["genus_2"]="ein ";
        textModule[1]["genus_2"]="a ";
        textModule[0]["below_coat"]="und darunter ";
        textModule[1]["below_coat"]="and under it ";
        textModule[0]["intro_belt"]="am G�rtel ";
        textModule[1]["intro_belt"]="at the belt ";
        textModule[0]["money_found"]="ein M�nzbeutel";
        textModule[1]["money_found"]="a moneybag";
        textModule[0]["nacked_breast"]="nichts auf dem Oberk�rper";
        textModule[1]["nacked_breast"]="nothing at the upper part of the body";
        textModule[0]["and"]=" und ";
        textModule[1]["and"]=" and ";
        textModule[0]["intro_health"]=" und wirkt ";
        textModule[1]["intro_health"]=" and appears to be ";
        initMod=1;
    end
    
    return textModule[language][identifier];
end

function getHPText(HP,language, char)
    if iniHPT==nil then
        HPText={};
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

function getClothesText(qual, dura, lang, sex,char)
    if initClText==nil then
        ClQualText={};
        ClQualText[0]={"adelige",     "noble", "sehr feine", "feine", "sehr gute", "gute", "normale", "billige","sch�bige","lumpige"};
        ClQualText[1]={"aristocratic","noble", "very fine",  "fine",  "very good", "good", "normal",  "cheap",  "shabby",  "measly"};
        ClDuraText={};
        ClDuraText[0]={"nagelneu" ,"neu", "leicht abgenutzt","gebraucht","abgenutzt","sehr abgenutzt","alt","dreckig", "kaputt", "zerschlissen"  };
        ClDuraText[1]={"brand new", "new",  "slightly torn",    "used",      "torn",      "highly torn",    "old","dirty",  "tattered","haggled"};

        sexText={};
        sexText[0]={}
        sexText[1]={}
        sexText[0][0]="Seine " --Kleidung wirkt ";
        sexText[0][1]="Ihre " --tr�gt ";
        sexText[1][0]="His ";
        sexText[1][1]="Her ";
        clText={};
        clText[0]=" Kleidung wirkt "
        clText[1]=" clothes look "
        initClText=1;
    end
    return sexText[lang][sex]..ClQualText[lang][10-qual]..clText[lang]..ClDuraText[lang][10-math.floor(dura/10)]..".";
end


function getClothesQualText(qual, lang)
    if initClQText==nil then
        ClQQualText={};
        ClQQualText[0]={"adelig",     "nobel", "sehr fein", "fein", "sehr gut", "gut", "normal", "billig","sch�big","lumpig"};
        ClQQualText[1]={"aristocraticly","nobly", "very fine",  "fine",  "very well", "well", "normaly",  "cheaply",  "shabbyly",  "measly"};
        clQText={};
        clQText[0]=" gekleidet"
        clQText[1]=" dressed"
        initClQText=1;
    end
    return ClQQualText[lang][10-qual]..clQText[lang]..", ";
end


-- 


function getAge(race,age, language)
    if ageList==nil then
        ageList = { };
        ageName = { };
        ageName[0] = { };
        ageName[1] = { };
        --                                                                                 human,dwarf,halfling, elf,orc,lizard,gnome,fairy,goblin,default
        ageName[0][1] = "sehr jung";          ageName[1][1] = "very young";   ageList[1] = {    14,   30,      20, 100, 14,    20,   30,   14,    20,     10 };
        ageName[0][2] = "jung";               ageName[1][2] = "young";        ageList[2] = {    18,   50,      25, 300, 20,    60,   50,   40,    23,     20 };
        ageName[0][3] = "";                   ageName[1][3] = "";             ageList[3] = {   nil,  nil,     nil, nil, nil,   nil,  nil,  nil,   nil,    30 };
        ageName[0][4] = "erwachsen";          ageName[1][4] = "grown up";     ageList[4] = {    25,   80,      40, 500, 30,   130,   80,   80,    28,     40 };
        ageName[0][5] = "im mittleren Alter"; ageName[1][5] = "in midlife";   ageList[5] = {    35,  125,      60, 1000, 45,   250,  125,  150,    38,     50 };
        ageName[0][6] = "etwas �lter";        ageName[1][6] = "elderly";      ageList[6] = {    45,  175,      80, 2000, 65,   375,  175,  220,    47,     60 };
        ageName[0][7] = "alt";                ageName[1][7] = "old";          ageList[7] = {    55,  220,     100, 3000, 85,   500,  220,  280,    56,     70 };
        ageName[0][8] = "sehr alt";           ageName[1][8] = "very old";     ageList[8] = {    70,  260,     115, 4500,105,   600,  260,  340,    63,     80 };
    end
    if ((race==34) or (race==35)) then
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
    if( i ~= 3 )then
        return ageName[language][i]..", ";
    else
        return ageName[language][i];
    end
end

function getFigure(height, mass, str, lang)
    if iniFig==nil then
        lowStr={};
        normalStr={};
        highStr={};
        lowStr[0]={"sehr mager ", "sehr zierlich ", "zierlich ", " ", "mollig ", "dick ", "fett "};
        lowStr[1]={"skinny ", "very petite ", "petite ", " ", "chubby ", "plump ", "fat "};
        normalStr[0]={"schm�chtig ", "d�nn ", "schlank ", " ", "mollig ", "dick ", "fett "};
        normalStr[1]={"lank ", "thin ", "slim ", " ", "chubby", "plump", "fat"};
        highStr[0]={"drahtig ", "sehr drahtig ", " ", "athletisch ", "muskul�s ", "kr�ftig ", "st�mmig "} 
        highStr[1]={"wiry ", "very wiry ", " ", "athletic ", "muscular ", "robust ", "sturdy " };
        iniFig=1;
    end
    height=height*2.54/100
    mass=mass/100
    BMI=mass/(height*height); -- 18.5, 24.9, 29.9, 
    -- str= 10 average
    if mass==0 then
        BMI=22;
    end
    Idx=math.ceil((BMI-16)/3)+1
    Idx=math.max(Idx,1);
    Idx=math.min(Idx,7);

    -- sehr mager, d�nn, schlank, (normal), mollig, dick, fett
    -- athletisch, drahtig, zierlich, kr�ftig
    if str<7 then
        return lowStr[lang][Idx];
    elseif str<14 then
        return normalStr[lang][Idx];
    else
        return highStr[lang][Idx];
    end
end
-- in seinen H�nden hat er ein Serinjahschwert[ und ein Schild].
function getWeaponText( Char, lang, SourceChar )
    local message = "";
    local leftItem = Char:getItemAt( Character.left_tool );
    handleCustomLookat(Char,SourceChar,leftItem);
	leftItem = ( leftItem == nil and 0 or leftItem.id );
    local rightItem = Char:getItemAt( Character.right_tool );
    handleCustomLookat(Char,SourceChar,rightItem);
	rightItem = ( rightItem == nil and 0 or rightItem.id );
    if ( leftItem == 228 or leftItem == 93 or leftItem == 99 or leftItem == 100 or leftItem == 382 ) then
        leftItem = 0;
    end
    if ( rightItem == 228 or rightItem == 93 or rightItem == 99 or rightItem == 100 or rightItem == 382 ) then
        rightItem = 0;
    end
    if ( leftItem == 0 and rightItem == 0 ) then
        return "";
    end
    if ( Char:increaseAttrib( "sex", 0 ) == 0 ) then
        message = message .. ( lang == 0 and " In seinen H�nden hat er " or " In his hands he has " );
    else
        message = message .. ( lang == 0 and " In ihren H�nden hat sie " or " In her hands she has " );
    end
    if ( leftItem ~= 0 ) then
        message = message .. getText( "genus_"..content.genus.GenusData( leftItem ), lang );
        message = message .. world:getItemName( leftItem, lang );
    end
    if ( leftItem ~= 0 and rightItem ~= 0 ) then
        message = message .. ( lang == 0 and " und " or " and " );
    end
    if ( rightItem ~= 0 ) then
        message = message .. getText( "genus_"..content.genus.GenusData( rightItem ), lang );
        message = message .. world:getItemName( rightItem, lang );
    end
    return message..".";
end

function checkCustomInventory(TargetChar, SourceChar)
	
	local checkItem;
	local posList = {1,4,9,10};
	-- check rest of inventory
	for i,pos in pairs(posList) do
		checkItem = TargetChar:getItemAt(pos);
		if checkItem.id > 0 then
			handleCustomLookat(TargetChar,SourceChar,checkItem);
		end
	end
	-- do not show to everyone
	if LookingAt > 45 then
		-- check neck
		handleCustomLookat(TargetChar,SourceChar,TargetChar:getItemAt(2));
		-- check fingers if no glove is found
		if TargetChar:getItemAt(4).id == 0 then
			handleCustomLookat(TargetChar,SourceChar,TargetChar:getItemAt(7));
			handleCustomLookat(TargetChar,SourceChar,TargetChar:getItemAt(8));
		end
	end
end

function handleCustomLookat(TargetChar,SourceChar,Item)
	
	if Item == nil or Item.id <= 0 or Item.data <= 2^30 then
		return;
	end
	if CustomLookAt[Item.id] ~= nil then
		local itemData = Item.data - 2^30;
		if CustomLookAt[Item.id][itemData] ~= nil then
			local lang = SourceChar:getPlayerLanguage();
			local customText;
			if TargetChar:increaseAttrib("sex",0) == 0 then
				if Item:getType() == 5 then
					customText = ( lang == 0 and "Am G�rtel hat er " or "At the belt he has " )
				else
					if Item.itempos == 5 or Item.itempos == 6 then
						customText = ( lang == 0 and "In den H�nden hat er " or "In his hands he has " );
					else
						customText = ( lang == 0 and "Er tr�gt " or "He wears " );
					end
				end
			else
				if Item:getType() == 5 then
					customText = ( lang == 0 and "Am G�rtel hat sie " or "At the belt she has " )
				else
					if Item.itempos == 5 or Item.itempos == 6 then
						customText = ( lang == 0 and "In den H�nden hat sie " or "In her hands she has " );
					else
						customText = ( lang == 0 and "Sie tr�gt " or "She wears " );
					end
				end
			end
			-- check for changed gender, but no gender text for gloves
			if Item.itempos ~= 4 then
				local gender = CustomLookAt[Item.id][itemData][5];
				if not gender then
					gender = content.genus.GenusData( Item.id );
				end
				customText = customText .. getText( "genus_"..gender, lang );
			end
			-- removed item name?
			if not CustomLookAt[Item.id][itemData][4] then
				customText = customText .. world:getItemName( Item.id, lang ) .. " ";
			end
			customText = customText .. CustomLookAt[Item.id][itemData][lang+1] .. ". ";
			SourceChar:inform( customText,Player.mediumPriority );
		end
	end
end

function createDevotionInform(SourceCharacter, TargetCharacter)
	local devotion = TargetCharacter:getQuestProgress(401);
	local priesthood = TargetCharacter:getQuestProgress(402);
	
	if devotion == 0 then
		return;
	end
	local sex = TargetCharacter:increaseAttrib("sex", 0);
	
	if not item.altars.init then
		item.altars.ini();
	end
	local godName = item.altars.godName[devotion];
	
	local gText, eText = "","";
	if sex == 0 then
		gText = "Er ist ein ";
		eText = "He is a ";
		if priesthood > 0 then
			gText = gText .. "Priester ";
			eText = eText .. "priest ";
		else
			gText = gText .. "Anhänger ";
			eText = eText .. "devotee ";
		end
	else
		gText = "Sie ist eine ";
		eText = "She is a ";
		if priesthood > 0 then
			gText = gText .. "Priesterin ";
			eText = eText .. "priestess ";
		else
			gText = gText .. "Anhängerin ";
			eText = eText .. "devotee ";
		end
	end
	gText = gText .. godName .."s.";
	eText = eText .. "of " .. godName ".";
	
	base.common.InformNLS(SourceCharacter, gText, eText);
end
