--Name:        Rian Delarn
--Race:        Mensch
--Town:        Magische Akademie - Arena
--Function:    Kreaturen beschwören
--Position:    x=31 y=56 z=50
--Facing:      West
--Last Update: 12/06/2008
--Update by:   Kadiya

dofile("npc_functions.lua")
dofile("npc_autonpcfunctions.lua")
dofile("m_basics.lua");

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger wech oder du bist ein Kopf kürzer!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Dont ya' touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    InitTalkLists()

    thisNPC:increaseSkill(1,"common language",100);
    
    -- ********* START DYNAMIC PART ********

    AddCycleText("#me beobachtet schweigend die Arena.","#me watches silently the arena.");
    AddCycleText("#me setzt sich auf den Baumstamm und beginnt in einem kleinen Buch zu lesen.","#me sit down at the log and starts to read in a small book.");
    AddCycleText("#me geht, leise Formeln vor sich hermurmelnd, langsam ein Stück auf und ab.","#me walks, mumbling silent formulas, a short way.");

    AddTraderTrigger("[Gg]rü[sß]","Ich grüße euch.");
    AddAdditionalTrigger("[Hh]allo");
    AddAdditionalTrigger("[Gg]rue[sß]");
    AddAdditionalTrigger("[Tt]a[gc].*");
    AddAdditionalText("Seid gegrüßt!");
    AddTraderTrigger("[Aa]uf [Bb]ald","Auf bald und sichere Wege.");
    AddAdditionalTrigger("[Gg]ötter.+euch");
    AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    AddAdditionalTrigger("[Uu]ff.+[Bb]ald");
    AddAdditionalTrigger("[Ff]ünf.+euch");
    AddTraderTrigger("[Ww]er [bs][ie][si][td] [di][uh].*","Ich bin "..thisNPC.name..": Ich lebe in der magischen Akademie und forsche hier im Fachgebiet der Beschwörungsmagie.");
    AddAdditionalTrigger("[Ww]ie.+[Nn]ame");
    AddTraderTrigger("[Hh]ilfe","Willst du trainieren? Wenn möchtest beschwöre ich dir auf dem Arenafeld eine Kreatur zum üben.");
    AddTraderTrigger("[Kk]reatur","Du möchtest eine Kreatur zum trainieren? Sag mir, ob du eine harmlose oder eine aggressive möchtest.");
    AddTraderTrigger("[Ss]tudent","Oh...Es tut mir leid, aber ich nehme keine Studenten an.");
    AddCondition("lang","german");
    AddTraderTrigger("[Ss]chüler","Ich unterrichte nicht.");
    AddCondition("lang","german");

    AddTraderTrigger("[Gg]reeting","Greetings to you!");
    AddAdditionalTrigger("[Hh]ello");
    AddAdditionalText("Greetings");
    AddTraderTrigger("[Gg]oodbye","Farewell.");
    AddAdditionalTrigger("[Bb]ye");
    AddAdditionalTrigger("[Ff]arewell");
    AddAdditionalTrigger("[Ff]ive.+you");
    AddAdditionalText("Goodbye");
    AddTraderTrigger("[Ww]ho.+you","I am "..thisNPC.name..". I live in the magic academy and research in department of summoning here.");
    AddAdditionalTrigger("[Ww]hat.+[Nn]ame");
    AddTraderTrigger("[Hh]elp","Have a training? If you want I summon a creature for you on the arena field.");
    AddTraderTrigger("[Cc]reature","Do you want a creature for training? Tell me, if you want a harmless or a aggressive creature.");
    AddTraderTrigger("[Ss]tudent","Oh...I'm sorry, but I take no students.");
    AddCondition("lang","english");
    AddTraderTrigger("[Pp]upil","I'm not a teacher.");
    
    AddTraderTrigger("[Ww]hat.+buy","Thanks, but I already have everything I need.");
    AddTraderTrigger("[Ww]hat.+sell","I don't sell anything. Do I look like a merchant?");
    AddTraderTrigger("buy","I don't sell anything. Do I look like a merchant?");
    AddTraderTrigger("sell","Thanks, but I already have everything I need.");
    AddTraderTrigger("[Ww]as.+kaufst","Ich habe bereits alles, was ich brauche.");
    AddTraderTrigger("[Ww]as.+verkaufst","Ich verkaufe nichts. Sehe ich etwa aus wie ein Händler?");
    AddTraderTrigger("[Kk]aufen","Ich verkaufe nichts. Sehe ich etwa aus wie ein Händler?");
    AddTraderTrigger("[Vv]erkaufen","Danke nein, ich habe bereits alles, was ich brauche.");
    AddTraderTrigger("[Gg]obaith","This whole island group is called Gobiath. Nice place, the weather usually does not get too rough or too hot, I like it.");
    AddCondition("lang","english");
    AddTraderTrigger("[Gg]reenbriar","Greenbriar is a settlement of the Halflings.");
    AddCondition("lang","english");
    AddTraderTrigger("[Hh]arbo[u]+r","Troll's Bane and Vanima both have Harbors. The one southwest from Troll's Bane is bigger though but he is quite far away from the town.");
    AddTraderTrigger("[Hh]ellbriar","That was an evil dungeon near Greenbriar ! The evil cultists there sacrificed most of the halflings of Greenbriar.");
    AddCondition("lang","english");
    AddTraderTrigger("[Mm]agic [Aa]cademy","This is the magic academy of gobaith. Its just allowed for mages, students and guests to be here.");
    AddTraderTrigger("[Mm]age [Aa]cademy","This is the magic academy of gobaith. Its just allowed for mages, students and guests to be here.");
    AddTraderTrigger("[Nn]orthmark","Some Norodaj-Barbarians have settled in the north of Gobaith...they are a bit simple and have some fear of magic, because they can't understand it...better don't go there.");
    AddTraderTrigger("[Ss]ilverbrand","Silverbrand is the town of the dwarfes. They don't like elven, mages, fairys, and any other race except there own...in this order.");
    AddTraderTrigger("[Vv]anima","Tol Vanima is the \"Isle of the elven\"...a small island in the east of gobaith. You can reach it over the harbour or with one of the teleporters.");
    AddCondition("lang","english");
    AddTraderTrigger("[Tt]roll['s].+[Bb]ane","Well, that's the biggest town on Gobiath.");
    AddCondition("lang","english");
    AddTraderTrigger("[Vv]arshikar","You find it past the small sand desert in the far northwest. I would use the Teleporter, the desert is full of dangerous scorpions.");
    AddCondition("lang","english");
--  
    AddTraderTrigger("[Gg]obiath","Diese ganze Inselgruppe wird Gobiath genannt. Nette Gegend, das Wetter wird nicht zu kalt oder zu heiß, ich bin gerne hier.");
    AddCondition("lang","german");
    AddTraderTrigger("[Gg]reenbriar","Greenbriar is eine Halblingssiedlung im Süden Gobaiths.");
    AddCondition("lang","german");
    AddTraderTrigger("[Hh]afen","Troll's Bane und Vanima haben Häfen. Der Hafen südwestlich von Troll's Bane ist zwar größer aber auch sehr weit von der Stadt entfernt.");
    AddTraderTrigger("[Hh]ellbriar","Das war ein von einem barbarischen Kult besetzter Dungeon nahe bei Greenbriar. Die bösartigen Kultisten dort haben die meisten der Halblinge geopfert.");
    AddCondition("lang","german");
    AddTraderTrigger("[Mm]agierakademie","Dies hier ist die magische Akademie. Es ist nur Magiern, Studenten und ihren Gästen gestattet hier zu sein.");
    AddTraderTrigger("[Mm]agische [Aa]kademie","Dies hier ist die magische Akademie. Es ist nur Magierin, Studenten und ihren Gästen gestattet hier zu sein.");
    AddTraderTrigger("[Nn]ordmark","Einige Norodaj-Barbaren haben sich im Norden Gobaiths angesiedelt. Sie sind etwas einfältig und haben große Angst vor Magie...geh besser nicht dorthin.");
    AddTraderTrigger("[Ss]ilberbrand","Silberbrand ist die unterirdische Stadt der Zwerge. Sie mögen keine Elfen, keine Magier, keine Feen und auch sonst keine Rasse außer ihrer eigenen...");
    AddTraderTrigger("[Vv]anima","Tol Vanima ist die \"Insel der Elfen\"...eine kleine Insel im Osten von Gobaith. Du kannst sie über den Hafen oder mit einem Teleporter erreichen");
    AddCondition("lang","german");
    AddTraderTrigger("[Tt]roll['s].+[Bb]ane","Tja, das ist die grösste Stadt auf Gobiath.");
    AddCondition("lang","german");
    AddTraderTrigger("[Vv]arshikar","Das findet man weit im Nordwesten hinter der kleinen Sandwüste. Ich würde den Teleporter benutzen, die Wüste ist voller gefährlicher Skorpione.");

-- ********* END DYNAMIC PART ********


    TradSpeakLang={0,1,10};
    TradStdLang=0;
    --common language=0
    --human language=1
    --dwarf language=2
    --elf language=3
    --lizard language=4
    --orc language=5
    --halfling language=6
    --fairy language=7
    --gnome language=8
    --goblin language=9
    --ancient language=10

    PreisHarmlKrea = 30;
    PreisAggrKrea  = 50;

end


function nextCycle()  -- ~10 times per second
    if ( TraderInit == nil) then
        TraderInit = {};
    end

    if (TraderInit[thisNPC.id] == nil) then
        initializeNpc();
        increaseLangSkill(TradSpeakLang);
        thisNPC.activeLanguage=TradStdLang;
        TraderInit[thisNPC.id] = true;
    end

    if (CastAggr==nil) then CastAggr=0; end

    if (CastAggr~=0)then
    	if (Round==nil) then Round=1; end
	if (Round==1) then
	    world:gfx(21,position(31,56,50));
	    Round=Round+1;
	    if (CastAggr==1) then 
       		local Language=thisNPC.activeLanguage;
	    	thisNPC.activeLanguage=10;
	    	thisNPC:talk(CCharacter.say,"IRA TAUR LUK");
	    	thisNPC.activeLanguage=Language;
	        world:makeSound(1,position(26,57,50));
	        world:gfx(5,position(26,57,50));
	    	world:createMonster(111,position(26,57,50),10);
	    end
	    CastAggr=CastAggr-1;
	else
	    if (Round==10) then
	    	Round=1;
	    else
	    	Round=Round+1;
	    end
	end
    end
    if (CastHarml==nil) then CastHarml=0; end

    if (CastHarml~=0)then
        if (Round==nil) then Round=1; end
        if (Round==1) then
            world:gfx(21,position(31,56,50));
            Round=Round+1;
            if (CastHarml==1) then
                local Language=thisNPC.activeLanguage;
                thisNPC.activeLanguage=10;
                thisNPC:talk(CCharacter.say,"IRA TAUR LUK");
                thisNPC.activeLanguage=Language;
                world:makeSound(13,position(26,57,50));
                world:gfx(5,position(26,57,50));
	        world:createMonster(116,position(26,57,50),10);
	     end
             CastHarml=CastHarml-1;
        else
             if (Round==10) then
                 Round=1;
             else
                 Round=Round+1;
             end
	end
    end

    SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if BasicNPCChecks(originator,2) then
        if (LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            result = SayPrice(message, originator);
            if not result then result = getCreature(message, originator) end;
            if not result then TellSmallTalk(message,originator) end;
        else
    	    if (verwirrt==false) then
        	gText="#me sieht dich leicht verwirrt an";
        	eText="#me looks at you a little confused";
        	outText=GetNLS(originator,gText,eText);
        	NPCTalking(thisNPC,outText);
        	verwirrt=true;
    	    end
	end
    end
end


function SayPrice(message, originator)
	if (string.find(message,"koste")~=nil) or (string.find(message,"costs")~=nil) then
        thisNPC:talkLanguage( CCharacter.say, CPlayer.german, "Wenn ich dir eine harmlose Kreatur beschwören soll, bekomme ich "..PreisHarmlKrea.." Kupferstücke von dir. Für eine aggressive Kreatur möchte ich "..PreisAggrKrea.." Kupferstücke haben.");
        thisNPC:talkLanguage( CCharacter.say, CPlayer.english, "If I should summon a harmles creature for you, I get "..PreisHarmlKrea.." coppercoins. For a aggressive creature one I take "..PreisAggrKrea.." coppercoins.");
        return true
    end
    return false;
end


function getCreature (message, originator)
     message = string.lower( message );
     if (string.find(message,"harmlos.+kreatur.+beschwör")~=nil) 
     	or (string.find(message,"beschwör.+harmlos.+kreatur")~=nil)
	or (string.find(message,"ich möchte.+harmlos.+kreatur")~=nil)
     	or (string.find(message,"summon.+harmles.+creatur")~=nil)
     	or (string.find(message,"harmles.+creatur.+summon")~=nil) then
	GCoins,SCoins,CCoins = CalcSilverCopper(PreisHarmlKrea);
	if CheckMoney(originator,GCoins,SCoins,CCoins) then
	    Pay(originator,GCoins,SCoins,CCoins);

            thisNPC:talkLanguage( CCharacter.say, CPlayer.german, "#me nickt und richtet seine Konzentration ganz auf die Arena während er die mystische Formel spricht.");
            thisNPC:talkLanguage( CCharacter.say, CPlayer.english, "#me nods and starts to concentrate on the arena field while speaking the mystical formula.");

	    CastHarml=6;
            logStr=os.date()..": "..originator.name.." ask NPC Rian for a harmless creature\n";
            logToFile_npc(logStr);


	    -- thisNPC:talkLanguage( CCharacter.say, CPlayer.german, "Bitte sehr.");
	    -- thisNPC:talkLanguage( CCharacter.say, CPlayer.english, "Here we go.");
	else
            thisNPC:talkLanguage( CCharacter.say, CPlayer.german, "Du hast nicht genug Geld. Ich möchte "..PreisHarmlKrea.." Kupferstücke haben." );
            thisNPC:talkLanguage( CCharacter.say, CPlayer.english,"You don't have enough money. I get "..PreisHarmlKrea.." coppercoins." );
        end
	return true;
    elseif (string.find(message,"beschwör.+aggressiv.+kreatur")~=nil)
	or (string.find(message,"aggressiv.+kreatur.+beschwör")~=nil)
	or (string.find(message,"ich möchte.+aggressiv.+kreatur")~=nil)
	or (string.find(message,"summon.+aggressiv.+creatur")~=nil)
	or (string.find(message,"aggressiv.+creatur.+summon")~=nil) then
        GCoins,SCoins,CCoins = CalcSilverCopper(PreisAggrKrea);
        if CheckMoney(originator,GCoins,SCoins,CCoins) then
            Pay(originator,GCoins,SCoins,CCoins);

            thisNPC:talkLanguage( CCharacter.say, CPlayer.german, "#me nickt und richtet seine Konzentration ganz auf die Arena während er die mystische Formel spricht.");
	    thisNPC:talkLanguage( CCharacter.say, CPlayer.english, "#me nods and starts to concentrate on the arena field while speaking the mystical formula.");
	    
	    CastAggr=6;
            logStr=os.date()..": "..originator.name.." ask NPC Rian for a aggressive creature\n";
	    logToFile_npc(logStr);

            --thisNPC:talkLanguage( CCharacter.say, CPlayer.english, "Here we go.");
        else
            thisNPC:talkLanguage( CCharacter.say, CPlayer.german, "Du hast nicht genug Geld. Ich möchte "..PreisAggrKrea.." Kupferstücke haben." );
            thisNPC:talkLanguage( CCharacter.say, CPlayer.english,"You don't have enough money. I get "..PreisAggrKrea.." coppercoins." );
        end
        return true;
    end
    return false;
end

function CheckMoney(User,Gold,Silber,Kupfer)
    local UserGold=User:countItem(61);
    local UserSilber=User:countItem(3077);
    local UserKupfer=User:countItem(3076);
    local Amount=(Gold*10000)+(Silber*100)+Kupfer;
    local UserAmount=(UserGold*10000)+(UserSilber*100)+UserKupfer;
    if (Amount<=UserAmount) then
        return true
    else
        return false
    end
end

function Pay(User,Gold,Silber,Kupfer)
    local GoldID=61;
    local SilberID=3077;
    local KupferID=3076;
    local PayGold=0;
    local PaySilber=0;
    local PayKupfer=0;
    local MissGold=Gold;
    local MissSilber=Silber;
    local MissKupfer=Kupfer;
    local UserGold=User:countItem(GoldID);
    local UserSilber=User:countItem(SilberID);
    local UserKupfer=User:countItem(KupferID);
    local Amount=(Gold*10000)+(Silber*100)+Kupfer;
    local GoldAlsKupfer=0;
    local SilberAlsKupfer=0;
    local GoldAlsSilber=0;

    GoldAlsKupfer = math.min( MissGold, math.floor( UserKupfer/10000 ) );
    PayKupfer = GoldAlsKupfer * 10000;
    MissGold = MissGold - GoldAlsKupfer;
    UserKupfer = UserKupfer - PayKupfer;
    GoldAlsKupfer = math.floor( UserKupfer/100 );
    GoldAlsSilber = 100 - GoldAlsKupfer;
    if ((MissGold > 0) and (GoldAlsKupfer > 0) and (UserSilber >= GoldAlsSilber)) then
        PayKupfer = PayKupfer + 100 * GoldAlsKupfer;
        PaySilber = PaySilber + GoldAlsSilber;
        MissGold = MissGold - 1;
        UserKupfer = UserKupfer - 100 * GoldAlsKupfer;
        UserSilber = UserSilber - GoldAlsSilber;
    end;

    SilberAlsKupfer = math.min( MissSilber, math.floor( UserKupfer/100 ) );
    PayKupfer = PayKupfer + SilberAlsKupfer * 100;
    MissSilber = MissSilber - SilberAlsKupfer;
    UserKupfer = UserKupfer - SilberAlsKupfer * 100;

    if (UserKupfer >= MissKupfer) then
        PayKupfer = PayKupfer + MissKupfer;
    else
        MissSilber = MissSilber + 1;
        PayKupfer = PayKupfer + MissKupfer - 100;
    end;

    GoldAlsSilber = math.min( MissGold, math.floor( UserSilber/100 ) );
    PaySilber = PaySilber + GoldAlsSilber * 100;
    MissGold = MissGold - GoldAlsSilber;
    UserSilber = UserSilber - GoldAlsSilber * 100;

    if (UserSilber >= MissSilber) then
        PayGold = MissGold;
        PaySilber = PaySilber + MissSilber;
    else
        PayGold = MissGold + 1;
        PaySilber = PaySilber + MissSilber - 100;
    end;

    if (PayGold>0) then
        User:eraseItem(GoldID,PayGold);
    end

    if (PaySilber>0) then
        User:eraseItem(SilberID,PaySilber);
    elseif (PaySilber<0) then
        User:createItem(SilberID,PaySilber*(-1),333,0);
    end

    if (PayKupfer>0) then
        User:eraseItem(KupferID,PayKupfer);
    elseif (PayKupfer<0) then
        User:createItem(KupferID,PayKupfer*(-1),333,0);
    end
end


function CalcSilverCopper(CAmount)
    local GAmount=math.floor(CAmount/10000);
    local SAmount=math.floor((CAmount-GAmount*10000)/100);
    local CAmount=CAmount-(SAmount*100+GAmount*10000);
    return GAmount,SAmount,CAmount
end

function logToFile_npc(theString)
    coldLog,errMsg=io.open("/home/kadiya/ask_npc.txt","a");
    if (coldLog~=nil) then
        coldLog:write(theString);
        coldLog:close();
        return true;
    end
    return false;
end




