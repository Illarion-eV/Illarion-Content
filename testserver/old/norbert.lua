--Name:	       Norbert        
--Race:        Mensch
--Town:        Magische Akademie - Denkgarten
--Function:    Zahlenrätsel
--Position:    x=63 y=65 z=51
--Facing:      West
--Last Update: 16/06/2008
--Update by:   Kadiya

require("npc.base.functions")
require("npc.base.autonpcfunctions")
require("magic.base.basics");
module("npc.norbert", package.seeall)

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(Character.say, Player.german, "#me kuschelt sich an "..user.name.." an.");
    thisNPC:talkLanguage(Character.say, Player.english, "#me cuddles up to "..user.name..".");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.npc.base.functions.InitTalkLists()

    thisNPC:increaseSkill(1,"common language",100);
    
    -- ********* START DYNAMIC PART ********

    npc.base.autonpcfunctions.npc.base.functions.AddCycleText("","");
    npc.base.autonpcfunctions.npc.base.functions.AddCycleText("","");
    npc.base.autonpcfunctions.npc.base.functions.AddCycleText("","");

    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Gg]rü[sß]","Ich grüße euch.");
    npc.base.autonpcfunctions.npc.base.functions.AddAdditionalTrigger("[Hh]allo");
    npc.base.autonpcfunctions.npc.base.functions.AddAdditionalTrigger("[Gg]rue[sß]");
    npc.base.autonpcfunctions.npc.base.functions.AddAdditionalTrigger("[Tt]a[gc].*");
    npc.base.autonpcfunctions.npc.base.functions.AddAdditionalText("Seid gegrüßt!");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Aa]uf [Bb]ald","Auf bald und sichere Wege.");
    npc.base.autonpcfunctions.npc.base.functions.AddAdditionalTrigger("[Gg]ötter.+euch");
    npc.base.autonpcfunctions.npc.base.functions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npc.base.autonpcfunctions.npc.base.functions.AddAdditionalTrigger("[Uu]ff.+[Bb]ald");
    npc.base.autonpcfunctions.npc.base.functions.AddAdditionalTrigger("[Ff]ünf.+euch");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Ww]er [bs][ie][si][td] [di][uh].*","Ich bin "..thisNPC.name..": Ich lebe in der magischen Akademie und forsche hier im Fachgebiet der Beschwörungsmagie.");
    npc.base.autonpcfunctions.npc.base.functions.AddAdditionalTrigger("[Ww]ie.+[Nn]ame");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Hh]ilfe","Willst du trainieren? Wenn möchtest beschwöre ich dir auf dem Arenafeld eine Kreatur zum üben.");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Kk]reatur","Du möchtest eine Kreatur zum trainieren? Sag mir, ob du eine harmlose oder eine aggressive möchtest.");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Ss]tudent","Oh...Es tut mir leid, aber ich nehme keine Studenten an.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Ss]chüler","Ich unterrichte nicht.");
    npc.base.autonpcfunctions.AddCondition("lang","german");

    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Gg]reeting","Greetings to you!");
    npc.base.autonpcfunctions.npc.base.functions.AddAdditionalTrigger("[Hh]ello");
    npc.base.autonpcfunctions.npc.base.functions.AddAdditionalText("Greetings");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Gg]oodbye","Farewell.");
    npc.base.autonpcfunctions.npc.base.functions.AddAdditionalTrigger("[Bb]ye");
    npc.base.autonpcfunctions.npc.base.functions.AddAdditionalTrigger("[Ff]arewell");
    npc.base.autonpcfunctions.npc.base.functions.AddAdditionalTrigger("[Ff]ive.+you");
    npc.base.autonpcfunctions.npc.base.functions.AddAdditionalText("Goodbye");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Ww]ho.+you","I am "..thisNPC.name..". I live in the magic academy and research in department of summoning here.");
    npc.base.autonpcfunctions.npc.base.functions.AddAdditionalTrigger("[Ww]hat.+[Nn]ame");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Hh]elp","Have a training? If you want I summon a creature for you on the arena field.");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Cc]reature","Do you want a creature for training? Tell me, if you want a harmless or a aggressive creature.");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Ss]tudent","Oh...I'm sorry, but I take no students.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Pp]upil","I'm not a teacher.");
    
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Ww]hat.+buy","Thanks, but I already have everything I need.");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Ww]hat.+sell","I don't sell anything. Do I look like a merchant?");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("buy","I don't sell anything. Do I look like a merchant?");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("sell","Thanks, but I already have everything I need.");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Ww]as.+kaufst","Ich habe bereits alles, was ich brauche.");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Ww]as.+verkaufst","Ich verkaufe nichts. Sehe ich etwa aus wie ein Händler?");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Kk]aufen","Ich verkaufe nichts. Sehe ich etwa aus wie ein Händler?");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Vv]erkaufen","Danke nein, ich habe bereits alles, was ich brauche.");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Gg]obaith","This whole island group is called Gobiath. Nice place, the weather usually does not get too rough or too hot, I like it.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Gg]reenbriar","Greenbriar is a settlement of the Halflings.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Hh]arbo[u]+r","Troll's Bane and Vanima both have Harbors. The one southwest from Troll's Bane is bigger though but he is quite far away from the town.");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Hh]ellbriar","That was an evil dungeon near Greenbriar ! The evil cultists there sacrificed most of the halflings of Greenbriar.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Mm]agic [Aa]cademy","This is the magic academy of gobaith. Its just allowed for mages, students and guests to be here.");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Mm]age [Aa]cademy","This is the magic academy of gobaith. Its just allowed for mages, students and guests to be here.");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Nn]orthmark","Some Norodaj-Barbarians have settled in the north of Gobaith...they are a bit simple and have some fear of magic, because they can't understand it...better don't go there.");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Ss]ilverbrand","Silverbrand is the town of the dwarfes. They don't like elven, mages, fairys, and any other race except there own...in this order.");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Vv]anima","Tol Vanima is the \"Isle of the elven\"...a small island in the east of gobaith. You can reach it over the harbour or with one of the teleporters.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Tt]roll['s].+[Bb]ane","Well, that's the biggest town on Gobiath.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Vv]arshikar","You find it past the small sand desert in the far northwest. I would use the Teleporter, the desert is full of dangerous scorpions.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
--  
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Gg]obiath","Diese ganze Inselgruppe wird Gobiath genannt. Nette Gegend, das Wetter wird nicht zu kalt oder zu heiß, ich bin gerne hier.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Gg]reenbriar","Greenbriar is eine Halblingssiedlung im Süden Gobaiths.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Hh]afen","Troll's Bane und Vanima haben Häfen. Der Hafen südwestlich von Troll's Bane ist zwar größer aber auch sehr weit von der Stadt entfernt.");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Hh]ellbriar","Das war ein von einem barbarischen Kult besetzter Dungeon nahe bei Greenbriar. Die bösartigen Kultisten dort haben die meisten der Halblinge geopfert.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Mm]agierakademie","Dies hier ist die magische Akademie. Es ist nur Magiern, Studenten und ihren Gästen gestattet hier zu sein.");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Mm]agische [Aa]kademie","Dies hier ist die magische Akademie. Es ist nur Magierin, Studenten und ihren Gästen gestattet hier zu sein.");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Nn]ordmark","Einige Norodaj-Barbaren haben sich im Norden Gobaiths angesiedelt. Sie sind etwas einfältig und haben große Angst vor Magie...geh besser nicht dorthin.");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Ss]ilberbrand","Silberbrand ist die unterirdische Stadt der Zwerge. Sie mögen keine Elfen, keine Magier, keine Feen und auch sonst keine Rasse außer ihrer eigenen...");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Vv]anima","Tol Vanima ist die \"Insel der Elfen\"...eine kleine Insel im Osten von Gobaith. Du kannst sie über den Hafen oder mit einem Teleporter erreichen");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Tt]roll['s].+[Bb]ane","Tja, das ist die grösste Stadt auf Gobiath.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.npc.base.functions.AddTraderTrigger("[Vv]arshikar","Das findet man weit im Nordwesten hinter der kleinen Sandwüste. Ich würde den Teleporter benutzen, die Wüste ist voller gefährlicher Skorpione.");

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

end


function nextCycle()  -- ~10 times per second
    if ( TraderInit == nil) then
        TraderInit = {};
    end

    if (TraderInit[thisNPC.id] == nil) then
        initializeNpc();
        npc.base.autonpcfunctions.npc.base.functions.increaseLangSkill(TradSpeakLang);
        thisNPC.activeLanguage=TradStdLang;
        TraderInit[thisNPC.id] = true;
    end

    npc.base.autonpcfunctions.npc.base.functions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npc.base.autonpcfunctions.npc.base.functions.BasicNPCChecks(originator,2) then
        if (npc.base.autonpcfunctions.npc.base.functions.LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            result = SayRow(message, originator);
            -- if not result then result = getCreature(message, originator) end;
            if not result then npc.base.autonpcfunctions.npc.base.functions.TellSmallTalk(message,originator) end;
        else
    	    if (verwirrt==false) then
        	gText="#me sieht dich leicht verwirrt an";
        	eText="#me looks at you a little confused";
        	outText=npc.base.npcautofunction.npc.base.functions.GetNLS(originator,gText,eText);
        	npc.base.autonpcfunctions.npc.base.functions.NPCTalking(thisNPC,outText);
        	verwirrt=true;
    	    end
	end
    end
end


function SayRow(message, originator)
	if (string.find(message,"rätsel")~=nil) or (string.find(message,"riddle")~=nil) then
	one=math.random(1,30);
	two=math.random(1,10);
	type=math.random(1,2);

	
	getRow(one,two,type);
	
	thisNPC:talkLanguage( Character.say, Player.german, "One=>"..one..", two=>"..two.." und typ ist : "..type..". Das ergibt eine Reihe von: 1=> "..first..", 2=> "..second..", 3=> "..third..", 4=> "..fourth..", 5=> "..fifth..".");
        thisNPC:talkLanguage( Character.say, Player.english, "If I should summon a harmles creature for you, I get coppercoins. For a aggressive creature one I tak coppercoins.");
        return true
    end
    return false;
end

function getRow(one,two,type)
    if (type==1) then
        first=one*two;
        second=first*one;
	third=second*one;
        fourth=third*one;
        fifth=fourth*one;
    elseif (type==2) then
        first=one+two;
        second=first+one;
        third=second+one;
        fourth=third+one;
        fifth=fourth+one;
    end
    return first, second, third, fourth, fifth;
end





