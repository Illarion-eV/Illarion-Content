-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-86,-23,0,2,false,'Hauptmann Arkos Seldaran','npc_hauptmann_arkos_seldaran.lua',0);

require("npcs.base.autonpcfunctions")
-- require("npcs.base.autonpcfunctions")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Dont you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    InitTalkLists();

    -- ********* START DYNAMIC PART ********
    QuestID = 589;
    SetRadius(40);
    AddCycleText("#me blickt sich um, offenbar jemanden suchend.","#me looks around, it seems he's looking for someone.");
    AddCycleText("#me trägt eine alte albarische Rüstung","#me wears an old albarian armor");
    AddCycleText("#me blickt gedankenverloren zum Himmel","#me looks lost in thought to the sky");
    AddCycleText("#me versucht vergeblich, seine stumpf gewordene albarische Rüstung zu polieren.","#me tries in vain to polish his dull albarian armor.");

    AddTraderTrigger("[wW]er bist du","Ich bin "..thisNPC.name..". Wie ist dein Name?");
    AddTraderTrigger("[wW]er seid ihr","Mein Name ist "..thisNPC.name..", wie lautet den eurer?");
    AddTraderTrigger("[wW]ie hei[sß]+t du","Ich heisse "..thisNPC.name..". Wie ist dein Name?");
    AddTraderTrigger("[dD]u bist","Ich bin "..thisNPC.name..". Wie ist dein Name?");
    AddTraderTrigger("[Ii]hr seid","Ich bin "..thisNPC.name..". Wie ist euer Name?");
    AddTraderTrigger("[Ii]ch bin neu","Tach, schön dich zu treffen. Mein Name ist "..thisNPC.name..", wie ist deiner?");
    AddTraderTrigger("[Ww]ie geht[s]","Mir geht es eigentlich ganz gut, danke.");
    AddTraderTrigger("[Hh]elping, [Mm]aking","Aye, I could need your help. Maybe you can bring me a pipe and after this about 10 Sibanac leaves?");
    AddCondition("qpg","=",0);

    AddTraderTrigger("[Dd]ein.+[Jj]ob","Was interessiert dich was ich mache?");
    AddTraderTrigger("[Dd]ein.+[Bb]eruf","Was interessiert dich was ich mache?");
    AddTraderTrigger("[Ee]uer.+[Bb]eruf","Was interessiert dich was ich mache?");
    AddTraderTrigger("[Dd]eine [Tt][äae]+tigkeit","Ich suche nach jemanden der mir was besorgt! Willst mir helfen?");
    AddTraderTrigger("[Ee]ure [Tt][äae]+tigkeit","Ich suche nach jemanden der mir was besorgt! Willst mir helfen?");
    AddTraderTrigger("[Dd]eine [Aa]ufgabe","Ich suche nach jemanden der mir was besorgt! Willst mir helfen?");
    AddTraderTrigger("[Ee]ure [Aa]ufgabe","Ich suche nach jemanden der mir was besorgt! Willst mir helfen?");
    AddTraderTrigger("[Ww]as tust du","Ich suche nach jemanden der mir was besorgt! Willst mir helfen?");
    AddTraderTrigger("[Ww]as tut ihr","Ich suche nach jemanden der mir was besorgt! Willst mir helfen?");
    AddTraderTrigger("[Kk]aufen","Ich verkaufe nichts! Sehe ich etwa aus wie ein Händler ?");
    AddTraderTrigger("[Vv]erkaufen","Nein! Ich habe bereits alles, was ich brauche.");
    AddTraderTrigger("[Ww]as kaufst","Nein! Ich habe bereits alles, was ich brauche.");
    AddTraderTrigger("[Ww]as verkaufst","Ich verkaufe nichts! Sehe ich etwa aus wie ein Händler ?");
    AddTraderTrigger("[Gg]obiath","Diese ganze Inselgruppe wird Gobiath genannt. Nette Gegend, das Wetter wird nicht zu rauh oder zu heiß, ich mag es.");
    AddCondition("lang","german");
    AddTraderTrigger("[Gg]reenbriar","Greenbriar ist eine Halblingsstadt.");
    AddCondition("lang","german");
    AddTraderTrigger("[Hh]afen","Troll's Bane und Vanima haben Häfen. Der Hafen südwestlich von Troll's Bane ist aber größer.");
    AddTraderTrigger("[Hh]ellbriar","Das war ein von einem barbarischen Kult besetzter Dungeon nahe bei Greenbriar. Die bösartigen Kultisten dort haben die meisten der Halblinge geopfert.");
    AddCondition("lang","german");
    AddTraderTrigger("[Mm]agierakademie","Ihr wollt nicht wirklich DA hin ! Es wird gesagt, den Ort kann nur ein Magier erreichen. Die verwandeln dort Leute in Schweine, Kühe oder schlimmeres !");
    AddTraderTrigger("[Nn]ordmark","Es ist da nicht kälter als anderswo auf Gobiath, abgesehen vom Nordwind im Winter. Dort haben sich einige Norodaj-Barbaren angesiedelt.");
    AddTraderTrigger("[Ss]ilberbrand","Silberbrand ist eine Zwergenstadt, in den bergen nordöstlich von Troll's Bane.");
    AddTraderTrigger("[Vv]anima","Tol Vanima ? Das ist eine ganze kleine Insel voller Bäume und Elfen.");
    AddCondition("lang","german");
    AddTraderTrigger("[Tt]roll['s] bane","Tja, das ist die grösste Stadt auf Gobiath.");
    AddCondition("lang","german");
    AddTraderTrigger("[Vv]arshikar","Das findet man weit im Nordwesten hinter der kleinen Sandwüste. Ich würde den Teleporter benutzen, die Wüste ist voller Skorpione.");
    AddCondition("lang","german");
    AddTraderTrigger("[Ww]ho [a']+re you","I am "..thisNPC.name..". What's your name ?");
    AddTraderTrigger("[wW]ho might you be","I'm called "..thisNPC.name..". And what might your name be ?");
    AddTraderTrigger("[Yy]our name","My name is "..thisNPC.name..". What is your name ?");
    AddTraderTrigger("[Yy]ou are","I am "..thisNPC.name..". What's your name ?");
    AddTraderTrigger("[Ii][ a']+m new","Nice to meet you, then. I am "..thisNPC.name..", what is your name ?");
    AddTraderTrigger("[Hh]ow are you","Oh, i am fine, thanks.");
    AddTraderTrigger("[Yy]our job","I don't want to talk about that right now.");
    AddTraderTrigger("[Yy]our profession","I don't want to talk about that right now.");
    AddTraderTrigger("[Yy]our mission","I'm looking for someone who can bring me some things. Would you like to help me?");
    AddTraderTrigger("[Yy]our mission","I'm looking for someone who can bring me some things. Would you like to help me?");
    AddTraderTrigger("[Yy]our mission","I'm looking for someone who can bring me some things. Would you like to help me?");
    AddTraderTrigger("[Yy]our task","I'm looking for someone who can bring me some things. Would you like to help me?");
    AddTraderTrigger("[wW]hat do you","I'm looking for someone who can bring me some things. Would you like to help me?");
    AddTraderTrigger("[Bb]uy","I don't sell anything. Do i look like a merchant ?");
    AddTraderTrigger("[Ss]ell","Thanks, but i already have everything i need.");
    AddTraderTrigger("[Ww]hat buy","Thanks, but i already have everything i need.");
    AddTraderTrigger("[Ww]hat sell","I don't sell anything. Do i look like a merchant ?");
    AddTraderTrigger("[Gg]obaith","This whole island group is called Gobiath. Nice place, the weather usually does not get too rough or too hot, i like it.");
    AddCondition("lang","english");
    AddTraderTrigger("[Gg]reenbriar","Greenbriar is the city of the halflings.");
    AddCondition("lang","english");
    AddTraderTrigger("[Hh]arbo[u]+r","Troll's Bane and Vanima both have Harbors. The one southwest from Troll's Bane is bigger though.");
    AddTraderTrigger("[Hh]ellbriar","That was an evil dungeon near Greenbriar ! The evil Cultists there sacrificed most of the Halflings of Greenbriar.");
    AddCondition("lang","english");
    AddTraderTrigger("[Mm]agic academy","You don't want to go THERE ! It can only be reached by a mage, they say. They turn people into pigs or cows or worse things there!");
    AddTraderTrigger("[Nn]orthmark","it's not cooler there than elsewhere on Gobiath, except for the north wind in winter. Some Norodaj-Barbarians have settled there.");
    AddTraderTrigger("[Ss]ilverbrand","Silverbrand is a dwarven town in the mountains northeast from Troll's Bane.");
    AddTraderTrigger("[Vv]anima","Tol Vanima ? That's a whole small island full of trees and elves.");
    AddCondition("lang","english");
    AddTraderTrigger("[Tt]roll['s] bane","Well, that's the biggest town on Gobiath.");
    AddCondition("lang","english");
    AddTraderTrigger("[Vv]arshikar","You find it past the small sand desert in the far northwest. I would use the Teleporter, the desrt is full of scorpions.");
    AddCondition("lang","english");
    AddTraderTrigger("[aA]uf bald","Man sieht sich, aber hoffentlich nicht in nächster Zeit.");
    AddConsequence("talk","end");
    AddTraderTrigger("[Hh]allo","Grüß dich, was willst du?");
    AddAdditionalTrigger("[Gg]rü[ßs]+e");
    AddAdditionalTrigger("[Ss]eid gegrüßt");
    AddCondition("qpg","<",2);
	AddConsequence("talk","begin");
    AddTraderTrigger("[Hh]ello","Greetings, what do you want?");
    AddAdditionalTrigger("[Gg]reeting[s]");
    AddAdditionalTrigger("[Bb]e greeted");
    AddCondition("qpg","<",2);
	AddConsequence("talk","begin");
    AddTraderTrigger("[Hh]elfen","Aye, ich könnt deine Hilfe gebrauchen, kannst du mir erstma' ne Pfeife bringen und danach etwa 10 Sibanacblätter?");
    AddAdditionalTrigger("[Mm]achen");
    AddCondition("qpg","=",0);
    AddConsequence("qpg","=",2);
--
    AddTraderTrigger("[Pp]feife","Eine Pfeife kannst du dir sicher von einem Schreiner machen lassen, oder frag einen der Händler hier in der Stadt vielleicht verkauft dir einer von denen die Pfeife.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("[Pp]ipe","A pipe? A carpenter can make you surely one or even ask a merchant here in town. Maybe he would sell you one.");
    AddCondition("qpg","=",2);
    AddTraderTrigger("[Ss]ibanac","Sibanacblätter findet man in der nähe von Flüssen hinter Schilf und falls du da kein Glück hast schau dich mal in den Wäldern um, da findet man ab und zu auch Sibanac.");
    AddAdditionalTrigger("[Bb]lätter");
    AddCondition("qpg","=",2);
    AddCondition("lang","german");
    AddTraderTrigger("[Ss]ibanac","You can find Sibanac leaves not far away from rivers behind reed and if you can't find it there you could search for at the forest. From time to time you can find Sibanac there.");
    AddAdditionalTrigger("[Ll]eaves");
    AddCondition("qpg","=",2);
	AddCondition("lang","english");
    AddTraderTrigger("[Hh]elfen","Aye, ich könnt deine Hilfe gebrauchen, kannst du mir erstma' ne Pfeife bringen und danach etwa 10 Sibanacblätter?");
    AddCondition("qpg","=",2);
    AddTraderTrigger("[Hh]elping","Aye, I could need your help. Maybe you can bring me a pipe and after this about 10 Sibanac leaves?");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",2);
    AddTraderTrigger("[Jj]a","Dann geh mal los und bring mir ne Pfeife und die 10 Sibanacblätter! Dann bring ich dir auch was bei.");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("[Yy]es","Well, then go and bring me a pipe and 10 sibanac leaves! Maybe then I might teach you something.");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("[Nn]ein","Dann verschwinde....oder komm wieder wenn du mir doch helfen willst!");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",0);
    AddTraderTrigger("[Nn]o","Come again, if you want to help me!");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",0);
	AddTraderTrigger("[Hh]allo"," Hast du endlich die Pfeife und die 10 Sibanacblätter dabei?");
    AddAdditionalTrigger("[Gg]r[üs][sß]e");
    AddAdditionalTrigger("[Ss]eid gegrüßt");
    AddAdditionalTrigger("[hH][ei]lf");
	AddAdditionalTrigger("[Mm]achen");
	AddCondition("qpg","=",3);
	AddConsequence("talk","begin");
	AddTraderTrigger("[Hh]ello"," Do you have the pipe and the 10 sibanac leaves with you?");
	AddAdditionalTrigger("[Gg]reeting[s]");
    AddAdditionalTrigger("[Bb]e greeted");
    AddAdditionalTrigger("[Hh]elp");
	AddAdditionalTrigger("[Mm]ake");
	AddCondition("qpg","=",3);
    AddConsequence("talk","begin");
	
	AddTraderTrigger("[Pp]feife","Dank dir und jetzt bring mir noch die 10 Sibanacblätter!");
    AddCondition("item",2744,"all",">=",1);
    AddCondition("qpg","=",3);
    AddConsequence("qpg","=",4);
    AddConsequence("deleteitem",2744,1);
    AddTraderTrigger("[Pp]ipe","Thank you. Now bring me the 10 Sibanac leaves!");
    AddCondition("item",2744,"all",">=",1);
    AddCondition("qpg","=",3);
    AddConsequence("qpg","=",4);
    AddConsequence("deleteitem",2744,1);
    AddTraderTrigger("[Ss]ibanac","Arr...das hast du gut gemacht. Aber mir fällt noch ein, dass ich kein Essen mehr hab. Kannst mir noch 20 geräucherten Schinken bringen?");
    AddCondition("item",155,"all",">=",10);
    AddCondition("qpg","=",4);
    AddCondition("lang","german");
    AddConsequence("qpg","=",5);
    AddConsequence("deleteitem",155,10);
    AddTraderTrigger("[Ss]ibanac","Arr...well done! But there I remember, I got nothing to eat! Maybe you can bring me 20 ham?");
    AddCondition("item",155,"all",">=",10);
    AddCondition("qpg","=",4);
    AddCondition("lang","english");
    AddConsequence("qpg","=",5);
    AddConsequence("deleteitem",155,10);    
	
	AddTraderTrigger("[Ss]chinken","Gut, gut dann pass mal gut auf was ich dir jetzt zeige. Sag 'Los' wenn ich beginnen soll.");
    AddCondition("item",306,"all",">=",20);
    AddCondition("qpg","=",6);
    AddConsequence("qpg","=",7);
    AddConsequence("deleteitem",306,20);
	AddTraderTrigger("[Ss]chinken","Den Schinken kannst du in Trollsbane bei den Schweinen holen und dann musst du zum Räucheroffen gehn und den rohen Schinken räuchern. Und dann kommst du zu mir und gibst es mir!");
    AddCondition("qpg","=",5);
    AddTraderTrigger("[Hh]am","Well, pay attention to what I say you now! If you are ready, say ready.");
    AddCondition("item",306,"all",">=",20);
    AddCondition("qpg","=",6);
    AddConsequence("qpg","=",7);
    AddConsequence("deleteitem",306,20);
	AddTraderTrigger("[Hh]am","You can pick up meat by the pigs in Trollsbane and after this, you have to go to the fumigation house for curing the meat. If you've done this, come to me and give it me!");
    AddCondition("qpg","=",5);
	
    AddTraderTrigger("[Ss]ibanac","Ey..was soll ich damit? Bring mir erstmal die Pfeife und dann erst die 10 Sibanacblätter!");
    AddCondition("qpg","=",3);
    AddCondition("lang","german");
    AddTraderTrigger("[Ss]ibanac","Ey, what I should do with this? First bring me the pipe and after this the 10 Sibanac leaves!");
    AddCondition("qpg","=",3);
    AddCondition("lang","english");	
    AddTraderTrigger("[Pp]feife","Sach mal bist du taub oder dämlich? Du hast die Pfeife gar nicht dabei, bring sie mir wenn ich dir was beibringen soll!");
    AddCondition("item",2744,"all","<",1);
    AddCondition("qpg","=",3);
    AddTraderTrigger("[Pp]ipe","Say, are you deaf or daffy? You haven't got the pipe in you inventory, bring it me, if you want to learn something!");
    AddCondition("item",2744,"all","<",1);
    AddCondition("qpg","=",3);
    AddTraderTrigger("[Ss]ibanac","Bring mir die 10 Sibanacblätter wenn du was von mir lernen willst.");
    AddCondition("qpg","=",4);
    AddCondition("item",155,"all","<",10);
    AddCondition("lang","german");
    AddTraderTrigger("[Ss]ibanac","Bring me 10 Sibanac leaves, if you want to learn someting!");
    AddCondition("qpg","=",4);
    AddCondition("item",155,"all","<",10);
    AddCondition("lang","english");
    AddTraderTrigger("[Jj]a","Spitze! Ich wart hier auf dich und wärm mich schon mal auf, für dein Training.");
    AddCondition("qpg","=",5);
    AddConsequence("qpg","=",6);
    AddTraderTrigger("[Yy]es","Good! I'll wait on you and I will warm me up for your training!");
    AddCondition("qpg","=",5);
    AddConsequence("qpg","=",6);
    AddTraderTrigger("[Nn]ein","Wenn du mir kein Essen bringen willst Freundchen, bring ich dir auch nix bei, so einfach is das! Wenn du es dir anders überlegst, dann sprich mich einfach wieder an.");
    AddCondition("qpg","=",5);
    AddConsequence("qpg","=",100);
    AddTraderTrigger("[Nn]o","If you don't want to bring me something to eat, I won't teach you something! If you've decided you in another way, come and talk to me again!");
    AddCondition("qpg","=",5);
    AddConsequence("qpg","=",100);
    AddTraderTrigger("[Hh]allo","Arr..da bist du ja wieder, bringst mir jetzt die 20 geräucherten Schinken oder nicht?");
    AddAdditionalTrigger("[Gg]r[üs][sß]e");
    AddAdditionalTrigger("[Ss]eid gegrüßt");
    AddAdditionalTrigger("[Ss]chinken");
    AddAdditionalTrigger("[hH][ei]lf");
    AddCondition("qpg","=",100);
    AddConsequence("qpg","=",5);
	AddConsequence("talk","begin");
    AddTraderTrigger("[Hh]ello","Arr, there you are again! You're bringing me the 20 ham now or not?");
    AddAdditionalTrigger("[Gg]reeting[s]");
    AddAdditionalTrigger("[Bb]e greeted");
    AddAdditionalTrigger("[Hh]am");
    AddAdditionalTrigger("[Hh]elping");
    AddCondition("qpg","=",100);
    AddConsequence("qpg","=",5);
	AddConsequence("talk","begin");
	
	AddTraderTrigger("[Hh]allo","Arr..da bist du ja wieder, bringst mir jetzt die 20 geräucherten Schinken oder nicht?");
    AddAdditionalTrigger("[Gg]r[üs][sß]e");
    AddAdditionalTrigger("[Ss]eid gegrüßt");
    AddAdditionalTrigger("[Ss]chinken");
    AddAdditionalTrigger("[hH][ei]lf");
    AddCondition("qpg","=",5);
	AddConsequence("talk","begin");
	
	AddTraderTrigger("[Hh]ello","Arr, there you are again! You're bringing me the 20 ham now or not?");
    AddAdditionalTrigger("[Gg]reet");
    AddAdditionalTrigger("[Bb]e greeted");
    AddAdditionalTrigger("[Hh]am");
    AddAdditionalTrigger("[Hh]elping");
    AddCondition("qpg","=",5);
    AddConsequence("talk","begin");
	
	AddTraderTrigger("[Hh]allo","Arr..da bist du ja wieder, hast du nun die 20 geräucherten Schinken dabei? Wenn nicht dann verschwinde!");
    AddAdditionalTrigger("[Gg]r[üs][sß]e");
    AddAdditionalTrigger("[Ss]eid gegrüßt");
    AddAdditionalTrigger("[Ss]chinken");
    AddAdditionalTrigger("[hH][ei]lf");
    AddCondition("qpg","=",6);
    AddConsequence("talk","begin");
    AddTraderTrigger("[Hh]ello","Arr, there you are again! Do you have the 20 ham with you? If not then leave!");
    AddAdditionalTrigger("[Gg]reeting[s]");
    AddAdditionalTrigger("[Bb]e greeted");
    AddAdditionalTrigger("[Hh]am");
    AddAdditionalTrigger("[Hh]elp");
    AddCondition("qpg","=",6);
    AddConsequence("talk","begin");
--
    AddTraderTrigger("[Ll]os","#me zeigt dir ein taktisches Kampfmanöver.");
    AddCondition("qpg","=",7);
	AddCondition("skill","tactics","=<",60);
    AddConsequence("skill","fighting","tactics","+",5);
    AddConsequence("qpg","=",8);
	AddTraderTrigger("[Ll]os","#me zeigt dir ein taktisches Kampfmanöver.");
    AddCondition("qpg","=",7);
    AddCondition("skill","tactics",">",60);
    AddConsequence("skill","fighting","tactics","+",1);
    AddConsequence("qpg","=",8);	
    AddTraderTrigger("[Rr]eady","#me shows you some tactical maneuvers.");
    AddCondition("qpg","=",7);
	AddCondition("skill","tactics","=<",60);
    AddConsequence("skill","fighting","tactics","+",5);
    AddConsequence("qpg","=",8);
	AddTraderTrigger("[Rr]eady","#me shows you some tactical maneuvers.");
    AddCondition("qpg","=",7);
    AddCondition("skill","tactics",">",60);
    AddConsequence("skill","fighting","tactics","+",1);
    AddConsequence("qpg","=",8);
	
    AddTraderTrigger("","Lass mich in Ruhe, ich hab dir schon etwas beigebracht.");
    AddCondition("qpg","=",8);
    AddCondition("lang","german");
    AddTraderTrigger("","Don't bother me, I've taught you anything yet!");
    AddCondition("qpg","=",8);
    AddCondition("lang","english");
	AddTraderTrigger("[Hh]elp","I'm looking for someone who can bring me some things. Would you like to help me?");
    AddCondition("qpg","<",2);
    AddConsequence("qpg","=",2);
    AddTraderTrigger("[Hh]ilfe","Ich suche nach jemanden der mir was besorgt! Willst mir helfen?");
    AddConsequence("qpg","=",2);
    AddCondition("qpg","<",2);
	
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;

    increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if BasicNPCChecks(originator,2) then
        if LangOK(originator,TradSpeakLang) then
            TellSmallTalk(message,originator);
        else
            Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end
