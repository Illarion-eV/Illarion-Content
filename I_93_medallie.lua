dofile("m_basics.lua");

function UseItemWithField(User,SourceItem, TargetPos, Counter, Param)
    if (SourceItem.data==0) then
        world:createMonster(Counter,TargetPos,20);
    elseif (SourceItem.data==1) then
        world:createMonster(Counter+250,TargetPos,20);
    elseif (SourceItem.data==2) then
        world:createMonster(Counter+500,TargetPos,20);
    elseif (SourceItem.data==3) then
		world:gfx(Counter,TargetPos);
    elseif (SourceItem.data==4) then
        world:makeSound(Counter,TargetPos);
    elseif (SourceItem.data==5) then
		User:setAttrib("racetyp",Counter);
	elseif (SourceItem.data==6) then
		SpawnAttack(TargetPos,Counter);
    elseif ( (SourceItem.data==7) and (SourceItem.itempos==5 or SourceItem.itempos==6) ) then
        MakeInferno(User.pos,Counter);
    elseif (SourceItem.data==8) then
		UndeadEventStat = Counter;
	else
        User:inform("Data 0;1;2 : Monsters - Data 3 : GFX - Data 4: SFX - Data 5: Race change");
    end
end

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    if ((SourceItem.data==8) and ( (User.id==833275147) or User.id==666) ) then
        UndeadEvent(User.pos);
    else
        UseItemWithField(User,SourceItem,position(User.pos.x,User.pos.y+1,User.pos.z),Counter,Param);
    end
end

function UndeadEvent(Posi)
    if (UndeadEventStat == nil) then
        UndeadEventStat = 1;
    end
    if (BasicMask==nil) then
        BasicMask = {};
        BasicMask[ 0] = {false,false,false,false, true, true, true,false,false,false,false};
        BasicMask[ 1] = {false,false, true, true, true, true, true, true, true,false,false};
        BasicMask[ 2] = {false, true, true, true, true, true, true, true, true, true,false};
        BasicMask[ 3] = {false, true, true, true, true, true, true, true, true, true,false};
        BasicMask[ 4] = { true, true, true, true, true, true, true, true, true, true, true};
        BasicMask[ 5] = { true, true, true, true, true, true, true, true, true, true, true};
        BasicMask[ 6] = { true, true, true, true, true, true, true, true, true, true, true};
        BasicMask[ 7] = {false, true, true, true, true, true, true, true, true, true,false};
        BasicMask[ 8] = {false, true, true, true, true, true, true, true, true, true,false};
        BasicMask[ 9] = {false,false, true, true, true, true, true, true, true,false,false};
        BasicMask[10] = {false,false,false,false, true, true, true,false,false,false,false};
    end
    for i=0,10 do
        for k=0,10 do
            if (BasicMask[i][k]) then
                currpos = position(Posi.x-5+i,Posi.y-5+k,Posi.z);
                if (UndeadEventStat == 1) then
                    world:gfx(46,currpos);
                    if world:isCharacterOnField(currpos) then
                        TempChar = world:getCharacterOnField(currpos);
                        temprace = TempChar:get_race();
                        if ((temprace == 10) or (temprace == 11) or (temprace == 20) or (temprace == 26) or (temprace == 29) or (temprace == 36)) then
                            TempChar:tempChangeAttrib("strength",-10,180);
                            TempChar:tempChangeAttrib("agility",-10,180);
                            TempChar:tempChangeAttrib("constitution",-10,180);
                            TempChar:tempChangeAttrib("intelligence",-10,180);
                            TempChar:tempChangeAttrib("essence",-10,180);
                            TempChar:tempChangeAttrib("willpower",-10,180);
                            TempChar:tempChangeAttrib("perception",-10,180);
                            if (TempChar:getPlayerLanguage()==0) then
                                TempChar:inform("Du spürst wie deine Kraft aus deinem Körper weicht und dein Blick sich trübt");
                            else
                                TempChar:inform("You feel how your strength leaves your body and how your view becomes unclear");
                            end
                        else
                            if (TempChar:getPlayerLanguage()==0) then
                                TempChar:inform("Du spürst nur ein leichtest kribbeln");
                            else
                                TempChar:inform("You feel nothing more then a slightly prickle");
                            end
                        end
                    end
                elseif (UndeadEventStat == 2) then
                    world:gfx(53,currpos);
                    if world:isCharacterOnField(currpos) then
                        TempChar = world:getCharacterOnField(currpos);
                        temprace = TempChar:get_race();
                        if ((temprace == 10) or (temprace == 11) or (temprace == 26) or (temprace == 29)) then
                            if (TempChar:getPlayerLanguage()==0) then
                                TempChar:inform("Du spürst nur ein leichtest kribbeln");
                            else
                                TempChar:inform("You feel nothing more then a slightly prickle");
                            end
                        else
                            TempChar:tempChangeAttrib("strength",10,180);
                            TempChar:tempChangeAttrib("agility",10,180);
                            TempChar:tempChangeAttrib("constitution",10,180);
                            TempChar:tempChangeAttrib("intelligence",10,180);
                            TempChar:tempChangeAttrib("essence",10,180);
                            TempChar:tempChangeAttrib("willpower",10,180);
                            TempChar:tempChangeAttrib("perception",10,180);
                            if (TempChar:getPlayerLanguage()==0) then
                                TempChar:inform("Du spürst wie zusätzliche Kraft deine Glieder durchströmt");
                            else
                                TempChar:inform("You feel new stenght in your body");
                            end
                        end
                    end
                end
            end
        end
    end
    if (UndeadEventStat == 1) then
        UndeadEventStat = 2;
    elseif (UndeadEventStat == 2) then
        UndeadEventStat = 1;
    end
end

function MakeInferno(Posi,Counter)
            world:makeSound(4,Posi);
            world:changeTile(15,Posi);
            if Counter>9 then
                SpellRadius=10;
            else
                SpellRadius=Counter;
            end

            for i=1,SpellRadius do
                base.common.CreateCircle(Posi,i,function( Posi )
                performGFX( 7, Posi );
                performTile(15,Posi);
                end );
            end
            world:makeSound(4,Posi);
            world:sendMapUpdate(Posi,10);

end

function SpawnAttack(Posi,Counter)
            world:makeSound(4,Posi);
            if Counter>9 then
                SpellRadius=10;
            else
                SpellRadius=Counter;
            end

            for i=1,SpellRadius do
                base.common.CreateCircle(Posi,i,function( Posi )
                SpawnArea( 113, Posi );
                end );
            end
end



function LookAtItem(User, Item)
    User:inform("Data 0;1;2 : Monsters - Data 3 : GFX - Data 4: SFX - Data 5: Race change");
    User:inform( "Datum: "..world:getTime("day").."/"..world:getTime("month").."/"..world:getTime("year") );
    User:inform( "Zeit: "..world:getTime("hour")..":"..world:getTime("minute")..":"..world:getTime("second") );
    User:inform( "Zeit (Unix): "..world:getTime("unix") );
end
