require("base.orders")
require("base.common")
require("base.factions")

module("item.id_3110_scroll", package.seeall)

-- UPDATE common SET com_script = 'item.id_3110_scroll' WHERE com_itemid = 3110;

function LookAtItem(User,Item)
    --abarbeitung der Aufträge
    local order = base.orders.Order:fromItem(Item);
    if ( order ~= nil ) then
        world:itemInform(User,Item,order:lookAt(User));
        return;
    end
    --ende der Aufträge
    local spell = Item.quality;
    if (spell == 101) then -- teleport
        
        User:inform( teleportLookAt( User, Item ) );
        
    elseif (spell == 102) then -- self-teleport
        
        base.common.InformNLS( User, "Auf der Pergamentrolle ist lediglich das Symbol eines Vogels abgebildet.", "Just the symbol of a bird has been painted on this scroll of parchment." );
    elseif (Item.data == 600) then -- Summon Creature
	base.common.InformNLS( User, "Die Pergamentrolle ist mit einem blutroten Siegel verschlossen.", "The scroll is sealed with a bloody red seal." );
    elseif ( Item.data== 666 ) then -- quest scroll
    	base.common.InformNLS( User, "Auf der Pergamentrolle ist das Symbol eines Drachen abgebildet.", "The symbol of a dragon has been painted on this scroll of parchment." );
    elseif ( Item.quality== 750) then -- guild membership decree
 	
		local rank 	  = math.floor(Item.data/100); -- the rank in the Guild(1 digit)
		local GuildID = (Item.data - rank*100);-- the Guild ID(2 digits(10-99))	
    	InformText = base.common.GetNLS( User, "Dekret der Gilde "..GuildNameGList[GuildID][1]..GuildRanklist[rank].gusage, "Decree of the guild "..GuildNameEList[GuildID][1]..GuildRanklist[rank].eusage )
   	    world:itemInform(User,Item, InformText);
   	elseif ( Item.quality == 751) then -- unban decree
    	InformText = base.common.GetNLS( User, "Entbannungsdekret der Stadt "..TownNameGList[Item.data][1],
									  "Unban decree of the town "..TownNameEList[Item.data][1])
		world:itemInform(User,Item, InformText);
	end
end

function CheckOrderNpc(User, SourceItem, Character)
	fnd, ordernpc = getNPCFromGlobalList(Character.id,User);
	if ( fnd ) then
		--wenn funktion true zurück gibt dann war es ein auftrag
		--daher restliche funktion abbrechen
		if (ordernpc:checkOrder(SourceItem,User) ) then 
			return;
		end
	end
end

function UseItem( User, SourceItem, TargetItem, counter, param, ltstate )
    local FrontChar = base.common.GetFrontCharacter(User);
	if FrontChar and FrontChar:getType() == Character.npc then
		CheckOrderNpc(User, SourceItem, FrontChar);
		return;
	end
	local spell = SourceItem.quality;
    if (SourceItem.data == 600) then -- summon creature
        summonCreature( User, SourceItem );
    elseif (spell == 101) then -- teleport
        teleportUseItem( User, SourceItem, ltstate );
    elseif (spell == 102) then -- self-teleport
        selfTeleportUseItem( User, SourceItem );
    elseif (SourceItem.data == 666) then 
		world:gfx(51,User.pos);
		world:gfx(31,User.pos);
		User:warp(position(48,-327,-23));
		world:gfx(51,User.pos);
		world:gfx(31,User.pos);
		world:erase(SourceItem,1);
    end;
end

function teleportTarget( Item )
    local x, y, z, dat;
    dat = Item.data;
    z = dat - math.floor(dat/1024)*1024 - 500;    
    dat = math.floor(dat / 1024);
    y = dat - math.floor(dat/1024)*1024 - 500;
    dat = math.floor(dat / 1024);
    x = dat - math.floor(dat/1024)*1024 - 500;
    return position(x, y, z);
end

function teleportLookAt( User, Item )
    
    dat = Item.data;
    dz = dat - math.floor(dat/1024)*1024 - 500 - User.pos.z;
    
    if ( math.abs(dz) > 15) then
        return base.common.GetNLS( User, "Die Pergamentrolle glüht bläulich.", "The scroll of parchment glows blueish." );
    end;
    
    dat = math.floor(dat / 1024);
    dy = User.pos.y - dat + math.floor(dat/1024)*1024 + 500;
    dat = math.floor(dat / 1024);
    dx = dat - math.floor(dat/1024)*1024 - 500 - User.pos.x;

    if ( dz == 0 ) then
        heightTxt = base.common.GetNLS( User, "schwarze", "black" );
    elseif ( dz < 0 ) then
        heightTxt = base.common.GetNLS( User, "rote", "red" );
    else
        heightTxt = base.common.GetNLS( User, "blaue", "blue" );
    end;

    if ( dx == 0 ) and ( dy == 0 ) then
        return base.common.GetNLS( User, "Auf der Pergamentrolle ist lediglich ein "..heightTxt.."s Kreuz zu sehen.", "The scroll of parchment just displays a "..heightTxt.." cross." );
    end;

    if ( dx == 0 ) then
        if ( dy > 0 ) then
            phi = math.pi/2;
        else
            phi = math.pi + math.pi/2;
        end;
    elseif ( dx > 0 ) then
        if ( dy >= 0 ) then
            phi = math.atan( dy/dx );
        else
            phi = math.atan( dy/dx ) + 2*math.pi;
        end;
    else
        phi = math.atan( dy/dx ) + math.pi;
    end;
    
    if ( phi < math.pi/8 ) then
        dirTxt = base.common.GetNLS( User, "Osten", "east" );
    elseif ( phi < 3*math.pi/8 ) then
        dirTxt = base.common.GetNLS( User, "Nordosten", "northeast" );
    elseif ( phi < 5*math.pi/8 ) then
        dirTxt = base.common.GetNLS( User, "Norden", "north" );
    elseif ( phi < 7*math.pi/8 ) then
        dirTxt = base.common.GetNLS( User, "Nordwesten", "northwest" );
    elseif ( phi < 9*math.pi/8 ) then
        dirTxt = base.common.GetNLS( User, "Westen", "west" );
    elseif ( phi < 11*math.pi/8 ) then
        dirTxt = base.common.GetNLS( User, "Südwesten", "southwest" );
    elseif ( phi < 13*math.pi/8 ) then
        dirTxt = base.common.GetNLS( User, "Süden", "south" );
    elseif ( phi < 15*math.pi/8 ) then
        dirTxt = base.common.GetNLS( User, "Südosten", "southeast" );
    else
        dirTxt = base.common.GetNLS( User, "Osten", "east" );
    end;
    
    return base.common.GetNLS( User, "Auf der Pergamentrolle ist lediglich ein "..heightTxt.."r Pfeil zu sehen, welcher gen "..dirTxt.." weist.", "The scroll of parchment just displays a "..heightTxt.." arrow, which points to the "..dirTxt.."." );
        
end

function teleportUseItem( User, SourceItem, ltstate )
            if ( ltstate == nil or ltstate == Action.success ) then
                
                    destination = teleportTarget( SourceItem );
                    User:warp(destination);
                    world:gfx(41,destination);
                    world:erase( SourceItem, 1 );

            elseif ( ltstate == Action.none ) then
                
                User:startAction( 100, 41, 10, 0, 0);
                
                destination = teleportTarget( SourceItem );
                world:gfx(41,destination);
                    
                User:talkLanguage( Character.say, Player.german, "#me beginnt konzentriert auf eine Pergamentrolle zu starren.");
                User:talkLanguage( Character.say, Player.english, "#me begins to stare on a scroll of parchment intensely.");
            
            elseif ( ltstate == Action.abort ) then
                
                User:talkLanguage(Character.say, Player.german, "#me wird abgelenkt.");
                User:talkLanguage(Character.say, Player.english,"#me gets distracted.");
                
            end
end

function selfTeleportUseItem( Caster, Item )

    local faceto = Caster:getFaceTo();

    local dx, dy;
    if (faceto == 0) then
        dy = -1; dx = 0;
    elseif (faceto == 2) then
        dy = 0; dx = 1;
    elseif (faceto == 4) then
        dy = 1; dx = 0;
    elseif (faceto == 6) then
        dy = 0; dx = -1;
    end;
    
    local dist = 0;
    local TelePos = Caster.pos;

    repeat
        TelePos.x = TelePos.x + dx;
        TelePos.y = TelePos.y + dy;
        dist = dist + 1;
    until world:isItemOnField( TelePos ) or world:isCharacterOnField( TelePos ) or (dist >= 8);
    TelePos.x = TelePos.x - dx;
    TelePos.y = TelePos.y - dy;
    
    Caster:talkLanguage( Character.say, Player.german, "#me starrt konzentriert auf eine Pergamentrolle.");
    Caster:talkLanguage( Character.say, Player.english, "#me stares on a scroll of parchment intensely.");
                   
    world:gfx(41,Caster.pos);
    world:gfx(41,TelePos);
    world:makeSound(13,Caster.pos);
    world:makeSound(13,TelePos);
    
    local oldpos = Caster.pos;
    Caster:warp(TelePos);
    
    world:erase( Item, 1 );
    
    if not (Caster.pos == TelePos) then
        world:sendMonitoringMessage("Possible Bug abuse by "..Caster.name..". Player tried to teleport from pos("..oldpos.x..","..oldpos.y..","..oldpos.z..") to pos("..TelePos.x..","..TelePos.y..","..TelePos.z..") but got placed at pos("..Caster.pos.x..","..Caster.pos.y..","..Caster.pos.z..")");
    end                        
end

function summonCreature( Caster, Item )
    Caster:inform("moep->start");

    faceto = Caster:getFaceTo();
    
    if (faceto==0) then    	--north
	CreaturePos  = position(Caster.pos.x,Caster.pos.y-1,Caster.pos.z);
    elseif (faceto==2) then    	--east
	CreaturePos  = position(Caster.pos.x+1,Caster.pos.y,Caster.pos.z);
    elseif (faceto==4) then 	--south
        CreaturePos  = position(Caster.pos.x,Caster.pos.y+1,Caster.pos.z);
    elseif (faceto== 6) then 	--west
	CreaturePos  = position(Caster.pos.x-1,Caster.pos.y,Caster.pos.z);
    else
    	Caster:inform("moep->Faceto nicht möglich, weil "..faceto.." ist Blickrichtung.");
    end

    if world:isCharacterOnField( CreaturePos ) then
	CreaturePos  = position(CreaturePos.x-1,CreaturePos.y+1,CreaturePos.z);
    end
    
    if (Item.quality==101) then
        world:createMonster(101,CreaturePos,10);
    elseif (Item.quality==111) then
        world:createMonster(111,CreaturePos,10);
    elseif (Item.quality==171) then
        world:createMonster(171,CreaturePos,10);
    elseif (Item.quality==211) then
        world:createMonster(211,CreaturePos,10);
    elseif (Item.quality==231) then
        world:createMonster(231,CreaturePos,10);
    end

    world:gfx(8,CreaturePos);
    world:makeSound(1,CreaturePos);

    world:erase( Item, 1 );

    Caster:inform("moep->ende");

end
