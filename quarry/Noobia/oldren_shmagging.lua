-- INSERT INTO npc VALUES (nextval('npc_seq'),2,-67,-104,0,4,false,'Oldren Shmagging','npc_oldren_shmagging.lua',0);
-- NPC craftmaster for newbie island
-- cooking and baking

require("npc.base.autonpcfunctions")
module("npc.oldren_shmagging", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Dont you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    -- general
    -- small talk
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Hello my friend! I am "..thisNPC.name..", a cook and a baker. I can teach you some things of my craft.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hiho");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("hallo","Hallo mein Freund! Ich bin "..thisNPC.name..", ein Koch und Bäcker. Ich kann dir ein paar Dinge meines Handwerks beibringen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][sß]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hiho");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Hello my friend! Back again, eh? Hm... Where did we stop?.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hiho");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("hallo","Hallo mein Freund! Na, wieder zurück? Hm... Wo waren wir stehen geblieben?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][sß]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hiho");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("hallo","Hallo mein Freund! Na, wieder zurück? Hm... Wo waren wir stehen geblieben?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][sß]");
    npc.base.autonpcfunctions.AddTraderTrigger("who you","I am "..thisNPC.name..", a cook and a baker. I can teach you some things of my craft.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what you");
    npc.base.autonpcfunctions.AddTraderTrigger("wer du","Ich bin "..thisNPC.name..", ein Koch und Bäcker. Ich kann dir ein paar Dinge meines Handwerks beibringen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was ihr");
    npc.base.autonpcfunctions.AddTraderTrigger("bye","Bye, bye.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("farewell");
    npc.base.autonpcfunctions.AddAdditionalTrigger("be well");
    npc.base.autonpcfunctions.AddAdditionalText("Be well, my friend!");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell, until we meet again.");
    npc.base.autonpcfunctions.AddTraderTrigger("tsch[üu][ßs]","Auf Wiedersehen, mein Freund!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("tschue[sß]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("leb wohl");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wiederseh");
    npc.base.autonpcfunctions.AddAdditionalTrigger("auf bald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("bis bald");
    npc.base.autonpcfunctions.AddAdditionalText("Tschüss auch.");
    npc.base.autonpcfunctions.AddAdditionalText("Leb wohl, bis zum nächsten Mal.");
    -- start teaching
    npc.base.autonpcfunctions.AddTraderTrigger("cook","So you want to learn some things about cooking and baking, right?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("bake");
    npc.base.autonpcfunctions.AddAdditionalTrigger("craft");
    npc.base.autonpcfunctions.AddAdditionalTrigger("teach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("learn");
	npc.base.autonpcfunctions.AddAdditionalTrigger("help");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("koch","So so, du willst also ein paar Dinge über Kochen und Backen lernen, richtig?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("back");
    npc.base.autonpcfunctions.AddAdditionalTrigger("handwerk");
    npc.base.autonpcfunctions.AddAdditionalTrigger("lern");
    npc.base.autonpcfunctions.AddAdditionalTrigger("lehr");
	npc.base.autonpcfunctions.AddAdditionalTrigger("hilf");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    -- STATE 1
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Very nice. Firstly, take this cooking spoon and this bucket. Go to the water with the bucket in your hands and 'use' it with the water. Come again when you have filled the bucket.");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("item",227,1,999,0);
    npc.base.autonpcfunctions.AddConsequence("item",51,1,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("ja","Sehr schön. Nimm erstmal diesen Kochlöffel und diesen Eimer. Geh zum Wasser mit dem Eimer in deinen Händen und 'benutze' ihn mit dem Wasser. Komm wieder, wenn du den Eimer gefüllt hast.");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("item",227,1,999,0);
    npc.base.autonpcfunctions.AddConsequence("item",51,1,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("no","But why are you here if you don't want to learn anything? Well, you can leave through the portal you just used at any time.");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("nein","Aber warum bist du dann hier, wenn du nichts lernen willst? Nunja, du kannst wieder durch das Portal gehen, das du eben benutzt hast, wann immer du willst.");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    -- STATE 2
    npc.base.autonpcfunctions.AddTraderTrigger("spoon","You need another cooking spoon, right? Here you are.");
    npc.base.autonpcfunctions.AddCondition("state",">=",2);
    npc.base.autonpcfunctions.AddCondition("item",227,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",227,1,999,0);
    npc.base.autonpcfunctions.AddTraderTrigger("l[öo]ffel","Du brauchst einen neuen Kochlöffel, richtig? Hier bitte sehr.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("loeffel");
    npc.base.autonpcfunctions.AddCondition("state",">=",2);
    npc.base.autonpcfunctions.AddCondition("item",227,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",227,1,999,0);
    npc.base.autonpcfunctions.AddTraderTrigger("bucket","You need another bucket, right? Here you are.");
    npc.base.autonpcfunctions.AddCondition("state",">=",2);
    npc.base.autonpcfunctions.AddCondition("item",51,"all","=",0);
    npc.base.autonpcfunctions.AddCondition("item",52,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",51,1,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("eimer","Du brauchst einen neuen Eimer, richtig? Hier bitte sehr.");
    npc.base.autonpcfunctions.AddCondition("state",">=",2);
    npc.base.autonpcfunctions.AddCondition("item",51,"all","=",0);
    npc.base.autonpcfunctions.AddCondition("item",52,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",51,1,333,0);
    -- STATE 3
    npc.base.autonpcfunctions.AddTraderTrigger("pork","You need more pork, right? Here you are.");
    npc.base.autonpcfunctions.AddCondition("state",">=",3);
    npc.base.autonpcfunctions.AddCondition("state","<",10);
    npc.base.autonpcfunctions.AddCondition("item",307,"all","<",3);
    npc.base.autonpcfunctions.AddConsequence("item",307,5,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("fleisch","Du brauchst mehr Schweinefleisch, richtig? Hier bitte sehr.");
    npc.base.autonpcfunctions.AddCondition("state",">=",3);
    npc.base.autonpcfunctions.AddCondition("state","<",10);
    npc.base.autonpcfunctions.AddCondition("item",307,"all","<",3);
    npc.base.autonpcfunctions.AddConsequence("item",307,5,333,0);
	npc.base.autonpcfunctions.AddTraderTrigger("entrail","You need more entrails, right? Here you are.");
    npc.base.autonpcfunctions.AddCondition("state",">=",3);
    npc.base.autonpcfunctions.AddCondition("state","<",10);
    npc.base.autonpcfunctions.AddCondition("item",63,"all","<",3);
    npc.base.autonpcfunctions.AddConsequence("item",63,5,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("eingeweide","Du brauchst mehr Eingeweide, richtig? Hier bitte sehr.");
    npc.base.autonpcfunctions.AddCondition("state",">=",3);
    npc.base.autonpcfunctions.AddCondition("state","<",10);
    npc.base.autonpcfunctions.AddCondition("item",63,"all","<",3);
    npc.base.autonpcfunctions.AddConsequence("item",63,5,333,0);
    -- STATE 10
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Alright, at the very beginning you need flour to make dough. That is made out of grain, but better ask a farmer about milling grain. I give you some bags of flour, place them and a bucket of water at the belt, and a rolling pin. Holding it in your hands and standing in front of the baking house over there, just 'use' that baking house. Come again when you have at least 5 pieces of dough.");
    npc.base.autonpcfunctions.AddCondition("state","=",10);
    npc.base.autonpcfunctions.AddConsequence("state","=",11);
    npc.base.autonpcfunctions.AddConsequence("item",2,10,333,0);
    npc.base.autonpcfunctions.AddConsequence("item",118,1,999,0);
    npc.base.autonpcfunctions.AddTraderTrigger("ja","Nun gut, zu allererst brauchst du Mehl um Teig zu machen. Das wird aus Getreide gemacht, aber frage besser einen Bauern über das Mahlen von Getreide. Ich gebe dir ein paar Säcke mit Mehl, trage sie und einen Eimer mit Wasser am Gürtel, und ein Nudelholz. Halte jenes in der Hand und stelle dich einfach direkt vor den Backofen dort und 'benutze' ihn. Komm wieder, wenn du mindestens 5 Klumpen Teig hast.");
    npc.base.autonpcfunctions.AddCondition("state","=",10);
    npc.base.autonpcfunctions.AddConsequence("state","=",11);
    npc.base.autonpcfunctions.AddConsequence("item",2,10,333,0);
    npc.base.autonpcfunctions.AddConsequence("item",118,1,999,0);
    npc.base.autonpcfunctions.AddTraderTrigger("no","As you want. You can come back whenever you want and continue the lesson about baking.");
    npc.base.autonpcfunctions.AddCondition("state","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("nein","Wie du willst. Du kannst jederzeit wiederkommen und die Lektion über Backen fortsetzen.");
    npc.base.autonpcfunctions.AddCondition("state","=",10);
    -- STATE 11
    npc.base.autonpcfunctions.AddTraderTrigger("flour","You need more flour, right? Here you are.");
    npc.base.autonpcfunctions.AddCondition("state","=",11);
    npc.base.autonpcfunctions.AddCondition("item",2,"all","<",5);
    npc.base.autonpcfunctions.AddConsequence("item",2,10,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("mehl","Du brauchst mehr Mehl, richtig? Hier bitte schön.");
    npc.base.autonpcfunctions.AddCondition("state","=",11);
    npc.base.autonpcfunctions.AddCondition("item",2,"all","<",5);
    npc.base.autonpcfunctions.AddConsequence("item",2,10,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("rolling pin","You need a new rolling pin, right? Here you are.");
    npc.base.autonpcfunctions.AddCondition("state",">=",11);
    npc.base.autonpcfunctions.AddCondition("item",118,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",118,1,999,0);
    npc.base.autonpcfunctions.AddTraderTrigger("nudelholz","Du brauchst ein neues Nudelholz, richtig? Hier bitte schön.");
    npc.base.autonpcfunctions.AddCondition("state",">=",11);
    npc.base.autonpcfunctions.AddCondition("item",118,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",118,1,999,0);
    -- STATE 12
    npc.base.autonpcfunctions.AddTraderTrigger("help","Oh, you have no more dough, right? You don't need to make it again, so I give you 5 new pieces.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("dough");
    npc.base.autonpcfunctions.AddAdditionalTrigger("more");
    npc.base.autonpcfunctions.AddCondition("state","=",12);
    npc.base.autonpcfunctions.AddCondition("item",5,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",5,5,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("hilfe","Oh, du hast keinen Teig mehr, richtig? Du musst es nicht nochmal machen, also gebe ich dir 5 neue Klumpen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("teig");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mehr");
    npc.base.autonpcfunctions.AddCondition("state","=",12);
    npc.base.autonpcfunctions.AddCondition("item",5,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",5,5,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("peel","You need a new peel, right? Here you are.");
    npc.base.autonpcfunctions.AddCondition("state",">=",12);
    npc.base.autonpcfunctions.AddCondition("item",121,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",121,1,999,0);
    npc.base.autonpcfunctions.AddTraderTrigger("ofenschieber","Du brauchst einen neuen Ofenschieber, richtig? Hier bitte schön.");
    npc.base.autonpcfunctions.AddCondition("state",">=",12);
    npc.base.autonpcfunctions.AddCondition("item",121,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",121,1,999,0);
    -- standard explanations
    npc.base.autonpcfunctions.AddTraderTrigger("dough","Dough is made out of flour, which is made out of grain. But I don't know how to mill grain to flour. I am just a baker, not a farmer. If you need flour for one of my tasks, I can give you some bags.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("flour");
    npc.base.autonpcfunctions.AddAdditionalTrigger("grain");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mill");
    npc.base.autonpcfunctions.AddTraderTrigger("teig","Teig wird aus Mehl gemacht, welches wiederrum aus Getreide gemacht wird. Aber ich weiß nicht, wie man Getreide zu Mehl zermahlen kann. Ich bin nur ein Bäcker, kein Bauer. Falls du für eine meiner Aufgaben Mehl brauchst, kann ich dir ein paar Säcke geben.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mehl");
    npc.base.autonpcfunctions.AddAdditionalTrigger("getreide");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mahlen");
    npc.base.autonpcfunctions.AddTraderTrigger("pork","Pork can be cooked to sausages. You always get a pair out of it. Kill a pig. Then you can easily take the pork from the cadaver. But if you need it for one of my tasks, I can give you some pork.");
    npc.base.autonpcfunctions.AddTraderTrigger("fleisch","Schweinefleisch kann zu Würsten gekocht werden. Du bekommst immer gleich ein Paar. Töte ein Schwein. Dann kannst du ganz einfach dessen Fleisch vom Kadaver entfernen. Falls du für eine meiner Aufgaben Schweinefleisch brauchst, kann ich dir auch etwas geben.");
	npc.base.autonpcfunctions.AddTraderTrigger("entrail","Entrails are used to cook sausages. You always get a pair out of it. Kill a pig. Then you can easily take the entrails from the cadaver. But if you need it for one of my tasks, I can give you some entrails.");
    npc.base.autonpcfunctions.AddTraderTrigger("eingeweide","Eingeweide kann zu Würsten gekocht werden. Du bekommst immer gleich ein Paar. Töte ein Schwein. Dann kannst du ganz einfach dessen Eingeweide vom Kadaver entfernen. Falls du für eine meiner Aufgaben Eingeweide brauchst, kann ich dir auch etwas geben.");
    npc.base.autonpcfunctions.AddTraderTrigger("baking house","The baking house is over there, next to the cherry tree. You need a baking house to bake bread, cakes or other delicacies.");
    npc.base.autonpcfunctions.AddTraderTrigger("backofen","Der Backofen ist dort drüben bei dem Kirschbaum. Du brauchst einen Backofen, um Brot, Kuchen und andere Leckereien zu backen.");
    npc.base.autonpcfunctions.AddTraderTrigger("fire","You can cook tasty dishes at any campfire, like the one next to me. Amelia has surely shown you how to spark off a fire. But you can use my one of course");
    npc.base.autonpcfunctions.AddTraderTrigger("feuer","Du kannst an jedem Lagerfeuer, wie das hier neben mir, leckere Gerichte kochen. Amelia hat dir bestimmt gezeigt, wie man eines entfacht. Aber du kannst gern meines benutzen.");
    npc.base.autonpcfunctions.AddTraderTrigger("soup","Concerning cooking, you can choose between two categories: soups or other dishes. For soups you need a soup bowl, for the most other dishes you need a plate - of course not for sausages. Both can be made by carpenters.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("bowl");
    npc.base.autonpcfunctions.AddAdditionalTrigger("plate");
    npc.base.autonpcfunctions.AddAdditionalTrigger("dish");
    npc.base.autonpcfunctions.AddAdditionalTrigger("category");
    npc.base.autonpcfunctions.AddTraderTrigger("suppe","Was das Kochen betrifft, kannst du aus zwei Kategorien wählen: Suppen oder andere Gerichte. Für Suppen brauchst du eine Suppenschüssel, für die meisten anderen Gerichte einen Teller - natürlich nicht für Würste. Beides können Schreiner herstellen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("sch[üu][sß]el");
    npc.base.autonpcfunctions.AddAdditionalTrigger("schue[sß]el");
    npc.base.autonpcfunctions.AddAdditionalTrigger("teller");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gericht");
    npc.base.autonpcfunctions.AddAdditionalTrigger("kategorie");
    npc.base.autonpcfunctions.AddTraderTrigger("spoon","Oh of course you need a cooking spoon and a bucket in order to cook anything. They can be made by carpenters. But if you need them for one of my tasks, I can give you one of each.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("bucket");
    npc.base.autonpcfunctions.AddTraderTrigger("l[öo]ffel","Natürlich brauchst du einen Kochlöffel und einen Eimer, um etwas zu kochen. Beides kann von Schreinern hergestellt werden. Aber falls du sie für eine meiner Aufgaben brauchst, kann ich dir jeweils ein Exemplar geben.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("loeffel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("eimer");
    -- last catch
    -- STATE 1
    npc.base.autonpcfunctions.AddTraderTrigger(".+","I asked if you want to learn something about cooking and baking. Yes or no?");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ich habe gefragt, ob du etwas übers Kochen und Backen lernen willst. Ja oder nein?");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- STATE 2
    npc.base.autonpcfunctions.AddTraderTrigger(".+","You should first fill the bucket with water. Go to the water with the bucket in your hands and 'use' it with the water. Come again when you have filled the bucket.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("item",52,"all","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Du solltest erst den Eimer mit Wasser füllen. Geh zum Wasser mit dem Eimer in deinen Händen und 'benutze' ihn mit dem Wasser. Komm wieder, wenn du den Eimer gefüllt hast.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("item",52,"all","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, you have a full bucket. Now I give you pork and entrails, you'll cook sausages. Stand directly in front of the fire with the spoon in your hands and the pork, entrails and the bucket of water at your belt and 'use' the spoon. You can choose a category, soups -represented by a soup bowl- or other dishes -represented by a plate. Choose the plate and then the sausages. When you are finished or if it doesn't work, just come to me again.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("item",52,"all",">",0);
    npc.base.autonpcfunctions.AddConsequence("state","=",3);
    npc.base.autonpcfunctions.AddConsequence("item",307,5,333,0);
	npc.base.autonpcfunctions.AddConsequence("item",63,5,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ah, du hast einen vollen Eimer. Jetzt gebe ich dir Schweinefleisch und Eingeweide, du wirst Würste kochen. Steh direkt vor das Feuer mit dem Löffel in der Hand und dem Fleisch und dem Eimer mit Wasser am Gürtel und 'benutze' den Löffel. Du kannst eine Kategorie wählen, Suppen -dargestellt durch eine Schüssel- oder andere Gerichte -dargestellt durch einen Teller. Wähle den Teller und dann die Würste. Wenn du fertig bist oder falls es nicht klappt, komm einfach wieder zu mir.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("item",52,"all",">",0);
    npc.base.autonpcfunctions.AddConsequence("state","=",3);
    npc.base.autonpcfunctions.AddConsequence("item",307,5,333,0);
	npc.base.autonpcfunctions.AddConsequence("item",63,5,333,0);
    -- STATE 3
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Come again when you have cooked at least one pair of sausages. Stand directly in front of the fire with the spoon in your hands and the pork and the bucket of water at your belt and 'use' the spoon. You can choose a category, soups -represented by a soup bowl- or other dishes -represented by a plate. Choose the plate and then the sausages.");
    npc.base.autonpcfunctions.AddCondition("state","=",3);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("item",3051,"all","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Komm wieder, wenn du mindestens ein Paar Würste gekocht hast. Steh direkt vor das Feuer mit dem Löffel in der Hand und dem Fleisch und dem Eimer mit Wasser am Gürtel und 'benutze' den Löffel. Du kannst eine Kategorie wählen, Suppen -dargestellt durch eine Schüssel- oder andere Gerichte -dargestellt durch einen Teller. Wähle den Teller und dann die Würste.");
    npc.base.autonpcfunctions.AddCondition("state","=",3);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("item",3051,"all","=",0);
    -- STATE 4, unfinished sausages
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Oh wait, I see that you haven't finished cooking those sausages. If you want to continue the work on an unfinished dish, just 'use' the spoon with that dish, having it placed at the belt of course.");
    npc.base.autonpcfunctions.AddCondition("state","=",4);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("state","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Oh warte, wie ich sehe hast du diese Würste nicht fertig gekocht. Wenn du die Arbeit an einem unfertigen Gericht weiterführen willst, dann 'benutze' den Löffel mit diesem Gericht, das du natürlich am Gürtel trägst.");
    npc.base.autonpcfunctions.AddCondition("state","=",4);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("state","=",3);
    -- STATE 5, finished sausages
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Great! You did it! One more hint: It may happen that there are 'unfinished dishes' left, continue the work by 'using' the spoon with that dish, having it placed at the belt of course. Now, we may proceed with baking. Are you ready?");
    npc.base.autonpcfunctions.AddCondition("state","=",5);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("state","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Großartig! Du hast's geschafft! Ein Hinweis noch: Es kann passieren, dass 'unfertige Gerichte' übrigbleiben, setze die Arbeit fort, indem du den Löffel mit diesem Gericht, das du natürlich am Gürtel trägst, 'benutzt'. Nun können wir mit Backen fortfahren. Bereit?");
    npc.base.autonpcfunctions.AddCondition("state","=",5);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("state","=",10);
    -- STATE 10
    npc.base.autonpcfunctions.AddTraderTrigger(".+","I asked if we can proceed with baking. Yes or no?");
    npc.base.autonpcfunctions.AddCondition("state","=",10);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ich fragte, ob wir mit Backen fortfahren können. Ja oder nein?");
    npc.base.autonpcfunctions.AddCondition("state","=",10);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- STATE 11
    npc.base.autonpcfunctions.AddTraderTrigger(".+","We can only proceed if you have 5 pieces of dough. Place the flour and a bucket of water at the belt and hold the rolling pin in your hands. Stand in front of the baking house and just 'use' it.");
    npc.base.autonpcfunctions.AddCondition("state","=",11);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("item",5,"all","<",5);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Wir können erst weiter machen, wenn du 5 Klumpen Teig hast. Trage das Mehl und einen Eimer mit Wasser am Gürtel und halte das Nudelholz in den Händen. Stelle dich direkt vor den Backofen und 'benutze' ihn.");
    npc.base.autonpcfunctions.AddCondition("state","=",11);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("item",5,"all","<",5);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Very good! Now take this peel and hold it in your hands. Go again to the baking house and place the dough at your belt. Now 'use' the peel and choose the bread roll. It is the easiest-to-make baked good. Come again when you have at least one bread roll.");
    npc.base.autonpcfunctions.AddCondition("state","=",11);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("state","=",12);
    npc.base.autonpcfunctions.AddConsequence("item",121,1,999,0);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Sehr gut! Nun nimm diesen Ofenschieber und halte ihn in deinen Händen. Geh' wieder zum Backofen und trage den Teig am Gürtel. Jetzt 'benutze' den Ofenschieber und wähle das Brötchen. Es ist die am einfachsten herzustellende Backware. Komm wieder, wenn du mindestens ein Brötchen hast.");
    npc.base.autonpcfunctions.AddCondition("state","=",11);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("state","=",12);
    npc.base.autonpcfunctions.AddConsequence("item",121,1,999,0);
    -- STATE 12
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Come again when you have baked at least one bread roll. Go to the baking house and place the dough at your belt. Now 'use' the peel, while holding it in your hands, and choose the bread roll. It is the easiest-to-make baked good.");
    npc.base.autonpcfunctions.AddCondition("state","=",12);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Komm wieder, wenn du mindestens ein Brötchen gebacken hast. Geh' wieder zum Backofen und trage den Teig am Gürtel. Jetzt 'benutze' den Ofenschieber, während du ihn in der Hand hältst, und wähle das Brötchen. Es ist die am einfachsten herzustellende Backware.");
    npc.base.autonpcfunctions.AddCondition("state","=",12);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- STATE 13, unfinished bread roll
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Oh wait, I see that you haven't finished baking that bread roll. If you want to continue the work on an unfinished baked good, just 'use' the peel with that baked good, having it placed at the belt of course.");
    npc.base.autonpcfunctions.AddCondition("state","=",13);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("state","=",12);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Oh warte, wie ich sehe hast du dieses Brötchen nicht fertig gebacken. Wenn du die Arbeit an einer unfertigen Backware weiterführen willst, dann 'benutze' den Ofenschieber mit dieser Backware, die du natürlich am Gürtel trägst.");
    npc.base.autonpcfunctions.AddCondition("state","=",13);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("state","=",12);
    -- STATE 14, finished bread roll
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Great! Your sausages and bread rolls smell very delicious. You can eat them by simply 'using' them. Well then, that's all I can do for you. But you surely will become a master cook and baker one day. I wish you good luck and Oldra with you. Farewell!");
    npc.base.autonpcfunctions.AddCondition("state","=",14);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Großartig! Deine Würste und Brötchen riechen wirklich köstlich. Du kannst sie essen, indem du sie einfach 'benutzt'. Nun denn, das ist alles, was ich für dich tun kann. Aber du wirst sicherlich eines Tages ein Meisterkoch und -bäcker. Viel Glück und Oldra mit dir. Leb wohl!");
    npc.base.autonpcfunctions.AddCondition("state","=",14);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;

    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npc.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npc.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if npc.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
            local state = NPCStatus[originator.id];
			if state == 3 then
				if CountItemsWithQuality(originator,3051,100,-1) > 0 then
					NPCStatus[originator.id] = 4;
				elseif CountItemsWithQuality(originator,3051,99,1) > 0 then
					NPCStatus[originator.id] = 5;
				end
			elseif state == 12 then
				if CountItemsWithQuality(originator,191,100,-1) > 0 then
					NPCStatus[originator.id] = 13;
				elseif CountItemsWithQuality(originator,191,99,1) > 0 then
					NPCStatus[originator.id] = 14;
				end
			end
			-- debug and testing
		    local a,b,c,d,e,f,g,h = nil;
		    a,b,c = string.find(string.lower(message),"debug (%d+)");
		    d,e = string.find(string.lower(message),"debug");
			f,g,h = string.find(string.lower(message),"questprogress (%d+)");
		    if a~=nil then
				NPCStatus[originator.id]=c+1-1;
				originator:inform("State set to "..c);
		    elseif d~=nil then
				originator:inform("State: "..NPCStatus[originator.id]); 
		    elseif f~=nil then
				originator:setQuestProgress(2,h+1-1);
				originator:inform("Questprogress set to "..h);
			else -- end debug and testing
				npc.base.autonpcfunctions.TellSmallTalk(message,originator);
		    end
        else
            npc.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end

function CountItemsWithQuality( Character, ItemID, Quality, Compare )
	
	local count = 0;
	local i;
	local item;
	for i=0,17 do
		item = Character:getItemAt(i);
		if item.id == ItemID then
			if Compare == 0 or Compare == nil then
				if item.quality == Quality then
					count = count+1;
				end
			elseif Compare == 1 then
				if item.quality > Quality then
					count = count+1;
				end
			elseif Compare == -1 then
				if item.quality < Quality then
					count = count+1;
				end
			end
		end
	end
	local container = nil;
	container = Character:getBackPack();
	if container then
		local worked = false;
		for i=1,100 do
			worked, item = container:viewItemNr(i);
			if worked then
				if item.id == ItemID then
					if Compare == 0 or Compare == nil then
						if item.quality == Quality then
							count = count+1;
						end
					elseif Compare == 1 then
						if item.quality > Quality then
							count = count+1;
						end
					elseif Compare == -1 then
						if item.quality < Quality then
							count = count+1;
						end
					end
				end
			else
				break;
			end
		end
	end
	return count;
end
