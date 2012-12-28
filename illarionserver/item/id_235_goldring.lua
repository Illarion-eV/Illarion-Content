-- data values in use: 100,101,102,666,700,800, 10000

require("base.lookat")
require("base.common")
require("content.jewelbonus")

module("item.id_235_goldring", package.seeall, package.seeall(content.jewelbonus))

function LookAtItem(User,Item)

    --------------------------------- SPIELERRINGE [ Data 100 - 500 ] --------------------------------------------------------------------------------
    if ( tonumber(Item:getData("ringData")) == 101) then -- Trauring von Roveig
        if (User:getPlayerLanguage()==0) then
            world:itemInform(User,Item,"Goldener Trauring mit der Gravur: Katarine und Roveig, 7.Tag des Eldas im 23.Jahr")
        else
            world:itemInform(User,Item,"golden wedding ring with the gravure: Katarine and Roveig, 7.Day of Eldas in the 23.Year")
        end
    elseif ( tonumber(Item:getData("ringData")) == 102) then -- Trauring von Katarine
        if (User:getPlayerLanguage()==0) then
            world:itemInform(User,Item,"Goldener Trauring mit der Gravur: Roveig und Katarine, 7.Tag des Eldas im 23.Jahr")
        else
            world:itemInform(User,Item,"golden wedding ring with the gravure: Roveig and Katarine, 7.Day of Eldas in the 23.Year")
        end
	elseif ( tonumber(Item:getData("ringData")) == 103) then -- Dajmail's Ring
        if (User:getPlayerLanguage()==0) then
            world:itemInform(User,Item,"Goldener Ring mit der Gravur: Dajmail und Nordwind")
        else
            world:itemInform(User,Item,"golden ring with the gravure: Dajmail and Northwind")
        end

        -------------------------------- QUESTRINGE [ Data > 500 ] ------------------------------------------------------------------------------------
    elseif ( tonumber(Item:getData("ringData")) == 666) then  -- Ring der Akademie
        if (User:getPlayerLanguage()==0) then
            world:itemInform(User,Item,"Ring mit dem Wappen der magischen Akademie Gobaiths");
        else
            world:itemInform(User,Item,"ring with the emblem of the magical academy of Gobaith");
        end
    elseif ( tonumber(Item:getData("ringData")) == 10000) then  -- Ring der Akademie
        if (User:getPlayerLanguage()==0) then
            world:itemInform(User,Item,"Auffälliger Ring");
        else
            world:itemInform(User,Item,"peculiar ring");
        end
    elseif (tonumber(Item:getData("ringData")) == 804) then -- Questitem  (Give the crown)
        if (User:isAdmin()) then -- nur für gm
                world:itemInform(User,Item,"Give the crown! (Krone erscheint auf 370, 134, -10)");
        end
    else
        world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,4,false,false ));
    end
end

function MoveItemAfterMove( User, SourceItem, TargetItem )
    --anlegen des einen rings
    stoneNr,stoneStr=getBonus(TargetItem);
    if stoneNr>0 then                                                   -- obviously a gem was inserted!
        if ((TargetItem.itempos==7) or (TargetItem.itempos==8)) then    -- put on a finger
            giveBonus(User,TargetItem);                                 -- now raise corresponding attribute(s) and start LTE
        elseif ((SourceItem.itempos==7) or (SourceItem.itempos==8)) then  -- taken off of a finger
            takeBonus(User,SourceItem,stoneNr,stoneStr);                -- now lower corresponding attribute(s) and remove/change LTE
        end
    else
        if ( TargetItem:getType() == 4 and (TargetItem.itempos == 7 or TargetItem.itempos == 8) and tonumber(TargetItem:getData("ringData")) == 100 ) then
            --unsichtbarkeitseffekt hinzufuegen
            User.effects:addEffect( LongTimeEffect(11,10) );
            --ablegen des einen rings
        elseif ( tonumber(TargetItem:getData("ringData")) == 100 ) then
            fnd, eff = User.effects:find( 11 );
            if ( fnd ) then
                User.effects:removeEffect( 11 );
            end
            -- Trauring von Roveig und Katarine
        elseif ( TargetItem:getType() == 4 and (TargetItem.itempos == 7 or TargetItem.itempos == 8) and (tonumber(TargetItem:getData("ringData")) == 101
            or tonumber(TargetItem:getData("ringData")) == 102) and (User.id==479308490 or User.id==975152582) ) then
                User:inform("Als du den Ring anlegst, überkommt Dich ein wohliges Gefühl.");
		end
	end
end

function MoveItemBeforeMove( Character, SourceItem, TargetItem)
	if ( tonumber(SourceItem:getData("ringData")) == 666 ) then
		if ( (TargetItem.itempos == 7) or (TargetItem.itempos == 8) ) then -- Wenn versucht wird den Ring anzulegen.
			if ((Character:increaseAttrib("essence",0)+Character:increaseAttrib("willpower",0)+Character:increaseAttrib("intelligence",0))>29) then
				return true;
			else
				base.common.InformNLS( Character,"Ein warnendes Kribbeln durchströhmt deinen Arm als du den Ring berührst. Du willst ihn lieber nicht anlegen.","A warning prickle travels through your arm as you touch the ring. You seems, it is better to let them lay.");
				return false;
			end
		end
	elseif ( tonumber(SourceItem:getData("ringData")) == 700 ) then
		if ( (TargetItem.itempos == 7) or (TargetItem.itempos == 8) ) then -- Wenn versucht wird den Ring anzulegen.
			if ( Character.id == 489898022) then
				return true;
			else
				base.common.InformNLS( Character,"Ein warnendes Kribbeln durchströhmt deinen Arm als du den Ring berührst. Du willst ihn lieber nicht anlegen.","A warning prickle travels through your arm as you touch the ring. You seems, it is better to let them lay.");
				return false;
			end
		end
	end
	return true;
end

function UseItem(User,SourceItem,TargetItem,counter,param,ltstate)
	local FrontItem = base.common.GetFrontItem(User);
	if (User:increaseAttrib("sex",0) == 0) then
		gText = "seinem";
		eText = "his";
	else
		gText = "ihrem";
		eText = "her";
	end

	-----------------------------------------
	-- Teleportringe
	-----------------------------------------
	if (tonumber(SourceItem:getData("ringData")) == 666 ) then    -- Ring der Akademie
		if ( (SourceItem.itempos == 7) or (SourceItem.itempos == 8) )   	-- am Finger getragen?
		and (User.activeLanguage == 10) 		-- Ancient aktiv?
		and ( string.find( User.lastSpokenText, "[Hh][Oo][Nn][Ii][Gg][Kk][Uu][Cc][Hh][Ee][Nn][Pp][Ff][Ee][Rr][Dd]" ) ~= nil ) then  -- Losung ok?
			User:talkLanguage( Character.say, Player.german, "#me dreht den schmalen Goldring an "..gText.." Finger.");
			User:talkLanguage( Character.say, Player.english, "#me spins the small goldring on "..eText.." finger.");
			if (User.pos == position(-89,-123,0)) then		-- Standort: Bane
				world:gfx(31,position(-88,-123,0));
				world:gfx(31,position(-90,-123,0));
				world:gfx(41,position(-89,-123,0));
				User:warp(position(35,26,50));
				world:gfx(31,position(34,26,50));
				world:gfx(31,position(36,26,50));
				world:gfx(41,position(35,26,50));
			elseif (User.pos == position(35,26,50)) then
				world:gfx(31,position(34,26,50));
				world:gfx(31,position(36,26,50));
				world:gfx(41,position(35,26,50));
				User:warp(position(-89,-123,0));
				world:gfx(31,position(-88,-123,0));
				world:gfx(31,position(-90,-123,0));
				world:gfx(41,position(-89,-123,0));
			end
		else
			User:talkLanguage( Character.say, Player.german, "#me dreht den schmalen Goldring an "..gText.." Finger, aber nichts passiert.");
			User:talkLanguage( Character.say, Player.english, "#me spins the small goldring on "..eText.." finger, but nothing happens.");
		end
	end
	if ( tonumber(SourceItem:getData("ringData")) == 100 ) then
		if ( FrontItem ~= nil and (FrontItem.id == 12 or FrontItem.id == 119 or FrontItem.id == 120 or FrontItem.id == 268 or FrontItem.id == 269 or FrontItem.id == 304 or FrontItem.id == 305 or FrontItem.id == 313 or FrontItem.id == 359) ) then
			User:inform("you can read on the ring: Ash nazg durbatuluk, Ash nazg gimbatul, Ash nazg thrakatuluk, Agh burzum-ishi krimpatul.");
		end
	end

	---------------------------------------------------------------
	-- Questring (Rilduran-quest)
	---------------------------------------------------------------
	if (tonumber(SourceItem:getData("ringData")) == 800) then
		if ( (User:isAdmin())  or (User.id==923280786) ) then -- nur für gm!!
			if ( string.find( User.lastSpokenText, "[Aa][Ss][Tt][Rr][Aa][Ll]" ) ~= nil ) then
				User:talkLanguage( Character.say, Player.german, "#me's Konturen scheinen für einen kurzen Augenblick zu flimmern, bevor sich seine Gestalt vollständig auflöst.");
				User:talkLanguage( Character.say, Player.english, "#me's outlines begins to glimmer, before his form dissolves completely.");
				world:gfx(52,User.pos);
				User:warp(position(-37,-193,1));
				world:gfx(52,position(-37,-193,1));
				world:gfx(52,position(-36,-194,1));
				world:gfx(52,position(-38,-192,1));
				world:gfx(52,position(-38,-194,1));
				world:gfx(52,position(-36,-192,1));
			else
				base.common.InformNLS( User,"Du versuchst den Ring zu benutzen, aber nichts passiert.","You try to use the ring, but nothing happens.");
			end
		end
	end
	-----------------------------------------------------------------
	-- Questring (Drachen-quest)
	-----------------------------------------------------------------
	if (User:isAdmin()) then -- nur für gm!!
		if (tonumber(SourceItem:getData("ringData")) == 801) then
			if (User:getRace() == 33) then
				FireBreath(User);
			end
		end
		if (tonumber(SourceItem:getData("ringData")) == 803) then
			if (User:getRace() == 53) then
				IceBreath(User);
			end
		end
	end

	-------------------------------------------------------------------
	-- Questring (Ritual)
	------------------------------------------------------------------
	if (tonumber(SourceItem:getData("ringData")) == 802) then
		if (User:isAdmin()) then -- nur für gm!!
			if ( string.find( User.lastSpokenText, "Stufe1" ) ~= nil ) then
				world:gfx(37,position(50,-328,-23));	-- wasser
				world:gfx(5,position(48,-330, -23));	-- erde
				world:gfx(36,position(48,-326,-23));	-- feuer
				world:gfx(46,position(46,-328,-23));	-- geist
				world:gfx(7,position(48,-328, -23));	-- wind
			end
			if( string.find( User.lastSpokenText, "Stufe2" ) ~= nil ) then
				world:gfx(37,position(50,-328,-23));       -- wasser
				world:gfx(5,position(48,-330, -23));        -- erde
				world:gfx(36,position(48,-326,-23));       -- feuer
				world:gfx(46,position(46,-328,-23));       -- geist
				world:gfx(7,position(48,-328, -23));        -- wind

				mage1 = world:getCharacterOnField(position(50,-328,-23));
				mage2 = world:getCharacterOnField(position(48,-330,-23));
				mage3 = world:getCharacterOnField(position(48,-326,-23));
				mage4 = world:getCharacterOnField(position(46,-328,-23));
				mage5 = world:getCharacterOnField(position(48,-328,-23));

				world:gfx(53,position(50,-328,-23));
				world:gfx(53,position(48,-330,-23));
				world:gfx(53,position(48,-326,-23));
				world:gfx(53,position(46,-328,-23));
				world:gfx(53,position(48,-328,-23));


				mage1:createItem( 3110, 2, 333, 666 );
				mage1:eraseItem( 3109, 1 );
				mage1:eraseItem( 285, 1 );
				mage2:createItem( 3110, 2, 333, 666 );
				mage2:eraseItem( 3109, 1 );
				mage2:eraseItem( 285, 1 );
				mage3:createItem( 3110, 2, 333, 666 );
				mage3:eraseItem( 3109, 1 );
				mage3:eraseItem( 285, 1 );
				mage4:createItem( 3110, 2, 333, 666 );
				mage4:eraseItem( 3109, 1 );
				mage4:eraseItem( 285, 1 );
				mage5:createItem( 3110, 2, 333, 666 );
				mage5:eraseItem( 3109, 1 );
				mage5:eraseItem( 285, 1 );

			end
			if( string.find( User.lastSpokenText, "Stufe3" ) ~= nil ) then

			end

		end
	end
	------------------------------------------------------------------
	-- Questring (Give the crown)
	------------------------------------------------------------------
	if (tonumber(SourceItem:getData("ringData")) == 804) then
		if (User:isAdmin()) then -- nur für gm!!
			world:gfx(7,position(370,134, -10));    -- wind
			world:gfx(7,position(371,134, -10));    -- wind
			world:gfx(7,position(369,134, -10));    -- wind
			world:gfx(7,position(370,133, -10));    -- wind
			world:gfx(7,position(370,135, -10));    -- wind

			world:gfx(7,position(371,131, -10));    -- wind
			world:gfx(7,position(372,136, -10));    -- wind
			world:gfx(7,position(366,134, -10));    -- wind

			world:makeSound(28,position(370,134,-10));
			world:makeSound(4,position(370,134,-10));
			world:makeSound(27,position(370,134,-10));
			world:makeSound(9,position(370,134,-10));
			
			world:changeTile(55,position(370,134,-10));
			world:changeTile(55,position(371,134,-10));
			world:changeTile(55,position(369,134,-10));
			world:changeTile(55,position(370,133,-10));
			world:changeTile(55,position(370,135,-10));

			world:sendMapUpdate(position(370,134,-10),10);

			world:createItemFromId(3104,1,position(370,134,-10),true,333,0);
			world:createItemFromId(225,1,position(370,134,-10),true,333,666);
		end
	end




	--------------------------------------
end

function FireBreath(Monster)
	if (firstFireBreath==nil) then
		FireNearBreathShape={};
		FireNearBreathShape[1]={9,9,9,9,9};
		FireNearBreathShape[2]={0,9,9,9,0};
		FireNearBreathShape[3]={0,9,9,9,0};
		FireNearBreathShape[4]={0,0,9,0,0};
		FireNearBreathShape[5]={0,0,9,0,0};
		firstFireBreath=true;
	end
	FireLooking=Monster:getFaceTo()
	if (FireLooking==0) then
		FireBreathShape=FireNearBreathShape;
	elseif (FireLooking==2) then
		FireBreathShape=ShapeDrehen(FireNearBreathShape);
	elseif (FireLooking==4) then
		FireBreathShape=ShapeDrehen(ShapeDrehen(FireNearBreathShape));
	elseif (FireLooking==6) then
		FireBreathShape=ShapeDrehen(ShapeDrehen(ShapeDrehen(FireNearBreathShape)));
	end
	for i=1,5 do
		for k=1,5 do
			if (FireLooking==0) then
				FireBreathPos=position(Monster.pos.x-3+k,Monster.pos.y-7+i,Monster.pos.z);
			elseif (FireLooking==2) then
				FireBreathPos=position(Monster.pos.x+k,Monster.pos.y-3+i,Monster.pos.z);
			elseif (FireLooking==4) then
				FireBreathPos=position(Monster.pos.x-3+k,Monster.pos.y+i,Monster.pos.z);
			elseif (FireLooking==6) then
				FireBreathPos=position(Monster.pos.x-7+k,Monster.pos.y-3+i,Monster.pos.z);
			end
			if (FireBreathShape[i][k]~=0) then
				world:gfx(FireBreathShape[i][k],FireBreathPos);
				if (math.random(1,5)==1) then
					world:createItemFromId(359,1,FireBreathPos,true,math.random(200,600),0);
					world:makeSound(5,FireBreathPos);
				end
				if world:isCharacterOnField(FireBreathPos) then
					HitChar=world:getCharacterOnField(FireBreathPos);
					HitChar:increaseAttrib("hitpoints",-2000)
				end
			end
		end
	end
end

function IceBreath(Monster)
	if (firstIceBreath==nil) then
		IceNearBreathShape={};
		IceNearBreathShape[1]={4,4,4,4,4};
		IceNearBreathShape[2]={0,4,4,4,0};
		IceNearBreathShape[3]={0,4,4,4,0};
		IceNearBreathShape[4]={0,0,4,0,0};
		IceNearBreathShape[5]={0,0,4,0,0};
		firstIceBreath=true;
	end
	IceLooking=Monster:getFaceTo()
	if (IceLooking==0) then
		IceBreathShape=IceNearBreathShape;
	elseif (IceLooking==2) then
		IceBreathShape=ShapeDrehen(IceNearBreathShape);
	elseif (IceLooking==4) then
		IceBreathShape=ShapeDrehen(ShapeDrehen(IceNearBreathShape));
	elseif (IceLooking==6) then
		IceBreathShape=ShapeDrehen(ShapeDrehen(ShapeDrehen(IceNearBreathShape)));
	end
	for i=1,5 do
		for k=1,5 do
			if (IceLooking==0) then
				IceBreathPos=position(Monster.pos.x-3+k,Monster.pos.y-7+i,Monster.pos.z);
			elseif (IceLooking==2) then
				IceBreathPos=position(Monster.pos.x+k,Monster.pos.y-3+i,Monster.pos.z);
			elseif (IceLooking==4) then
				IceBreathPos=position(Monster.pos.x-3+k,Monster.pos.y+i,Monster.pos.z);
			elseif (IceLooking==6) then
				IceBreathPos=position(Monster.pos.x-7+k,Monster.pos.y-3+i,Monster.pos.z);
			end
			if (IceBreathShape[i][k]~=0) then
				world:gfx(IceBreathShape[i][k],IceBreathPos);
				if (math.random(1,5)==1) then
					world:createItemFromId(360,1,IceBreathPos,true,math.random(200,600),0);
					world:makeSound(5,IceBreathPos);
				end
				if world:isCharacterOnField(IceBreathPos) then
					HitChar=world:getCharacterOnField(IceBreathPos);
					HitChar:increaseAttrib("hitpoints",-2000)
				end
			end
		end
	end
end

function ShapeDrehen(Shape)
	retShape={};
	for i=1,5 do
		retShape[i]={Shape[5][i],Shape[4][i],Shape[3][i],Shape[2][i],Shape[1][i]};
	end
	return retShape
end
