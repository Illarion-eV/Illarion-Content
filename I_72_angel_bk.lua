-- I_72.lua Angeln

-- UPDATE common SET com_script='I_72_angel.lua' WHERE com_itemid=72;

dofile("base_lookat.lua" );
require("base.common")
require("base.treasure")

function getBonusFromTool(toolItem)
    local dataValue=toolItem.data;
    --User:inform("data= "..dataValue);
    if ((dataValue>9) and (dataValue<100)) then  -- this actually has one gem
        str1=math.mod(dataValue,10)+1;
        --User:inform("str1 "..str1);
        dataValue=dataValue-str1+1;
        --User:inform("new data: "..dataValue);
        stone1=math.floor(dataValue/10);
        return stone1, str1, 0, 0;
    elseif ((dataValue>1009) and (dataValue<10000)) then
        str1=math.mod(dataValue,10)+1;
        dataValue=dataValue-str1+1
        stone1=math.mod(dataValue,100)/10;
        dataValue=dataValue-stone1*10
        str2=math.mod(dataValue,1000)/100+1;
        stone2=math.floor(dataValue/1000);
        return stone1, str1, stone2, str2;
    end
    return 0,0,0,0;
end

function UseItemWithField( User, SourceItem, TargetPos, Counter, Param, ltstate )
    base.common.ResetInterruption( User, ltstate )
    if ( ltstate == Action.abort ) then -- Arbeit unterbrochen
        if (User:increaseAttrib("sex",0) == 0) then
            gText = "seine";
            eText = "his";
        else
            gText = "ihre";
            eText = "her";
        end
        User:talkLanguage(CCharacter.say, CPlayer.german, "#me unterbricht "..gText.." Arbeit.");
        User:talkLanguage(CCharacter.say, CPlayer.english,"#me interrupts "..eText.." work.");
        return
    end
    if (SourceItem.data==1) then
        base.common.InformNLS(User,"Die Angelschnur ist zerrissen.","The fishing line is broken.");
        return
    end
    if not base.common.CheckItem( User, SourceItem ) then -- Sicherheitscheck
        return
    end

    -- Angeln unterirdisch nicht möglich
    --
    if (TargetPos.z < 0) then
    	base.common.InformNLS(User,"In unterirdischen Wasserlöchern wird das Angeln kaum erfolgreich sein.","Fishing in underground waterholes wouldn't be successful.");
	return
    end

    if base.common.Encumbrence(User) then -- Durch Steife Rüstung behindert
        base.common.InformNLS( User,
        "Deine Rüstung behindert dich beim Fischen.",
        "Your armor disturbes you while fishing." );
        return
    end
    if ( SourceItem:getType() ~= 4 ) then
        base.common.InformNLS(User,
        "Du solltest eine Angel in der Hand haben, wenn du angeln willst.",
        "You should have a fishing rod in your hand, if you want to catch any fish.");
        return
    end
    if (world:getField(TargetPos):tile() ~= 6) then
        base.common.InformNLS(User,
        "Die Chance im Wasser einen Fisch zu fangen ist bedeutend höher als auf dem Land.",
        "The chance to catch a fish is much higher in the water than on the land.");
        return
    end

    if not base.common.IsLookingAt( User, TargetPos ) then
        base.common.TurnTo( User, TargetPos );
    end

    if ( ltstate == Action.none ) then -- Arbeit noch nicht begonnen -> Los gehts
        User:startAction( GenWorkTime(User, SourceItem), 0, 0, 0, 0);
        User:talkLanguage( CCharacter.say, CPlayer.german, "#me beginnt zu fischen.");
        User:talkLanguage( CCharacter.say, CPlayer.english, "#me starts fishing.");
        return
    end
    --rand=math.random(240);
    rand=math.random(2);  --changed from 600!

    if (rand==1) and base.treasure.createMap( User ) then
        base.common.InformNLS(User,
        "Statt eines Fisches hast du eine Karte am Haken hängen.",
        "Instead of a fish you find a map hanging on your hook.");
        return
    end

     if ((rand==2)or(rand==3)) then
         base.common.InformNLS(User,
             "Ein heftiger Ruck reißt dir fast die Angel aus der Hand. Noch während du dich wunderst teilt sich das Wasser vor dir und eine glitschige Wasserleiche steigt aus den Wellen empor.",
             "A heavy force pulls on your fishing rod. While you are wondering what it could be, the water in front of you ripples and a slimy mummy climbs out of the water.");

             world:createMonster(101,TargetPos,20);
             world:gfx(1,TargetPos);
             world:gfx(37,TargetPos);
             world:makeSound(1,TargetPos);
	     return
     end


--    if base.common.IsInterrupted( User ) then
--        base.common.InformNLS(User,
--        "Beinahe rutscht dir die Angel aus der Hand, aber dank eines schnellen Griffes kannst du sie festhalten.",
--        "The fishing rod nearly slips out of your hand, but with a fast grab you are able to keep it.");
--        return
--    end

    if base.common.ToolBreaks( User, SourceItem, true) then -- Angel beschädigen
        User:talkLanguage( CCharacter.say, CPlayer.german, "#me lässt die Angel aus den Händen rutschen und die Angel sinkt auf den Grund.");
        User:talkLanguage( CCharacter.say, CPlayer.english, "#me lets the fishing rod slip out of the hands and it sinks to the ground.");
        return
    end

    world:gfx(11,TargetPos);
    world:makeSound(9,TargetPos);
    local fishSkill=User:getSkill("fishing");
    gem1, str1, gem2, str2=getBonusFromTool(SourceItem);
    step=0;
    if gem1==3 then     -- ruby modifies skill!
        step=str1;
    end
    if gem2==3 then
        step=step+str2;
    end
    fishSkill=fishSkill+step;
    local FishTry=(User:increaseAttrib("perception",0)+(User:increaseAttrib("dexterity",0)/2)+(User:increaseAttrib("agility",0)/4))+RaceBon(User)+10+math.max(1,(fishSkill-10));
    FishTry=0;

    if (FishTry>math.random(0,100)) then
        local FTry=math.random(0,1000);
        -- Forelle
        if (FTry<660) then
            User:createItem(73,1,333,0)
        -- Lachs
        elseif (FTry>=660 and FTry<920) then
            User:createItem(355,1,333,0)
        -- Stiefel
        elseif (FTry>=920 and FTry<940) then
            User:createItem(53,1,100,0)
            base.common.InformNLS(User,"Ein alter, durchlöcherter Lederstiefel hängt am Haken.","An old, perforated leather boot hangs on your hook.");
        -- Öllampe
        elseif (FTry>=940 and FTry<990) then
            User:createItem(92,1,333,0);
            base.common.InformNLS(User,"Du ziehst eine glitzernde Öllampe aus dem Wasser. Wo die wohl herkommt...?","You pull a sparkling oil lamp out of the water. Where did that come from?");
        -- Eimer
        elseif (FTry>=990 and FTry<=1000) then
            User:createItem(51,1,333,0)
            base.common.InformNLS(User,"Ein Eimer verfängt sich in deiner Angelschnur. Den hat hier wohl jemand verloren.","A bucket gets caught in your fishing line. Someone must have lost a bucket here.");
        end
	User:learn(2,"fishing",2,100);
    else
        User:learn(2,"fishing",1,100);

    end


    if (math.random(180) == 0) then
        base.common.InformNLS(User,"Die Angelschnur zerreist.","The fishing line breaks.");
        SourceItem.data=1;
        world:changeItem(SourceItem);
    else
        User:startAction( GenWorkTime(User,SourceItem), 0, 0, 0, 0);
    end
end

function RaceBon(Char)
    local Race=Char:get_race();
    if (Race == 1) then --Zwerg
        return -7;
    elseif (Race == 5) then -- Echsenmensch
        return 5;
    else  -- alle anderen
        return 0;
    end
end

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
    if ((TargetItem.id==0) or (TargetItem==nil)) then
        UseItemWithField(User,SourceItem,base.common.GetFrontPosition(User),counter,param, ltstate);
    else
        UseItemWithField(User,SourceItem,TargetItem.pos,counter,param, ltstate);
    end
end

function LookAtItem( User, Item )
    world:itemInform( User, Item, base.lookat.GetItemDescription( User, Item, 2, false, false )..(Item.data==1 and base.common.GetNLS(User," mit gerissener Angelschnur"," with broken fishing line") or "" ));
end

-- Arbeitszeit Generieren
function GenWorkTime(User,toolItem)
    local Skill  = User:getSkill( "fishing" );
    local Attrib = User:increaseAttrib( "dexterity", 0 );

    gem1, str1, gem2, str2=getBonusFromTool(toolItem);
    step=0;
    if gem1==3 then     -- ruby modifies skill!
        step=str1;
    end
    if gem2==3 then
        step=step+str2;
    end
    Skill=Skill+step;
    step=0;
    if gem1==6 then     -- amethyst modifies time needed
        step=str1;
    end
    if gem2==6 then
        step=step+str2;
    end
    step=step*1.75;

    --return math.floor( (( -0.2 * (Skill+Attrib) + 50) + math.random(0,40))*(100-step)/100);
    return 10;
end

function dataFromCoo(posi)
    return 1048576*(500+posi.x)+1024*(500+posi.y)+(500+posi.z);
end

function findPosition(User)
    found=false;
    while found==false do
        x=math.random(-500,456);
        y=math.random(-500,274);
        newPos=position(x,y,0);
        if world:getField(newPos):tile()~=6 then
            found=true;
        end
    end
    return newPos;
end
