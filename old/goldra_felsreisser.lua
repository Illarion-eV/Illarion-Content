--[[name="Goldra Felsreisser"
position=112,-198,-3
sex=female 
race=dwarf
direction=south
radius=0
Task: Townguard at the workshop in Silverbrand
last updated: 24/02/2009 by Ardian
]]--
-- INSERT INTO npc VALUES (nextval('npc_seq'),1,112,-198,-3,4,false,'Goldra Felsreisser','npc_goldra_felsreisser.lua',1);
require("base.common")
require("npc.base.autonpcfunctions")
require("base.keys")
require("base.doors")
module("npc.goldra_felsreisser", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    
	user:talkLanguage(Character.say, Player.german, "#me packt sie an den Armen und schüttelt sie kräftig.");
    user:talkLanguage(Character.say, Player.english, "#me grabs her arms and shakes her forceful.");
    game1.reset();
	move.reset();
	
    thisNPC:talkLanguage(Character.say, Player.german, "Nimm deine Finger da wech!");
    thisNPC:talkLanguage(Character.say, Player.english, "Dont ya' touch me!");
    
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

	npc.base.autonpcfunctions.AddTraderTrigger("[Mm]ein.+[Nn]ame.+ist.*","Freut mich %CHARNAME, nenn mick Goldra, ick bin von der Bürgerwehr Silberbrands!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ii]c[hk].+bin.*");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Man.+nennt.+mich.*");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ii]c[hk].+hei[sß][se].*");
	npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddConsequence("state","=",1);
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Mm]y.+[Nn]ame.+is.*","A pleasure %CHARNAME, call me Goldra, I'm from the Militia of Silverbrand!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ii].+am.*");
	npc.base.autonpcfunctions.AddCondition("lang","english");
	npc.base.autonpcfunctions.AddConsequence("state","=",1);
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Gg]rü[sß]","Tach %CHARNAME, schön dich mal wieder hier zu treffen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]allo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]rue[sß]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Tt]a[gc].*");
    npc.base.autonpcfunctions.AddAdditionalText("Grüß dich %CHARNAME, schön dich mal wiederzusehen.");
	npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("[Aa]uf [Bb]ald","Irmorom mit dir.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]ötter.+euch");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Uu]ff.+[Bb]ald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ff]ünf.+euch");
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Gg]rü[sß]","Tach auch.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]allo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]rue[sß]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Tt]a[gc].*");
    npc.base.autonpcfunctions.AddAdditionalText("Grüß dich!");
    npc.base.autonpcfunctions.AddTraderTrigger("[Aa]uf [Bb]ald","Auf bald. Irmorom mit dir.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]ötter.+euch");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Uu]ff.+[Bb]ald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ff]ünf.+euch");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ww]er [bs][ie][si][td] [di][uh].*","Ick bin die "..thisNPC.name.." von der Bürgerwehr Silberbrands, jau! Ick bin Torwächterin. Und wer bist du?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ww]ie.+[Nn]ame");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]ilfe","Ick fürchte ick kann dir nich' helfen, muss hier Wache stehen. Frag am besten nen anderen Zwergen nach Hilfe.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("helfen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hilf");
    npc.base.autonpcfunctions.AddTraderTrigger("Where am [Ii]","You are in Silverbrand, the town of the dwarfes on Gobaith.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("qpg","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]o bin ich","Das hier ist Silberbrand, die Stadt der Zwerge auf Gobaith.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    
    
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]ow.+are.you","I am fine and how are ya'?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]ie.+gehts","Eigentlich ganz gut, danke der Nachfrage.");
    npc.base.autonpcfunctions.AddAdditionalText("Mir geht es gut und dir?");
	npc.base.autonpcfunctions.AddCondition("lang","german");  
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Gg]reeting","Be greeted %CHARNAME, nice to see ya here again.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]ello");
    npc.base.autonpcfunctions.AddAdditionalText("Greetings %CHARNAME, nice to see ya again");
	npc.base.autonpcfunctions.AddCondition("state","=",1);
	npc.base.autonpcfunctions.AddTraderTrigger("[Gg]reeting","Be greeted %CHARNAME, nice to see ya here again.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Hh]ello");
    npc.base.autonpcfunctions.AddAdditionalText("Greetings %CHARNAME, nice to see ya again");
	npc.base.autonpcfunctions.AddTraderTrigger("[Gg]oodbye","Farewell. Irmorom with ya.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Bb]ye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ff]arewell");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ff]ive.+you");
    npc.base.autonpcfunctions.AddAdditionalText("Goodbye");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]ho.+you","I am "..thisNPC.name..", from the militia of Silverbrand, aye! I guard the gates and who are ya'?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ww]hat.+[Nn]ame");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]elp"," I'm afraid that I can't help ya much, I have to keep watching here. Better ask another dwarf here like Garabosch over there for help.");


    npc.base.autonpcfunctions.AddTraderTrigger("buy","I don't sell anything, as you see I'm a guard.");
    npc.base.autonpcfunctions.AddTraderTrigger("sell","Thanks, but I already have everything I need.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+buy","Thanks, but I already have everything I need.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+sell","I don't sell anything, as you see I'm a guard.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Kk]aufen","Ick verkauf' nichts, wie du siehst bin ick Torwächterin!");
    npc.base.autonpcfunctions.AddTraderTrigger("[Vv]erkaufen","Nay danke, ick hab' bereits alles was ick brauche.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+kauf","Nay danke, ick hab' bereits alles was ick brauche.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+verkauf","Ick verkauf' nichts, wie du siehst bin ick Torwächterin!");
    
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]reenbriar","Greenbriar is a settlement of the Halflings.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]arbo[u]+r","Troll's Bane and Vanima both have Harbors. The one southwest from Troll's Bane is bigger though.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]ellbriar","That was an evil dungeon near Greenbriar ! The evil Cultists there sacrificed most of the Halflings of Greenbriar.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Mm]agic [Aa]cademy","You don't want ta go THERE ! It can only be entered by a mage, they say. They turn people into pigs or cows or worse things there!");
    npc.base.autonpcfunctions.AddTraderTrigger("[Mm]age [Aa]cademy","You don't want ta go THERE ! It can only be entered by a mage, they say. They turn people into pigs or cows or worse things there!");
    npc.base.autonpcfunctions.AddTraderTrigger("[Nn]orthmark","it's not cooler there than elsewhere on Gobiath, except for the north wind in winter. Some Norodaj-Barbarians have settled there.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ss]ilverbrand","Silverbrand is the name of this town, its the town of the dwarfes.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Vv]anima","Tol Vanima ? That's a whole small island full of trees and elves.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Tt]roll['s].+[Bb]ane","Well, that's the biggest town on Gobiath.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Vv]arshikar","You find it past the small sand desert in the far northwest. I would use the Teleporter, the desert is full of scorpions.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    --  
    npc.base.autonpcfunctions.AddTraderTrigger("[Gg]reenbriar","Greenbriar is nen Halblingsdorf. Viel zu grün da wennste mich fragst.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]afen","Troll's Bane und Vanima haben Häfen. Der Hafen südwestlich von Troll's Bane is aber größer.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Hh]ellbriar","Das war ein von einem barbarischen Kult besetzter Dungeon nahe bei Greenbriar. Die bösartigen Kultisten dort haben die meisten der armen Halblinge geopfert.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Mm]agierakademie","Du willst nicht wirklich DA hin ! Es wird gesagt, den Ort kann nur ein Magier betreten. Die verwandeln dort Leute in Schweine, Kühe oder schlimmeres !");
    npc.base.autonpcfunctions.AddTraderTrigger("[Nn]ordmark","Es ist da nicht kälter als anderswo auf Gobiath, abgesehen vom Nordwind im Winter. Dort haben sich einige Norodaj-Barbaren angesiedelt.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ss]ilberbrand","Silberbrand ist der Name dieser Stadt hier, es ist die Stadt der Zwerge.");
    npc.base.autonpcfunctions.AddTraderTrigger("[Vv]anima","Tol Vanima ? Das ist eine ganze kleine Insel voller Bäume und Elfen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Tt]roll['s].+[Bb]ane","Tja, das ist die grösste Stadt auf Gobiath. Dort leben alle Rassen, sogar ein zwei Zwerge. Aber früher oder später kommen sie alle hierher.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Vv]arshikar","Das findet man nicht ganz so weit von hier im Nordwesten hinter der kleinen Sandwüste. Ich würde den Teleporter benutzen, die Wüste ist voller Skorpione.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ii]rmorom","The Lord of trade and craftsmenship ! He is the main god of the dwarves. Some call him the smith of the world.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ii]rmorom","Der Herr des Handels und des Handwerks ! Er ist der Hauptgott des Zwergenvolkes. Manche nennen ihn auch den Weltenschmied.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	--
	--Citizens
    npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Bb]oindil.*","#me grummelt 'Arrr, das is der Zwerg, der mir einst diesen Wisch von Abschiedsbrief in die Hand gedrückt hat und dann 'uff nimmer wiedersehn abgehaun' is! Früher...da war er noch schwer in Ordnung, nu weiß ick aber nich was in ihn gefahren is.");
    npc.base.autonpcfunctions.AddCondition("lang","german");   
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Bb]rendil.*","Mhh... von Brendil hab mir nur Geschichten gehört. Soll 'n starker Kämpfer gewesen sein - aber mit schwachem Geist. Soll irgendwann verrückt gewordn sein, wenn mir nich alles täuscht.");
    npc.base.autonpcfunctions.AddCondition("lang","german");   
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Gg]loin.*","#me kratzt sich kurz nachdenklich an ihrer Schläfe \"Glôin... diesn Namen hab mir schon mal gehört... is dat nicht Brendil, dieser Taugenüscht?\"");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ee]rz[äa][eh].+[Gg]lôin.*");
	npc.base.autonpcfunctions.AddCondition("lang","german");    
    npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Gg]horn.*","Was redest du von König Ghorn? Er war n' weiser und gerechter König! Ick glaub gehört zu haben, dass der die Gewölbe entdeckte, die Silberbrand mit der Menschenstadt verband. Bin mir da aber nich sicher.");
    npc.base.autonpcfunctions.AddCondition("lang","german");   
    npc.base.autonpcfunctions.AddTraderTrigger("[Tt]unnel.*","Da war mal n' starkes Beben in den Erzminen. Wir dachten schon der ganze Berg würd' einbrechen, so stark war das! Aber durch det Beben wurde ein Tunnel frei gelegt - was damit heut' is, weiß mir nicht.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Gg]ew[öo][le][bl][eb].*");
	npc.base.autonpcfunctions.AddCondition("lang","german");   
    npc.base.autonpcfunctions.AddTraderTrigger("[Rr]othman.*","#me haut verärgert mit der Faust gegen die Felswand \"Hör mir 'uff mit diesem Namen! Jeder dieser Rothmans hat es verdient geteert und gefedert und dann vom höchsten Gipfel diese Berges gestürzt zu werdn. Das Geräusch vom Aufprall wär' wie Musik in meen Ohr!\"");
    npc.base.autonpcfunctions.AddCondition("lang","german");   
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Rr]imni.*","Och, der Rimni... auch so 'n Faulpelz! Macht viel, aber nüscht richtich! Abgesehn von senen leckren Broten! Arrr, wie von Irmorom selbst gebacken, so schmecken die!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Ss]asse.*","#me blinzelt freudig \"Arr, wo is Sasse? Gibs was zu futtern? Kein andrer kann so leckren Rehberaten zubereiten, wie der!\"");
    npc.base.autonpcfunctions.AddCondition("lang","german"); 
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Aa]ndril.*","#me senkt bedächtig den Kopf \"Mögest du in Frieden Ruhn, Andril! Dein leckes Zwergenbräu fehlt uns in der Kehle. Deine Bedachtheit und Weisheit würd uns in so mancher finstren Stunden helfen.\"");
    npc.base.autonpcfunctions.AddCondition("lang","german");    
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Gg]oldhand.*","Arrr, so ein stattlicher Zwerg, der Garon! Hat ganz schön viel erreicht, richteste ihm mal schöne Grüße von der Goldra aus? *sie zwinkert dir zu*");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ee]rz[äa][eh].+[Gg]aron.*");
	npc.base.autonpcfunctions.AddCondition("lang","german");    
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Ff]riedwulfa.*","Die Friedel weiß noch wie man zupackt! Sie und mir sind ausm selben Stein gehaun! Legt sich jemand mit ihr an, hat ers auch mit mir zu tun! Und das rat ick keinem!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ee]rz[äa][eh].+[Ff]ried[el].*");
	npc.base.autonpcfunctions.AddCondition("lang","german");    
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Gg]uran.*","Sprichst grad vom Meisterschmied Guran? Wennst ne dicke, starke Rüstung brauchst ist er dein Zwerg *klopft gegen ihre Rüstung unter der Robe* das gute Stück hier ist auch von ihm.");
    npc.base.autonpcfunctions.AddCondition("lang","german");    
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Tt]horwald.*","Selten zuvor hab mir sonen fleissigen Zwegenkönich gesehn, wie ihn! Egal wat du brauchtest, egal in welchen Mengen: Er hatte et uff Lager!");
    npc.base.autonpcfunctions.AddCondition("lang","german");	
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Tt]horgrimm.*","Thorgrimm? Arr... den seh ick hier so selten wie das Sonnenlicht! Ick glob der hockt tagein, tagaus in seiner Priesterkammer und redet zu Irmorom - hoffentlich schwafelt er dabei net zu viel, sonst wird Irmorom noch grantig.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Ss]urian.*","Mit Thorgrimm und Surian is das Schicksal der Götter uff jeden Fall auf unsrer Seite! ...wobei Bragon ja eher ein Kieselstein im Vergleich zu Irmorom ist, natürlich.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Ii]var.*","Ivar hat nich nur Kraft im Arm, sondern auch Hummeln im Hintern! So viel wie der schuftet, geht ja in keinen Zwergenbart. Da könnt sich so manch andrer Zwerg ne Scheibe oder zwei von abschneidn!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger("[Mm]agdha.*","Was is mit Magdha? Du findest sie schöner als mir? Arrr... ick gebs zu... sie hat größere Steine vor der Hütte, aber im Kampf hatse noch nie gegen mir gewonnen! *zwinkert dir zu*");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Tt]hurbert.*","Der Thurbert, ja dat war ein tüchtiger Zwerg. Als Kanzler war er 'n guter Organisator und konnte sogar mit'm Kroppzeug von oben gut reden, doch leider meinte es dat Schicksal nich gut mit ihm. Kurz nach seiner späteren Krönung  zum König erstickte er an nem Steak, Gerüchte besagen dass sein Leibkoch Salfalur damit was zu tun hatte.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Tt]irana.*","Na die Tirana hat das Herz am rechten Fleck, an der Kochstelle. Der ihr Futter ist das Allerbeste, nur noch übertroffen von ihr'm Gebräu, vor allem det Bier.");
    npc.base.autonpcfunctions.AddCondition("lang","german");    
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Ff]erin.*","Tja, über Ferin, den Bruder Altkönig Thorwalds kann ich nich viel sagen. Zu selten bekam man ihn zu Gesicht aber wenn er da war, dann richtig und für alle!");
    npc.base.autonpcfunctions.AddCondition("lang","german"); 
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Tt]hanseus.*","Er is'n junger un' ungeduldiger Bruder, nen bissl grün hinter den Ohren is er auch. Aber ein Zwerg sollte wie er einer sein, immer gemeinschaftlich und hilfsbereit.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Bb]alduin.*","Der Balduin, jau, nen fleißiger angehender Goldschmied. Hat schon beim ein oder andern' Auftrag wat mitgearbeitet. Ganz am Anfang war er noch Bürger von Trollsbane als er sein' Eid abgelegt hat. Heut' aber nimmer.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Tt]rokamm.*","Der ist ziemlich launisch, der Trokamm. Manchmal strengt er sich richtich an bei der Arbeit dann liegt er nur mehr auffer faulen Haut. Er war wo er herkommt mal König, behauptet er immer.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Bb]althor.*","Der Balthor gehört zu den Meisterschmieden Silberbrands, ich hab mal gehört dass er 'Balthor Pinnhand' heißt weil er mal in ner' Taverne die anbot \"Zahl 30 Münzen und fülle deinen Krug so oft du willst\" selbige Taverne fast bankrottgesoffen hat. Als er unter Protest den Krug abgeben sollte hat er ihn sich einfach an die Hand ge-pinnt");
    npc.base.autonpcfunctions.AddCondition("lang","german");
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Aa]mrothar.*","Amrothar, ja klar, der is'n alter Schürfer. Ist unser Kanzler und hat mal Silberbrand geführt als Friedl ne Weile weg war.");
    npc.base.autonpcfunctions.AddCondition("lang","german");  
	
	npc.base.autonpcfunctions.AddTraderTrigger("[Ee]rz[äa][eh].+[Mm]anron.*","Der Manron ist einer der Altkönige, wenn er mal nich am Goldschmieden ist, dann ist er in den Minen schürfen - so wie es sich für nen Zwergen gehört!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ee]rz[äa][eh].+[Kk][öo][ne][in][gi].*");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Ee]rz[äa][eh].+[Kk][öo][ne][in][ci][hc].*");  
	--
	
    npc.base.autonpcfunctions.AddTraderTrigger("[Bb]ier.*","#me hebt den Krug und prostet in die Runde 'Wer viel rumsteht, muss viel trinken - Alte Torwächterweisheit!'");
    npc.base.autonpcfunctions.AddCondition("lang","german"); 
    npc.base.autonpcfunctions.AddTraderTrigger("[Tt]orwächter.*","Jetzt fang bloß nich damit an, über meine Aufgabe zu meckern! Ohne uns und dat Tor wär Silberbrand schon ein dutzend Mal eingenommen worden!");
    npc.base.autonpcfunctions.AddCondition("lang","german");  
    npc.base.autonpcfunctions.AddTraderTrigger("[Tt]or.*","Aye, jeden Tag und jede Stund' steh ick da draussen am Tor - haste gewusst, dass da mindestens fuffzich Bäume drin verbaut sind? Von den Mengen an Nägeln ganz zu schweigen, aber schlussendlich ists n' Meisterstück geworden.");
    npc.base.autonpcfunctions.AddCondition("lang","german"); 
	npc.base.autonpcfunctions.AddTraderTrigger("[Dd]unkel.*","Wie? Du findest es dunkel hier? Dann schneid' dir mal die Haare und mach die Augen richtig uff'! Du meckerst ja fast so viel wie Trokamm, wenn er mal wieder zum Training muss!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("[Dd]üster.*");   
    
    if not InitDone then
        InitDone = true;
        
        itemlist = {320}--,10,232,233,321,914,915,1245,1246,1247,1250,1251,1554,1557,1273,1276,1278};                 --hier IDs der nichtpassierbaren Items eintragen!
		game1=drinkGame(); 				  --spielfunktion initialisieren
		
		if (thisNPC.pos.y>=-199) then
		NpcOutside=true;
		else
		    NpcOutside=false;
		end
		
		joke=false;
		doorapos=position( 110, -200, -3);
		doorbpos=position( 111, -200, -3);
		kingid=956233928;
		boindil=2082906332;
		debug=false;
		move=moveFunction(doorapos,doorbpos,itemlist); --Gehen initialisieren
		jokelist_de={};
		jokelist_en={};
        initJoke();
	end

    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,2};
    TradStdLang=0;

    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

    
end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npc.base.autonpcfunctions.SpeakerCycle();

	if (not NpcOutside and game1.rundenzahl()==0) then	
		if not move.status() then
			if joke then
				if wait(9) then
					tellJoke(); --tells a joke
					joke=false;
				end
			end
			rand=math.random(20000);
			if not joke then
				if(rand<=2) then
					thisNPC:talkLanguage(Character.say,Player.german,"#me schwankt leicht auf ihrem Hocker und muss grinsen \"Kennste den schon"..hicks().."...?\"");
            		joke=true;
        			initJoke();
				elseif (rand==100) then
					thisNPC:talkLanguage(Character.say,Player.german,"#me erhebt sich \"Ach, ick sollt wieder an mein' Posten, bis später!\"");
	           	    thisNPC:talkLanguage(Character.say,Player.english,"#me stands up \"Hrm, I really should go back to my place, see ya' later!\"");
					move.moveWithoutCommand(4);
				elseif (rand>3 and rand<=4) then
					thisNPC:talkLanguage(Character.say,Player.german,"#me klimpert mit einem Becher voller Münzen \"Kommt und spielt dat Trinkspiel mit mir wenn ihr euch traut.\"");
	           	    thisNPC:talkLanguage(Character.say,Player.english,"#me jingles with a mug full of coins \"Come and play with me the drinking game if ya' dare.\"");	
				elseif(rand>=10 and rand<=12) then
					drinkBeer();
				elseif(rand==13) then
					thisNPC:talkLanguage(Character.say,Player.german,"Na, will jemand etwas über einen der Bürger Silberbrands wissen? Ich kenn sie alle, jau, fragt mich nur über wen ick wat erzähln' soll, jau! ");
				end
			end
		end
 	elseif NpcOutside then
		if (math.random(6000)==1) then
			rand=math.random(6);
			if (rand==1) then
				doora=world:getItemOnField(	doorapos);
		        doorb=world:getItemOnField(doorbpos);
				if (doora.id==652 and doorb.id==656) then
				   	thisNPC:talkLanguage(Character.say,Player.german,"#me geht vor die Tore und rüttelt an ihnen \"Aye,"..hicks().."is zu!\"");
           	       	thisNPC:talkLanguage(Character.say,Player.english,"#me steps infront of the gate and juggles it \"Aye,"..hicks().."it's closed!\"");
				end
			elseif (rand==2) then
				move.moveWithoutCommand(3); --get inside and close the gates
			else
				thisNPC:talkLanguage(Character.say,Player.german,"#me lehnt sich auf ihre Axt und lässt einen prüfenden Blick durch die Halle schweifen.");
           	    thisNPC:talkLanguage(Character.say,Player.english,"#me leans on her axe and looks vetting through the hall.");
           	end
        end
 	end
    move.nextCycle(); --move Function
	game1.nextCycle();--game Function
end

function receiveText(texttype, message, originator)
		if (thisNPC.pos.y>=-199) then
				NpcOutside=true;
		else
				NpcOutside=false;
		end
	if string.find(message,"[Rr]eset.+[Gg]ame")~=nil then
		game1.reset();
		originator:inform("Game reset");
	elseif string.find(message,"[Rr]eset.+[Mm]ove")~=nil then
		move.reset();
		originator:inform("Move reset");
	end
	if npc.base.autonpcfunctions.BasicNPCChecks(originator,2) then  --Npc wird aus nächster Nähe angesprochen
	
        if npc.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
			if (mainTask(message,originator)~=true) then
				if (string.find(message,"[Ww]em.+hast.+du.+zuletzt.+aufgemacht.*")~=nil or 
					string.find(message,"[Ww]ho.+did.+you.+open.+last.+time.+the.+gate.*")~=nil) then
					if (originator.id==kingid) then
						if (last_User~=nil) then
							gText="Dem dem ick zuletzt aufjemacht hab"..hicks().."war '"..last_User.."', jau!";
							eText="The one who I opened last time the door"..hicks().."was '"..last_User.."', aye!";
						else
							gText="Tut mir leid, hab ick"..hicks().."schon vergessen.";
							eText="I am sorry, I have forgotten who I opened last time the gate.";
						end
					else
						gText="Das verrat' ick dir doch nich!";
						eText="I won't tell that to you!";
					end
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);

				elseif (string.find(message,"[Ee]rz[äa][eh][l].+[Ww]itz.*")~=nil or string.find(message,"[Tt]ell.+[Jj]oke.*")~=nil) then
					tellJoke(); --tells a joke
				else	
					game1.receiveText(texttype, message, originator,move.status(),NpcOutside);
					npc.base.autonpcfunctions.TellSmallTalk(message,originator);
				end 
		 	end
		else
        	npc.base.autonpcfunctions.Confused(
            "#me sieht dich leicht verwirrt an",
            "#me looks at you a little confused"
            );
		end
	
	
	elseif npc.base.autonpcfunctions.BasicNPCChecks(originator,10) then --Npc wird aus mehreren Schritten Entfernung angesprochen		
		mainTask(message,originator);
	end
end








-----------NEBENFUNKTIONEN:---------------------------

--[[
    mainTask
    This function checks if the Char said the mean triggers(open door, close door,...) and sets all needed variables to open/close door
    @param originator - CharStruct - the Char who talked to the NPC
    @param message - String - The text the Character spoke
    
    @return true in case the NPC said one of the mean triggers else false
]]
function mainTask(message, originator)
	if (originator.activeLanguage==2 or originator:isAdmin()==true) then --If the Character speaks dwarfish then...
		if (standardAnswer(message,1)==true) then  
			
			if (math.random(0,200)==1) then --Chance of 1 to 199 not to open the door
				keinBock(originator);
			elseif (originator.id==boindil) then
				if (math.random(0,5)==1) then
					gText="Nahh.. Boindil, bäähh.. Zurück zur Oberfläche mit dir, Mistkerl!";
        			eText="Nahh.. Boindil, baahh.. Go back to the surface, scumbag!";
				else
					gText="Verschwinde Boindil, du hast's mit uns endgültig verscherzt!";
        			eText="Back off Boindil, your beard is no longer welcome here!";
				end
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			
			else

		        doora=world:getItemOnField(doorapos);
		        doorb=world:getItemOnField(doorbpos);
		        if (doora.id==684 or doorb.id==668) then --If one of the doors is already opened then...
					gText="Dat Tor steht doch"..hicks().."eh offen!";
                	eText="The gate is already"..hicks().."opened.";
                	outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        	npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				
				else
					if (not move.status()) and (game1.rundenzahl()==0) then
						move.receiveText(originator,1); --Open gate
						if (originator.id~=kingid) then
							last_User= originator.name;
						end

						if (originator.pos.y>doorapos.y) then --The char. has to stand outside of the doors to get greeted
							if (originator.id==956233928) then --Char. Friedwulfa
								gText="Willkommmen zurück Eure Majestät"..hicks()..", heut schon wen verkloppt?";
								eText="Welcome back your majesty,"..hicks().."anyone beated today?";
							elseif (originator.id==867463423) then --Char. Manron
								gText="Willkommen zurück"..hicks().." Manron.";
								eText="Welcome back Manron.";
							elseif (originator.id==1322717830) then --Char. Thorgrimm
								gText="Willkommen zurück Hohepriester Thorgrimm.";
								eText="Welcome back Highpriest Thorgrimm.";
							elseif (originator.id==1245724712) then --Char Thanseus
								gText="Grüß dich "..hicks().." Thanseus. Komm nur rein"..hicks()..", ich freu mich immer wieder dich zu sehen.";
								eText="Be greeted Thanseus. Just get in, I'm always glad to see you.";
							elseif (originator.id==825680180) then --Char. Tirana
								gText="Tach Tirana,"..hicks().."freut mick dat du wieder da bist, bringste"..hicks().."mir gleich ne Fleischplatte vorbei?";
								eText="Greets Tirana, good to have you back, can you bring"..hicks().."me a plate with some meat?";
							elseif (originator.id==1608149008) then --Char Ivar
								gText="Tach Ivar, endlich mal wer ordentliches. Bringste mir"..hicks().."später ein' oder zwei Krüge Bier vorbei?";
								eText="Hello Ivar, finally a duly one. Can you bring me later some beer?";
							elseif (originator.id==1089492350) then --Amrothar Eisenbein
								gText="Grüß dich Amrothar, wie wär's mit nem Training später?";
								eText="Greetings Amrothar, do ya' want to train with me a bit later?";
							else --Unknown Dwarf

								if (originator:increaseAttrib( "sex",0) == 0) then --Char. is male
									gText="Willkommen in "..hicks().."Silberbrand, Bruder.";
									eText="Welcome in"..hicks().."Silverbrand Brother.";
								else                                                                                       
							    	gText="Willkommen in Silberbrand,"..hicks().."Schwester.";
	                				eText="Welcome in"..hicks().."Silverbrand Sister.";
								end
							end
	                			outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
			        			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
						end
					elseif (not move.status()) and (game1.rundenzahl()~=0) then
						gText="Nay, jetzt nich, bin grad dabei ne Münze zu gewinnen!";
						eText="Nay, not now, I have a coin to win!";
	                	outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
			        	npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);	
					end
				end
			end
				return true; 
				   
		elseif (standardAnswer(message,2)==true) then
			
			if ( world:isCharacterOnField(doorapos) or world:isCharacterOnField(doorbpos)) then -- Is a char. on the position of the doors?
				gText="Ick kann det Tor nich zumachen weil "..hicks().."jemand im Weg steht.";
                eText="I can't close the gate"..hicks().."during someone stands in the way.";
                outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);			
			elseif (originator.id==boindil) then
				
				if (math.random(0,5)==1) then
					gText="Nahh.. Boindil, bäähh.. Zurück zur Oberfläche"..hicks().."mit dir, Mistkerl!";
        			eText="Nahh.. Boindil, baahh.. Go back to"..hicks().."the surface, scumbag!";
				else
					gText="Verschwinde"..hicks().."Boindil, du hast's mit uns"..hicks().."endgültig verscherzt!";
        			eText="Back off Boindil,"..hicks().."your beard is no longer welcome here!";
				end
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			else
				doora=world:getItemOnField(	doorapos);
		        doorb=world:getItemOnField(doorbpos);
					if (doora.id==652 and doorb.id==656) then --If both doors are already closed then...
						gText="Dat Tor ist"..hicks().."eh schon zu.";
                		eText="The gate"..hicks().."is already closed.";
                		outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		        		npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					else
						if (not move.status()) and (game1.rundenzahl()==0) then
							move.receiveText(originator,2);--Close gate
						elseif (not move.status()) and (game1.rundenzahl()~=0) then
							gText="Nay, jetzt nich, bin grad dabei ne Münze zu gewinnen!";
							eText="Nay, not now, I have a coin to win!";
		                	outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				        	npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);	
						end
					end
			end
				return true;
				
		elseif (string.find(message,"[Tt]or.+[Aa]uf")~=nil or string.find(message,"[Oo]pen.+[Gg]ate")~=nil) then
			gText="Ick bin deine Schwester, also"..hicks().."behandle mich 'uch so!";
			eText="I'm yer sister, so ye"..hicks().."better treat me lik' this!";
			outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			return true;
		elseif (standardAnswer(message,3)==true and originator.id~=boindil) then  --Come in Irima
			if NpcOutside==true and not move.status() then
				move.receiveText(originator,3);--go in
				
				local rand=math.random(3);
				if rand==3 then
					gText="Jau, bin sofort zur Stelle!";
					eText="Aye,I'm instantly there!";
				else
					gText="Jaja ... nen Moment noch.";
					eText="Just a moment!";
				end
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			end
			return true;	
		elseif (standardAnswer(message,4)==true and originator.id~=boindil) then  --Go out irima
			if NpcOutside==false and not move.status() then
				move.receiveText(originator,4);--go out

			    gText="#me erhebt sich \"Aye, ick sollt wirklich wieder raus, bis denne!\".";
				eText="#me stands up \"Aye, I really should go outside again, see yer later!\"";
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				game1.reset();
			end
			return true;
		end --Wenn nicht "Tor auf Irima" oder "Tur zu" dann ende
			 
			 	
	elseif (originator.activeLanguage==0) then
		if (standardAnswer(message,1) or standardAnswer(message,2) 
		 or standardAnswer(message,3) or standardAnswer(message,4)) then  
			gText="Sprich wie 'n Zwerg mit mir"..hicks().."oder verschwinde wieder!";
			eText="Talk lik' a dwarf wit' me or"..hicks().."leave!";
			outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
			npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			return true;
		end					
	end	
end

--[[
    standardAnswer
    Checks whether a string can be counted to an answertype
    @param message - string
    @param answertype - integer
    
    @return boolean - true in case message can be counted to the answertype else false
]]
function standardAnswer(message,answertype)

	if (answertype==1) then --answertype 1 == standardphrases for "open door"
		     if (string.find(message,"[Gg]oldra.+[Tt][üo]r.+[Aa]uf.*")~=nil or string.find(message,"[Gg]oldra.+[Oo]pen.+[Gg]ate.*")~=nil
			 or string.find(message,"[Oo]pen.+[Gg]ate.+[Gg]oldra.*")~=nil or string.find(message,"[Oo]pen.+[Gg]ate.+[Ss]ister.*")~= nil
			 or string.find(message,"[Tt][üo]r.+[Aa]uf.+[Gg]oldra.*")~=nil or string.find(message,"[Tt][üo]r.+[Aa]uf.+[Ss]chwester.*")~=nil
			 or string.find(message,"[Ss]chwester.+[Tt][üo]r.+[Aa]uf.*")~=nil or string.find(message,"[Ss]ister.+[Oo]pen.+[Gg]ate.*")~=nil
			 or string.find(message,"[Öö]ffne.+[Tt][üo]r.+[Ss]chwester.*")~=nil or string.find(message,"[Oo]effne.+[Tt][üo]r.+[Ss]chwester.*")~=nil
			 or string.find(message,"[Öö]ffne.+[Tt][üo]r.+[Gg]oldra.*")~=nil or string.find(message,"[Oo]effne.+[Tt][üo]r.+[Gg]oldra.*")~=nil) then
				
			 	return true;
		 	 else
		     	return false;
		 	 end

    elseif (answertype==2) then --answertype 2 == standardphrases for "close door"
			 if ( string.find(message,"[Tt][üo]r.+[Zz]u.*")~=nil or string.find(message,"[Cc]lose.+[Gg]ate.*")~=nil
			 or string.find(message,"[Ss]chlie[sß]*.+[Tt][üo]r.*")~=nil or string.find(message,"[Cc]lose.+[Dd]oor.*")~=nil) then
		
		   		return true;
			 else
		   		return false;
			 end
	elseif (answertype==3) then --answertype 3 == standardphrases for "come in and drink a beer"
			 if ( string.find(message,"[Bb]ier.+trink.+[Gg]oldra.*")~=nil or string.find(message,"[Dd]rink.+[Bb]eer.+[Gg]oldra.*")~=nil
			 or string.find(message,"[Kk]omm.+rein.+[Gg]oldra.*")~=nil or string.find(message,"[Cc]ome.+in.+[Gg]oldra.*")~=nil
			 or string.find(message,"[Gg]eh.+rein.+[Gg]oldra.*")~=nil or string.find(message,"[Gg]o.+in.+[Gg]oldra.*")~=nil
			 or string.find(message,"[Bb]ier.+trink.+[Ss]chwester.*")~=nil or string.find(message,"[Dd]rink.+[Bb]eer.+[Ss]ister.*")~=nil
			 or string.find(message,"[Kk]omm.+rein.+[Ss]chwester.*")~=nil or string.find(message,"[Cc]ome.+in.+[Ss]ister.*")~=nil
			 or string.find(message,"[Gg]eh.+rein.+[Ss]chwester.*")~=nil or string.find(message,"[Gg]o.+in.+[Ss]ister.*")~=nil) then
		   		return true;
			 else
		   		return false;
			 end
	elseif (answertype==4) then --answertype 4 == standardphrases for "go out guarding"
			 if (string.find(message,"[Gg]eh.+[Ww]ache.+[Gg]oldra.*")~=nil or string.find(message,"[Gg]o.+[Gg]uard.+[Gg]oldra.*")~=nil
			 or string.find(message,"[Gg]eh.+rau[ßs].+[Gg]oldra.*")~=nil or string.find(message,"[Gg]o.+out.+[Gg]oldra.*")~=nil
			 or string.find(message,"[Gg]eh.+[Ww]ache.+[Ss]chwester.*")~=nil or string.find(message,"[Gg]o.+[Gg]uard.+[Ss]ister.*")~=nil
			 or string.find(message,"[Gg]eh.+rau[ßs].+[Ss]chwester.*")~=nil or string.find(message,"[Gg]o.+out.+[Ss]ister.*")~=nil
			 or string.find(message,"[Gg]eh.+[Hh]alle.+[Ss]chwester.*")~=nil or string.find(message,"[Gg]o.+[Hh]all.+[Ss]ister.*")~=nil
			 or string.find(message,"[Gg]eh.+[Hh]alle.+[Gg]oldra.*")~=nil or string.find(message,"[Gg]o.+[Hh]all.+[Gg]oldra.*")~=nil) then
		   		return true;
			 else
		   		return false;
			 end
    elseif (answertype==5) then --answertype 5 == standardphrases for "start drinkgame"
			 if ( string.find(message,"[Tt]rinkspiel.+[Gg]oldra.*")~=nil or string.find(message,"[Dd]rinkgame.+[Gg]oldra.*")~=nil
			 or string.find(message,"[Qq]uer.+durch.+[Gg]ob[ai][ia]th.+[Gg]oldra.*")~=nil or string.find(message,"[Aa]cross.+[Gg]ob[ai][ia]th.+[Gg]oldra.*")~=nil)
			 or string.find(message,"[Gg]oldra.+[Qq]uer.+[Gg]ob[ai][ia]th.*")~=nil or string.find(message,"[Gg]oldra.+[Aa]cross.+[Gg]ob[ai][ia]th.*")~=nil
			 or string.find(message,"[Gg]oldra.+[Tt]rinkspiel.*")~=nil or string.find(message,"[Gg]oldra.+[Dd]rinkgame.*")~=nil
			 or string.find(message,"[Tt]rinkspiel.+[Ss]chwester.*")~=nil or string.find(message,"[Dd]rinkgame.+[Ss]ister.*")~=nil
			 or string.find(message,"[Qq]uer.+durch.+[Gg]ob[ai][ia]th.+[Ss]chwester.*")~=nil or string.find(message,"[Aa]cross.+[Gg]ob[ai][ia]th.+[Ss]ister.*")~=nil
			 or string.find(message,"[Ss]chwester.+[Qq]uer.+[Gg]ob[ai][ia]th.*")~=nil or string.find(message,"[Ss]ister.+[Aa]cross.+[Gg]ob[ai][ia]th.*")~=nil
			 or string.find(message,"[Ss]chwester.+[Tt]rinkspiel.*")~=nil or string.find(message,"[Ss]ister.+[Dd]rinkgame.*")~=nil then

		   		return true;
			 else
		   		return false;
			 end
	elseif (answertype==6) then --answertype 6 == standardwords for "yes"
         if (string.find(message,"[Jj]a")~=nil or string.find(message,"[Yy]es")~=nil or
             string.find(message,"[Kk]lar")~=nil or string.find(message,"[Ss]icher")~=nil or
			 string.find(message,"[Ss]ure")~=nil or string.find(message,"[Aa]ye")~=nil) then
			 return true;
		 else
		     return false;
		 end

	else
        	 return false;
   	end
end


--[[
    keinBock
    Lets the NPC say a trigger
    @param	originator - character struct
    
    @return nothing
]]
function keinBock(originator)

	if (math.random(0,10)==1) then
        gText="#me hält ihren Kopf \"Nay,"..hicks().."bin heut nich im Stimmung"..hicks()..", hab Kopfweh! Beweg deinen Hintern selber!\".";
		eText="#me holds her head \"Nay,"..hicks().."today I'm in a foul mood, I've headache!"..hicks().."Mov' yer behind yerself!\".";
        outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
	else
		gText="#me grummelt \"Mach doch"..hicks().."selber auf!\".";
        eText="#me grumbles \"I don't feel like it today. Do it"..hicks().."yourself!\".";
        outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
		npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
	end
end

--[[
    wait
    Lets the NPC make a break for a time
    @param timeInSeconds - float - The time how long the NPC shall take a break(in Seconds)
    
    @return true in case the NPC finished the break else false
]]
function wait(timeInSeconds)  --Works ONLY in the nextCycle-function!!!
        if (cycleCounter==nil) then
            cycleCounter=0;
			return false;
        elseif(cycleCounter~=nil and cycleCounter~=(timeInSeconds*10)) then
            cycleCounter=cycleCounter+1;
			return false;
        elseif (cycleCounter==(timeInSeconds*10)) then
			cycleCounter=nil;
			return true;
		end
end

function checkGender(originator,returnType)

	if returnType==0 then
        if (originator:increaseAttrib("sex",0) == 0) then
			eTextG = "he";
            gTextG = "er";
        else
            eTextG = "she";
            gTextG = "sie";
        end
    
	elseif returnType==1 then    
        if (originator:increaseAttrib("sex",0) == 0) then
            gTextG = "seine";
            eTextG = "his";
        else
            gTextG = "ihre";
            eTextG = "her";
        end
	elseif returnType==2 then    
        if (originator:increaseAttrib("sex",0) == 0) then
            gTextG = "ihn";
            eTextG = "him";
        else
            gTextG = "sie";
            eTextG = "her";
        end
    
	elseif returnType==3 then
	    if (originator:increaseAttrib("sex",0) == 0) then
            gTextG = "ihm";
            eTextG = "him";
		else
            gTextG = "ihr";
            eTextG = "her";
		end
	else
            gTextG= "***Falscher returnType in checkGender, bitte melde dies einem Dev***";
        	eTextG= "***Wrong returnType in checkGender, please report this to a Dev***";
    end
		text=base.common.npc.base.npcautofunction.GetNLS(originator,gTextG,eTextG);
    	return text;
end
--[[
    drinkBeer
    Lets the NPC 'drink' a beer
    @param nothing
    
    @return nothing
]]
function drinkBeer()
    		world:makeSound(12,thisNPC.pos); -- Trinkgeräusch machen
			thisNPC:talkLanguage(Character.say,Player.german,"#me holt eine Flasche Bier aus ihrer Tasche und nimmt einen großzügigen Schluck.");
           	thisNPC:talkLanguage(Character.say,Player.english,"#me pulls a bottle of beer out of her bag and takes a generous sip.");
end

function lookAtNpc(Char, mode)
    if initLook==nil then
        output={};
        output[0]="Sie trägt eine neu aussehende Wächterrobe mit einem aufgestickten Wappen Silberbrands darauf. In der Hand hält die grimmig blickende Zwergin eine große, doppelschneidige Axt, während sie ihren Blick aufmerksam schweifen lässt.";
        output[1]="She wears a quite new-looking Guardian's robe with an embroidered emblem of Silverbrand on it. The frowning looking dwarf holds a big, sharp axe in her hand, whilst her eyes wander across the hall.";
        initLook=1;
    end

    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end




function drinkGame()

    local self = {
        gameState          = 0,     -- 0: inactive, 1: playing
        player         	   = nil,   -- Struct of the Player
        startGame		   = {},	-- Includes the players which have the money for a game
		rundenzahl		   = 0,
		trinkCounter	   = 0,
		outcome1	   	   = 0,
		outcome2	   	   = 0,
		coinTaken		   = false,
		playerDrinkfactor  = nil,
		drunk			   = {},
		npcDrinkfactor	   = 130;	-- NPCrace(6.1) * NPCconstitution(17)
    };

	local trinkCounter = function ()
	
		if self.trinkCounter~=240 then
			self.trinkCounter=self.trinkCounter+1;
		elseif self.trinkCounter==240 then
			self.trinkCounter=0;
		end
	end

	local getFactor	= function (trinker)
		local konsti=trinker:increaseAttrib("constitution",0);
		local race=trinker:getRace();
			if race==0 then --human
				 factor=4.2;
			elseif race==1 then --dwarf
			     factor=5.1;
			elseif race==2 then --halfling
				 factor=4.3;
			elseif race==3 then --elf
			    factor=3.3;
			elseif race==4 then --orc
			     factor=4.8;
			elseif race==5 then --lizardman
			     factor=2.7;
			elseif race==6 then --gnome
			     factor=3.7;
			elseif race==7 then --fairy
			     factor=0.8;
			elseif race==8 then --goblin
			    factor=2.6;
			else
			    factor=1.0
			end
		return (factor*2.5)*(konsti-2);
	end


	local calculateOutcomes = function ()
		local playerRand=math.random(1,18+(self.rundenzahl/9)+self.playerDrinkfactor*10/100);
		local npcRand=math.random(1,20+(self.rundenzahl/9));
		if self.rundenzahl==1 then
			self.outcome1=self.playerDrinkfactor-(playerRand*2+self.rundenzahl); self.outcome2=self.npcDrinkfactor-(npcRand*2+self.rundenzahl);
		else
			self.outcome1=self.outcome1-(playerRand*2+self.rundenzahl); self.outcome2=self.outcome2-(npcRand*2+self.rundenzahl);
		end

	end
	
	local reset = function ()
		self.gameState=0;
		self.player=nil;
		self.rundenzahl=0;
		self.trinkCounter=0;
		self.outcome1=0;
		self.outcome2=0;
		self.coinTaken=false;
		self.playerDrinkfactor=nil;
		self.npcDrinkfactor=130;
	end

	local checkIfOnline= function ()
		playerStillOnline=false;
		local players=world:getPlayersInRangeOf(thisNPC.pos, 15);
		if players[1]~=nil then
			for i, player in pairs(players) do --looks if the drinker hasn't logged out
				if (players[i].id==self.player.id) then
					playerStillOnline=true;
				end
			end						
		else
			reset();
		end
		if not playerStillOnline then
			reset();
		end
		playerStillOnline=false;
	end			

	local toast = function ()		
		rand=math.random(8);
	
		if rand==1 then
			gText="Der Kopf tut weh, die Füße stinken. Höchste Zeit ein Bier zu trinken...";
		elseif rand==2 then
			gText="Hopfen und Malz, ab in den Hals.";
		elseif rand==3 then
			gText="Red' was wahr ist, Iß' was gar ist Trink' was klar ist";
		elseif rand==4 then
			gText="Hopp, hopp, rein in Kopp!";
		elseif rand==5 then
			gText="Trinken, trinken das is Kult, wer nich trinkt is selber Schuld!";		
		elseif rand==6 then
			gText="Der Klügere kippt nach! Hehe...";
		elseif rand==7 then
			gText="Nicht viel reden, Gläser heben!";
		elseif rand==8 then
			gText="Digge Aue, Digger Kopp, Scheiß egal Ex un hopp";
		end
		thisNPC:talkLanguage(Character.say, Player.german, gText);
	end		
	
			
	local nextCycle = function ()
		if self.gameState==1 then
			checkIfOnline();
		end
		if self.gameState==1 then
			if not move.status() then 
				  trinkCounter();				
	
				if self.trinkCounter==10 then --Rundenzahl	
					if self.rundenzahl==1 then
						gTextR="Erste Runde: Rübenschnaps";
						gTextR1="Das'n feiner kleiner Absacker für'n Anfang! Den hab ich aus Greenbriar von den Halblingen gekauft!";
						eTextR="First Round: Beet Booze";
					elseif self.rundenzahl==2 then
						gTextR="Zweite Runde: Met";
						gTextR1="So, zweite Runde... Hier hab'n wir nen Krug Honigwein aus der Nordmark. Die könn' zwar nich so brau'n wie wir aber sie werdn mit der Zeit besser, jau.";
						eTextR="Second Round: Mead";
					elseif self.rundenzahl==3 then
						gTextR="Dritte Runde: Hundepisse";
						gTextR1="Dritte Runde, hier hab ich nu wat aus Troll's Bane. Das trink'n die da alle, desweg'n sind die da so komisch.";
						eTextR="Third Round: Dogpiss";
					elseif self.rundenzahl==4 then
						gTextR="Vierte Runde: Schwefelbrand";
						gTextR1="In der vierten Runde nu hab ich was ganz feines! Den Schwefelbrand, aus Silberhammer's Hause, der wird dir schmeckn, das heißt falls du nich umkippst.";
						eTextR="Fourth Round: Brimstone Brand";
					elseif self.rundenzahl==5 then
						gTextR="Fünfte Runde: Goldleim";
						gTextR1="Goldleim, mit dem Gesöff halt'n die Goldburger die Steine ihrer Burg zusamm'. Also auf zur 5ten Runde!";
						eTextR="Fifth Round: Goldglue";
					elseif self.rundenzahl==6 then
						gTextR="Sechste Runde: Rosenlikör Nummer 5";
						gTextR1="Du haust ganz schön was weg... Mal sehen wie du nach Runde 6 aussiehst. Jetzt gibt's den Rosenlikör von unseren Freund'n aus der Grau'n Zuflucht.";
						eTextR="Sixth Round: Rosesliqueur Number 5";
					elseif self.rundenzahl==7 then
						gTextR="Siebte Runde: Chergas Vermächtnis";
						gTextR1="Runde 7, nu wird's ernst! Das Gesöff hab ich im Friedhof damals gefundn, das erweckt die Totn da zum Leb'n.";
						eTextR="Seventh Round: Chergas Heritage";
					elseif self.rundenzahl==8 then
						gTextR="Achte Runde: Skorpion";
						gTextR1="Das Zeug is wie Gift, is aus Varshikar und wird dort von Einarmig'n Goblins aus den Stacheln der Skorpione gepresst. Der gelungene Abschluss!";
						eTextR="Eighth Round: Scorpion";
					elseif self.rundenzahl>8 then
						gTextR="Ah nay, hab nichts mehr da, war wohl unentschieden, hier hast du deine Münze wieder!";
						eTextR="Ah nay, I have nothin' drinkable anymore, here I give ya' your coin back!";
						gTextR1=nil;
						self.player:createItem(3077,1,666,0); --create Silvercoin
						reset();
					end	
						thisNPC:talkLanguage(Character.say, Player.german, gTextR);
			    		thisNPC:talkLanguage(Character.say, Player.english, eTextR);
						if gTextR1~=nil then
							thisNPC:talkLanguage(Character.say, Player.german, gTextR1);
						end
			
				elseif self.trinkCounter==100 then  --Trinkspruch
					if math.random(4)<=3 then
						toast();
					end				
				elseif self.trinkCounter==150 then
						gText="PROST!";
						eText="Cheers!"
						thisNPC:talkLanguage(Character.say, Player.german, gText);
			    		thisNPC:talkLanguage(Character.say, Player.english, eText);
				elseif self.trinkCounter==180 then
				    world:makeSound(12,thisNPC.pos); -- Trinkgeräusch machen
					gText="#me reicht "..checkGender(self.player,3).." eine Flasche die "..checkGender(self.player,0).." austrinkt.";
					eText="#me hands "..checkGender(self.player,3).." a bottle which "..checkGender(self.player,0).." drinks."; 
					outText=base.common.npc.base.npcautofunction.GetNLS(self.player,gText,eText);
					npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				
					calculateOutcomes();
					
				elseif self.trinkCounter==210 then    --inform und ende
				
					if self.outcome1>=100 then
						gText="#w Du fühlst dich noch ganz gut.";
						eText="#w You still feel good";			
					elseif self.outcome1>=50 and self.outcome1<100 then
						gText="#w Du fühlst dich etwas benebelt.";
						eText="#w You feel a bit befogged";			
						rand=math.random(1300,1800);
						self.player:increaseAttrib("hitpoints",-rand);
								
					elseif self.outcome1>=30 and self.outcome1<50 then
						gText="#w Du siehst deine Umgebung nur noch verzerrt.";
						eText="#w You see your surroundings now only blurred";			
						rand=math.random(1500,2100);
						self.player:increaseAttrib("hitpoints",-rand);
					elseif self.outcome1>=1 and self.outcome1<30 then
						gText="#w Dir ist wirklich schlecht. Eigentlich willst du aufhören, doch willst du dir die Blöße geben?";
						eText="#w You feel really bad. Actually you want to give up, but do you really want to expose yourself?";			
						rand=math.random(2000,2800);
						self.player:increaseAttrib("hitpoints",-rand);	
					end
						if self.outcome1>0 then
						base.common.InformNLS( self.player, gText, eText );
						end
					
					if self.outcome1<=0 then
						gText="#w Dir wird schlecht und du musst dich übergeben.";
						eText="#w You feel perish and have to puke.";
						base.common.InformNLS( self.player, gText, eText );
		        		self.player:talkLanguage(Character.say, Player.german, "#me übergibt sich.");
		       			self.player:talkLanguage(Character.say, Player.english,"#me pukes.");
					
					elseif self.outcome1>0 and self.outcome2>0 then
						self.rundenzahl=self.rundenzahl+1;		
						self.gameState=0;
						gText="Du bist ne Runde weiter, machst du weiter oder gibste auf?";
						eText="You reached the next round, do you want to continue or to give up?";
						thisNPC:talkLanguage(Character.say, Player.german, gText);
		    			thisNPC:talkLanguage(Character.say, Player.english, eText);	
		 			end
	
					if self.player~=nil then
						if self.outcome2<=0 and self.outcome1>0 then
			
							gText="#me blickt "..self.player.name.." an - ihr Blick wirkt starr. Eine Fontäne schießt plötzlich aus ihrem Mund und das Essen der letzen Stunde verteilt sich auf Gesicht des Gewinners.";
							eText="#me looks to "..self.player.name..", her gaze seems fixed. Suddenly a fountain gushes out of her mouth and the last hour's meal spreads on the face of the winner.";
							outText=base.common.npc.base.npcautofunction.GetNLS(self.player,gText,eText);
							npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			            	gText="Argh, du bist der bessere von uns *hicks* , hier dein Geld!";
							eText="Argh, you are the better one from us two *hicks* , here ya' money!";		
							self.drunk[world:getTime("hour")]=true;
							outText=base.common.npc.base.npcautofunction.GetNLS(self.player,gText,eText);
							npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
							self.player:createItem(3077,3,666,0); --create 3 silvercoins
							initJoke();
							reset();	
						else
							if self.outcome1<=0 then
								gText="Pah, wusst ick doch das du gegen mick nich gewinnst! Aber sei nich traurig, niemand hat ne Chance gegen Irima!";
								eText="Pah, I knew that ya' want win against me! But don't be sad, nobody has a chance against Irima!";
								thisNPC:talkLanguage(Character.say, Player.german, gText);
								thisNPC:talkLanguage(Character.say, Player.english, eText);
								if math.random(5)==1 then
			        				gText="#me reicht "..checkGender(self.player,3).." ein Kleid \"Da du ja anscheinend wie nen Langbeinerweib trinkst kannst du dich uch so anziehen\".";
									eText="#me hands "..checkGender(self.player,3).." a dress \"It seems ya' drink like a longleg-woman so why not also dressing so\".";
									outText=base.common.npc.base.npcautofunction.GetNLS(self.player,gText,eText);
									npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
									self.player:createItem(385,1,111,0); --create girl dress
								end
				                reset();
							end	
						end
					end
				end
			end		  
		end
	end	

	
    local receiveText = function (texttype, message, originator,movestate,NpcOutside)  --movestate and npcOutside müssen übergeben werden

		if (standardAnswer(message,5)) then
			if not self.drunk[world:getTime("hour")] then
			    if (not movestate and NpcOutside==false and self.rundenzahl<1) then
		            AmountCopper=originator:countItem(3076);
					AmountSilver=originator:countItem(3077);
					if AmountCopper>=100 or AmountSilver>=1 then
					    self.startGame[originator.id]=true;
						gText="Der Einsatz beträgt 1 Silberstück, wer zuerst aufgibt oder sich übergibt hat verloren. Wenn du gewinnst geb ich dir 3 Silberlinge, willste spielen?";
						eText="The stake is 1 silver coin, who gives up or pukes first looses. If ya' win I will give ya' 3 silver coins, do you want to play?";
		
					else
					    self.startGame[originator.id]=false;
					    gText="Komm erst wieder wenn du das Geld hast, du brauchst mindestens ne Silbermünze für das Spiel!"
					    eText="Come back when ya' have enough money, you need at least 1 silver coin for the game!";
					end
						outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
						npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
				end
			else
				gText="Nay, jetz noch nich *hicks* , ich hab' *hicks* vorhin erst verloren!"
				eText="Nay, not now *hicks* , I already *hicks* lost a few moments before!";
				outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
				npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
			end
			
		elseif (standardAnswer(message,6)) then
		    if self.startGame[originator.id] then
                AmountCopper=originator:countItem(3076);
				AmountSilver=originator:countItem(3077);
				if AmountCopper>=100 then
                	originator:eraseItem(3076,100);
                	self.coinTaken=true;
                elseif AmountSilver>=1 then
                	originator:eraseItem(3077,1);
                	self.coinTaken=true;
                else
                	self.coinTaken=false;
                end
                if self.coinTaken then
					self.player=originator;
					self.playerDrinkfactor=getFactor(originator);
					gText="#me nimmt aus ihrer Tasche einige Flaschen \"Gut, spielen wir 'Quer durch Gobaith'\"";
					eText="#me takes some bottles out of her bag \"Good, lets play 'Across Gobaith'\"";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					self.rundenzahl=1;
					self.gameState=1;
					self.startGame[originator.id]=false;
					self.coinTaken=false;	
				else
					gText="Willst du mich übers Ohr hauen? Du hast nicht genügend Geld dabei, du brauchst mindestens ne Silbermünze für das Spiel!";
					eText="Are ya' trying to take me in? You don't have enough money with you, you need at least 1 silver coin for the game!";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					self.startGame[originator.id]=false;
				end
			end
         elseif (string.find(message,"[Ww]eiter.*")~=nil or string.find(message,"[Gg]o.+on")~=nil) then
         	 if self.player~=nil then
         	 	 if originator.id==self.player.id then
					 if (self.gameState==0 and self.rundenzahl>0) then
							gText="Jut, weiter gehts!";
							eText="Well, let's go on!";
							outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
							npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
							self.gameState=1;
					end
				 end
			 end				
		 elseif (string.find(message,"[Aa]uf[hg][öe][rb]en.*")~=nil or string.find(message,"[Gg]eb.+auf")~=nil 
		 	  or string.find(message,"[Gg]ive.+up")~=nil   or string.find(message,"[Hh]ör.+auf")~=nil) then
         	if self.player~=nil then
         		if originator.id==self.player.id then
					gText="Ha, wusst ick doch dat du ein Elbenmädchen bist und gleich uffgibst!";
					eText="Ha, I knew that ya're an elvengirl and don't want to play!";
		    		outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText);
					npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					reset();
				end
			end	
		 end
    end
    
	local rundenzahl = function ()
		if (self.gameState==0 and self.rundenzahl>0) then
			state=0;
		else
			state=self.rundenzahl;
		end
		return state;
	end
    
    local drunk = function ()
		local state=self.drunk[world:getTime("hour")];
		if (state==true) then
			return true;
		else
			self.drunk[world:getTime("hour")-1]=false;
			return false;
		end
	end
		
    return {
        nextCycle    = nextCycle,
        receiveText  = receiveText,
        reset 		 = reset,
		rundenzahl	 = rundenzahl,
		drunk		 = drunk	 ,   
    }; 
end

function hicks()
	if game1.drunk() then
		rand=math.random(2);
		if rand==1 then
			hText=" *hicks* ";
		else
			hText=" ";
		end
	else
		rand=math.random(6000);
		if rand==500 then
			hText=" *hicks* ";
		else
			hText=" ";
		end
	end
	return hText;
end



function moveFunction(doorapos,doorbpos,itemlist)

    local self = {
        moving             = false,     -- false: npc not moving, true: npc is moving
        player         	   = nil,   	-- Struct of the Player
		faceto			   = 4,         -- The looking direction of the Npc when he reaches the target(0=north,6=west,4=south,2=east)
		target			   = nil,		-- the destination the npc has to go
		doorapos	   	   = doorapos,  -- the position of the first(left) door
		doorbpos	   	   = doorbpos,  -- the position of the second(right) door
		NpcOutside         = false,
		TimeBetweenSteps   = 0.8,       -- Time between a step of the npc in seconds
		TimeAfterTask      = 1.6,       -- Time after the Npc made a task in seconds
		movestate          = 0,         -- movestate
		itemlist		   = itemlist,  -- a list with the non-passable items
		blocked			   = false;     -- true if the npc is blocked by a char or item else false
		
    };

	local checkIfNpcOutside = function ()
		if (thisNPC.pos.y>=self.doorapos.y+1) then
			self.NpcOutside=true;
		else
		    self.NpcOutside=false;
		end
	end
	
	local reset = function ()
		self.target=nil;
		self.moving=false;
		self.movestate=0;
		self.player=nil;
		thisNPC:setAttrib("faceto",self.faceto);
		self.blocked=false;
	end
	
	function isPassable( id , lower, upper )  --returns true if Item with Id "id" non-passable!
	    if lower > upper then
	        return false;
	    end;
	    margin = math.floor((lower+upper)/2);
	    if self.itemlist[margin] == id then
	        return true;
	    elseif self.itemlist[margin] < id then
	        return isPassable( id, margin+1, upper );
	    else
	        return isPassable( id, lower, margin-1 );
	    end;
	end
	
	local CheckItem = function ( posi ) --returns false if one of the items non-passable!
    	local fld = world:getField(posi);
    	local cnt = fld:countItems();
    	local i;
    	for i=0,cnt-1 do
        	if isPassable( (fld:getStackItem(i)).id, 1, table.getn( self.itemlist ) ) then
            	return false;
        	end;
    	end;
    	return true;
	end
	
	local searchTarget = function ()
		if self.target==nil then
			checkIfNpcOutside();
			if (self.movestate==1 or self.movestate==2) then --Open gate or close gate
				if self.NpcOutside then
					self.target=position(self.doorapos.x,self.doorapos.y+1,self.doorapos.z);
					if world:isCharacterOnField(self.target) then
						self.target=position(self.doorbpos.x,self.doorbpos.y+1,self.doorbpos.z);
					end
					self.faceto=4;
				else
					self.target=position(self.doorapos.x,self.doorapos.y-1,self.doorapos.z);
					if world:isCharacterOnField(self.target) then
						self.target=position(self.doorbpos.x,self.doorbpos.y-1,self.doorbpos.z);
					end
				end
			elseif self.movestate==3 then  --go and drink a beer
				self.target=position(self.doorapos.x,self.doorapos.y+1,self.doorapos.z);
				if world:isCharacterOnField(self.target) then
					self.target=position(self.doorbpos.x,self.doorbpos.y+1,self.doorbpos.z);
				end
				self.faceto=0;
			elseif self.movestate==3.1 then
				self.target=position(self.doorapos.x,self.doorapos.y-1,self.doorapos.z);
				if world:isCharacterOnField(self.target) then
					self.target=position(self.doorbpos.x,self.doorbpos.y-1,self.doorbpos.z);
				end
				self.faceto=0;
			elseif self.movestate==3.2 then
				self.target=position(113,-205,-3); self.faceto=0;
				if ( world:isCharacterOnField(self.target) == true) then self.target=position(112,-205,-3); self.faceto=0; end
				if ( world:isCharacterOnField(self.target) == true) then self.target=position(114,-206,-3); self.faceto=6; end
				if ( world:isCharacterOnField(self.target) == true) then self.target=position(111,-206,-3); self.faceto=2; end
				if ( world:isCharacterOnField(self.target) == true) then self.target=position(112,-205,-3); self.faceto=0; end
				if ( world:isCharacterOnField(self.target) == true) then self.target=position(110,-203,-3); self.faceto=4; end
			elseif self.movestate==4 then  --go outside guarding again
				self.target=position(self.doorapos.x,self.doorapos.y-1,self.doorapos.z);
				if world:isCharacterOnField(self.target) then
					self.target=position(self.doorbpos.x,self.doorbpos.y-1,self.doorbpos.z);
				end
				self.faceto=4;
			elseif self.movestate==4.1 then
				self.target=position(self.doorapos.x,self.doorapos.y+1,self.doorapos.z);
				if ( world:isCharacterOnField(self.target) == true) then
					self.target=position(self.doorbpos.x,self.doorbpos.y+1,self.doorbpos.z);
				end
			elseif self.movestate==4.2 then
				self.target=position(112,-198,-3);
				self.faceto=4;
				if world:isCharacterOnField(self.target) then self.target=position(111,-198,-3); self.faceto=4; end
			elseif self.movestate==4.3 then
				self.target=position(112,-198,-3);
				self.faceto=4;
			else
			    self.target=position(112,-198,-3); self.faceto=4;
			end

		elseif world:isCharacterOnField(self.target) then
			char=world:getCharacterOnField(self.target);
            if char.id~=thisNPC.id then
				checkIfNpcOutside();
				if (self.movestate==1 or self.movestate==2) then --Open gate or close gate
					if self.NpcOutside then
						self.target=position(self.doorapos.x,self.doorapos.y+1,self.doorapos.z);
						if world:isCharacterOnField(self.target) then
							self.target=position(self.doorbpos.x,self.doorbpos.y+1,self.doorbpos.z);
						end
						self.faceto=4;
					else
						self.target=position(self.doorapos.x,self.doorapos.y-1,self.doorapos.z);
						if world:isCharacterOnField(self.target) then
							self.target=position(self.doorbpos.x,self.doorbpos.y-1,self.doorbpos.z);
						end
					end
				elseif self.movestate==3 then  --go and drink a beer
					self.target=position(self.doorapos.x,self.doorapos.y+1,self.doorapos.z);
					if world:isCharacterOnField(self.target) then
						self.target=position(self.doorbpos.x,self.doorbpos.y+1,self.doorbpos.z);
					end
					self.faceto=0;
				elseif self.movestate==3.1 then
					self.target=position(self.doorapos.x,self.doorapos.y-1,self.doorapos.z);
					if world:isCharacterOnField(self.target) then
						self.target=position(self.doorbpos.x,self.doorbpos.y-1,self.doorbpos.z);
					end
					self.faceto=0;
				elseif self.movestate==3.2 then
					self.target=position(113,-205,-3); self.faceto=0;
					if ( world:isCharacterOnField(self.target) == true) then self.target=position(112,-205,-3); self.faceto=0; end
					if ( world:isCharacterOnField(self.target) == true) then self.target=position(114,-206,-3); self.faceto=6; end
					if ( world:isCharacterOnField(self.target) == true) then self.target=position(111,-206,-3); self.faceto=2; end
					if ( world:isCharacterOnField(self.target) == true) then self.target=position(112,-205,-3); self.faceto=0; end
					if ( world:isCharacterOnField(self.target) == true) then self.target=position(110,-203,-3); self.faceto=4; end
				elseif self.movestate==4 then  --go outside guarding again
					self.target=position(self.doorapos.x,self.doorapos.y-1,self.doorapos.z);
					if world:isCharacterOnField(self.target) then
						self.target=position(self.doorbpos.x,self.doorbpos.y-1,self.doorbpos.z);
					end
					self.faceto=4;
				elseif self.movestate==4.1 then
					self.target=position(self.doorapos.x,self.doorapos.y+1,self.doorapos.z);
					if ( world:isCharacterOnField(self.target) == true) then
						self.target=position(self.doorbpos.x,self.doorbpos.y+1,self.doorbpos.z);
					end
				elseif self.movestate==4.2 then
					self.target=position(112,-198,-3);
					self.faceto=4;
					if world:isCharacterOnField(self.target) then self.target=position(111,-198,-3); self.faceto=4; end
				elseif self.movestate==4.3 then
					self.target=position(112,-198,-3);
					self.faceto=4;
				else
				    self.target=position(112,-198,-3); self.faceto=4;
				end
				char=nil;
			end
		end
	end

	local doTask = function ()
		if self.movestate==1 then

			doora=world:getItemOnField(self.doorapos);
			doorb=world:getItemOnField(self.doorbpos);

			base.keys.UnlockDoor( doora ); --Tore entriegeln
			base.keys.UnlockDoor( doorb );
			doora=world:getItemOnField(self.doorapos);
			doorb=world:getItemOnField(self.doorbpos);
			base.doors.OpenDoor( doora );  --Tore öffnen
			base.doors.OpenDoor( doorb );

			if  self.NpcOutside then
				gText="#me öffnet das Tor und wirft einen grimmigen Blick in die Werkstatt.";
				eText="#me opens the gate and looks grimly into the workshop.";
				self.movestate=4.2;
			else
				gText="#me öffnet das Tor und blickt prüfend durch die Halle.";
				eText="#me opens the gate and looks vetting through the hall.";
				self.movestate=3.2;
			end
				thisNPC:talkLanguage(Character.say,Player.german,gText);
	           	thisNPC:talkLanguage(Character.say,Player.english,eText);
	           	self.target=nil;
		elseif self.movestate==2 then
			if ( world:isCharacterOnField(doorapos) or world:isCharacterOnField(doorbpos)) then -- Is a char. on the position of the doors?

				char1=world:getCharacterOnField(doorapos); char2=world:getCharacterOnField(doorbpos);
				if (char1~=nil) then
					char1:warp(position(self.doorapos.x,self.doorapos.y+2,self.doorapos.z));
					char=char1;
				end
				if (char2~=nil) then
					char2:warp(position(self.doorbpos.x,self.doorbpos.y+2,self.doorbpos.z));
					char=char2;
				end


				gText="#me schubst "..checkGender(char,2).." zur Seite \"Arr...wech da!\"";
	            eText="#me pushes "..checkGender(char,2).." to the side \"Arr...get out of my way!\"";
				thisNPC:talkLanguage(Character.say,Player.german,gText);
	           	thisNPC:talkLanguage(Character.say,Player.english,eText);

			    char=nil; char1=nil; char2=nil;
			end


			doora=world:getItemOnField(self.doorapos);
			doorb=world:getItemOnField(self.doorbpos);

			base.doors.CloseDoor( doora ); --Tore schließen
			base.doors.CloseDoor( doorb );
			doora=world:getItemOnField(self.doorapos);
			doorb=world:getItemOnField(self.doorbpos);
			base.keys.LockDoor( doora );  --Tore verriegeln
			base.keys.LockDoor( doorb );


			gText="#me lässt die Flügel des Tores krachend zufallen und sperrt ab.";
			eText="#me shuts the gate crashing then locks it.";
			thisNPC:talkLanguage(Character.say,Player.german,gText);
	        thisNPC:talkLanguage(Character.say,Player.english,eText);
			if  self.NpcOutside then
				self.movestate=4.2;
			else
				self.movestate=3.2;
			end
			self.target=nil;
		elseif self.movestate==3 then

			doora=world:getItemOnField(self.doorapos);
			doorb=world:getItemOnField(self.doorbpos);

			base.keys.UnlockDoor( doora ); --Tore entriegeln
			base.keys.UnlockDoor( doorb );
			doora=world:getItemOnField(self.doorapos);
			doorb=world:getItemOnField(self.doorbpos);
			base.doors.OpenDoor( doora );  --Tore öffnen
			base.doors.OpenDoor( doorb );
			self.movestate=self.movestate+0.1;
			self.target=nil;
		elseif self.movestate==3.1 then
			if ( world:isCharacterOnField(doorapos) or world:isCharacterOnField(doorbpos)) then -- Is a char. on the position of the doors?

				char1=world:getCharacterOnField(doorapos); char2=world:getCharacterOnField(doorbpos);
				if (char1~=nil) then
					char1:warp(position(self.doorapos.x,self.doorapos.y+2,self.doorapos.z));
					char=char1;
				end
				if (char2~=nil) then
					char2:warp(position(self.doorbpos.x,self.doorbpos.y+2,self.doorbpos.z));
					char=char2;
				end

				gText="#me schubst "..checkGender(char,2).." zur Seite \"Arr...wech da!\"";
	            eText="#me pushes "..checkGender(char,2).." to the side \"Arr...get out of my way!\"";
				thisNPC:talkLanguage(Character.say,Player.german,gText);
	           	thisNPC:talkLanguage(Character.say,Player.english,eText);
			    char=nil; char1=nil; char2=nil;
			end

			doora=world:getItemOnField(self.doorapos);
			doorb=world:getItemOnField(self.doorbpos);

			base.doors.CloseDoor( doora ); --Tore schließen
			base.doors.CloseDoor( doorb );
			doora=world:getItemOnField(self.doorapos);
			doorb=world:getItemOnField(self.doorbpos);
			base.keys.LockDoor( doora );  --Tore verriegeln
			base.keys.LockDoor( doorb );

			gText="#me lässt die Flügel des Tores krachend zufallen und sperrt ab.";
			eText="#me shuts the gate crashing then locks it.";
			thisNPC:talkLanguage(Character.say,Player.german,gText);
	        thisNPC:talkLanguage(Character.say,Player.english,eText);
			self.movestate=self.movestate+0.1;
			self.target=nil;
		elseif self.movestate==3.2 then
				gText="#me setzt sich.";
				eText="#me takes a seat.";
				thisNPC:talkLanguage(Character.say,Player.german,gText);
	           	thisNPC:talkLanguage(Character.say,Player.english,eText);
	           	self.movestate=self.movestate+0.1;
		elseif self.movestate==4 then

			doora=world:getItemOnField(self.doorapos);
			doorb=world:getItemOnField(self.doorbpos);

			base.keys.UnlockDoor( doora ); --Tore entriegeln
			base.keys.UnlockDoor( doorb );
			doora=world:getItemOnField(self.doorapos);
			doorb=world:getItemOnField(self.doorbpos);
			base.doors.OpenDoor( doora );  --Tore öffnen
			base.doors.OpenDoor( doorb );
			self.movestate=self.movestate+0.1;
			self.target=nil;
		elseif self.movestate==4.1 then
			if ( world:isCharacterOnField(doorapos) or world:isCharacterOnField(doorbpos)) then -- Is a char. on the position of the doors?

				char1=world:getCharacterOnField(doorapos); char2=world:getCharacterOnField(doorbpos);
				if (char1~=nil) then
					char1:warp(position(self.doorapos.x,self.doorapos.y+2,self.doorapos.z));
					char=char1;
				end
				if (char2~=nil) then
					char2:warp(position(self.doorbpos.x,self.doorbpos.y+2,self.doorbpos.z));
					char=char2;
				end
				gText="#me schubst "..checkGender(char,2).." zur Seite \"Arr...wech da!\"";
	            eText="#me pushes "..checkGender(char,2).." to the side \"Arr...get out of my way!\"";

				thisNPC:talkLanguage(Character.say,Player.german,gText);
	           	thisNPC:talkLanguage(Character.say,Player.english,eText);

				char=nil; char1=nil; char2=nil;
			end

			doora=world:getItemOnField(self.doorapos);
			doorb=world:getItemOnField(self.doorbpos);

			base.doors.CloseDoor( doora ); --Tore schließen
			base.doors.CloseDoor( doorb );
			doora=world:getItemOnField(self.doorapos);
			doorb=world:getItemOnField(self.doorbpos);
			base.keys.LockDoor( doora );  --Tore verriegeln
			base.keys.LockDoor( doorb );

			gText="#me lässt die Flügel des Tores krachend zufallen und sperrt ab.";
			eText="#me shuts the gate crashing then locks it.";
			thisNPC:talkLanguage(Character.say,Player.german,gText);
	        thisNPC:talkLanguage(Character.say,Player.english,eText);
			self.movestate=self.movestate+0.1;
			self.target=nil;
		else
			reset();
		end
	end

	local sameposition = function (pos1,pos2)
		if( (pos1.x==pos2.x) and (pos1.y==pos2.y) ) then
			return true;
		else
			return false;
		end
	end
	local MoveX = function (XOff)
	  	if (XOff == 0) then
	        return false;
	 	else 
			if (XOff > 0) then
		        checkPos = position( thisNPC.pos.x - 1, thisNPC.pos.y, thisNPC.pos.z );
		    else
		        checkPos = position( thisNPC.pos.x + 1, thisNPC.pos.y, thisNPC.pos.z );
		    end

		    if not CheckItem( checkPos ) then
		        return false;
		    end
		    old_pos = thisNPC.pos;
		    if (XOff > 0) then
		        thisNPC:move(6,true);
		    elseif (XOff<0) then
		        thisNPC:move(2,true);
		    end
		    if sameposition(old_pos,thisNPC.pos) then
		        return false;
		    else
		        return true;
		    end
	 	end
	end


	local MoveY = function (YOff)
		if (YOff == 0) then
			return false;
		else
		    if (YOff >= 0) then
		        checkPos = position( thisNPC.pos.x, thisNPC.pos.y - 1, thisNPC.pos.z );
		    else
		        checkPos = position( thisNPC.pos.x, thisNPC.pos.y + 1, thisNPC.pos.z );
		    end

		    if not CheckItem( checkPos ) then
		        return false;
		    end
		    old_pos = thisNPC.pos;
		    if (YOff > 0) then
		        thisNPC:move(0,true);
		    elseif (YOff < 0) then
		        thisNPC:move(4,true);
		    end
		    if sameposition(old_pos,thisNPC.pos) then
		        return false;
		    else
		        return true;
		    end
 		end
	end
	
	local moveTo = function ()
	
        XOff = thisNPC.pos.x - self.target.x;  --hier wird die Differenz zum User ausgesucht
        YOff = thisNPC.pos.y - self.target.y;
        if (math.sqrt(XOff*XOff + YOff*YOff) >= 1) then --wenn der User nur 1 Feld entfernt ist dann...
            if ((math.abs(XOff) < math.abs(YOff)) and not self.blocked) or ((math.abs(XOff) > math.abs(YOff)) and self.blocked) then
                if not MoveX(XOff) then
                    if not MoveY(YOff) then
                        self.blocked = true;
                    else
                        self.blocked = false;
                    end
                else
                    self.blocked = false;
                end
            else
                if not MoveY(YOff) then
                    if not MoveX(XOff) then
                        self.blocked = true;
                    else
                        self.blocked = false;
                    end
                else
                    self.blocked = false;
                end
            end
        end
	end

	local nextCycle = function ()		
		if self.moving then
			searchTarget();
			if not equapos(self.target,thisNPC.pos) then

				if _waitVar==nil then _waitVar=0 end
				if wait(self.TimeBetweenSteps) then
					moveTo();--moves to the target;
				end			
				if self.blocked then
					if _waitVar==200 then  --20sec.
						gText="Dat Ding da versperrt meinen Weg, räumt et mal einer weg, sonst komm ick nit an das Schloss!";
						eText="This thing there is blocking my way, I can't reach the lock until someone removes it!";
						thisNPC:talkLanguage(Character.say,Player.german,gText);
						thisNPC:talkLanguage(Character.say,Player.english,eText);
						
						if self.NpcOutside then
							self.movestate=4.2;
						else
							self.movestate=3.2;
						end
						self.target=nil;
						_waitVar=nil;
					else
						_waitVar=_waitVar+1;
					end	
				else
					_waitVar=0;
				end   		
			else
					if wait(self.TimeAfterTask) then
				        doTask();
					end
			end
		end	
	end	
    local receiveText = function (originator,movestate)  --originator, movestate und self.NpcOutside müssen übergeben werden
    	checkIfNpcOutside();
		self.player=originator;
		self.movestate=movestate;
		self.moving=true;

    end
    
    local moveWithoutCommand = function (movestate)
    	checkIfNpcOutside();
		self.movestate=movestate;
		self.moving=true;
    end
	
	local status = function ()
		if (self.moving==nil) then
			self.moving=false;
		end
		return self.moving;
	end
	
	return {
        nextCycle    = nextCycle,
        receiveText  = receiveText,
		reset 		 = reset,
		status		 = status,
		moveWithoutCommand = moveWithoutCommand,
    };
    
end

function tellJoke()
	rand=math.random(1,14);
	thisNPC:talkLanguage(Character.say,Player.german,jokelist_de[rand]);	
	if jokelist_en[rand]~=nil then
		thisNPC:talkLanguage(Character.say,Player.english,jokelist_en[rand]);
	end
end

function initJoke()
	jokelist_de[1]="Die letzten Worte eines"..hicks().."Langohrs mit Liebespech \"Hmm, spinn ick oder hat"..hicks().."dat Astloch Zähne?\""
	jokelist_de[2]="Der holde Elbenjüngling zu seiner Freundin \"Willst du sehen wo mich der Heiler damals operiert hat?\". Sie senkt schüchtern den Blick, errötet und haucht \"Ja.\" Der Jüngling zeigt zu nem nahen Baum und meint trocken \"Da drüben im Moos.\"";
	jokelist_de[3]="Wieviele"..hicks().."Orks braucht es um in ein"..hicks().."Haus einzudringen? 300 oder mehr. 5 halten den Rammbock"..hicks().."der Rest hebt dat Haus an und stößt es jegen den Rammbock bis die Tür nachjibt!";
	jokelist_de[4]="Die letzten Worte eines"..hicks().."Elfischen  Waffenmeisters \"Achtung! Wurfspeere zu mir!\"";
	jokelist_de[5]="Sagt ein Elf zum"..hicks().."anderen als sie nem Rudel Orks aufstöbern \"Komm! Du bist Elf, ich bin Elf, zusammen sind wir zweiundzwanzig, lass sie uns umzingeln.\"";
	jokelist_de[6]="In einem Zwergenstollen wird"..hicks().."n' toter Elf aufjefunden. Der"..hicks().."herbeijerufene Heiler des Zwergenstammes untersucht die Leiche, findet"..hicks().."22 tiefe Stichwunden im Rücken und sagt: \"Bei Irmorom, so nen furchtbaren Selbstmord hab ick noch nie jesehn!\"";
	jokelist_de[7]="Ein kleiner Junge"..hicks().."geht durch die Straßen von Trolls Bane. Er"..hicks().."findet ein Schwert. Ein paar Schritte weiter sieht er nen Ritter Kallahorns gehen. Der kleine Junge: \"Ist dat ihr Schwert, Sir?\" Der Ritter: \"Nee,.. ick hab meines verloren.\"";
	jokelist_de[8]="Was ist ein"..hicks().."Waldläufer mit ner Laterne in der Hand in der Nacht"..hicks().."im Wald?....EIN ARMLEUCHTER!!!";
	jokelist_de[9]="Womit kann man nen Langohr über Jahre beschäftigen? - Mit nem Pergament bei dem auf beiden Seiten \"Bitte Wenden!\" steht.";
	jokelist_de[10]="Kommt ein"..hicks().."Elb"..hicks().."in eine Taverne, trägt Mist in seinen"..hicks().."Händen und ruft: \"Hey Leute, seht doch mal wo ich beinahe hineingetreten wäre!\"";
	jokelist_de[11]="Was ist der Unterschied zwischen"..hicks().."einem Baum und einem"..hicks().."Elben? Wenn du einem Baum einen Tritt verpasst labert er"..hicks().."dich nicht eine Stunde lang voll."
	jokelist_de[12]="Meint ein Elf zu Manron \"Ich bräuchte eine neue Harfe und weiß nicht woher ich das Geld nehmen soll.\" \"So ein Glück\", seufzt Manron, \"Ich dachte schon, Du wolltest"..hicks().."mich anpumpen.\"";
	jokelist_de[13]="Wieviele Elfen braucht man um Mittagessen zu machen? Fünfundzwanzig. Vierundzwanzig halten die Kuh fest und einer fängt an zu grasen!";
	jokelist_de[14]="Was ist dümmer als ein Elf? - zwei Elfen!";

	jokelist_en[1]="Famous last words of a love-sick longear"..hicks().."trying to \"relief\" himself: \"The Five help me, does that treehole have teeth?\"";
    jokelist_en[2]="The fair elven boy asks his girlfriend \"Do you want to see"..hicks().."where the healer cut me open?\". She bats down her eyelids, blushing and whispers \"Yes\" The boy states flatly, gesturing to a nearby tree \"Over there, in the moss.\"";
	jokelist_en[3]="How many orcs does it take to storm a"..hicks().."house? 300 or more. 5 keep the battle ram in place while the rest lifts the house up and throw it against the ram until the door breaks open.";
	jokelist_en[4]="Famous last words of an"..hicks().."elven army-weapons keeper \"All javelins are to be returned to me!\"";
	jokelist_en[5]="Two elves scout and discover"..hicks().."a pack of orcs. One suggests \"Brother! I am el(e)ven, you are"..hicks().."el(e)ven too! Togethere we are twenty-two, enough to ambush these vile creatures!\"";
	jokelist_en[6]="An elf is found dead in a dwarven mine. The summoned dwarven healer examines the corpse and cries out"..hicks().."in terror, upon finding 22 deep stabs into its back:\"Irmoroms beard! 'tis the most terrible suicide me has ever seen!\"";
	jokelist_en[7]="A small boy npc.base.autonpcfunctions.walks along the streets of"..hicks().."Trolls Bane. He finds a sword. A few"..hicks().."steps ahead is a knight of Kallahorn npc.base.autonpcfunctions.walking. The small boy: \"Is that your sword, Sir?\" The knight: \"Nah.., I lost mine.\"";
    jokelist_en[8]="An elf npc.base.autonpcfunctions.walks into a bar.";
	jokelist_en[9]="How can you keep a"..hicks().."longear occupied for years? Hand him a"..hicks().."parchment reading \"Please turn over!\" on"..hicks().."both sides.";
    jokelist_en[10]="An elf npc.base.autonpcfunctions.walks into a tavern, carrying a big pile of"..hicks().."cowdung in his hand and cries out:\"Guys! Look what I nearly stepped into!\"";
end
					
