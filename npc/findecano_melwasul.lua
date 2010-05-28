--[[ INSERT INTO npc VALUES (nextval('npc_seq'),3,-101,-133,0,4,false,'Findecáno Melwasúl','npc_findecano_melwasul.lua',0);
name=Findecáno Melwasúl
position=-101,-133,0
sex=male
race=elf
direction=south
questid=2
function: newbie island NPC; last NPC, telling about craftmasters
]]

require("npc.base.autonpcfunctions")
require("base.common")
module("npc.findecano_melwasul")

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

    QuestID = 2;
    -- small talk
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Come again when Amelia Kolodem sends you to me. She is the human lumberjack lady down in the forest. Go outside, follow the road, climb down the ladder and go through the cave and follow the road through the desert into the wood. She's by the fire place.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("qpg","<",48);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Kommt wieder, wenn Amelia Kolodem Euch zu mir schickt. Sie ist die Holzfällerin unten im Wald. Geht nach draußen, folgt der Straße, klettert die Leiter herunter und durchquert die Höhle und folgt wieder der Straße durch die Wüste in den Wald. Sie steht bei der Feuerstelle.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("qpg","<",48);
    npc.base.autonpcfunctions.AddTraderTrigger("greet","Be greeted, young traveller. As I see you have passed all tasks so far on this island. You are now allowed to leave it and enter Gobaith. But I greatly recommend that you first learn something from the craftmasters that I've hired for you newcomers.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hello");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("gr[üu][sß]","Seid gegrüßt, junger Reisender. Wie ich sehe, habt Ihr alle bisherigen Aufgaben auf dieser Insel erledigt. Ihr dürft sie nun verlassen und Gobaith betreten. Doch ich empfehle dringendst, dass Ihr erst noch etwas von meinen Handwerksmeistern lernt, die ich für Euch Neuankömmlinge angeheuert habe.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hallo");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("greet","Hello again, young traveller. If you want to leave this island, just tell me 'I want to enter Gobaith'. If you want to learn more, ask me 'What about the craftmasters?'.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hello");
    npc.base.autonpcfunctions.AddTraderTrigger("gr[üu][sß]","Nochmals hallo, junger Reisender. Falls Ihr diese Insel verlassen wollt, sagt mir einfach 'Ich will nach Gobaith'. Falls Ihr mehr lernen wollt, fragt mich 'Was ist mit den Handwerksmeistern?'.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hallo");
    npc.base.autonpcfunctions.AddTraderTrigger("who you","I am "..thisNPC.name..", I can help you to travel to Gobaith and to my craftmasters. Just ask for it.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what you");
    npc.base.autonpcfunctions.AddTraderTrigger("wer du","Ich bin "..thisNPC.name..", ich kann Euch helfen nach Gobaith und zu meinen Handwerksmeistern zu reisen. Fragt ruhig danach.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was du");
	npc.base.autonpcfunctions.AddAdditionalTrigger("wer ihr");
	npc.base.autonpcfunctions.AddAdditionalTrigger("was ihr");
    npc.base.autonpcfunctions.AddTraderTrigger("how are you","Oh, I am fine. I hope you too.");
    npc.base.autonpcfunctions.AddTraderTrigger("wie geht dir","Oh, mir geht es gut. Ich hoffe Euch auch.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie geht euch");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wohlbefinden");
    npc.base.autonpcfunctions.AddTraderTrigger("bye","Be well.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("farewell");
    npc.base.autonpcfunctions.AddAdditionalTrigger("be well");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell.");
    npc.base.autonpcfunctions.AddAdditionalText("Good bye.");
    npc.base.autonpcfunctions.AddTraderTrigger("auf bald","Auf bald.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("bis bald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("leb.+wohl");
    npc.base.autonpcfunctions.AddAdditionalTrigger("tsch[üu][ßs]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mach.+gut");
    npc.base.autonpcfunctions.AddAdditionalText("Bis bald.");
    npc.base.autonpcfunctions.AddAdditionalText("Lebt wohl.");
    -- infos
    npc.base.autonpcfunctions.AddTraderTrigger("craft","You may visit the craftmasters. You see the magic portals along the carpet over there? Just step into one. Each banner gives information about who is on the other side of the portal. You can read it by just clicking on the field where it stands with the left mouse button.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("master");
    npc.base.autonpcfunctions.AddTraderTrigger("handwerk","Ihr dürft meine Handwerksmeister aufsuchen. Seht Ihr die magischen Portale entlang des Teppichs dort drüben? Tretet einfach in eines hinein. Auf jeder Standarte stehen Informationen, wer sich hinter dem jeweiligen Portal verbirgt. Ihr könnt es lesen, indem Ihr einfach mit der linken Maustaste auf das Feld, auf dem sie steht, klickt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("meister");
    npc.base.autonpcfunctions.AddTraderTrigger("gobiath","It is called Gobaith, not Gobiath. Fool.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("gobiath","Es heißt Gobaith, nicht Gobiath. Narr.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("gobaith","You are now allowed to leave this isle. Those portals next to me lead to Gobaith. The signposts hold the name of the town you can go to and the people that are currently within the town's borders. Troll's Bane - the portal right next to me - is the biggest town, you'd best choose that one.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("leave");
    npc.base.autonpcfunctions.AddCondition("qpg","=",100);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("gobaith","Ihr dürft nun diese Insel verlassen. Jene Portale neben mir führen nach Gobaith. Auf den Wegweisern steht der Name der Stadt, in die Ihr gehen könnt, und die Leute, die sich gerade innerhalb der Stadt aufhalten. Troll's Bane - das Portal direkt neben mir - ist die größte Stadt, das mögt Ihr vielleicht wählen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("verlassen");
    npc.base.autonpcfunctions.AddCondition("qpg","=",100);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("gobaith","Do you want to enter Gobaith now? But remember: You won't be able to come back here, ever. So if you want to get to know other crafts, then do this now. Do you want to leave this place nevertheless?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("leave");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("state","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("gobaith","Wollt Ihr nun Gobaith betreten? Aber bedenkt: Ihr könnt dann nie wieder hier her zurückkehren. Also falls Ihr noch andere Handwerke kennenlernen wollt, tut dies jetzt. Wollt Ihr trotzdem diesen Ort verlassen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("verlassen");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("state","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("help","If you want to leave this island, just tell me 'I want to enter Gobaith'. If you want to learn more, ask me 'What about the craftmasters?'.");
    npc.base.autonpcfunctions.AddTraderTrigger("hilf","Falls Ihr diese Insel verlassen wollt, sagt mir einfach 'Ich will nach Gobaith'. Falls Ihr mehr lernen wollt, fragt mich 'Was ist mit den Handwerksmeistern?'.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("helf");
    -- STATE 2
    npc.base.autonpcfunctions.AddTraderTrigger("no","Well then, you can visit my craftmasters.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("nein","Nun, dann könnt Ihr meine Handwerksmeister besuchen.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("yes","So shall it be. You are now allowed to leave this isle. Those portals next to me lead to Gobaith. The signposts hold the name of the town you can go to and the people that are currently within the town's borders. Troll's Bane - the portal right next to me - is the biggest town, you'd best choose that one. Farewell then and the Five Gods with you.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",100);
    npc.base.autonpcfunctions.AddConsequence("state","=",3);
    npc.base.autonpcfunctions.AddTraderTrigger("ja","So soll es sein. Ihr dürft nun diese Insel verlassen. Jene Portale neben mir führen nach Gobaith. Auf den Wegweisern steht der Name der Stadt, in die Ihr gehen könnt, und die Leute, die sich gerade innerhalb der Stadt aufhalten. Troll's Bane - das Portal direkt neben mir - ist die größte Stadt, das mögt Ihr vielleicht wählen. Lebt wohl nun und mögen die Fünf Götter mit Euch sein.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",100);
    npc.base.autonpcfunctions.AddConsequence("state","=",3);
    -- last catch
    npc.base.autonpcfunctions.AddTraderTrigger(".+","I asked if you want to enter Gobaith now, remember: there is no way back to this island. Yes or no?");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ich fragte, ob Ihr Gobaith nun betreten wollt, bedenkt: es gibt keinen Weg zurück zu dieser Insel. Ja oder nein?");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddCondition("lang","german");
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
			if NPCStatus[originator.id] == 3 then
				thisNPC:talkLanguage(CCharacter.say,CPlayer.english,"#me raises his hand and mumbles a mystical formula.");
				thisNPC:talkLanguage(CCharacter.say,CPlayer.german,"#me hebt seine Hand und murmelt eine mystische Formel.");
				world:gfx(53,originator.pos);
				world:makeSound(13,originator.pos);
				NPCStatus[originator.id]=1;
			end
        else
            npc.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end
