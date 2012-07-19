-- UPDATE common SET com_script='item.id_2502_gynkfire' WHERE com_itemid IN (2502);

module("item.id_2502_gynkfire", package.seeall, package.seeall(item.general.wood))

function LookAtItem(User,Item)
    if (User:getPlayerLanguage() == 0) then
        world:itemInform(User,Item,( math.floor(Item.quality/100) == 2 and "Brennendes " or "" ).."Gynkesisches Feuer");
    else
        world:itemInform(User,Item,( math.floor(Item.quality/100) == 2 and "burning " or "" ).."Gynkese Fire");
    end;
end;

function Drop(User,Item)
    if (math.random(1,User:increaseAttrib("dexterity",0)+7)==1) then
        Explode(User, Item);
        User:talkLanguage(Character.say,Player.german,"#me lässt eine Flasche fallen, welche explodiert.");
        User:talkLanguage(Character.say,Player.english,"#me drops a bottle and it explodes.");
        InformChar(User,"Das Gynkesische Feuer rutscht dir aus den Händen und explodiert vor deinen Füßen.","The Gynkese Fire slips out of your hands and explodes in front of you feets.");
    end;
end;

function MoveItemBeforeMove(User, SourceItem, TargetItem)
    if (math.floor(SourceItem.quality/100)==2) then
        if (SourceItem:getType()==4 and (SourceItem.itempos==5 or SourceItem.itempos==6)) then
            return true;
        elseif (TargetItem:getType()~=3) then
            return true;
        else
            InformChar(User,
            "Du solltest das Gynkesische Feuer in der Hand haben um es zu werfen.",
            "You should have the Gynkese Fire in your hand to throw it.");
            return false;
        end;
    else
        return true;
    end;
end;

function MoveItemAfterMove(User, SourceItem, TargetItem)
    if (math.floor(SourceItem.quality/100)==2) then
        if (SourceItem:getType()==4 and (SourceItem.itempos==5 or SourceItem.itempos==6)) then
            if (TargetItem:getType()==3) then
                Explode(User, TargetItem);
                if not User:isAdmin() then
                    User:talkLanguage(Character.say,Player.german,"#me wirft eine Flasche, welche explodiert.");
                    User:talkLanguage(Character.say,Player.english,"#me throws a bottle and it explodes.");
                end
                User.movepoints=User.movepoints-30;
            else
                Drop(User,TargetItem);
            end;
        else
            Drop(User,TargetItem);
        end;
    end;
end;

function UseItem(User,SourceItem,TargetItem,counter,param)
    local lang=User:getPlayerLanguage();
    if (math.floor(SourceItem.quality/100)==2) then
        InformChar(User,
        "Du löschst das Gynkesische Feuer.",
        "You put the Gynkese Fire out.");
        SourceItem.quality=300+(SourceItem.quality-(math.floor(SourceItem.quality/100)*100));
    else
        InformChar(User,
        "Du zündest das Gynkesische Feuer an. Vorsichtig damit!",
        "You light the Gynkese Fire up. Be careful with it.");
        SourceItem.quality=200+(SourceItem.quality-(math.floor(SourceItem.quality/100)*100));        
    end;
    world:changeItem( SourceItem );
end;

function Explode(Attacker, Item)    
    local Strength=Item.quality - (math.floor(Item.quality/100)*100);
    CreateCircle( 1,Scale(  20, 100,Strength),Item.pos,3, Attacker);
    CreateCircle( 9,Scale( 100, 500,Strength),Item.pos,2, Attacker);
    CreateCircle(44,Scale(1000,3000,Strength),Item.pos,1, Attacker);
    world:gfx(36,Item.pos);
    HitChar(Item.pos,Scale(3000,6000,Strength), Attacker);
    world:makeSound(5,Item.pos);
    world:erase(Item,1);
end;

function InformChar(User,gText,eText)
    User:inform(User:getPlayerLanguage()==0 and gText or eText);
end;

function CreateCircle(gfxid,Damage,CenterPos,Radius, Attacker)
    local irad = math.ceil(Radius);
    local dim = 2*(irad+1);
    local x;
    local y;
    local map = {};    
    for x = -irad-1, irad do
        map[x] = {};
        for y = -irad-1, irad do
            map[x][y] = (x+0.5)*(x+0.5)+(y+0.5)*(y+0.5)-irad*irad > 0
        end;
    end;   
    for x = -irad, irad do
        for y = -irad, irad do
            if not( map[x][y] and  map[x-1][y] and map[x][y-1] and map[x-1][y-1] )
               and( map[x][y] or   map[x-1][y] or  map[x][y-1] or  map[x-1][y-1] ) then
                HitPos=position( CenterPos.x + x, CenterPos.y + y, CenterPos.z );
                world:gfx(gfxid,HitPos);
                HitChar(HitPos,Damage, Attacker);
            end;
        end;
    end;
end;

function HitChar(Posi,Hitpoints, Attacker)
    if world:isCharacterOnField(Posi) then
		local Defender = world:getCharacterOnField(Posi);
		local hp = Defender:increaseAttrib("hitpoints",-Hitpoints);
	end;
end;

function Scale(ScBegin, ScEnd, value)
    return ((ScEnd-ScBegin)/100)*value+ScBegin;
end;
