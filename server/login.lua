-- called after every player login
require("base.common")
require("content.dailymessage")

module("server.login", package.seeall());

function onLogin( player )
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
			player:inform("Fehler beim erstellen des Lasttieres");
		else
			Transporter = world:getCharacterOnField(newPos);
			transport_effect = CLongTimeEffect( 10, 500000 );
			transport_effect:addValue("owner",player.id);
			Transporter.effects:addEffect(transport_effect);
		end
	end
	-- Abhandlung von Transporttieren fertig

	-- Überprüfung für Korrekt Initiertes Regenerationsscript
	find, reg_effect = player.effects:find(2);
	if not find then
		player.effects:addEffect( CLongTimeEffect(2,10) );
	end

	-- Geruchs Effekt setzen
	find, stinkEffekt = player.effects:find(18);
	if not find then
		player.effects:addEffect( CLongTimeEffect(18,10) );
	end

	if not( player.pos.z == 100 or player.pos.z == 101 ) then
		HowAreYouToday( player );
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
	-- Langzeiteffekt für magie
	--
	if ( ( player:getMagicType( ) == 0 ) and ( player:getMagicFlags( 0 ) > 0 ) ) then -- Charakter ist Magier
		player:inform("Magie start");
	    find, magicEffect = player.effects:find(600);
	    player:inform("Effekt gesucht");
            if not find then
	    player:inform("Effekt nicht gefunden");
		player.effects:addEffect( CLongTimeEffect(600,10) );
	    player:inform("Effekt gesetzt");
	    end
	    player:inform("Effekt gefunden.");
	end
]]
	-- Überprüfung auf Newbie-Status
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
			outText=base.common.GetNLS(player,"Endlich wieder festen Boden unter den Füßen.","Finally standing again on firm ground.");
			player:talk(CCharacter.say,outText);
			foundEffect,newbieEffect = player.effects:find(13);
			if not foundEffect then
				newbieEffect=CLongTimeEffect(13,1);
				player.effects:addEffect(newbieEffect);
			else
				newbieEffect.nextCalled=100;
				setNewbiePos(newbieEffect, player);
			end
		end
	elseif (NewbieState == 36 or NewbieState == 322) then  --player logged out on Newbieisland during fighting,lets warp him back to the npc
		player:warp(position(63,41,100));
		if (world:isCharacterOnField(position(41,50,100))==true) then
			if (world:isCharacterOnField(position(43,50,100))==true) then
				player:warp(position(41,48,100));
				player:talk(CCharacter.say, "Arghh");
			else
				player:warp(position(43,50,100));
				player:talk(CCharacter.say, "Arghh");
			end
		else
			player:warp(position(41,50,100));
			player:talk(CCharacter.say, "Arghh"); --needed phrase for the Npc(npc_nargon_hammerfaust.lua) to react
		end
	end
	-- Überprüfung von Newbie-Status fertig

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

function HowAreYouToday( Char )
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
    local Race = Char:get_race();
    local msg = content.dailymessage.GetMessage( Char:getPlayerLanguage(), attrib, Race, value );
    if msg then
		Char:inform( base.common.GetNLS( Char, "#w Deine heutige Verfassung: ", "#w Your condition today: " )..msg );
    end
end