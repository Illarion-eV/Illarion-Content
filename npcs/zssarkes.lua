-- INSERT INTO npc VALUES (nextval('npc_seq'),5,131,585,0,2,false,'Zssarkes','npc_zssarkes.lua',0);

require("npcs.base.autonpcfunctions")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    InitTalkLists();

    -- ********* START DYNAMIC PART ********

    -- Lizard in guard dormitory who directs player to the tavern and teaches 5 skillpoints in one weapon skill afterwards
    QuestID = 103;
    AddCycleText("#me tröpfelt ein paar Tropfen Politur auf einen Lappen und fängt an sein Schwert damit einzureiben","#me drips some polish onto a cloth and starts to rub his sword in");
    AddCycleText("#me sortiert ein paar Rüstungsteile in seine Truhe","#me sorts some armor into his chest");
    AddCycleText("#me lässt seinen Schwanz hin und her schnalzen","#me flicks his tail");
    AddCycleText("#me zischelt leise vor sich hin, während er eine neue Sehne an einem Bogen befestigt","#me hisses quietly to himself, while he attaches a new fiber on a bow");
    AddCycleText("#me macht ein paar flinke Bewegungen mit einem Dolch, anscheinend aus Trainingszwecken.","#me makes some quick movements with a dagger, seemgl as training");
    AddCycleText("#me schaut sich leise zischelnd in dem Raum um","#me quietly hisses and looks around in the room");
    -- Game help
    AddTraderTrigger("help","[Game Help] This NPC is a palace guard, he might be able to teach you a thing or two. Keywords: Litios, training, fight");
    AddTraderTrigger("hilfe","[Spielhilfe] Dieser NPC ist eine Palastwache und könnte dir vielleicht das ein oder andere beibringen. Schlüsselwörter: Litios, Training, Kampf");
    AddTraderTrigger("restart","Quest restarted");
    AddConsequence("qpg","=",0);
    -- Smalltalk
    AddTraderTrigger("Hello","Greetingss ssstranger");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("Zsss.. Greetingss");
    AddAdditionalText("Good day ssstranger");
    AddTraderTrigger("Grüße","Grüssse Fremder");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("Zsss.. Grüssse");
    AddAdditionalText("Guten Tag Fremder");
    AddTraderTrigger("Hiho","Greetingss ssstranger");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddAdditionalText("Zsss.. Greetingss");
    AddAdditionalText("Good day ssstranger");
    AddTraderTrigger("Hiho","Grüssse Fremder");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddAdditionalText("Zsss.. Grüssse");
    AddAdditionalText("Guten Tag Fremder");
    AddTraderTrigger("Farewell","May the great motherss guide your waysss!");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddAdditionalText("Zzelphia with you!");
    AddAdditionalText("Farewellsss");
    AddTraderTrigger("Tschüß","Möge die grosssse Mutter euch auf euren Wegen bessschützen!");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("Zzelphia mit euch!");
    AddAdditionalText("Auf baldsss");
    AddTraderTrigger("Ciao","May the great motherss guide your waysss!");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddAdditionalText("Zzelphia with you!");
    AddAdditionalText("Farewellsss");
    AddTraderTrigger("Ciao","Möge die grosssse Mutter euch auf euren Wegen bessschützen!");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddAdditionalText("Zzelphia mit euch!");
    AddAdditionalText("Auf baldsss");
    AddTraderTrigger("How are you","Goodss, thankss you");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddAdditionalText("I feelss well und you?");
    AddAdditionalText("I do wellsss, thankss you");
    AddTraderTrigger("Wie geht","Gut, dankess");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddAdditionalText("I fühless mich gutss und duss?");
    AddAdditionalText("Mir gehtss gut, dankess");
    AddTraderTrigger("your name","Zzss.. I'm Zssarkes");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("Zssarkes at yoursss service");
    AddAdditionalText("Zssarkes, pleasuress to meetss youss");
    AddTraderTrigger("dein name","Ich binss Zssarkes");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddAdditionalText("Zssarkes zu dienstenss");
    AddAdditionalText("Zssarkes, eine Freude euch kennenss zzu lernenss");
    -- Typical NPC phraces
    AddTraderTrigger("what sell","Zzss.. I'm not a trader");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddAdditionalText("I'm a guard notss a merchant");
    AddAdditionalText("I do not tradess");
    AddTraderTrigger("was verkauf","Ich binss kein Händler");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddAdditionalText("Ich handelss nicht");
    AddAdditionalText("Ich bin kein Händlerss, sssondern eine Wache");
    AddTraderTrigger("tell something","I'm not goodss in telling ssstoriess");
    AddAdditionalText("I have no timess to tell sstoriess");
    AddAdditionalText("Zzss.. I'm a guardss not a ssstoryteller");
    AddTraderTrigger("erzähl was","Ich bin nichtss gut im Geschichten erzählenss");
    AddAdditionalTrigger("erzähl etwas");
    AddAdditionalText("Ich habe keiness Zeit um Geschichtenss zu erzählenss");
    AddAdditionalText("Zzss.. Ich bin eine Wache, kein Geschichtenerzähler");
    -- Quest
    AddTraderTrigger("Litios","Oh you knowss Litioss? He leftss the dormitory a whiless back. Ssaid he wantedss to go to tavernss for a drinkss");
    AddCondition("qpg","=",0);
    AddCondition("lang","english");
    AddConsequence("qpg","=",1);
    AddTraderTrigger("Litios","Oh ihr kenntss Litioss? Er hatss den Sschlafssaal vor einer Weile verlassssen. Sssagte er wollte in die Taverne für einen Drinkss");
    AddCondition("qpg","=",0);
    AddCondition("lang","german");
    AddConsequence("qpg","=",1);
    AddTraderTrigger("training","Youss too weak to train withss me, but I canss teach youss something about fightingss. What weapon type do you wantss to know more aboutss?");
    AddCondition("qpg","=",1);
    AddCondition("lang","english");
    AddConsequence("qpg","=",2);
    AddTraderTrigger("training","Du zu sschwach um mit mir zzu trainierenss, aber ich kann dirss etwass beibringenss über Kampf. Überss welchen Waffentyp willssst du mehr wisssen?");
    AddCondition("qpg","=",1);
    AddCondition("lang","german");
    AddConsequence("qpg","=",2);
    AddTraderTrigger("fight","You are a fighter? Let Zssarkes teach youss something about weapons, alright? What weapon type you wantss to know more aboutss?");
    AddAdditionalTrigger("combat");
    AddCondition("qpg","=",1);
    AddConsequence("qpg","=",2);
    AddTraderTrigger("kampf","Ihr sseid Kämpfer? Lass dir von Zssarkes noch etwass über Waffenss beibringenss, in Ordnungss? Überss welchen Waffentyp willssst du mehr wissen?");
    AddCondition("qpg","=",1);
    AddConsequence("qpg","=",2);
    AddTraderTrigger("learn puncture","#me rattles on about daggers and other puncture weapons and how to use them. ");
    AddCondition("qpg","=",2);
    AddCondition("skill","punctureweapons","=<",20);
    AddConsequence("qpg","=",3);
    AddConsequence("skill","fighting","punctureweapons","+",5);
    AddConsequence("inform","Youhavethefeelingthatyou'velearntalottoday.");
    AddTraderTrigger("stichwaffen lernen","#me erklärt viel über Dolche und andere Stichwaffen und wie man diese benutzt.");
    AddCondition("qpg","=",2);
    AddCondition("skill","punctureweapons","=<",20);
    AddConsequence("qpg","=",3);
    AddConsequence("skill","fighting","punctureweapons","+",5);
    AddConsequence("inform","DuhastdasGefühlalshättestduheutevielgelernt.");
    AddTraderTrigger("learn slashing","#me rattles on about sowrds and waraxes and how to use them.");
    AddCondition("qpg","=",2);
    AddCondition("skill","slashingweapons","=<",20);
    AddConsequence("qpg","=",3);
    AddConsequence("skill","fighting","slashingweapons","+",5);
    AddConsequence("inform","Youhavethefeelingthatyou'velearntalottoday.");
    AddTraderTrigger("hiebwaffen lernen","#me erklärt viel über Schwerter und Kriegsäxte und wie man diese benutzt.");
    AddCondition("qpg","=",2);
    AddCondition("skill","slashingweapons","=<",20);
    AddConsequence("qpg","=",3);
    AddConsequence("skill","fighting","slashingweapons","+",5);
    AddConsequence("inform","DuhastdasGefühlalshättestduheutevielgelernt.");
    AddTraderTrigger("learn concussion","#me rattles on about maces and warhammer and how to use them.");
    AddCondition("qpg","=",2);
    AddCondition("skill","concussionweapons","=<",20);
    AddConsequence("qpg","=",3);
    AddConsequence("skill","fighting","cucussionweapons","+",5);
    AddConsequence("inform","Youhavethefeelingthatyou'velearntalottoday.");
    AddTraderTrigger("schlagwaffen lernen","#me erklärt viel über Streitkolben und Kriegshämmer und wie man diese benutzt. ");
    AddCondition("qpg","=",2);
    AddCondition("skill","concussionweapons","=<",20);
    AddConsequence("qpg","=",3);
    AddConsequence("skill","fighting","concussionweapons","+",5);
    AddConsequence("inform","DuhastdasGefühlalshättestduheutevielgelernt.");
    AddTraderTrigger("learn distance","#me rattles on about bows and slings and how to use them. ");
    AddCondition("qpg","=",2);
    AddCondition("skill","distanceweapons","=<",20);
    AddConsequence("qpg","=",3);
    AddConsequence("skill","fighting","distanceweapons","+",5);
    AddConsequence("inform","Youhavethefeelingthatyou'velearntalottoday.");
    AddTraderTrigger("schusswaffen lernen","#me erklärt viel über Bögen und Schlingen und wie man diese benutzt.");
    AddCondition("qpg","=",2);
    AddCondition("skill","distanceweapons","=<",20);
    AddConsequence("qpg","=",3);
    AddConsequence("skill","fighting","distanceweapons","+",5);
    AddConsequence("inform","DuhastdasGefühlalshättestduheutevielgelernt.");
    AddTraderTrigger("learn puncture","You seemss rather skilled in the art of fightingss, I cannotss teachss you anythingss");
    AddCondition("qpg","=",2);
    AddCondition("skill","punctureweapons",">",20);
    AddTraderTrigger("stichwaffen lernen","Ihr ssseht geübt auss in der Kunst desss Kämpfenss, ich könnenss euch nichtss beibringenss");
    AddCondition("qpg","=",2);
    AddCondition("skill","punctureweapons",">",20);
    AddTraderTrigger("learn slashing","You seemss rather skilled in the art of fightingss, I cannotss teachss you anythingss");
    AddCondition("qpg","=",2);
    AddCondition("skill","slashingweapons",">",20);
    AddTraderTrigger("hiebwaffen lernen","Ihr ssseht geübt auss in der Kunst desss Kämpfenss, ich könnenss euch nichtss beibringenss");
    AddCondition("qpg","=",2);
    AddCondition("skill","slashingweapons",">",20);
    AddTraderTrigger("learn concussion","You seemss rather skilled in the art of fightingss, I cannotss teachss you anythingss");
    AddCondition("qpg","=",2);
    AddCondition("skill","concussionweapons",">",20);
    AddTraderTrigger("schlagwaffen lernen","Ihr ssseht geübt auss in der Kunst desss Kämpfenss, ich könnenss euch nichtss beibringenss");
    AddCondition("qpg","=",2);
    AddCondition("skill","concussionweapons",">",20);
    AddTraderTrigger("learn distance","You seemss rather skilled in the art of fightingss, I cannotss teachss you anythingss");
    AddCondition("qpg","=",2);
    AddCondition("skill","distanceweapons",">",20);
    AddTraderTrigger("schusswaffen lernen","Ihr ssseht geübt auss in der Kunst desss Kämpfenss, ich könnenss euch nichtss beibringenss");
    AddCondition("qpg","=",2);
    AddCondition("skill","distanceweapons",">",20);
    -- Weapon types
    AddTraderTrigger("weapon type","There are four typesss of weaponss: Puncture, slashing, concussion and distance.");
    AddTraderTrigger("waffentyp","Esss gibt vier versschiedene Typenss von Waffenss: Stich- , Hieb- , Schlag-  und Schusswaffenss");
    AddTraderTrigger("puncture","Daggersss are the mossst famouss memberss of the puncture weaponsss");
    AddTraderTrigger("stichwaffen","Dolche ssind die berühmtesssten Mitgliederss der Sstichwaffensss");
    AddAdditionalTrigger("stich");
    AddAdditionalTrigger("stichwaffe");
    AddTraderTrigger("slashing","Swordss and waraxess are exampless for slashing weaponss");
    AddTraderTrigger("hiebwaffen","Sschwerterss und Kriegssäxtess sind Beispieless für Hiebwaffenss");
    AddAdditionalTrigger("hieb");
    AddAdditionalTrigger("hiebwaffe");
    AddTraderTrigger("concussion","Macesss and warhammer count asss concussion weaponss");
    AddTraderTrigger("schlagwaffen","Streitkolbenss und Kriegsshämmer zzählen als Schlagwaffenss");
    AddAdditionalTrigger("schlag");
    AddAdditionalTrigger("schlagwaffe");
    AddTraderTrigger("distance","Distance weaponss are normally bowss and slingss");
    AddTraderTrigger("schusswaffen","Schusswaffenss sind normalss Bögenss und Schleudernss");
    AddAdditionalTrigger("schuss");
    AddAdditionalTrigger("schusswaffe");
    -- leaders, faction and politics
    AddTraderTrigger("cadomyr","Cadomyr iss my hometown and I protectsss it with my life. That'ss why I joined the guardss to give somethingss back to town. Our queen is good to uss and we do what she wantss");
    AddCondition("lang","english");
    AddTraderTrigger("cadomyr","Cadomyr issst meine Heimat und ich besschütze ssie mit meinem Lebenss. Desswegen bin ich auch der Wache beigetretensss, um der Stadt etwass zurückzugeben. Unsere Königin isst gut zzu unss und wir machen, wass ssie will.");
    AddCondition("lang","german");
    AddTraderTrigger("runewick","Runewick? Sss.. the town has some nice waterss and meadowss as far as I know, but knowledge is more worth than honorss there. Is dangerousss...");
    AddCondition("lang","english");
    AddTraderTrigger("runewick","Runewick? Sss.. die Stadt hat schöness Wasser und Weideland soweit ich weißss, aber Wissen isst mehr Wert alss Ehre dort. Das ist gefährlichss...");
    AddCondition("lang","german");
    AddTraderTrigger("galmair","Banditsss, robberss and villainss. That'ss where money and liess are the mosst important goodss. I don't like that place.");
    AddCondition("lang","english");
    AddTraderTrigger("galmair","Banditen, Räuberss und Schufte. Dort sind Geld und Lügen die wichtigsten Warenss. Ich mag den Ortss nicht.");
    AddCondition("lang","german");
    AddTraderTrigger("queen","Queen Rosaline is good to uss and I feelss honored to be member of her palaceguardss. The good god mother Zelphia watchess over her.");
    AddAdditionalTrigger("rosaline edwards");
    AddCondition("lang","english");
    AddTraderTrigger("königin","Königin Rosaline ist gut zu uns und ich fühle mich geehrt dasss ich Mitglied ihrer Palassstwache bin. Die gute Gottmutter Zelphia wacht über ihrss.");
    AddAdditionalTrigger("rosaline edwards");
    AddCondition("lang","german");
    AddTraderTrigger("archmage","Archmage Morgan isss the leader of Runewick. He is studying much and gatherss knowledge about everything. Wise men he iss but weakss.");
    AddAdditionalTrigger("Elvaine Morgan");
    AddCondition("lang","english");
    AddTraderTrigger("erzmagier","Erzmagier Morgan issst der Anführer von Runewick. Er studiert viel und ssammelt Wisssen über alless. Ein weiser Mann er issst aber schwach.");
    AddAdditionalTrigger("Elvaine Morgan");
    AddCondition("lang","german");
    AddTraderTrigger("Valerio Guilianni","Guilianni is scum, nothing more. He hasss no honor and he'll neverss come to great sea of mother Zelphia.");
    AddCondition("lang","english");
    AddTraderTrigger("Valerio Guilianni","Guilianni ist Abschaumss, mehr nicht. Er hat keiness Ehre und er wird niemalss zu großem Meer von Mutter Zelphia kommenss.");
    AddCondition("lang","german");
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
