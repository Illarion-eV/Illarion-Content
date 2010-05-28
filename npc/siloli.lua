-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-413, -145, 0,6,false,'Siloli','npc_siloli.lua',0);

require("npc.base.autonpcfunctions")
module("npc.siloli")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end
    
    npc.base.autonpcfunctions.InitTalkLists();
    
    
    -- ********* START DYNAMIC PART ********
-- comes from trader with qs=2
-- qs=3: can you proove?
-- qs=4: want that children starve?
-- qs=5: half of ham
-- qs=10: finished talking ham, gave something to him
-- qs=11: finished talking, didn't give anything to him, lack of proof.
-- qs=12: finished talking, angry
npc.base.autonpcfunctions.SetRadius( 10 );
QuestID=557;
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Geh mir aus den Augen!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",12);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("chance",20);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Verschwinde, ich will dich nicht mehr sehn!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",12);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("chance",25);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Mörder meiner Kinder, weg mit dir!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",12);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("chance",33);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Geh weg!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",12);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("chance",50);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Was machst du noch hier?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",12);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Get out of my sight!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",12);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("chance",20);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Get lost, I don't want to see you anymore!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",12);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("chance",25);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","murderer of my children, go away!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",12);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("chance",33);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Go away!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",12);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("chance",50);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Why are you still here?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",12);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("one[ ]*arm","I have two arms, of course!");
    npc.base.autonpcfunctions.AddTraderTrigger("ein[ ]*arm","Ich habe natürlich zwei Arme!");
    npc.base.autonpcfunctions.AddTraderTrigger("steal","What should I have stolen?");
    npc.base.autonpcfunctions.AddConsequence("state","=",3);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("stehlen","Was soll ich gestohlen haben?");
    npc.base.autonpcfunctions.AddConsequence("state","=",3);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("thief","What should I have stolen?");
    npc.base.autonpcfunctions.AddConsequence("state","=",3);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("dieb","What should I have stolen?");
    npc.base.autonpcfunctions.AddConsequence("state","=",3);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("ham","You accuse me of stealing ham? That's a bad accusation, can you prove that?");
    npc.base.autonpcfunctions.AddCondition("state","=",3);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("schinken","Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
    npc.base.autonpcfunctions.AddCondition("state","=",3);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("ham","I should have delivered ham? That would mean that I stole it? That's a bad accusation, can you prove that?");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("schinken","Ich sollte Schinken liefern? Das würde ja heißen, dass ich ihn gestohlen habe! Das ist eine harte Beschuldigung, kannst du das beweisen?");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("wo schinken","Welcher Schinken denn? Wo soll der denn sein?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("gib schinken","Ich soll dir meinen Schinken geben? Wieso?");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("give ham","I should give you my ham? Why?");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("where ham","Which ham? Where should that ham be?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("schinken gestohlen","Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("schinken genommen","Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("gestohlen","Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("schinken geklaut","Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("geklaut","Ich soll Schinken gestohlen haben? Das ist eine harte Beschuldigung, kannst du das beweisen?");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("stole ham","You accuse me of stealing ham? That's a bad accusation, can you prove that?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("took ham","You accuse me of stealing ham? That's a bad accusation, can you prove that?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("take ham","You accuse me of stealing ham? That's a bad accusation, can you prove that?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("ham stole","You accuse me of stealing ham? That's a bad accusation, can you prove that?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("wo schinken","Ich habe keinen Schinken, wie oft denn noch?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",11);
    npc.base.autonpcfunctions.AddTraderTrigger("where ham","I don't have any ham, how often should I repeat that?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",11);
    npc.base.autonpcfunctions.AddTraderTrigger("stole ham","I didn't steal any ham!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",11);
    npc.base.autonpcfunctions.AddTraderTrigger("ham stole","I didn't steal any ham!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",11);
    npc.base.autonpcfunctions.AddTraderTrigger("du schinken gestohlen","Ich habe keinen Schinken gestohlen!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",11);
    npc.base.autonpcfunctions.AddTraderTrigger("ja","Oh... nun, ich habe den Schinken, der mir angeboten wurde, genommen, aber kann man das 'Stehlen' nennen? Ich brauche ihn doch für meine Familie! Willst du wirklich, dass meine Kinder hungern?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npc.base.autonpcfunctions.AddTraderTrigger("nein","Na eben. Wenn du's nicht beweisen kannst, dann äußere solche Anschuldigungen besser nicht.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",11);
    npc.base.autonpcfunctions.AddTraderTrigger("ja","Hast du keine Kinder? Du bist herzlos! Also gut, ich schlage dir ein Geschäft vor: Ich gebe dir die Hälfte des Schinkens, einverstanden?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npc.base.autonpcfunctions.AddTraderTrigger("nein","Na eben, du bist ja doch nicht so herzlos wie ich dachte. Aber ich denke, ich kann dir zwei Stück Schinken abgeben.");
    npc.base.autonpcfunctions.AddConsequence("item",306,2,333,0);
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("ja","Gut, ich glaube, das ist fair, immerhin hast du ja Beweise. Und bis Übermorgen habe ich sicher im Wald einige Pilze für meine Kinder gesammelt. Hier, der Schinken.");
    npc.base.autonpcfunctions.AddConsequence("item",306,2,333,0);
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("nein","Du willst wirklich meine Kinder sterben sehen! Hast du denn gar keine Vaterinstinkte?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("nein","Du willst wirklich meine Kinder sterben sehen! Hast du denn gar keine Mutterinstinkte?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    npc.base.autonpcfunctions.AddTraderTrigger("doch","Na eben. Ich gebe dir sechs Stück Schinken, dann bekommt jedes meiner Kinder noch ein halbes Stück.");
    npc.base.autonpcfunctions.AddConsequence("item",306,6,333,0);
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("ja","Na eben. Ich gebe dir sechs Stück Schinken, dann bekommt jedes meiner Kinder noch ein halbes Stück.");
    npc.base.autonpcfunctions.AddConsequence("item",306,6,333,0);
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("nein","Nun gut, du erbarmungsloses Etwas. Ich werde dir eine Einladung zur Beerdigung meiner Kinder schicken... Hier, dein verdammter Schinken! Und jetzt geh mir aus den Augen!");
    npc.base.autonpcfunctions.AddConsequence("item",306,10,333,0);
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",12);
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Oh... well, I took that ham that someone wanted to give to me, but can you consider that 'stealing'? I need it for my family! Or do you want to see my children starving?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npc.base.autonpcfunctions.AddTraderTrigger("no","See? If you can't prove it, you shouldn't speak our such bad accusations.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",3);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",11);
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Don't you have children? You are so heartless! Well, I propose a deal: I'll give you half of my ham, can you accept that?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",5);
    npc.base.autonpcfunctions.AddTraderTrigger("no","Ah, you're not so heartless than I thought. I think I can give you two pieces of my ham.");
    npc.base.autonpcfunctions.AddConsequence("item",306,2,333,0);
    npc.base.autonpcfunctions.AddCondition("qpg","=",4);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Good, I think that's fair enough, I mean, you have a proof. I will surely find some mushrooms within the next days to feed my children. Here you are.");
    npc.base.autonpcfunctions.AddConsequence("item",306,2,333,0);
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("no","You really want to see my children starve! Don't you have paternal instinkts?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npc.base.autonpcfunctions.AddCondition("sex","male");
    npc.base.autonpcfunctions.AddTraderTrigger("no","You really want to see my children starve! Don't you have maternal instinkts?");
    npc.base.autonpcfunctions.AddCondition("qpg","=",5);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",6);
    npc.base.autonpcfunctions.AddCondition("sex","female");
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Very good. I will give you six pieces of my ham, that way my children get half a piece each.");
    npc.base.autonpcfunctions.AddConsequence("item",306,6,333,0);
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("no","Well, you merciless something! I'll send you invitations for the burial of my children... Here, your damn ham! And now, get lost!");
    npc.base.autonpcfunctions.AddConsequence("item",306,10,333,0);
    npc.base.autonpcfunctions.AddCondition("qpg","=",6);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",12);
    npc.base.autonpcfunctions.AddTraderTrigger("schinken","Ein wundervoller Genuß, so ein paar Stücke Schinken können eine ganze Familie einige Tage lang ernähren!");
    npc.base.autonpcfunctions.AddTraderTrigger("ham","Mmmh, ham, I love it! A few pieces of ham can feed a whole family for some days!");
    npc.base.autonpcfunctions.AddTraderTrigger("Hafen","Der Hafen? Da war ich als Kind einmal, ich weiß gar nicht genau, wo der ist.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",11);
    npc.base.autonpcfunctions.AddTraderTrigger("Hafen","Am Hafen war ich erst unlängst, schöne Gegend!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("Hafen","Jaja, der Hafen. Da gibt es Schiffe und Wasser, nicht?");
    npc.base.autonpcfunctions.AddTraderTrigger("Harbo[u]+r","The harbor? I once was there, as a child. I can't even remember where it was.");
    npc.base.autonpcfunctions.AddCondition("qpg","=",11);
    npc.base.autonpcfunctions.AddTraderTrigger("Harbo[u]+r","I visited the harbor recently, nice spot there!");
    npc.base.autonpcfunctions.AddCondition("qpg","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("Harbo[u]+r","Yes, the harbor. There are ships and water, isn't it?");
    npc.base.autonpcfunctions.AddTraderTrigger("I am","Greetings, %CHARNAME, nice to meet you.");
    npc.base.autonpcfunctions.AddTraderTrigger("I'm","Greetings, %CHARNAME, nice to meet you.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ich bin","Seid gegrüßt, %CHARNAME, schön euch zu treffen.");
    npc.base.autonpcfunctions.AddTraderTrigger("auf bald","Gehabt euch wohl!");
    npc.base.autonpcfunctions.AddTraderTrigger("beruf","Ich bin ein einfacher Bauer, nur ein Bauer.");
    npc.base.autonpcfunctions.AddTraderTrigger("buy","I don't buy anything.");
    npc.base.autonpcfunctions.AddTraderTrigger("bye","Farewell!");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Ich heiße %NPCNAME.");
    npc.base.autonpcfunctions.AddTraderTrigger("deine aufgabe","Ich bin nur ein Bauer.");
    npc.base.autonpcfunctions.AddTraderTrigger("eure aufgabe","Ich bin nur ein Bauer.");
    npc.base.autonpcfunctions.AddTraderTrigger("farewell","Farewell, thanks for visiting me!");
    npc.base.autonpcfunctions.AddConsequence("talk","end");
    npc.base.autonpcfunctions.AddTraderTrigger("good day","Hello.");
    npc.base.autonpcfunctions.AddTraderTrigger("gr[üue]+[sß]+e","Seid gegrüßt!");
    npc.base.autonpcfunctions.AddTraderTrigger("greetings","Be greeted.");
    npc.base.autonpcfunctions.AddConsequence("talk","begin");
    npc.base.autonpcfunctions.AddTraderTrigger("greets","Be greeted.");
    npc.base.autonpcfunctions.AddTraderTrigger("guten tag","Seid gegrüßt!");
    npc.base.autonpcfunctions.AddCondition("idlestate","idle");
    npc.base.autonpcfunctions.AddTraderTrigger("guten tag","Ich rede später mit dir.");
    npc.base.autonpcfunctions.AddCondition("idlestate","busy");
    npc.base.autonpcfunctions.AddTraderTrigger("hail","Be greeted.");
    npc.base.autonpcfunctions.AddTraderTrigger("hallo","Seid gegrüßt!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("hallo","Be greeted.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("helfen","Wenn du Hilfe brauchst, geh nach Troll's Bane.");
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Be greeted.");
    npc.base.autonpcfunctions.AddTraderTrigger("help","If you need help, visit Troll's Bane.");
    npc.base.autonpcfunctions.AddTraderTrigger("hilfe","Wenn du Hilfe brauchst, geh nach Troll's Bane.");
    npc.base.autonpcfunctions.AddTraderTrigger("how are you","I am fine, thanks. How are you?");
    npc.base.autonpcfunctions.AddTraderTrigger("job","I am just a simple farmer.");
    npc.base.autonpcfunctions.AddTraderTrigger("kaufen","Ich kaufe nichts.");
    npc.base.autonpcfunctions.AddTraderTrigger("mein name","Sehr angenehm.");
    npc.base.autonpcfunctions.AddTraderTrigger("my name","Nice to meet you.");
    npc.base.autonpcfunctions.AddTraderTrigger("sell","I don't sell anything");
    npc.base.autonpcfunctions.AddTraderTrigger("verkaufen","Ich handle nicht.");
    npc.base.autonpcfunctions.AddTraderTrigger("was kaufst","Ich handle nicht.");
    npc.base.autonpcfunctions.AddTraderTrigger("was tust du","Was ein Bauer eben so tut.");
    npc.base.autonpcfunctions.AddTraderTrigger("was tut ihr","Was ein Bauer eben so tut.");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf[s]*t","Ich handle nicht.");
    npc.base.autonpcfunctions.AddTraderTrigger("wer seid","Ich bin %NPCNAME.");
    npc.base.autonpcfunctions.AddTraderTrigger("what buy","I don't trade");
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","I don't trade");
    npc.base.autonpcfunctions.AddTraderTrigger("what you do","I just do what a farmer does.");
    npc.base.autonpcfunctions.AddTraderTrigger("who","I am %NPCNAME.");
    npc.base.autonpcfunctions.AddTraderTrigger("wie geht es","Danke, mir geht es gut.");
    npc.base.autonpcfunctions.AddTraderTrigger("wie hei[sß]+t du","Ich heiße %NPCNAME.");
    npc.base.autonpcfunctions.AddTraderTrigger("you name","My name is %NPCNAME.");
    npc.base.autonpcfunctions.AddTraderTrigger("carrier","What carrier? What should I have delivered?");
    npc.base.autonpcfunctions.AddConsequence("state","=",2);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("bote","Was für ein Bote? Was soll ich denn überbracht haben?");
    npc.base.autonpcfunctions.AddConsequence("state","=",2);
    npc.base.autonpcfunctions.AddCondition("qpg","=",2);
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;
    
    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
    thisNPC.activeLanguage=TradStdLang;
    
end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npc.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npc.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if npc.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
            npc.base.autonpcfunctions.TellSmallTalk(message,originator);
        else
            npc.base.autonpcfunctions.Confused(
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