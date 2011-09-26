-- called after every player login
require("base.common")
require("content.dailymessage")

module("server.login", package.seeall);

function onLogin( player )

    world:gfx(31,player.pos); --A nice GFX that announces clearly: A player logged in.

	--General welcome message
    players=world:getPlayersOnline(); --Reading all players online so we can count them
	base.common.InformNLS(player,"[Login] Willkommen auf Illarion! Es sind "..table.getn(players).." Spieler online.","[Login] Welcome to Illarion! There are "..table.getn(players).." players online."); --sending a message

	--Messages of the day
    
	--Default message of the day; more messages would be cool
	base.common.TempInformNLS( player,
        "[Login] Wir spielen miteinander, nicht gegeneinander. Viel Spaﬂ beim Spielen!",
        "[Login] We play with, not against each other. Have fun playing!"
    );

	--TEMPORARY SOLUTION TO CATCH NEW PLAYERS
	if player:getMentalCapacity() < 1999 or player:getQuestProgress(122) == 0 then --Mental Capacity CANNOT drop below 1999 -> New player or cheater. However, new players should start with a higher value
	    player:increaseMentalCapacity(2000000); --Maybe reduce to 200000 for brand new players. This is for existing players.
		base.common.TempInformNLS(player,"[Skillsystem] Mental Capacity zwangsangepasst!","[Skill system] Adjustment of mental capacity enforced."); --Debuggin'
		player:setQuestProgress(122,1);
	end
	--TEMPORARY SOLUTION END
	
	player:increaseAttrib("foodlevel",-1);
	-- Abhandlung von Transporttieren
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

		    if not world:createDynamicNPC("Lasttier",npcRace,newPos,0,"npc_lasttier.lua") then
		        newPos = false;
		    end
		end
		if not newPos then
			player:inform("Fehler beim Erstellen des Lasttieres.");
		else
			Transporter = world:getCharacterOnField(newPos);
			transport_effect = LongTimeEffect( 10, 500000 );
			transport_effect:addValue("owner",player.id);
			Transporter.effects:addEffect(transport_effect);
		end
	end
	-- Abhandlung von Transporttieren fertig

	-- ‹berpr¸fung f¸r korrekt initiertes Regenerationsskript
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

	--Good/Bad days removed for the time being (confusing!!!)
	--[[if not( player.pos.z == 100 or player.pos.z == 101 ) then
		HowAreYouToday( player );
	end]]

	-- Langzeitefekt f¸r Runenlehren
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
	    --player:inform("moep->Effekt gefunden");
		found, Rune1Index = teachEffect:findValue("Rune1Index");
		if found then
    		if ( (timestamp>=Rune1Index) or (Rune1Index==1) ) then
    		    --player:inform("moep->Rune 1 ist frei");
    			teachEffect:addValue("Rune1Index",1);
				Rune1=1;
			else
			    --player:inform("moep->Rune 1 ist gesperrt");
			    Rune1=2;
			end
		end
		found, Rune2Index = teachEffect:findValue("Rune2Index");
		if found then
    		if ( (timestamp>=Rune2Index) or (Rune2Index==1) ) then
    		    --player:inform("moep->Rune 2 ist frei");
				teachEffect:addValue("Rune2Index",1);
				Rune2=1;
			else
			    --player:inform("moep->Rune 2 ist gesperrt");
			    Rune2=2;
			end
		end
		if ( (Rune1==1) and (Rune2==1) ) then
		    --player:inform("moep->Effekt wird entfernt");
			player.effects:removeEffect(22);
		end
	else
	    --player:inform("moep->Effekt NICHT gefunden");
    end

    --player:inform("moep->Fertig!");

--[[
	-- Langzeiteffekt f¸r magie
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
	-- ‹berpr¸fung auf Newbie-Status
	NewbieState = player:getQuestProgress(2);
	if NewbieState == 2 then
		-- player logged out before moving the first time, let's offer another chance
		NewbieState=0;
	end
	if NewbieState == 0 and player.pos.z == 100 then
		-- first login
		local atNewbieSpawn = true;
		-- commented out, useless?
		--[[ for x=31,32 do
			for y=19,24 do
				if player.pos.x == x and player.pos.y == y then
					atNewbieSpawn = true;
				end
			end
		end ]]
		if atNewbieSpawn then
			player:setQuestProgress(2,1); -- player seems to be a newbie, so start "Quest"
			outText=base.common.GetNLS(player,"#w Du verl‰ﬂt das Schiff, welches dich in das geheimnisvolle Land Illarion gebracht hat. Endlich wieder festen Boden unter den F¸ﬂen!","#w You leave the ship that brought you to the mysterious land Illarion. Finally standing again on firm ground again!");
			player:inform(outText);
			outText2=base.common.GetNLS(player,"#w Hilfe erh‰ltst du jederzeit im Illarion-Chat oder auf dem Illarion-Forum, welche auf der Homepage verlinkt sind.","#w You can get help of any kind in the Illarion chat or the Illarion forum. You can find a link to both on the homepage.");
			player:inform(outText2);

			foundEffect,newbieEffect = player.effects:find(13);
			if not foundEffect then
				newbieEffect=LongTimeEffect(13,1);
				player.effects:addEffect(newbieEffect);
			else
				newbieEffect.nextCalled=100;
				setNewbiePos(newbieEffect, player);
			end
		end
	elseif (NewbieState == 36 or NewbieState == 322) then  --player logged out on Noobia during fighting,lets warp him back to the npc
		player:warp(position(63,41,100));
		if (world:isCharacterOnField(position(41,50,100))==true) then
			if (world:isCharacterOnField(position(43,50,100))==true) then
				player:warp(position(41,48,100));
				player:talk(Character.say, "Arghh!");
			else
				player:warp(position(43,50,100));
				player:talk(Character.say, "Arghh!");
			end
		else
			player:warp(position(41,50,100));
			player:talk(Character.say, "Arghh!"); --needed phrase for the Npc(npc_nargon_hammerfaust.lua) to react
		end
	end
	-- ‹berpr¸fung von Newbie-Status fertig

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
