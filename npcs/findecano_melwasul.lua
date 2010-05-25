--[[ INSERT INTO npc VALUES (nextval('npc_seq'),3,-101,-133,0,4,false,'Findecáno Melwasúl','npc_findecano_melwasul.lua',0);
name=Findecáno Melwasúl
position=-101,-133,0
sex=male
race=elf
direction=south
questid=2
function: newbie island NPC; last NPC, telling about craftmasters
]]

require("npcs.base.autonpcfunctions")
require("base.common")

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

    QuestID = 2;
    -- small talk
    AddTraderTrigger(".+","Come again when Amelia Kolodem sends you to me. She is the human lumberjack lady down in the forest. Go outside, follow the road, climb down the ladder and go through the cave and follow the road through the desert into the wood. She's by the fire place.");
    AddCondition("lang","english");
    AddCondition("qpg","<",48);
    AddTraderTrigger(".+","Kommt wieder, wenn Amelia Kolodem Euch zu mir schickt. Sie ist die Holzfällerin unten im Wald. Geht nach draußen, folgt der Straße, klettert die Leiter herunter und durchquert die Höhle und folgt wieder der Straße durch die Wüste in den Wald. Sie steht bei der Feuerstelle.");
    AddCondition("lang","german");
    AddCondition("qpg","<",48);
    AddTraderTrigger("greet","Be greeted, young traveller. As I see you have passed all tasks so far on this island. You are now allowed to leave it and enter Gobaith. But I greatly recommend that you first learn something from the craftmasters that I've hired for you newcomers.");
    AddAdditionalTrigger("hello");
    AddCondition("state","=",0);
    AddConsequence("state","=",1);
    AddTraderTrigger("gr[üu][sß]","Seid gegrüßt, junger Reisender. Wie ich sehe, habt Ihr alle bisherigen Aufgaben auf dieser Insel erledigt. Ihr dürft sie nun verlassen und Gobaith betreten. Doch ich empfehle dringendst, dass Ihr erst noch etwas von meinen Handwerksmeistern lernt, die ich für Euch Neuankömmlinge angeheuert habe.");
    AddAdditionalTrigger("grue[sß]");
    AddAdditionalTrigger("hallo");
    AddCondition("state","=",0);
    AddConsequence("state","=",1);
    AddTraderTrigger("greet","Hello again, young traveller. If you want to leave this island, just tell me 'I want to enter Gobaith'. If you want to learn more, ask me 'What about the craftmasters?'.");
    AddAdditionalTrigger("hello");
    AddTraderTrigger("gr[üu][sß]","Nochmals hallo, junger Reisender. Falls Ihr diese Insel verlassen wollt, sagt mir einfach 'Ich will nach Gobaith'. Falls Ihr mehr lernen wollt, fragt mich 'Was ist mit den Handwerksmeistern?'.");
    AddAdditionalTrigger("grue[sß]");
    AddAdditionalTrigger("hallo");
    AddTraderTrigger("who you","I am "..thisNPC.name..", I can help you to travel to Gobaith and to my craftmasters. Just ask for it.");
    AddAdditionalTrigger("what you");
    AddTraderTrigger("wer du","Ich bin "..thisNPC.name..", ich kann Euch helfen nach Gobaith und zu meinen Handwerksmeistern zu reisen. Fragt ruhig danach.");
    AddAdditionalTrigger("was du");
	AddAdditionalTrigger("wer ihr");
	AddAdditionalTrigger("was ihr");
    AddTraderTrigger("how are you","Oh, I am fine. I hope you too.");
    AddTraderTrigger("wie geht dir","Oh, mir geht es gut. Ich hoffe Euch auch.");
    AddAdditionalTrigger("wie geht euch");
    AddAdditionalTrigger("wohlbefinden");
    AddTraderTrigger("bye","Be well.");
    AddAdditionalTrigger("farewell");
    AddAdditionalTrigger("be well");
    AddAdditionalText("Farewell.");
    AddAdditionalText("Good bye.");
    AddTraderTrigger("auf bald","Auf bald.");
    AddAdditionalTrigger("bis bald");
    AddAdditionalTrigger("leb.+wohl");
    AddAdditionalTrigger("tsch[üu][ßs]");
    AddAdditionalTrigger("mach.+gut");
    AddAdditionalText("Bis bald.");
    AddAdditionalText("Lebt wohl.");
    -- infos
    AddTraderTrigger("craft","You may visit the craftmasters. You see the magic portals along the carpet over there? Just step into one. Each banner gives information about who is on the other side of the portal. You can read it by just clicking on the field where it stands with the left mouse button.");
    AddAdditionalTrigger("master");
    AddTraderTrigger("handwerk","Ihr dürft meine Handwerksmeister aufsuchen. Seht Ihr die magischen Portale entlang des Teppichs dort drüben? Tretet einfach in eines hinein. Auf jeder Standarte stehen Informationen, wer sich hinter dem jeweiligen Portal verbirgt. Ihr könnt es lesen, indem Ihr einfach mit der linken Maustaste auf das Feld, auf dem sie steht, klickt.");
    AddAdditionalTrigger("meister");
    AddTraderTrigger("gobiath","It is called Gobaith, not Gobiath. Fool.");
    AddCondition("lang","english");
    AddTraderTrigger("gobiath","Es heißt Gobaith, nicht Gobiath. Narr.");
    AddCondition("lang","german");
    AddTraderTrigger("gobaith","You are now allowed to leave this isle. Those portals next to me lead to Gobaith. The signposts hold the name of the town you can go to and the people that are currently within the town's borders. Troll's Bane - the portal right next to me - is the biggest town, you'd best choose that one.");
    AddAdditionalTrigger("leave");
    AddCondition("qpg","=",100);
    AddCondition("lang","english");
    AddTraderTrigger("gobaith","Ihr dürft nun diese Insel verlassen. Jene Portale neben mir führen nach Gobaith. Auf den Wegweisern steht der Name der Stadt, in die Ihr gehen könnt, und die Leute, die sich gerade innerhalb der Stadt aufhalten. Troll's Bane - das Portal direkt neben mir - ist die größte Stadt, das mögt Ihr vielleicht wählen.");
    AddAdditionalTrigger("verlassen");
    AddCondition("qpg","=",100);
    AddCondition("lang","german");
    AddTraderTrigger("gobaith","Do you want to enter Gobaith now? But remember: You won't be able to come back here, ever. So if you want to get to know other crafts, then do this now. Do you want to leave this place nevertheless?");
    AddAdditionalTrigger("leave");
    AddCondition("lang","english");
    AddConsequence("state","=",2);
    AddTraderTrigger("gobaith","Wollt Ihr nun Gobaith betreten? Aber bedenkt: Ihr könnt dann nie wieder hier her zurückkehren. Also falls Ihr noch andere Handwerke kennenlernen wollt, tut dies jetzt. Wollt Ihr trotzdem diesen Ort verlassen?");
    AddAdditionalTrigger("verlassen");
    AddCondition("lang","german");
    AddConsequence("state","=",2);
    AddTraderTrigger("help","If you want to leave this island, just tell me 'I want to enter Gobaith'. If you want to learn more, ask me 'What about the craftmasters?'.");
    AddTraderTrigger("hilf","Falls Ihr diese Insel verlassen wollt, sagt mir einfach 'Ich will nach Gobaith'. Falls Ihr mehr lernen wollt, fragt mich 'Was ist mit den Handwerksmeistern?'.");
    AddAdditionalTrigger("helf");
    -- STATE 2
    AddTraderTrigger("no","Well then, you can visit my craftmasters.");
    AddCondition("state","=",2);
    AddTraderTrigger("nein","Nun, dann könnt Ihr meine Handwerksmeister besuchen.");
    AddCondition("state","=",2);
    AddTraderTrigger("yes","So shall it be. You are now allowed to leave this isle. Those portals next to me lead to Gobaith. The signposts hold the name of the town you can go to and the people that are currently within the town's borders. Troll's Bane - the portal right next to me - is the biggest town, you'd best choose that one. Farewell then and the Five Gods with you.");
    AddCondition("state","=",2);
    AddConsequence("qpg","=",100);
    AddConsequence("state","=",3);
    AddTraderTrigger("ja","So soll es sein. Ihr dürft nun diese Insel verlassen. Jene Portale neben mir führen nach Gobaith. Auf den Wegweisern steht der Name der Stadt, in die Ihr gehen könnt, und die Leute, die sich gerade innerhalb der Stadt aufhalten. Troll's Bane - das Portal direkt neben mir - ist die größte Stadt, das mögt Ihr vielleicht wählen. Lebt wohl nun und mögen die Fünf Götter mit Euch sein.");
    AddCondition("state","=",2);
    AddConsequence("qpg","=",100);
    AddConsequence("state","=",3);
    -- last catch
    AddTraderTrigger(".+","I asked if you want to enter Gobaith now, remember: there is no way back to this island. Yes or no?");
    AddCondition("state","=",2);
    AddCondition("lang","english");
    AddTraderTrigger(".+","Ich fragte, ob Ihr Gobaith nun betreten wollt, bedenkt: es gibt keinen Weg zurück zu dieser Insel. Ja oder nein?");
    AddCondition("state","=",2);
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
			if NPCStatus[originator.id] == 3 then
				thisNPC:talkLanguage(CCharacter.say,CPlayer.english,"#me raises his hand and mumbles a mystical formula.");
				thisNPC:talkLanguage(CCharacter.say,CPlayer.german,"#me hebt seine Hand und murmelt eine mystische Formel.");
				world:gfx(53,originator.pos);
				world:makeSound(13,originator.pos);
				NPCStatus[originator.id]=1;
			end
        else
            Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end
