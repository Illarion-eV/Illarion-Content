-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-54,-218,0,2,false,'Artoss Ishem','npc_artoss_ishem.lua',0);

require("npc.base.autonpcfunctions")
module("npc.artoss_ishem", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(Character.say, Player.german, "Finger weg!");
    thisNPC:talkLanguage(Character.say, Player.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    npc.base.autonpcfunctions.SetRadius(0);
    npc.base.autonpcfunctions.AddCycleText("#me richtet seine Rüstung.","#me adjusts his armor.");
    npc.base.autonpcfunctions.AddCycleText("#me poliert seine Rüstung mit einem sauberen Tuch.","#me polishes his armor with a clean cloth.");
    npc.base.autonpcfunctions.AddCycleText("#me beißt in einen Apfel.","#me bites into an apple.");
    npc.base.autonpcfunctions.AddCycleText("Willkommen in der Grauen Zuflucht!","Welcome to the Grey Refuge!");
    npc.base.autonpcfunctions.AddCycleText("#me blickt sich mit wachsamen Augen um.","#me looks around with an observant gaze.");
    npc.base.autonpcfunctions.AddCycleText("#me strafft seine Schultern.","#me squares his shoulders.");
    npc.base.autonpcfunctions.AddCycleText("#me gähnt verhalten.","#me yawns retained.");
    npc.base.autonpcfunctions.AddCycleText("#me's Rüstung strahlt vor glanz.","#me's armor is shining of brightness.");
    npc.base.autonpcfunctions.AddCycleText("#me kämmt gepflegt sein Haar.","#me combs his hair.");
    
    npc.base.autonpcfunctions.AddTraderTrigger("Hallo","Ich grüße euch.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Grüße");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddAdditionalText("Guten Tag.");
    npc.base.autonpcfunctions.AddAdditionalText("Seid gegrüßt");
    npc.base.autonpcfunctions.AddTraderTrigger("Wer seid ihr?","Ich bin Artoss Ishem, Ritter der Grauen Rose.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wer bist du?");
    npc.base.autonpcfunctions.AddTraderTrigger("Wo bin ich?","Ihr befindet euch bei der Grauen Zuflucht.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Was ist das hier?");
    npc.base.autonpcfunctions.AddAdditionalText("Das ist die Graue Zuflucht");
    npc.base.autonpcfunctions.AddAdditionalText("Das ist die Graue Zuflucht, Heimat der Ritter der Grauen Rose!");
    npc.base.autonpcfunctions.AddTraderTrigger("Was macht ihr?","Ich stehe hier Wache.");
    npc.base.autonpcfunctions.AddTraderTrigger("Was verkaufst du?","Ich verkaufe nichts, tut mir leid. Sam verkauft etwas in der Burg.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Was verkauft ihr?");
    npc.base.autonpcfunctions.AddAdditionalText("Geht zu Sam.");
    npc.base.autonpcfunctions.AddAdditionalText("Ich verkaufe nichts.");
    npc.base.autonpcfunctions.AddTraderTrigger("Sam","Sam ist ein einfacher Händler hier in der Burg. Er verkauft Kleidung, Werkzeuge, Kerzen und Lampenöl.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wer ist Sam?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Wo ist die Nordmark?","Die Nordmark findet ihr wenn ihr von hier aus nach Westen geht. Sobald ihr am Meer angekommen seid, geht nach Norden. Passt aber auf, die haben harte Gesetze.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Nordmark");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Wo ist Trolls Bane?","Troll's Bane ist leicht zu finden. Ihr folgt den Weg einfach über die südliche Brücke. Dort den Weg folgen und schon steht ihr vor den Stadtmauern. Seid aber auf der Hut! Es gibt dort viele Kriminelle!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Trolls Bane");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bane");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Wo ist Greenbriar?","Oh. Wenn ihr nach Greenbriar wollt seid ihr hier falsch. Am besten folgt ihr dem Weg südlich nach Troll's Bane. Von dort aus geht ihr weiterhin südlich zur Union. Dort angekommen lauft ihr gen Westen, vorbei an dem Hafen, bis zu einer Brücke. Dort geht ihr rüber und dann nach Süden. Die Halblinge sind immer freundlich. Dort lässt es sich leben.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greenbriar");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Briar");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Wo ist Varshikar?","Die Wüstenstadt findet ihr wenn ihr von hier aus nach Troll's Bane lauft. Von dort aus den Weg vorbei an Garon's Werkstatt immer nach Osten den Weg folgen. Es ist sehr heiß dort aber man hat nette Gesellschaft! Und passt auf, in der nähe hausen Orks!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Varshikar");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Wo ist Silberbrand?","Zu den zwergen kommt ihr am schnellsten wenn ihr die Brücke überquert und dann dem Fairy Tear's nach Osten folgt. Die Zwerge sind manchmal richtig mürrisch. Aber ihr Bier ist das Beste weit und breit!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Silberbrand");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","[Spielhilfe] Dies ist ein NPC welcher dir etwas über die Graue Rose erzählen kann. Außerdem kann er dir sagen wo du verschiedene Städte findest.");
    npc.base.autonpcfunctions.AddTraderTrigger("Was ist die Graue Rose?","Die Grause Rose ist der älteste Ritterzirkel auf Gobaith. Er besteht in der Regel aus dem hohen Zirkel, den Rittern und dem Gefolge. Die Graue Rose ist stets nach Gleichgewicht bestrebt und nimmt gerne neues Gefolge auf.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Graue Rose");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Rose");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Graue Zuflucht");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Be greeted!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalText("Good day.");
    npc.base.autonpcfunctions.AddAdditionalText("I greet you.");
    npc.base.autonpcfunctions.AddTraderTrigger("Who are you?","I am Artoss Ishem, Knight of the Grey Rose.");
    npc.base.autonpcfunctions.AddTraderTrigger("Where am I?","You are at the Grey Refuge.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("What is this?");
    npc.base.autonpcfunctions.AddAdditionalText("This is the Grey Refuge.");
    npc.base.autonpcfunctions.AddAdditionalText(" This is the Grey Refuge, home of the knights of the Grey Rose.");
    npc.base.autonpcfunctions.AddTraderTrigger("What are you doing?","I am guarding.");
    npc.base.autonpcfunctions.AddTraderTrigger("What do you sell?","I don't sell anything. Ask Sam in the castle.");
    npc.base.autonpcfunctions.AddAdditionalText("Go to Sam.");
    npc.base.autonpcfunctions.AddAdditionalText("I don't sell anything.");
    npc.base.autonpcfunctions.AddTraderTrigger("Who ist Sam?","Sam is a simply merchant in the castle. There you can buy clothes, tools, candles and lampoil.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Sam");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Where is the Nordmark?","You'll find the Nordmark if you go west. Once you reach the sea npc.base.autonpcfunctions.walk north. But beware, they have hard laws.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Nordmark");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Where is Trolls Bane?","Troll's Bane is easy to find. Just follow the path over the bridge. Follow the path south and you already see the town walls.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Trolls Bane");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bane");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Where is Greenbriar?","Oh. If you want to go to Greenbriar, you're totally wrong here. The best way is that you first go to Troll's Bane. From there you have to go south to the union. At the union you have to go west, pass the habor and npc.base.autonpcfunctions.walk over the bridge. From there just go south. The halflings are always friendly and it is a good place to live.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greenbriar");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Briar");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Where is Varshikar?","You'll find the desert town if you go to Troll's Bane and turn east. Pass Garon's workshop and follow the way east. It is very hot there but you'll find some nice people. And pay attention, in the mountains are some strong creatures!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Varshikar");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Where is Silverbrand?","The fastest way to the dwarves is if you pass the bridge and follow the Fairy Tear's on the other side of the river. Sometime the dwarfs are grumbly but their beer is the best on Gobaith!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Silverbrand");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Silberbrand");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Help","[Gamehelp] This is an NPC who can tell you something about the Grey Rose and where you can find the other towns.");
    npc.base.autonpcfunctions.AddTraderTrigger("What is the Grey Rose?","The Grey Rose is the oldest knight circle on Gobaith. Usually it consists of the high circle, the knights and the following. The Grey Rose is always striving for balance on Gobaith and is always looking for followers.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Grey Rose");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Rose");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Grey Refuge");
    npc.base.autonpcfunctions.AddCondition("lang","english");
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
            npc.base.autonpcfunctions.TellSmallTalk(message,originator);
        else
            npc.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end
