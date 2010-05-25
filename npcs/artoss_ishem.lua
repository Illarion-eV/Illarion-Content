-- INSERT INTO npc VALUES (nextval('npc_seq'),0,-54,-218,0,2,false,'Artoss Ishem','npc_artoss_ishem.lua',0);

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

    SetRadius(0);
    AddCycleText("#me richtet seine Rüstung.","#me adjusts his armor.");
    AddCycleText("#me poliert seine Rüstung mit einem sauberen Tuch.","#me polishes his armor with a clean cloth.");
    AddCycleText("#me beißt in einen Apfel.","#me bites into an apple.");
    AddCycleText("Willkommen in der Grauen Zuflucht!","Welcome to the Grey Refuge!");
    AddCycleText("#me blickt sich mit wachsamen Augen um.","#me looks around with an observant gaze.");
    AddCycleText("#me strafft seine Schultern.","#me squares his shoulders.");
    AddCycleText("#me gähnt verhalten.","#me yawns retained.");
    AddCycleText("#me’s Rüstung strahlt vor glanz.","#me’s armor is shining of brightness.");
    AddCycleText("#me kämmt gepflegt sein Haar.","#me combs his hair.");
    
    AddTraderTrigger("Hallo","Ich grüße euch.");
    AddAdditionalTrigger("Grüße");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Tag");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("Guten Tag.");
    AddAdditionalText("Seid gegrüßt");
    AddTraderTrigger("Wer seid ihr?","Ich bin Artoss Ishem, Ritter der Grauen Rose.");
    AddAdditionalTrigger("Wer bist du?");
    AddTraderTrigger("Wo bin ich?","Ihr befindet euch bei der Grauen Zuflucht.");
    AddAdditionalTrigger("Was ist das hier?");
    AddAdditionalText("Das ist die Graue Zuflucht");
    AddAdditionalText("Das ist die Graue Zuflucht, Heimat der Ritter der Grauen Rose!");
    AddTraderTrigger("Was macht ihr?","Ich stehe hier Wache.");
    AddTraderTrigger("Was verkaufst du?","Ich verkaufe nichts, tut mir leid. Sam verkauft etwas in der Burg.");
    AddAdditionalTrigger("Was verkauft ihr?");
    AddAdditionalText("Geht zu Sam.");
    AddAdditionalText("Ich verkaufe nichts.");
    AddTraderTrigger("Sam","Sam ist ein einfacher Händler hier in der Burg. Er verkauft Kleidung, Werkzeuge, Kerzen und Lampenöl.");
    AddAdditionalTrigger("Wer ist Sam?");
    AddCondition("lang","german");
    AddTraderTrigger("Wo ist die Nordmark?","Die Nordmark findet ihr wenn ihr von hier aus nach Westen geht. Sobald ihr am Meer angekommen seid, geht nach Norden. Passt aber auf, die haben harte Gesetze.");
    AddAdditionalTrigger("Nordmark");
    AddCondition("lang","german");
    AddTraderTrigger("Wo ist Trolls Bane?","Troll's Bane ist leicht zu finden. Ihr folgt den Weg einfach über die südliche Brücke. Dort den Weg folgen und schon steht ihr vor den Stadtmauern. Seid aber auf der Hut! Es gibt dort viele Kriminelle!");
    AddAdditionalTrigger("Trolls Bane");
    AddAdditionalTrigger("Bane");
    AddCondition("lang","german");
    AddTraderTrigger("Wo ist Greenbriar?","Oh. Wenn ihr nach Greenbriar wollt seid ihr hier falsch. Am besten folgt ihr dem Weg südlich nach Troll's Bane. Von dort aus geht ihr weiterhin südlich zur Union. Dort angekommen lauft ihr gen Westen, vorbei an dem Hafen, bis zu einer Brücke. Dort geht ihr rüber und dann nach Süden. Die Halblinge sind immer freundlich. Dort lässt es sich leben.");
    AddAdditionalTrigger("Greenbriar");
    AddAdditionalTrigger("Briar");
    AddCondition("lang","german");
    AddTraderTrigger("Wo ist Varshikar?","Die Wüstenstadt findet ihr wenn ihr von hier aus nach Troll's Bane lauft. Von dort aus den Weg vorbei an Garon's Werkstatt immer nach Osten den Weg folgen. Es ist sehr heiß dort aber man hat nette Gesellschaft! Und passt auf, in der nähe hausen Orks!");
    AddAdditionalTrigger("Varshikar");
    AddCondition("lang","german");
    AddTraderTrigger("Wo ist Silberbrand?","Zu den zwergen kommt ihr am schnellsten wenn ihr die Brücke überquert und dann dem Fairy Tear's nach Osten folgt. Die Zwerge sind manchmal richtig mürrisch. Aber ihr Bier ist das Beste weit und breit!");
    AddAdditionalTrigger("Silberbrand");
    AddCondition("lang","german");
    AddTraderTrigger("Hilfe","[Spielhilfe] Dies ist ein NPC welcher dir etwas über die Graue Rose erzählen kann. Außerdem kann er dir sagen wo du verschiedene Städte findest.");
    AddTraderTrigger("Was ist die Graue Rose?","Die Grause Rose ist der älteste Ritterzirkel auf Gobaith. Er besteht in der Regel aus dem hohen Zirkel, den Rittern und dem Gefolge. Die Graue Rose ist stets nach Gleichgewicht bestrebt und nimmt gerne neues Gefolge auf.");
    AddAdditionalTrigger("Graue Rose");
    AddAdditionalTrigger("Rose");
    AddAdditionalTrigger("Graue Zuflucht");
    AddCondition("lang","german");
    AddTraderTrigger("Hello","Be greeted!");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Good day");
    AddAdditionalText("Good day.");
    AddAdditionalText("I greet you.");
    AddTraderTrigger("Who are you?","I am Artoss Ishem, Knight of the Grey Rose.");
    AddTraderTrigger("Where am I?","You are at the Grey Refuge.");
    AddAdditionalTrigger("What is this?");
    AddAdditionalText("This is the Grey Refuge.");
    AddAdditionalText(" This is the Grey Refuge, home of the knights of the Grey Rose.");
    AddTraderTrigger("What are you doing?","I am guarding.");
    AddTraderTrigger("What do you sell?","I don't sell anything. Ask Sam in the castle.");
    AddAdditionalText("Go to Sam.");
    AddAdditionalText("I don't sell anything.");
    AddTraderTrigger("Who ist Sam?","Sam is a simply merchant in the castle. There you can buy clothes, tools, candles and lampoil.");
    AddAdditionalTrigger("Sam");
    AddCondition("lang","english");
    AddTraderTrigger("Where is the Nordmark?","You'll find the Nordmark if you go west. Once you reach the sea walk north. But beware, they have hard laws.");
    AddAdditionalTrigger("Nordmark");
    AddCondition("lang","english");
    AddTraderTrigger("Where is Trolls Bane?","Troll's Bane is easy to find. Just follow the path over the bridge. Follow the path south and you already see the town walls.");
    AddAdditionalTrigger("Trolls Bane");
    AddAdditionalTrigger("Bane");
    AddCondition("lang","english");
    AddTraderTrigger("Where is Greenbriar?","Oh. If you want to go to Greenbriar, you're totally wrong here. The best way is that you first go to Troll's Bane. From there you have to go south to the union. At the union you have to go west, pass the habor and walk over the bridge. From there just go south. The halflings are always friendly and it is a good place to live.");
    AddAdditionalTrigger("Greenbriar");
    AddAdditionalTrigger("Briar");
    AddCondition("lang","english");
    AddTraderTrigger("Where is Varshikar?","You'll find the desert town if you go to Troll's Bane and turn east. Pass Garon's workshop and follow the way east. It is very hot there but you'll find some nice people. And pay attention, in the mountains are some strong creatures!");
    AddAdditionalTrigger("Varshikar");
    AddCondition("lang","english");
    AddTraderTrigger("Where is Silverbrand?","The fastest way to the dwarves is if you pass the bridge and follow the Fairy Tear's on the other side of the river. Sometime the dwarfs are grumbly but their beer is the best on Gobaith!");
    AddAdditionalTrigger("Silverbrand");
    AddAdditionalTrigger("Silberbrand");
    AddCondition("lang","english");
    AddTraderTrigger("Help","[Gamehelp] This is an NPC who can tell you something about the Grey Rose and where you can find the other towns.");
    AddTraderTrigger("What is the Grey Rose?","The Grey Rose is the oldest knight circle on Gobaith. Usually it consists of the high circle, the knights and the following. The Grey Rose is always striving for balance on Gobaith and is always looking for followers.");
    AddAdditionalTrigger("Grey Rose");
    AddAdditionalTrigger("Rose");
    AddAdditionalTrigger("Grey Refuge");
    AddCondition("lang","english");
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