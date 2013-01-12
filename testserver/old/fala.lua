require("npc.base.functions")
module("npc.fala", package.seeall)

function useNPC(user)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(Character.say, "Fasst mich nicht an!") end
    if (lang==1) then thisNPC:talk(Character.say, "Don't you touch me!") end
end

function initializeNpc()
    npc.base.functions.InitTalkLists()
    
    	npc.base.functions.AddTraderTrigger("[Gg]rü.+","Die Fünf mit euch. Ihr seht ratlos aus, braucht ihr Hilfe?");
	npc.base.functions.AddAdditionalTrigger("[Hh]allo");
	npc.base.functions.AddAdditionalTrigger("[Gg]uten Tag");	
	npc.base.functions.AddTraderTrigger("[Hh]ilfe","Nun, ich kann euch einiges erzählen über: Gobaith, die Städte, die Götter, die Rassen und die Sehenswürdigkeiten"); 
	npc.base.functions.AddTraderTrigger("[Gg]obaith","Gobaith ist die Insel auf der ihr euch befindet, es gibt einige Siedlungen hier und viele Orte die sehr sehenswert sind"); 
	npc.base.functions.AddAdditionalTrigger("[Ii]nsel");
	
npc.base.functions.AddTraderTrigger("[Ss]tädte","Da gibt es einmal Trollsbane, Silberbrand, Varshikar, Greenbriar und natürlich Tol Vanima"); 
	npc.base.functions.AddAdditionalTrigger("[Ss]iedlungen");
	npc.base.functions.AddTraderTrigger("[Ss]ilberbrand","Silberbrand ist die Stadt der Zwerge, verlasst die Stadt durch das Osttor und folgt der Straße nach Osten, der Weg ist beschildert.");
	npc.base.functions.AddTraderTrigger("[Vv]arshikar","Varshikar ist eine kleinere Siedlung in den Bergen, geht durch das Osttor nach Osten und haltet euch auf dem Weg, passt auf Räuber, Fliegen und Skorpione auf");
	npc.base.functions.AddTraderTrigger("[Rr]äuber","Wegelagerer die euch ohne zögern töten könnten! Sie lagern bekanntlich im Wäldchen zwischen Silberbrand und Varshikar und im und um den Nordwald herum.");
	npc.base.functions.AddTraderTrigger("[Ss]korpione","Ihr Biss ist extrem giftig! Sie leben in der Wüste zwischen Silberbrand und Varshikar, seid vorsichtig wenn ihr sie sieht!");
	npc.base.functions.AddTraderTrigger("[Ff]liegen","Eher lästige Biester, aber unterschätzt sie nicht! Ihr trefft sie am ehesten in der Nähe von Sümpfen.");
	npc.base.functions.AddTraderTrigger("[Gg]reenbriar","Eine Halblingssiedlung auf einer Insel südwestlich von hier. Verlasst die Stadt durch das Westtor und folgt der Straße und den Wegweisern ");
	npc.base.functions.AddTraderTrigger("[Tt]ol.+[Vv]anima","Tol Vanima ist die Insel der Elfen. Ihr erreicht sie per Schiff vom Hafen aus. Es ist Unsitte dort Waffen zu tragen!");




	npc.base.functions.AddTraderTrigger("[Oo]rte","Nun, Lake Adron, die Burg der Grauen, die drei Schwestern, das Druidenhaus, und der Hafen sind einige interessante Orte");
	npc.base.functions.AddAdditionalTrigger("[Ss]ehenswürdigkeiten");
	npc.base.functions.AddAdditionalTrigger("[Pp]lätze");

	npc.base.functions.AddTraderTrigger("[Ll]ake.+[Aa]dron","Der See hat seinen Namen vom Gott Adron und begrenzt Trollsbane im Osten, ein hübsches Plätzchen.");

	npc.base.functions.AddTraderTrigger("[Bb]urg","Die Burg erhebt sich nördlich von Trollsbane und wacht über die umliegende Landschaft, ein beeindruckendes Bauwerk. ");

	npc.base.functions.AddTraderTrigger("[Dd]rei.+[Ss]chwestern","Die drei Schwestern oder Inseln der Sirani sind Gobaith vorgelagert. Eine Fähre pendelt vom Hafen aus dort hin. Ein wirklich romantischer Ort...");

	npc.base.functions.AddTraderTrigger("[Dd]ruidenhaus","");

	npc.base.functions.AddTraderTrigger("[Tt]rollsbane","Trollsbane ist die älteste Menschensiedlung der Insel. Sie liegt sehr zentral und ist auch die größte Stadt. Ach ja, und ihr steht mitten in ihr, braucht ihr eine Stadtübersicht?");
	npc.base.functions.AddTraderTrigger("[Ss]tadtübersicht","Es gibt viele Gebäude hier: Die Stadttore, das Seahorse Inn, die Taverne, die Bücherei, die Werkstatt, das Gefängnis, das Krankenhaus, der Laden");
	npc.base.functions.AddTraderTrigger("[Ss]tadttore","Nun die Tore sind keine Gebäude an sich aber durch sie könnt ihr die Stadt verlassen, es gibt ein Nordtor, ein Osttor und ein Westtor");
	npc.base.functions.AddTraderTrigger("[Ss]eahorse Inn","Wenn ihr eine bleibe sucht, seid ihr hier richtig! Es ist ein großes mehrstöckiges Haus am Westtor, gleich neben Lake Adron, ihr könnt es nicht verfehlen!");
	npc.base.functions.AddTraderTrigger("[Tt]averne","Die Fluffy Sheep Taverne ist gleich auf der anderen Straßenseite dieses Gebäudes. Der Barkeeper ist ruppig, aber die Getränke sind gut und preiswert.");
	npc.base.functions.AddTraderTrigger("[Bb]ücherei","Ihr befindet euch in der Bücherei. Dieser Schrein ist Elara, der"); --- noch schreiben
	npc.base.functions.AddTraderTrigger("[Ww]erkstatt","Die Werkstatt ist gleich östlich vom Seahorse Inn. In der Werkstatt findet ihr sperriges Werkzeug für manches Handwerk."); 
	npc.base.functions.AddTraderTrigger("[Gg]efängnis","Hofft dass ihr es nie von Innen sehen müsst! Es ist etwas westlich vom Nordtor.");
	npc.base.functions.AddTraderTrigger("[Kk]rankenhaus","Das Krankenhaus liegt zwischen Taverne und Seahorse Inn. Dort könnt ihr Kräuter und Heiltränke erstehen und behandelt werden sollte ein Heiler präsent sein.");
	npc.base.functions.AddTraderTrigger("[Ll]aden","Zum Laden kommt ihr wenn ihr der Straße draußen Richtung Osten folgt. Eliza verkauft Waffen, die anderen Händler Kleidung und Gemischtwaren.");

  
    
    	npc.base.functions.AddCycleText("#me schaut sich um","#me looks around");
    	npc.base.functions.AddCycleText("#me murmelt ein Gebet in sich hinein","#me murmurs a prayer towards himself");

    
    TradSpeakLang={0,1,4};  -- Sprache die der NPC spricht
    TradStdLang=0;          -- Sprache die der NPC normalerweise spricht
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
    if (TraderFirst == nil) then
        initializeNpc();
        npc.base.functions.increaseLangSkill(TradSpeakLang)
        thisNPC.activeLanguage=TradStdLang;
    end
    npc.base.functions.SpeakerCycle();
end	

function receiveText(texttype, message, originator)
    if npc.base.functions.BasicNPCChecks(originator,2) then
        if (npc.base.functions.LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            npc.base.functions.TellSmallTalk(message);
        else
            if (verwirrt==false) then
                gText="#me sieht dich leicht verwirrt an";
                eText="#me looks at you a little confused";
                outText=npc.base.functions.GetNLS(originator,gText,eText);
                thisNPC:talk(Character.say,outText);
                verwirrt=true;
            end
        end
    end
end--function
