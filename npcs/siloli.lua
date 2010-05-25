-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-413, -145, 0,6,false,'Siloli','npc_siloli.lua',0);

dofile("npc_autonpcfunctions.lua")

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
-- comes from trader with qs=2
-- qs=3: can you proove?
-- qs=4: want that children starve?
-- qs=5: half of ham
-- qs=10: finished talking ham, gave something to him
-- qs=11: finished talking, didn't give anything to him, lack of proof.
-- qs=12: finished talking, angry
SetRadius( 10 );
QuestID=557;
    AddTraderTrigger(".+","Geh mir aus den Augen!");
    AddCondition("qpg","=",12);
    AddCondition("lang","german");
    AddCondition("chance",20);
    AddTraderTrigger(".+","Verschwinde, ich will dich nicht mehr sehn!");
    AddCondition("qpg","=",12);
    AddCondition("lang","german");
    AddCondition("chance",25);
    AddTraderTrigger(".+","Mörder meiner Kinder, weg mit dir!");
    AddCondition("qpg","=",12);
    AddCondition("lang","german");
    AddCondition("chance",33);
    AddTraderTrigger(".+","Geh weg!");
    AddCondition("qpg","=",12);
    AddCondition("lang","german");
    AddCondition("chance",50);
    AddTraderTrigger(".+","Was machst du noch hier?");
    AddCondition("qpg","=",12);
    AddCondition("lang","german");
    AddTraderTrigger(".+","Get out of my sight!");
    AddCondition("qpg","=",12);
    AddCondition("lang","english");
    AddCondition("chance",20);
    AddTraderTrigger(".+","Get lost, I don't want to see you anymore!");
    AddCondition("qpg","=",12);
    AddCondition("lang","english");
    AddCondition("chance",25);
    AddTraderTrigger(".+","murderer of my children, go away!");
    AddCondition("qpg","=",12);
    AddCondition("lang","english");
    AddCondition("chance",33);
    AddTraderTrigger(".+","Go away!");
    AddCondition("qpg","=",12);
    AddCondition("lang","english");
    AddCondition("chance",50);
    AddTraderTrigger(".+","Why are you still here?");
    AddCondition("qpg","=",12);
    AddCondition("lang","english");
    AddTraderTrigger("one[ ]*arm","I have two arms, of course!");
    AddTraderTrigger("ein[ ]*arm","Ich habe natürlich zwei Arme!");
    AddTraderTrigger("steal","What should I have stolen?");
    AddConsequence("state","=",3);
    AddCondition("qpg","=",2);
    AddTraderTrigger("stehlen","Was soll ich gestohlen haben?");
    AddConsequence("state","=",3);
    AddCondition("qpg","=",2);
    AddTraderTrigger("thief","What should I have stolen?");
    AddConsequence("state","=",3);
    AddCondition("qpg","=",2);
    AddTraderTrigger("dieb","What should I have stolen?");
    AddConsequence("state","=",3);
    AddCondition("qpg","=",2);
    AddTraderTrigger("ham","You accuse me of stealing ham? That's a bad accusation, can you prove that?");
    AddCondition("state","=",3);
    AddConsequence("state","=",0);
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("schinken","Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
    AddCondition("state","=",3);
    AddConsequence("state","=",0);
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("ham","I should have delivered ham? That would mean that I stole it? That's a bad accusation, can you prove that?");
    AddCondition("state","=",2);
    AddConsequence("state","=",0);
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("schinken","Ich sollte Schinken liefern? Das würde ja heißen, dass ich ihn gestohlen habe! Das ist eine harte Beschuldigung, kannst du das beweisen?");
    AddCondition("state","=",2);
    AddConsequence("state","=",0);
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("wo schinken","Welcher Schinken denn? Wo soll der denn sein?");
    AddCondition("qpg","=",2);
    AddTraderTrigger("gib schinken","Ich soll dir meinen Schinken geben? Wieso?");
    AddConsequence("state","=",1);
    AddCondition("qpg","=",2);
    AddTraderTrigger("give ham","I should give you my ham? Why?");
    AddConsequence("state","=",1);
    AddCondition("qpg","=",2);
    AddTraderTrigger("where ham","Which ham? Where should that ham be?");
    AddCondition("qpg","=",2);
    AddTraderTrigger("schinken gestohlen","Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("schinken genommen","Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("gestohlen","Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
    AddCondition("state","=",1);
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("schinken geklaut","Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("geklaut","Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
    AddCondition("state","=",1);
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("stole ham","You accuse me of stealing ham? That's a bad accusation, can you prove that?");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("took ham","You accuse me of stealing ham? That's a bad accusation, can you prove that?");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("take ham","You accuse me of stealing ham? That's a bad accusation, can you prove that?");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("ham stole","You accuse me of stealing ham? That's a bad accusation, can you prove that?");
    AddCondition("qpg","=",2);
    AddConsequence("qpg","=",3);
    AddTraderTrigger("wo schinken","Ich habe keinen Schinken, wie oft denn noch?");
    AddCondition("qpg","=",11);
    AddTraderTrigger("where ham","I don't have any ham, how often should I repeat that?");
    AddCondition("qpg","=",11);
    AddTraderTrigger("stole ham","I didn't steal any ham!");
    AddCondition("qpg","=",11);
    AddTraderTrigger("ham stole","I didn't steal any ham!");
    AddCondition("qpg","=",11);
    AddTraderTrigger("du schinken gestohlen","Ich habe keinen Schinken gestohlen!");
    AddCondition("qpg","=",11);
    AddTraderTrigger("ja","Oh... nun, ich habe den Schinken, der mir angeboten wurde, genommen, aber kann man das 'Stehlen' nennen? Ich brauche ihn doch für meine Familie! Willst du wirklich, dass meine Kinder hungern?");
    AddCondition("qpg","=",3);
    AddConsequence("qpg","=",4);
    AddTraderTrigger("nein","Na eben. Wenn du's nicht beweisen kannst, dann äußere solche Anschuldigungen besser nicht.");
    AddCondition("qpg","=",3);
    AddConsequence("qpg","=",11);
    AddTraderTrigger("ja","Hast du keine Kinder? Du bist herzlos! Also gut, ich schlage dir ein Geschäft vor: Ich gebe dir die Hälfte des Schinkens, einverstanden?");
    AddCondition("qpg","=",4);
    AddConsequence("qpg","=",5);
    AddTraderTrigger("nein","Na eben, du bist ja doch nicht so herzlos wie ich dachte. Aber ich denke, ich kann dir zwei Stück Schinken abgeben.");
    AddConsequence("item",306,2,333,0);
    AddCondition("qpg","=",4);
    AddConsequence("qpg","=",10);
    AddTraderTrigger("ja","Gut, ich glaube, das ist fair, immerhin hast du ja Beweise. Und bis Übermorgen habe ich sicher im Wald einige Pilze für meine Kinder gesammelt. Hier, der Schinken.");
    AddConsequence("item",306,2,333,0);
    AddCondition("qpg","=",5);
    AddConsequence("qpg","=",10);
    AddTraderTrigger("nein","Du willst wirklich meine Kinder sterben sehen! Hast du denn gar keine Vaterinstinkte?");
    AddCondition("qpg","=",5);
    AddConsequence("qpg","=",6);
    AddCondition("sex","male");
    AddTraderTrigger("nein","Du willst wirklich meine Kinder sterben sehen! Hast du denn gar keine Mutterinstinkte?");
    AddCondition("qpg","=",5);
    AddConsequence("qpg","=",6);
    AddCondition("sex","female");
    AddTraderTrigger("doch","Na eben. Ich gebe dir sechs Stück Schinken, dann bekommt jedes meiner Kinder noch ein halbes Stück.");
    AddConsequence("item",306,6,333,0);
    AddCondition("qpg","=",6);
    AddConsequence("qpg","=",10);
    AddTraderTrigger("ja","Na eben. Ich gebe dir sechs Stück Schinken, dann bekommt jedes meiner Kinder noch ein halbes Stück.");
    AddConsequence("item",306,6,333,0);
    AddCondition("qpg","=",6);
    AddConsequence("qpg","=",10);
    AddTraderTrigger("nein","Nun gut, du erbarmungsloses Etwas. Ich werde dir eine Einladung zur Beerdigung meiner Kinder schicken... Hier, dein verdammter Schinken! Und jetzt geh mir aus den Augen!");
    AddConsequence("item",306,10,333,0);
    AddCondition("qpg","=",6);
    AddConsequence("qpg","=",12);
    AddTraderTrigger("yes","Oh... well, I took that ham that someone wanted to give to me, but can you consider that 'stealing'? I need it for my family! Or do you want to see my children starving?");
    AddCondition("qpg","=",3);
    AddConsequence("qpg","=",4);
    AddTraderTrigger("no","See? If you can't prove it, you shouldn't speak our such bad accusations.");
    AddCondition("qpg","=",3);
    AddConsequence("qpg","=",11);
    AddTraderTrigger("yes","Don't you have children? You are so heartless! Well, I propose a deal: I'll give you half of my ham, can you accept that?");
    AddCondition("qpg","=",4);
    AddConsequence("qpg","=",5);
    AddTraderTrigger("no","Ah, you're not so heartless than I thought. I think I can give you two pieces of my ham.");
    AddConsequence("item",306,2,333,0);
    AddCondition("qpg","=",4);
    AddConsequence("qpg","=",10);
    AddTraderTrigger("yes","Good, I think that's fair enough, I mean, you have a proof. I will surely find some mushrooms within the next days to feed my children. Here you are.");
    AddConsequence("item",306,2,333,0);
    AddCondition("qpg","=",5);
    AddConsequence("qpg","=",10);
    AddTraderTrigger("no","You really want to see my children starve! Don't you have paternal instinkts?");
    AddCondition("qpg","=",5);
    AddConsequence("qpg","=",6);
    AddCondition("sex","male");
    AddTraderTrigger("no","You really want to see my children starve! Don't you have maternal instinkts?");
    AddCondition("qpg","=",5);
    AddConsequence("qpg","=",6);
    AddCondition("sex","female");
    AddTraderTrigger("yes","Very good. I will give you six pieces of my ham, that way my children get half a piece each.");
    AddConsequence("item",306,6,333,0);
    AddCondition("qpg","=",6);
    AddConsequence("qpg","=",10);
    AddTraderTrigger("no","Well, you merciless something! I'll send you invitations for the burial of my children... Here, your damn ham! And now, get lost!");
    AddConsequence("item",306,10,333,0);
    AddCondition("qpg","=",6);
    AddConsequence("qpg","=",12);
    AddTraderTrigger("schinken","Ein wundervoller Genuß, so ein paar Stücke Schinken können eine ganze Familie einige Tage lang ernähren!");
    AddTraderTrigger("ham","Mmmh, ham, I love it! A few pieces of ham can feed a whole family for some days!");
    AddTraderTrigger("Hafen","Der Hafen? Da war ich als Kind einmal, ich weiß gar nicht genau, wo der ist.");
    AddCondition("qpg","=",11);
    AddTraderTrigger("Hafen","Am Hafen war ich erst unlängst, schöne Gegend!");
    AddCondition("qpg","=",10);
    AddTraderTrigger("Hafen","Jaja, der Hafen. Da gibt es Schiffe und Wasser, nicht?");
    AddTraderTrigger("Harbo[u]+r","The harbor? I once was there, as a child. I can't even remember where it was.");
    AddCondition("qpg","=",11);
    AddTraderTrigger("Harbo[u]+r","I visited the harbor recently, nice spot there!");
    AddCondition("qpg","=",10);
    AddTraderTrigger("Harbo[u]+r","Yes, the harbor. There are ships and water, isn't it?");
    AddTraderTrigger("I am","Greetings, %CHARNAME, nice to meet you.");
    AddTraderTrigger("I'm","Greetings, %CHARNAME, nice to meet you.");
    AddTraderTrigger("Ich bin","Seid gegrüßt, %CHARNAME, schön euch zu treffen.");
    AddTraderTrigger("auf bald","Gehabt euch wohl!");
    AddTraderTrigger("beruf","Ich bin ein einfacher Bauer, nur ein Bauer.");
    AddTraderTrigger("buy","I don't buy anything.");
    AddTraderTrigger("bye","Farewell!");
    AddTraderTrigger("dein name","Ich heiße %NPCNAME.");
    AddTraderTrigger("deine aufgabe","Ich bin nur ein Bauer.");
    AddTraderTrigger("eure aufgabe","Ich bin nur ein Bauer.");
    AddTraderTrigger("farewell","Farewell, thanks for visiting me!");
    AddConsequence("talk","end");
    AddTraderTrigger("good day","Hello.");
    AddTraderTrigger("gr[üue]+[sß]+e","Seid gegrüßt!");
    AddTraderTrigger("greetings","Be greeted.");
    AddConsequence("talk","begin");
    AddTraderTrigger("greets","Be greeted.");
    AddTraderTrigger("guten tag","Seid gegrüßt!");
    AddCondition("idlestate","idle");
    AddTraderTrigger("guten tag","Ich rede später mit dir.");
    AddCondition("idlestate","busy");
    AddTraderTrigger("hail","Be greeted.");
    AddTraderTrigger("hallo","Seid gegrüßt!");
    AddCondition("lang","german");
    AddTraderTrigger("hallo","Be greeted.");
    AddCondition("lang","english");
    AddTraderTrigger("helfen","Wenn du Hilfe brauchst, geh nach Troll's Bane.");
    AddTraderTrigger("hello","Be greeted.");
    AddTraderTrigger("help","If you need help, visit Troll's Bane.");
    AddTraderTrigger("hilfe","Wenn du Hilfe brauchst, geh nach Troll's Bane.");
    AddTraderTrigger("how are you","I am fine, thanks. How are you?");
    AddTraderTrigger("job","I am just a simple farmer.");
    AddTraderTrigger("kaufen","Ich kaufe nichts.");
    AddTraderTrigger("mein name","Sehr angenehm.");
    AddTraderTrigger("my name","Nice to meet you.");
    AddTraderTrigger("sell","I don't sell anything");
    AddTraderTrigger("verkaufen","Ich handle nicht.");
    AddTraderTrigger("was kaufst","Ich handle nicht.");
    AddTraderTrigger("was tust du","Was ein Bauer eben so tut.");
    AddTraderTrigger("was tut ihr","Was ein Bauer eben so tut.");
    AddTraderTrigger("was verkauf[s]*t","Ich handle nicht.");
    AddTraderTrigger("wer seid","Ich bin %NPCNAME.");
    AddTraderTrigger("what buy","I don't trade");
    AddTraderTrigger("what sell","I don't trade");
    AddTraderTrigger("what you do","I just do what a farmer does.");
    AddTraderTrigger("who","I am %NPCNAME.");
    AddTraderTrigger("wie geht es","Danke, mir geht es gut.");
    AddTraderTrigger("wie hei[sß]+t du","Ich heiße %NPCNAME.");
    AddTraderTrigger("you name","My name is %NPCNAME.");
    AddTraderTrigger("carrier","What carrier? What should I have delivered?");
    AddConsequence("state","=",2);
    AddCondition("qpg","=",2);
    AddTraderTrigger("bote","Was für ein Bote? Was soll ich denn überbracht haben?");
    AddConsequence("state","=",2);
    AddCondition("qpg","=",2);
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;
    
    increaseLangSkill(TradSpeakLang)
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

function lookAtNpc(Char, mode)
    if initLook==nil then
        output={};
        output[0]="Ein verdächtig wirkender, magerer Kerl, der nervöse Blicke um sich wirft. Ein abgenagter Knochen lugt aus seiner Hosentasche.";
        output[1]="A suspicious, thin guy glancing around nervously. You can see a bone peeking out of his pocket.";
        initLook=1;
    end
    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end