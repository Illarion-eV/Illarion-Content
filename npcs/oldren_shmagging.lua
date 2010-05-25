-- INSERT INTO npc VALUES (nextval('npc_seq'),2,-67,-104,0,4,false,'Oldren Shmagging','npc_oldren_shmagging.lua',0);
-- NPC craftmaster for newbie island
-- cooking and baking

require("npcs.base.autonpcfunctions")
-- dofile("/usr/share/servers/illarionserver/scripts/npc_autonpcfunctions.lua");

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

    -- general
    -- small talk
    AddTraderTrigger("hello","Hello my friend! I am "..thisNPC.name..", a cook and a baker. I can teach you some things of my craft.");
    AddAdditionalTrigger("greet");
    AddAdditionalTrigger("hiho");
    AddCondition("state","=",0);
    AddCondition("lang","english");
    AddTraderTrigger("hallo","Hallo mein Freund! Ich bin "..thisNPC.name..", ein Koch und Bäcker. Ich kann dir ein paar Dinge meines Handwerks beibringen.");
    AddAdditionalTrigger("gr[üu][sß]");
    AddAdditionalTrigger("hiho");
    AddCondition("state","=",0);
    AddCondition("lang","german");
    AddTraderTrigger("hello","Hello my friend! Back again, eh? Hm... Where did we stop?.");
    AddAdditionalTrigger("greet");
    AddAdditionalTrigger("hiho");
    AddCondition("lang","english");
    AddTraderTrigger("hallo","Hallo mein Freund! Na, wieder zurück? Hm... Wo waren wir stehen geblieben?");
    AddAdditionalTrigger("gr[üu][sß]");
    AddAdditionalTrigger("hiho");
    AddCondition("lang","german");
    AddTraderTrigger("hallo","Hallo mein Freund! Na, wieder zurück? Hm... Wo waren wir stehen geblieben?");
    AddAdditionalTrigger("gr[üu][sß]");
    AddTraderTrigger("who you","I am "..thisNPC.name..", a cook and a baker. I can teach you some things of my craft.");
    AddAdditionalTrigger("what you");
    AddTraderTrigger("wer du","Ich bin "..thisNPC.name..", ein Koch und Bäcker. Ich kann dir ein paar Dinge meines Handwerks beibringen.");
    AddAdditionalTrigger("wer ihr");
    AddAdditionalTrigger("was du");
    AddAdditionalTrigger("was ihr");
    AddTraderTrigger("bye","Bye, bye.");
    AddAdditionalTrigger("farewell");
    AddAdditionalTrigger("be well");
    AddAdditionalText("Be well, my friend!");
    AddAdditionalText("Farewell, until we meet again.");
    AddTraderTrigger("tsch[üu][ßs]","Auf Wiedersehen, mein Freund!");
    AddAdditionalTrigger("tschue[sß]");
    AddAdditionalTrigger("leb wohl");
    AddAdditionalTrigger("wiederseh");
    AddAdditionalTrigger("auf bald");
    AddAdditionalTrigger("bis bald");
    AddAdditionalText("Tschüss auch.");
    AddAdditionalText("Leb wohl, bis zum nächsten Mal.");
    -- start teaching
    AddTraderTrigger("cook","So you want to learn some things about cooking and baking, right?");
    AddAdditionalTrigger("bake");
    AddAdditionalTrigger("craft");
    AddAdditionalTrigger("teach");
    AddAdditionalTrigger("learn");
	AddAdditionalTrigger("help");
    AddCondition("state","=",0);
    AddCondition("lang","english");
    AddConsequence("state","=",1);
    AddTraderTrigger("koch","So so, du willst also ein paar Dinge über Kochen und Backen lernen, richtig?");
    AddAdditionalTrigger("back");
    AddAdditionalTrigger("handwerk");
    AddAdditionalTrigger("lern");
    AddAdditionalTrigger("lehr");
	AddAdditionalTrigger("hilf");
    AddCondition("state","=",0);
    AddCondition("lang","german");
    AddConsequence("state","=",1);
    -- STATE 1
    AddTraderTrigger("yes","Very nice. Firstly, take this cooking spoon and this bucket. Go to the water with the bucket in your hands and 'use' it with the water. Come again when you have filled the bucket.");
    AddCondition("state","=",1);
    AddConsequence("state","=",2);
    AddConsequence("item",227,1,999,0);
    AddConsequence("item",51,1,333,0);
    AddTraderTrigger("ja","Sehr schön. Nimm erstmal diesen Kochlöffel und diesen Eimer. Geh zum Wasser mit dem Eimer in deinen Händen und 'benutze' ihn mit dem Wasser. Komm wieder, wenn du den Eimer gefüllt hast.");
    AddCondition("state","=",1);
    AddConsequence("state","=",2);
    AddConsequence("item",227,1,999,0);
    AddConsequence("item",51,1,333,0);
    AddTraderTrigger("no","But why are you here if you don't want to learn anything? Well, you can leave through the portal you just used at any time.");
    AddCondition("state","=",1);
    AddTraderTrigger("nein","Aber warum bist du dann hier, wenn du nichts lernen willst? Nunja, du kannst wieder durch das Portal gehen, das du eben benutzt hast, wann immer du willst.");
    AddCondition("state","=",1);
    -- STATE 2
    AddTraderTrigger("spoon","You need another cooking spoon, right? Here you are.");
    AddCondition("state",">=",2);
    AddCondition("item",227,"all","=",0);
    AddConsequence("item",227,1,999,0);
    AddTraderTrigger("l[öo]ffel","Du brauchst einen neuen Kochlöffel, richtig? Hier bitte sehr.");
    AddAdditionalTrigger("loeffel");
    AddCondition("state",">=",2);
    AddCondition("item",227,"all","=",0);
    AddConsequence("item",227,1,999,0);
    AddTraderTrigger("bucket","You need another bucket, right? Here you are.");
    AddCondition("state",">=",2);
    AddCondition("item",51,"all","=",0);
    AddCondition("item",52,"all","=",0);
    AddConsequence("item",51,1,333,0);
    AddTraderTrigger("eimer","Du brauchst einen neuen Eimer, richtig? Hier bitte sehr.");
    AddCondition("state",">=",2);
    AddCondition("item",51,"all","=",0);
    AddCondition("item",52,"all","=",0);
    AddConsequence("item",51,1,333,0);
    -- STATE 3
    AddTraderTrigger("pork","You need more pork, right? Here you are.");
    AddCondition("state",">=",3);
    AddCondition("state","<",10);
    AddCondition("item",307,"all","<",3);
    AddConsequence("item",307,5,333,0);
    AddTraderTrigger("fleisch","Du brauchst mehr Schweinefleisch, richtig? Hier bitte sehr.");
    AddCondition("state",">=",3);
    AddCondition("state","<",10);
    AddCondition("item",307,"all","<",3);
    AddConsequence("item",307,5,333,0);
	AddTraderTrigger("entrail","You need more entrails, right? Here you are.");
    AddCondition("state",">=",3);
    AddCondition("state","<",10);
    AddCondition("item",63,"all","<",3);
    AddConsequence("item",63,5,333,0);
    AddTraderTrigger("eingeweide","Du brauchst mehr Eingeweide, richtig? Hier bitte sehr.");
    AddCondition("state",">=",3);
    AddCondition("state","<",10);
    AddCondition("item",63,"all","<",3);
    AddConsequence("item",63,5,333,0);
    -- STATE 10
    AddTraderTrigger("yes","Alright, at the very beginning you need flour to make dough. That is made out of grain, but better ask a farmer about milling grain. I give you some bags of flour, place them and a bucket of water at the belt, and a rolling pin. Holding it in your hands and standing in front of the baking house over there, just 'use' that baking house. Come again when you have at least 5 pieces of dough.");
    AddCondition("state","=",10);
    AddConsequence("state","=",11);
    AddConsequence("item",2,10,333,0);
    AddConsequence("item",118,1,999,0);
    AddTraderTrigger("ja","Nun gut, zu allererst brauchst du Mehl um Teig zu machen. Das wird aus Getreide gemacht, aber frage besser einen Bauern über das Mahlen von Getreide. Ich gebe dir ein paar Säcke mit Mehl, trage sie und einen Eimer mit Wasser am Gürtel, und ein Nudelholz. Halte jenes in der Hand und stelle dich einfach direkt vor den Backofen dort und 'benutze' ihn. Komm wieder, wenn du mindestens 5 Klumpen Teig hast.");
    AddCondition("state","=",10);
    AddConsequence("state","=",11);
    AddConsequence("item",2,10,333,0);
    AddConsequence("item",118,1,999,0);
    AddTraderTrigger("no","As you want. You can come back whenever you want and continue the lesson about baking.");
    AddCondition("state","=",10);
    AddTraderTrigger("nein","Wie du willst. Du kannst jederzeit wiederkommen und die Lektion über Backen fortsetzen.");
    AddCondition("state","=",10);
    -- STATE 11
    AddTraderTrigger("flour","You need more flour, right? Here you are.");
    AddCondition("state","=",11);
    AddCondition("item",2,"all","<",5);
    AddConsequence("item",2,10,333,0);
    AddTraderTrigger("mehl","Du brauchst mehr Mehl, richtig? Hier bitte schön.");
    AddCondition("state","=",11);
    AddCondition("item",2,"all","<",5);
    AddConsequence("item",2,10,333,0);
    AddTraderTrigger("rolling pin","You need a new rolling pin, right? Here you are.");
    AddCondition("state",">=",11);
    AddCondition("item",118,"all","=",0);
    AddConsequence("item",118,1,999,0);
    AddTraderTrigger("nudelholz","Du brauchst ein neues Nudelholz, richtig? Hier bitte schön.");
    AddCondition("state",">=",11);
    AddCondition("item",118,"all","=",0);
    AddConsequence("item",118,1,999,0);
    -- STATE 12
    AddTraderTrigger("help","Oh, you have no more dough, right? You don't need to make it again, so I give you 5 new pieces.");
    AddAdditionalTrigger("dough");
    AddAdditionalTrigger("more");
    AddCondition("state","=",12);
    AddCondition("item",5,"all","=",0);
    AddConsequence("item",5,5,333,0);
    AddTraderTrigger("hilfe","Oh, du hast keinen Teig mehr, richtig? Du musst es nicht nochmal machen, also gebe ich dir 5 neue Klumpen.");
    AddAdditionalTrigger("teig");
    AddAdditionalTrigger("mehr");
    AddCondition("state","=",12);
    AddCondition("item",5,"all","=",0);
    AddConsequence("item",5,5,333,0);
    AddTraderTrigger("peel","You need a new peel, right? Here you are.");
    AddCondition("state",">=",12);
    AddCondition("item",121,"all","=",0);
    AddConsequence("item",121,1,999,0);
    AddTraderTrigger("ofenschieber","Du brauchst einen neuen Ofenschieber, richtig? Hier bitte schön.");
    AddCondition("state",">=",12);
    AddCondition("item",121,"all","=",0);
    AddConsequence("item",121,1,999,0);
    -- standard explanations
    AddTraderTrigger("dough","Dough is made out of flour, which is made out of grain. But I don't know how to mill grain to flour. I am just a baker, not a farmer. If you need flour for one of my tasks, I can give you some bags.");
    AddAdditionalTrigger("flour");
    AddAdditionalTrigger("grain");
    AddAdditionalTrigger("mill");
    AddTraderTrigger("teig","Teig wird aus Mehl gemacht, welches wiederrum aus Getreide gemacht wird. Aber ich weiß nicht, wie man Getreide zu Mehl zermahlen kann. Ich bin nur ein Bäcker, kein Bauer. Falls du für eine meiner Aufgaben Mehl brauchst, kann ich dir ein paar Säcke geben.");
    AddAdditionalTrigger("mehl");
    AddAdditionalTrigger("getreide");
    AddAdditionalTrigger("mahlen");
    AddTraderTrigger("pork","Pork can be cooked to sausages. You always get a pair out of it. Kill a pig. Then you can easily take the pork from the cadaver. But if you need it for one of my tasks, I can give you some pork.");
    AddTraderTrigger("fleisch","Schweinefleisch kann zu Würsten gekocht werden. Du bekommst immer gleich ein Paar. Töte ein Schwein. Dann kannst du ganz einfach dessen Fleisch vom Kadaver entfernen. Falls du für eine meiner Aufgaben Schweinefleisch brauchst, kann ich dir auch etwas geben.");
	AddTraderTrigger("entrail","Entrails are used to cook sausages. You always get a pair out of it. Kill a pig. Then you can easily take the entrails from the cadaver. But if you need it for one of my tasks, I can give you some entrails.");
    AddTraderTrigger("eingeweide","Eingeweide kann zu Würsten gekocht werden. Du bekommst immer gleich ein Paar. Töte ein Schwein. Dann kannst du ganz einfach dessen Eingeweide vom Kadaver entfernen. Falls du für eine meiner Aufgaben Eingeweide brauchst, kann ich dir auch etwas geben.");
    AddTraderTrigger("baking house","The baking house is over there, next to the cherry tree. You need a baking house to bake bread, cakes or other delicacies.");
    AddTraderTrigger("backofen","Der Backofen ist dort drüben bei dem Kirschbaum. Du brauchst einen Backofen, um Brot, Kuchen und andere Leckereien zu backen.");
    AddTraderTrigger("fire","You can cook tasty dishes at any campfire, like the one next to me. Amelia has surely shown you how to spark off a fire. But you can use my one of course");
    AddTraderTrigger("feuer","Du kannst an jedem Lagerfeuer, wie das hier neben mir, leckere Gerichte kochen. Amelia hat dir bestimmt gezeigt, wie man eines entfacht. Aber du kannst gern meines benutzen.");
    AddTraderTrigger("soup","Concerning cooking, you can choose between two categories: soups or other dishes. For soups you need a soup bowl, for the most other dishes you need a plate - of course not for sausages. Both can be made by carpenters.");
    AddAdditionalTrigger("bowl");
    AddAdditionalTrigger("plate");
    AddAdditionalTrigger("dish");
    AddAdditionalTrigger("category");
    AddTraderTrigger("suppe","Was das Kochen betrifft, kannst du aus zwei Kategorien wählen: Suppen oder andere Gerichte. Für Suppen brauchst du eine Suppenschüssel, für die meisten anderen Gerichte einen Teller - natürlich nicht für Würste. Beides können Schreiner herstellen.");
    AddAdditionalTrigger("sch[üu][sß]el");
    AddAdditionalTrigger("schue[sß]el");
    AddAdditionalTrigger("teller");
    AddAdditionalTrigger("gericht");
    AddAdditionalTrigger("kategorie");
    AddTraderTrigger("spoon","Oh of course you need a cooking spoon and a bucket in order to cook anything. They can be made by carpenters. But if you need them for one of my tasks, I can give you one of each.");
    AddAdditionalTrigger("bucket");
    AddTraderTrigger("l[öo]ffel","Natürlich brauchst du einen Kochlöffel und einen Eimer, um etwas zu kochen. Beides kann von Schreinern hergestellt werden. Aber falls du sie für eine meiner Aufgaben brauchst, kann ich dir jeweils ein Exemplar geben.");
    AddAdditionalTrigger("loeffel");
    AddAdditionalTrigger("eimer");
    -- last catch
    -- STATE 1
    AddTraderTrigger(".+","I asked if you want to learn something about cooking and baking. Yes or no?");
    AddCondition("state","=",1);
    AddCondition("lang","english");
    AddTraderTrigger(".+","Ich habe gefragt, ob du etwas übers Kochen und Backen lernen willst. Ja oder nein?");
    AddCondition("state","=",1);
    AddCondition("lang","german");
    -- STATE 2
    AddTraderTrigger(".+","You should first fill the bucket with water. Go to the water with the bucket in your hands and 'use' it with the water. Come again when you have filled the bucket.");
    AddCondition("state","=",2);
    AddCondition("lang","english");
    AddCondition("item",52,"all","=",0);
    AddTraderTrigger(".+","Du solltest erst den Eimer mit Wasser füllen. Geh zum Wasser mit dem Eimer in deinen Händen und 'benutze' ihn mit dem Wasser. Komm wieder, wenn du den Eimer gefüllt hast.");
    AddCondition("state","=",2);
    AddCondition("lang","german");
    AddCondition("item",52,"all","=",0);
    AddTraderTrigger(".+","Ah, you have a full bucket. Now I give you pork and entrails, you'll cook sausages. Stand directly in front of the fire with the spoon in your hands and the pork, entrails and the bucket of water at your belt and 'use' the spoon. You can choose a category, soups -represented by a soup bowl- or other dishes -represented by a plate. Choose the plate and then the sausages. When you are finished or if it doesn't work, just come to me again.");
    AddCondition("state","=",2);
    AddCondition("lang","english");
    AddCondition("item",52,"all",">",0);
    AddConsequence("state","=",3);
    AddConsequence("item",307,5,333,0);
	AddConsequence("item",63,5,333,0);
    AddTraderTrigger(".+","Ah, du hast einen vollen Eimer. Jetzt gebe ich dir Schweinefleisch und Eingeweide, du wirst Würste kochen. Steh direkt vor das Feuer mit dem Löffel in der Hand und dem Fleisch und dem Eimer mit Wasser am Gürtel und 'benutze' den Löffel. Du kannst eine Kategorie wählen, Suppen -dargestellt durch eine Schüssel- oder andere Gerichte -dargestellt durch einen Teller. Wähle den Teller und dann die Würste. Wenn du fertig bist oder falls es nicht klappt, komm einfach wieder zu mir.");
    AddCondition("state","=",2);
    AddCondition("lang","german");
    AddCondition("item",52,"all",">",0);
    AddConsequence("state","=",3);
    AddConsequence("item",307,5,333,0);
	AddConsequence("item",63,5,333,0);
    -- STATE 3
    AddTraderTrigger(".+","Come again when you have cooked at least one pair of sausages. Stand directly in front of the fire with the spoon in your hands and the pork and the bucket of water at your belt and 'use' the spoon. You can choose a category, soups -represented by a soup bowl- or other dishes -represented by a plate. Choose the plate and then the sausages.");
    AddCondition("state","=",3);
    AddCondition("lang","english");
    AddCondition("item",3051,"all","=",0);
    AddTraderTrigger(".+","Komm wieder, wenn du mindestens ein Paar Würste gekocht hast. Steh direkt vor das Feuer mit dem Löffel in der Hand und dem Fleisch und dem Eimer mit Wasser am Gürtel und 'benutze' den Löffel. Du kannst eine Kategorie wählen, Suppen -dargestellt durch eine Schüssel- oder andere Gerichte -dargestellt durch einen Teller. Wähle den Teller und dann die Würste.");
    AddCondition("state","=",3);
    AddCondition("lang","german");
    AddCondition("item",3051,"all","=",0);
    -- STATE 4, unfinished sausages
    AddTraderTrigger(".+","Oh wait, I see that you haven't finished cooking those sausages. If you want to continue the work on an unfinished dish, just 'use' the spoon with that dish, having it placed at the belt of course.");
    AddCondition("state","=",4);
    AddCondition("lang","english");
    AddConsequence("state","=",3);
    AddTraderTrigger(".+","Oh warte, wie ich sehe hast du diese Würste nicht fertig gekocht. Wenn du die Arbeit an einem unfertigen Gericht weiterführen willst, dann 'benutze' den Löffel mit diesem Gericht, das du natürlich am Gürtel trägst.");
    AddCondition("state","=",4);
    AddCondition("lang","german");
    AddConsequence("state","=",3);
    -- STATE 5, finished sausages
    AddTraderTrigger(".+","Great! You did it! One more hint: It may happen that there are 'unfinished dishes' left, continue the work by 'using' the spoon with that dish, having it placed at the belt of course. Now, we may proceed with baking. Are you ready?");
    AddCondition("state","=",5);
    AddCondition("lang","english");
    AddConsequence("state","=",10);
    AddTraderTrigger(".+","Großartig! Du hast's geschafft! Ein Hinweis noch: Es kann passieren, dass 'unfertige Gerichte' übrigbleiben, setze die Arbeit fort, indem du den Löffel mit diesem Gericht, das du natürlich am Gürtel trägst, 'benutzt'. Nun können wir mit Backen fortfahren. Bereit?");
    AddCondition("state","=",5);
    AddCondition("lang","german");
    AddConsequence("state","=",10);
    -- STATE 10
    AddTraderTrigger(".+","I asked if we can proceed with baking. Yes or no?");
    AddCondition("state","=",10);
    AddCondition("lang","english");
    AddTraderTrigger(".+","Ich fragte, ob wir mit Backen fortfahren können. Ja oder nein?");
    AddCondition("state","=",10);
    AddCondition("lang","german");
    -- STATE 11
    AddTraderTrigger(".+","We can only proceed if you have 5 pieces of dough. Place the flour and a bucket of water at the belt and hold the rolling pin in your hands. Stand in front of the baking house and just 'use' it.");
    AddCondition("state","=",11);
    AddCondition("lang","english");
    AddCondition("item",5,"all","<",5);
    AddTraderTrigger(".+","Wir können erst weiter machen, wenn du 5 Klumpen Teig hast. Trage das Mehl und einen Eimer mit Wasser am Gürtel und halte das Nudelholz in den Händen. Stelle dich direkt vor den Backofen und 'benutze' ihn.");
    AddCondition("state","=",11);
    AddCondition("lang","german");
    AddCondition("item",5,"all","<",5);
    AddTraderTrigger(".+","Very good! Now take this peel and hold it in your hands. Go again to the baking house and place the dough at your belt. Now 'use' the peel and choose the bread roll. It is the easiest-to-make baked good. Come again when you have at least one bread roll.");
    AddCondition("state","=",11);
    AddCondition("lang","english");
    AddConsequence("state","=",12);
    AddConsequence("item",121,1,999,0);
    AddTraderTrigger(".+","Sehr gut! Nun nimm diesen Ofenschieber und halte ihn in deinen Händen. Geh' wieder zum Backofen und trage den Teig am Gürtel. Jetzt 'benutze' den Ofenschieber und wähle das Brötchen. Es ist die am einfachsten herzustellende Backware. Komm wieder, wenn du mindestens ein Brötchen hast.");
    AddCondition("state","=",11);
    AddCondition("lang","german");
    AddConsequence("state","=",12);
    AddConsequence("item",121,1,999,0);
    -- STATE 12
    AddTraderTrigger(".+","Come again when you have baked at least one bread roll. Go to the baking house and place the dough at your belt. Now 'use' the peel, while holding it in your hands, and choose the bread roll. It is the easiest-to-make baked good.");
    AddCondition("state","=",12);
    AddCondition("lang","english");
    AddTraderTrigger(".+","Komm wieder, wenn du mindestens ein Brötchen gebacken hast. Geh' wieder zum Backofen und trage den Teig am Gürtel. Jetzt 'benutze' den Ofenschieber, während du ihn in der Hand hältst, und wähle das Brötchen. Es ist die am einfachsten herzustellende Backware.");
    AddCondition("state","=",12);
    AddCondition("lang","german");
    -- STATE 13, unfinished bread roll
    AddTraderTrigger(".+","Oh wait, I see that you haven't finished baking that bread roll. If you want to continue the work on an unfinished baked good, just 'use' the peel with that baked good, having it placed at the belt of course.");
    AddCondition("state","=",13);
    AddCondition("lang","english");
    AddConsequence("state","=",12);
    AddTraderTrigger(".+","Oh warte, wie ich sehe hast du dieses Brötchen nicht fertig gebacken. Wenn du die Arbeit an einer unfertigen Backware weiterführen willst, dann 'benutze' den Ofenschieber mit dieser Backware, die du natürlich am Gürtel trägst.");
    AddCondition("state","=",13);
    AddCondition("lang","german");
    AddConsequence("state","=",12);
    -- STATE 14, finished bread roll
    AddTraderTrigger(".+","Great! Your sausages and bread rolls smell very delicious. You can eat them by simply 'using' them. Well then, that's all I can do for you. But you surely will become a master cook and baker one day. I wish you good luck and Oldra with you. Farewell!");
    AddCondition("state","=",14);
    AddCondition("lang","english");
    AddConsequence("state","=",0);
    AddTraderTrigger(".+","Großartig! Deine Würste und Brötchen riechen wirklich köstlich. Du kannst sie essen, indem du sie einfach 'benutzt'. Nun denn, das ist alles, was ich für dich tun kann. Aber du wirst sicherlich eines Tages ein Meisterkoch und -bäcker. Viel Glück und Oldra mit dir. Leb wohl!");
    AddCondition("state","=",14);
    AddCondition("lang","german");
    AddConsequence("state","=",0);
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
				TellSmallTalk(message,originator);
		    end
        else
            Confused(
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
