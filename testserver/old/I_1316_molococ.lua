function LookAtItem(User,Item)
    if (User:getPlayerLanguage() == 0) then
        world:itemInform(User,Item,"Du siehst einen"..( math.floor(Item.quality/100) == 2 and " brennenden " or " " ).."Molotov Cocktail.");
    else
        world:itemInform(User,Item,"You see a"..( math.floor(Item.quality/100) == 2 and " burning " or " " ).."molotov cocktail.");
    end;
end;

function Drop(User,Item)
    if (math.random(1,User:increaseAttrib("dexterity",0)+7)==1) then
        Explode(Item);
        User:talkLanguage(Character.say,Player.german,"#me lässt eine Flasche fallen, welche explodiert.");
        User:talkLanguage(Character.say,Player.english,"#me drops a bottle and it explodes.");
        InformChar(User,
        "Der Molotov Cocktail rutscht dir aus den Händen und explodiert vor deinen Füßen.",
        "The molotov cocktail slip out of your hands and explode in front of you feets.");
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
            "Du solltest den Molotov Cocktail in der Hand haben um ihn zu werfen.",
            "You should have the molotov cocktail in your hand to throw it.");
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
                Explode(TargetItem);
                User:talkLanguage(Character.say,Player.german,"#me wirft eine Flasche, welche explodiert.");
                User:talkLanguage(Character.say,Player.english,"#me throws a bottle and it explodes.");
                User.movepoints=User.movepoints-30;
            else
                Drop(User,TargetItem);
            end;
        else
            Drop(User,TargetItem);
        end;
    end;
end;

function UseItem(User, SourceItem)
    local lang=User:getPlayerLanguage();
    if (math.floor(SourceItem.quality/100)==2) then
        InformChar(User,
        "Du löschst den Molotov Cocktail.",
        "You put the molotov cocktail out.");
        SourceItem.quality=300+(SourceItem.quality-( math.floor (SourceItem.quality/100)*100));
    else
        InformChar(User,
        "Du zündest den Molotov Cocktail an. Vorsicht damit.",
        "You light the molotov cocktail up. Be careful with the cocktail.");
        SourceItem.quality=200+(SourceItem.quality-(math.floor(SourceItem.quality/100)*100));        
    end;
    world:changeItem( SourceItem );
end;

function Explode(Item)    
    local Strength=Item.quality - (math.floor(Item.quality/100)*100);
    CreateCircle( 1,Scale(  20, 100,Strength),Item.pos,3);
    CreateCircle( 9,Scale( 100, 500,Strength),Item.pos,2);
    CreateCircle(44,Scale(1000,3000,Strength),Item.pos,1);
    world:gfx(36,Item.pos);
    HitChar(Item.pos,Scale(3000,6000,Strength));
    world:makeSound(5,Item.pos);
    world:erase(Item,1);
end;

function InformChar(User,gText,eText)
    User:inform(User:getPlayerLanguage()==0 and gText or eText);
end;

function CreateCircle(gfxid,Damage,CenterPos,Radius)
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
                HitPos = position( CenterPos.x + x, CenterPos.y + y, CenterPos.z );
                world:gfx(gfxid,HitPos);
                HitChar(HitPos,Damage);
            end;
        end;
    end;
end;

function HitChar(Pos,Hitpoints)
    if world:isCharacterOnField(Pos) then world:getCharacterOnField(Pos):increaseAttrib("hitpoints",-Hitpoints) end;
end;

function Scale(ScBegin, ScEnd, value)
    return ((ScEnd-ScBegin)/100)*value+ScBegin;
end;
