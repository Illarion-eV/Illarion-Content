dofile("npc_functions.lua")

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(CCharacter.say, "Fasst mich nicht an!") end
    if (lang==1) then thisNPC:talk(CCharacter.say, "Don't you touch me!") end
end

function initializeNpc()
    npcs.base.autonpcfunctions.InitTalkLists()
    
    	npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]rü.+","Die Fünf mit euch. Ihr seht ratlos aus, braucht ihr Hilfe?");
	npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh]allo");
	npcs.base.autonpcfunctions.AddAdditionalTrigger("[Gg]uten Tag");	
	npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]ilfe","Nun, ich kann euch einiges erzählen über: Gobaith, die Städte, die Götter, die Rassen und die Sehenswürdigkeiten"); 
	npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]obaith","Gobaith ist die Insel auf der ihr euch befindet, es gibt einige Siedlungen hier und viele Orte die sehr sehenswert sind"); 
	npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ii]nsel");
	
npcs.base.autonpcfunctions.AddTraderTrigger("[Ss]tädte","Da gibt es einmal Trollsbane, Silberbrand, Varshikar, Greenbriar und natürlich Tol Vanima"); 
	npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ss]iedlungen");
	npcs.base.autonpcfunctions.AddTraderTrigger("[Ss]ilberbrand","Silberbrand ist die Stadt der Zwerge, verlasst die Stadt durch das Osttor und folgt der Straße nach Osten, der Weg ist beschildert.");
	npcs.base.autonpcfunctions.AddTraderTrigger("[Vv]arshikar","Varshikar ist eine kleinere Siedlung in den Bergen, geht durch das Osttor nach Osten und haltet euch auf dem Weg, passt auf Räuber, Fliegen und Skorpione auf");
	npcs.base.autonpcfunctions.AddTraderTrigger("[Rr]äuber","Wegelagerer die euch ohne zögern töten könnten! Sie lagern bekanntlich im Wäldchen zwischen Silberbrand und Varshikar und im und um den Nordwald herum.");
	npcs.base.autonpcfunctions.AddTraderTrigger("[Ss]korpione","Ihr Biss ist extrem giftig! Sie leben in der Wüste zwischen Silberbrand und Varshikar, seid vorsichtig wenn ihr sie sieht!");
	npcs.base.autonpcfunctions.AddTraderTrigger("[Ff]liegen","Eher lästige Biester, aber unterschätzt sie nicht! Ihr trefft sie am ehesten in der Nähe von Sümpfen.");
	npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]reenbriar","Eine Halblingssiedlung auf einer Insel südwestlich von hier. Verlasst die Stadt durch das Westtor und folgt der Straße und den Wegweisern ");
	npcs.base.autonpcfunctions.AddTraderTrigger("[Tt]ol.+[Vv]anima","Tol Vanima ist die Insel der Elfen. Ihr erreicht sie per Schiff vom Hafen aus. Es ist Unsitte dort Waffen zu tragen!");




	npcs.base.autonpcfunctions.AddTraderTrigger("[Oo]rte","Nun, Lake Adron, die Burg der Grauen, die drei Schwestern, das Druidenhaus, und der Hafen sind einige interessante Orte");
	npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ss]ehenswürdigkeiten");
	npcs.base.autonpcfunctions.AddAdditionalTrigger("[Pp]lätze");

	npcs.base.autonpcfunctions.AddTraderTrigger("[Ll]ake.+[Aa]dron","Der See hat seinen Namen vom Gott Adron und begrenzt Trollsbane im Osten, ein hübsches Plätzchen.");

	npcs.base.autonpcfunctions.AddTraderTrigger("[Bb]urg","Die Burg erhebt sich nördlich von Trollsbane und wacht über die umliegende Landschaft, ein beeindruckendes Bauwerk. ");

	npcs.base.autonpcfunctions.AddTraderTrigger("[Dd]rei.+[Ss]chwestern","Die drei Schwestern oder Inseln der Sirani sind Gobaith vorgelagert. Eine Fähre pendelt vom Hafen aus dort hin. Ein wirklich romantischer Ort...");

	npcs.base.autonpcfunctions.AddTraderTrigger("[Dd]ruidenhaus","");

	npcs.base.autonpcfunctions.AddTraderTrigger("[Tt]rollsbane","Trollsbane ist die älteste Menschensiedlung der Insel. Sie liegt sehr zentral und ist auch die größte Stadt. Ach ja, und ihr steht mitten in ihr, braucht ihr eine Stadtübersicht?");
	npcs.base.autonpcfunctions.AddTraderTrigger("[Ss]tadtübersicht","Es gibt viele Gebäude hier: Die Stadttore, das Seahorse Inn, die Taverne, die Bücherei, die Werkstatt, das Gefängnis, das Krankenhaus, der Laden");
	npcs.base.autonpcfunctions.AddTraderTrigger("[Ss]tadttore","Nun die Tore sind keine Gebäude an sich aber durch sie könnt ihr die Stadt verlassen, es gibt ein Nordtor, ein Osttor und ein Westtor");
	npcs.base.autonpcfunctions.AddTraderTrigger("[Ss]eahorse Inn","Wenn ihr eine bleibe sucht, seid ihr hier richtig! Es ist ein großes mehrstöckiges Haus am Westtor, gleich neben Lake Adron, ihr könnt es nicht verfehlen!");
	npcs.base.autonpcfunctions.AddTraderTrigger("[Tt]averne","Die Fluffy Sheep Taverne ist gleich auf der anderen Straßenseite dieses Gebäudes. Der Barkeeper ist ruppig, aber die Getränke sind gut und preiswert.");
	npcs.base.autonpcfunctions.AddTraderTrigger("[Bb]ücherei","Ihr befindet euch in der Bücherei. Dieser Schrein ist Elara, der"); --- noch schreiben
	npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]erkstatt","Die Werkstatt ist gleich östlich vom Seahorse Inn. In der Werkstatt findet ihr sperriges Werkzeug für manches Handwerk."); 
	npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]efängnis","Hofft dass ihr es nie von Innen sehen müsst! Es ist etwas westlich vom Nordtor.");
	npcs.base.autonpcfunctions.AddTraderTrigger("[Kk]rankenhaus","Das Krankenhaus liegt zwischen Taverne und Seahorse Inn. Dort könnt ihr Kräuter und Heiltränke erstehen und behandelt werden sollte ein Heiler präsent sein.");
	npcs.base.autonpcfunctions.AddTraderTrigger("[Ll]aden","Zum Laden kommt ihr wenn ihr der Straße draußen Richtung Osten folgt. Eliza verkauft Waffen, die anderen Händler Kleidung und Gemischtwaren.");

  
    
    	npcs.base.autonpcfunctions.AddCycleText("#me schaut sich um","#me looks around");
    	npcs.base.autonpcfunctions.AddCycleText("#me murmelt ein Gebet in sich hinein","#me murmurs a prayer towards himself");

    
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
        npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
        thisNPC.activeLanguage=TradStdLang;
    end
    npcs.base.autonpcfunctions.SpeakerCycle();
end	

function receiveText(texttype, message, originator)
    if npcs.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if (npcs.base.autonpcfunctions.LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            npcs.base.autonpcfunctions.TellSmallTalk(message);
        else
            if (verwirrt==false) then
                gText="#me sieht dich leicht verwirrt an";
                eText="#me looks at you a little confused";
                outText=npcs.base.npcautofunction.GetNLS(originator,gText,eText);
                thisNPC:talk(CCharacter.say,outText);
                verwirrt=true;
            end
        end
    end
end--function
