-- called after every player login
require("base.common")
require("content.dailymessage")

module("server.login", package.seeall);

function onLogin( player )

    world:gfx(31,player.pos); --A nice GFX that announces clearly: A player logged in.

	--General welcome message
    players=world:getPlayersOnline(); --Reading all players online so we can count them
	base.common.TempInformNLS(player,"[Login] Willkommen auf Illarion! Es sind "..table.getn(players).." Spieler online.","[Login] Welcome to Illarion! There are "..table.getn(players).." players online."); --sending a message
    
	--Noobia handling
	if (player.pos.z == 100) or (player.pos.z == 101) then --On Noobia	
		
		found, myEffect = player.effects:find(13); --Noob effect
			
		if not found then --brand new player!
		
            newbieEffect = LongTimeEffect(13,1);
		    player.effects:addEffect(newbieEffect);
					    
		end

		local callbackNewbie = function(dialogNewbie) end; --empty callback
		
		if player:getPlayerLanguage() == 0 then		
			dialogNewbie = MessageDialog("Willkommen bei Illarion!", "Willkommen bei Illarion, dem kostenlosen Online-Rollenspiel. Dieses Tutorial wird dich auf deinen ersten Schritten begleiten und dir die Bedienung des Spiels beibringen. Du kannst das Tutorial jederzeit überspringen.", callbackNewbie);
		else		
			dialogNewbie = MessageDialog("Welcome to Illarion!", "Welcome to Illarion, the free online roleplaying game. This tutorial will guide you through your first steps and will show you the handling of the game. You may skip the tutorial at any time.", callbackNewbie);
		end	
		
		player:requestMessageDialog(dialogNewbie); --showing the welcome text
		
    end --Noobia end
	
    if (player.pos.z ~= 100) and (player.pos.z~= 101) then --Not on Noobia, confuses noobs
	
	--Messages of the day
    messageG={};
    messageG[1]="[Tipp] Leichte Rüstungen wie Leder schützen sehr gut gegen stumpfe Waffen aber schlecht gegen Hiebwaffen.";
    messageG[2]="[Tipp] Mittlere Rüstungen wie Kettenhemden schützen sehr gut gegen Hiebwaffen aber schlecht gegen Stichwaffen.";
    messageG[3]="[Tipp] Schwere Rüstungen wie Plattenpanzer schützen sehr gut gegen Stichwaffen aber schlecht gegen stumpfe Waffen.";
	messageG[4]="[Tipp] Wir spielen miteinander, nicht gegeneinander. Viel Spaß beim Spielen!";	
	messageG[5]="[Tipp] Bitte besuche uns auch im IRC-Chat: #illarion auf Quakenet.";
	messageG[6]="[Tipp] Im Forum sind viele interessante Diskussion und Informationen zu finden. Meld dich gleich an!";
	messageG[7]="[Tipp] Wenn du einen Gamemaster erreichen möchtest, schreibe !gm <Deine Nachricht> im Chatfenster.";
	messageG[8]="[Tipp] Brágon ist der Gott des Feuers.";
	messageG[9]="[Tipp] Eldan ist der Gott des Geistes.";
	messageG[10]="[Tipp] Findari ist die Göttin der Luft.";
	messageG[11]="[Tipp] Tanora/Zelphia ist die Göttin des Wassers.";
	messageG[12]="[Tipp] Ushara ist die Göttin der Erde .";
	messageG[13]="[Tipp] Adron ist der Gott des Weines und der Feste.";
	messageG[14]="[Tipp] Cherga ist die Göttin der Geister und der Unterwelt.";
	messageG[15]="[Tipp] Elara ist die Göttin des Wissens und der Weisheit.";
	messageG[16]="[Tipp] Irmorom ist der Gott des Handels und des Handwerks.";
	messageG[17]="[Tipp] Malachín ist der Gott der Jagd und der Schlachten.";
	messageG[18]="[Tipp] Moshran ist der Gott des Blutes und der Gebeine.";
	messageG[19]="[Tipp] Nargùn ist der Gott des Chaos.";
	messageG[20]="[Tipp] Oldra ist die Göttin der Fruchtbarkeit und des Lebens.";
	messageG[21]="[Tipp] Ronagan ist der Gott der Diebe und der Schatten.";
	messageG[22]="[Tipp] Sirani ist die Göttin der Liebe und der Freude.";
	messageG[23]="[Tipp] Zhambra ist der Gott der Freundschaft und Treue.";
	messageG[24]="[Tipp] Cadomyr ist das Reich der Ehre.";
	messageG[25]="[Tipp] Runewick ist das Reich der Weisheit.";		
	messageG[26]="[Tipp] Galmair ist das Reich des Reichtums.";
	messageG[27]="[Tipp] Manchen Monstern sollte man lieber nicht alleine begegnen.";
	messageG[28]="[Tipp] Gegenstände von geringer Haltbarkeit drohen zu zerbrechen. Ein Fachmann kann sie ausbessern.";
	messageG[29]="[Tipp] Fernwaffen werden nicht umsonst so genannt: stark auf Distanz; nutzlos im Nahkampf.";
	messageG[30]="[Tipp] Hiebwaffen sind gut gegen leichte Rüstungen.";
	messageG[31]="[Tipp] Stichwaffen sind gut gegen mittlere Rüstungen.";
	messageG[32]="[Tipp] Stumpfe Waffen sind gute gegen schwere Rüstungen.";
	messageG[33]="[Tipp] Ein Silberstück entspricht einhundert Kupferstücken. Einhundert Silberstücke entsprechen einem Goldstück.";
	messageG[34]="[Tipp] Die besten Alchemisten	leben in Runewick.";
	messageG[35]="[Tipp] Die besten Kerzenzieher leben in Runewick.";
	messageG[36]="[Tipp] Die besten Schreiner leben in Runewick.";
	messageG[37]="[Tipp] Die besten Köche leben in Runewick.";
	messageG[38]="[Tipp] Die besten Bauern leben in Runewick.";
	messageG[39]="[Tipp] Die besten Kräuterkundigen leben in Runewick.";
	messageG[40]="[Tipp] Die besten Schneider leben in Runewick.";
	messageG[41]="[Tipp] Die besten Schmiede leben in Galmair.";
	messageG[42]="[Tipp] Die besten Ziegelbrenner leben in Galmair.";
	messageG[43]="[Tipp] Die besten Steinmetze leben in Galmair.";
	messageG[44]="[Tipp] Die besten Bergarbeiter leben in Galmair.";
	messageG[45]="[Tipp] Die besten Brauer leben in Galmair.";
	messageG[46]="[Tipp] Die besten Fischer leben in Cadomyr.";
	messageG[47]="[Tipp] Die besten Glasbläser leben in Cadomyr.";
	messageG[48]="[Tipp] Die besten Gräber leben in Cadomyr.";
	messageG[49]="[Tipp] Die besten Kunstschmiede leben in Cadomyr.";
	messageG[50]="[Tipp] Die besten Edelsteinschleifer leben in Cadomyr.";
	
    messageE={};
    messageE[1]="[Hint] Light armour like leather armour protects good against blunt weapons but bad against slashing weapons.";
    messageE[2]="[Hint] Medium armour like chain mail protects good against slashing weapons but bad against puncture weapons.";
    messageE[3]="[Hint] Heavy armour like plate armour protects good against puncture weapons but bad against blunt weapons.";
    messageE[4]="[Hint] We play with, not against each other. Have fun playing!";
	messageE[5]="[Hint] Please join our IRC chat: #illarion on Quakenet.";
	messageE[6]="[Hint] The forum contains many interesting discussions and information. Register today!";	
	messageE[7]="[Hint] If you want to contact a gamemaster, type !gm <Your message> in the chat box.";
	messageE[8]="[Hint] Brágon is the God of fire.";
	messageE[9]="[Hint] Eldan is the God of spirit.";
	messageE[10]="[Hint] Findari is the Goddess of air.";
	messageE[11]="[Hint] Tanora/Zelphia is the Goddess of water.";
	messageE[12]="[Hint] Ushara is the Goddess of earth.";
	messageE[13]="[Hint] Adron is the God of festivities and wine.";
	messageE[14]="[Hint] Cherga is the Goddess of spirits and the underworld.";
	messageE[15]="[Hint] Elara is the Goddess of wisdom and knowledge.";
	messageE[16]="[Hint] Irmorom is the God of trade and craftsmanship.";
	messageE[17]="[Hint] Malachín is the God of battle and hunting.";
	messageE[18]="[Hint] Moshran is the God of blood and bones.";
	messageE[19]="[Hint] Nargùn is the God of chaos.";
	messageE[20]="[Hint] Oldra is the Goddess of life and fertility.";
	messageE[21]="[Hint] Ronagan is the God of thieves and shadows.";
	messageE[22]="[Hint] Sirani is the Goddess of love and pleasure.";
	messageE[23]="[Hint] Zhambra is the God of friendship and loyalty.";
	messageE[24]="[Hint] Cadomyr is the realm of honour.";
	messageE[25]="[Hint] Runewick is the realm of wisdom.";
	messageE[26]="[Hint] Galmair is the realm of wealth.";
	messageE[27]="[Hint] Some monsters you should avoid all alone.";
	messageE[28]="[Hint] Items of low durability might break any time. A specialist can repair them.";
	messageE[29]="[Hint] Distance weapons have their name for a reason; useful for distant targets, useless in melee.";
	messageE[30]="[Hint] Slashing weapons are good against light armour.";
	messageE[31]="[Hint] Puncture weapons are good against medium armour.";
	messageE[32]="[Hint] Blunt weapons are good against heavy armour.";
	messageE[33]="[Hint] A silver coin equals a hundred copper coins. One hundred silver coins equal one gold coin.";
	messageE[34]="[Hint] The best alchemists are living in Runewick.";
	messageE[35]="[Hint] The best candle makers are living in Runewick.";
	messageE[36]="[Hint] The best carpenters are living in Runewick.";
	messageE[37]="[Hint] The best cooks are living in Runewick.";
	messageE[38]="[Hint] The best peasants are living in Runewick.";
	messageE[39]="[Hint] The best herbalists are living in Runewick.";
	messageE[40]="[Hint] The best tailors are living in Runewick.";
	messageE[41]="[Hint] The best blacksmiths are living in Galmair.";
	messageE[42]="[Hint] The best brick makers are living in Galmair.";
	messageE[43]="[Hint] The best masons are living in Galmair.";
	messageE[44]="[Hint] The best miners are living in Galmair.";
	messageE[45]="[Hint] The best brewers are living in Galmair.";
	messageE[46]="[Hint] The best fishers are living in Cadomyr.";
	messageE[47]="[Hint] The best glass blowers are living in Cadomyr.";
	messageE[48]="[Hint] The best diggers are living in Cadomyr.";
	messageE[49]="[Hint] The best finesmiths are living in Cadomyr.";
	messageE[50]="[Hint] The best gem grinders are living in Cadomyr.";	
	
	    dailyMessageID=math.random(1,table.getn(messageG)); --chosing a message at random
	    base.common.TempInformNLS( player,messageG[dailyMessageID],messageE[dailyMessageID]); --sending the message
    end
	
	--TEMPORARY SOLUTION TO CATCH NEW PLAYERS
	if player:getMentalCapacity() < 1999 or player:getQuestProgress(122) == 0 then --Mental Capacity CANNOT drop below 1999 -> New player or cheater. However, new players should start with a higher value
	    player:increaseMentalCapacity(2000000); --Maybe reduce to 200000 for brand new players. This is for existing players.
		base.common.TempInformNLS(player,"[Skillsystem] Mental Capacity zwangsangepasst!","[Skill system] Adjustment of mental capacity enforced."); --Debuggin'
		player:setQuestProgress(122,1); --Saving the information that the player went throuh this process
	end
	--TEMPORARY SOLUTION END
	
	player:increaseAttrib("foodlevel",-1);
	
	-- Beasts of burden
	local cowStatus = player:getQuestProgress(8);
	if (player:getQuestProgress(8) ~= 0) then
	    if (cowStatus == 1) then
		    newPos = createCow( player );
		else
		    newPos = base.common.DataToPosition( cowStatus );

			npcRace=50;
			if (player.pos.z == 50) then
				npcRace=30;
			end

		    if not world:createDynamicNPC("Lasttier",npcRace,newPos,0,"npc.lasttier") then
		        newPos = false;
		    end
		end
		if not newPos then
			player:inform("[Error] Problem creating the beast of burden. Please inform a developer.");
		else
			Transporter = world:getCharacterOnField(newPos);
			transport_effect = LongTimeEffect( 10, 500000 );
			transport_effect:addValue("owner",player.id);
			Transporter.effects:addEffect(transport_effect);
		end
	end
	-- Beasts of burden done

	-- Überprüfung für korrekt initiertes Regenerationsskript
	find, reg_effect = player.effects:find(2);
	if not find then
		player.effects:addEffect( LongTimeEffect(2,10) );
	end
	
	--Checking longterm cooldown
	find, reg_effect = player.effects:find(33);
	if not find then
		player.effects:addEffect( LongTimeEffect(33,10) );
	end

	-- Smell effect removed for the time being (annoying!!!)
	find, stinkEffekt = player.effects:find(18);
	if find then
		player.effects:removeEffect(18);
	end
	
	-- Cold effect removed for the time being (annoying!!!)
	find, coldEffekt = player.effects:find(3);
	if find then
		player.effects:removeEffect(3);
	end

	-- Langzeitefekt für Runenlehren
    year=world:getTime("year");
    year=(year-1)*31536000;						-- (year-1)*((15*24) + 5)*24*60*60;
    month=world:getTime("month");
    month=(month-1)*2073600;					-- (month-1)*24*24*60*60;
    day=world:getTime("day");
    day=(day-1)*86400;							-- (day-1)*24*60*60;
    hour=world:getTime("hour");
    hour=hour*3600;								-- hour*60*60;
    minute=world:getTime("minute");
    minute=minute*60;
    second=world:getTime("second");
    second=second;

	timestamp=year+month+day+hour+minute+second;

	find, teachEffect = player.effects:find(22);
	if find then
		found, Rune1Index = teachEffect:findValue("Rune1Index");
		if found then
    		if ( (timestamp>=Rune1Index) or (Rune1Index==1) ) then
    			teachEffect:addValue("Rune1Index",1);
				Rune1=1;
			else
			    Rune1=2;
			end
		end
		found, Rune2Index = teachEffect:findValue("Rune2Index");
		if found then
    		if ( (timestamp>=Rune2Index) or (Rune2Index==1) ) then
				teachEffect:addValue("Rune2Index",1);
				Rune2=1;
			else
			    Rune2=2;
			end
		end
		if ( (Rune1==1) and (Rune2==1) ) then
			player.effects:removeEffect(22);
		end
	else
    end

--[[
	-- Langzeiteffekt für Magie
	--
	if ( ( player:getMagicType( ) == 0 ) and ( player:getMagicFlags( 0 ) > 0 ) ) then -- Charakter ist Magier
		player:inform("Magie start");
	    find, magicEffect = player.effects:find(600);
	    player:inform("Effekt gesucht");
            if not find then
	    player:inform("Effekt nicht gefunden");
		player.effects:addEffect( LongTimeEffect(600,10) );
	    player:inform("Effekt gesetzt");
	    end
	    player:inform("Effekt gefunden.");
	end
]]

	--Good/Bad days removed for the time being (confusing!!!)
	--[[if not( player.pos.z == 100 or player.pos.z == 101 ) then
		HowAreYouToday( player );
	end]]
	
	return true;
end

function createCow( player )
	posList = { 0, 1, -1, 2, -2 };
	for i, XPos in pairs(posList) do
		for k, YPos in pairs(posList) do
			SettingPos = position(player.pos.x+XPos,player.pos.y+YPos,player.pos.z);
			if not world:isCharacterOnField( SettingPos ) and not world:isItemOnField( SettingPos ) then
				if world:createDynamicNPC("Lasttier",50,SettingPos,0,"npc_lasttier.lua") then
					return SettingPos;
				else
					return false;
				end
			end
		end
	end
	return false;
end

function setNewbiePos(newbieEffect,Character)

	newbieEffect:addValue("newbiePosX",Character.pos.x);
	newbieEffect:addValue("newbiePosY",Character.pos.y);
	newbieEffect:addValue("newbiePosZ",Character.pos.z);
end

--Good/Bad days removed for the time being (confusing!!!)
--[[function HowAreYouToday( Char )
    if not listOfAttribs then
        listOfAttribs = {"strength","dexterity","constitution","agility","willpower","perception","essence","intelligence"};
    end
    math.randomseed( Char.id + world:getTime("day") + world:getTime("month") + world:getTime("year") );

    local firstAttrib = listOfAttribs[ math.random(1,8) ];
    local secondAttrib = "";
    repeat
        secondAttrib = listOfAttribs[ math.random(1,8) ];
    until( firstAttrib ~= secondAttrib );

    local randomTry = math.random(0,10);
    if( randomTry >= 0 ) and ( randomTry < 1 ) then
        AttribMessage( Char, firstAttrib, 2 );
    elseif( randomTry >= 1 ) and ( randomTry < 3 ) then
        AttribMessage( Char, firstAttrib, 1 );
    elseif( randomTry >= 3 ) and ( randomTry < 5 ) then
        AttribMessage( Char, firstAttrib, -1 );
    end

    local randomTry = math.random(0,10);
    if( randomTry >= 0 ) and ( randomTry < 1 ) then
        AttribMessage( Char, secondAttrib, 2 );
    elseif( randomTry >= 1 ) and ( randomTry < 3 ) then
        AttribMessage( Char, secondAttrib, 1 );
    elseif( randomTry >= 3 ) and ( randomTry < 5 ) then
        AttribMessage( Char, secondAttrib, -1 );
    end
end

function AttribMessage( Char, attrib, value )
    Char:increaseAttrib( attrib, value );
    local Race = Char:getRace();
    local msg = content.dailymessage.GetMessage( Char:getPlayerLanguage(), attrib, Race, value );
    if msg then
		Char:inform( base.common.GetNLS( Char, "#w Deine heutige Verfassung: ", "#w Your condition today: " )..msg );
    end
end]]
