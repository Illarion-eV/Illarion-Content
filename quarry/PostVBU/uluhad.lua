-- INSERT INTO npc VALUES (nextval('npc_seq'),0,1,1,0,4,false,'Uluhad','npc_uluhad.lua',0);
require("npc.base.autonpcfunctions")
module("npc.uluhad", package.seeall)

function buyIn( amount )
    User:setQuestProgress(playerBuyInID, User:getQuestProgress(playerBuyInID)+amount);
    return amount;
end

function cashOut()
    playerMoney = User:getQuestProgress(playerMoneyID);
    playerBuyIn = User:getQuestProgress(playerBuyInID);
    playerWonMon = playerMoney - playerBuyIn;
    if( playerWonMon > 0 ) then
        houseMoney = math.ceil(houseRake*playerWonMon);
        playerMoney = playerMoney - houseMoney;
        
        filepoint,errmsg=io.open("/home/vilarion/money/gamble"..QuestID..".dat","r+");
        if (filepoint~=nil) then
            filepoint:seek("set");
            coins = houseMoney + filepoint:read("*n");
            filepoint:seek("set");
            filepoint:write(""..coins);
            filepoint:close();
        end;
        
        thisNPC:talkLanguage(Character.say, Player.german, "Der Hausanteil ist "..houseRakePercent.."% aller Gewinne");
        thisNPC:talkLanguage(Character.say, Player.english,"The house rake is "..houseRakePercent.."% of all winnings");
    end;
    User:setQuestProgress(playerMoneyID, 0);
    User:setQuestProgress(playerBuyInID, 0);
    return playerMoney;
end

 function useNPC(user,counter,param)
   thisNPC:increaseSkill(1,"common language",100);
   thisNPC:talkLanguage(Character.say, Player.german, "Finger weg!");
   thisNPC:talkLanguage(Character.say, Player.english, "Don't you touch me!");
 end

 function initializeNpc()
   if TraderFirst then
       TraderFirst=1;
       return true;
   end
   
   --debugMode = 1;
   
   QuestID   = 17;
   houseRake = 0.10;
   
   playerMoneyID = QuestID;
   playerBuyInID = QuestID+1;
   houseRakePercent = houseRake * 100;
   
   npc.base.autonpcfunctions.InitTalkLists();
   
   
   -- ********* START DYNAMIC PART ********
   npc.base.autonpcfunctions.AddTraderTrigger("Hello","Be greeted.");
   npc.base.autonpcfunctions.AddTraderTrigger("Hallo","Seid mir gegrüßt.");
   npc.base.autonpcfunctions.AddTraderTrigger("greetings","Be greeted.");
   npc.base.autonpcfunctions.AddTraderTrigger("grüße","Seid mir gegrüßt.");
   npc.base.autonpcfunctions.AddTraderTrigger("help","I sell chips for gambling and give you your money afterwards. I am the cashier here.");
   npc.base.autonpcfunctions.AddTraderTrigger("hilfe","Ich verkaufe Chips zum Spielen und gebe Euch später Euer Geld. Ich bin der Kassierer hier.");
   npc.base.autonpcfunctions.AddTraderTrigger("what sell","I sell chips for gambling and give you your money afterwards. I am the cashier here.");
   npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ich verkaufe Chips zum Spielen und gebe Euch später Euer Geld. Ich bin der Kassierer hier.");
   
   npc.base.autonpcfunctions.AddTraderTrigger("%NUMBER chips","That is not enough money for %NUMBER chips.");
   npc.base.autonpcfunctions.AddCondition("money","<","%NUMBER");
   npc.base.autonpcfunctions.AddCondition("lang","english");
   npc.base.autonpcfunctions.AddTraderTrigger("%NUMBER chips","Das ist nicht genug Geld für %NUMBER Chips.");
   npc.base.autonpcfunctions.AddCondition("money","<","%NUMBER");
   npc.base.autonpcfunctions.AddCondition("lang","german");

   npc.base.autonpcfunctions.AddTraderTrigger("%NUMBER chips","Here are %NUMBER chips to play with. Enjoy your stay.");
   npc.base.autonpcfunctions.AddConsequence("money","-","%NUMBER");
   --npc.base.autonpcfunctions.AddCondition("money",">=","%NUMBER")
   npc.base.autonpcfunctions.AddConsequence("qpg","+",buyIn);
   npc.base.autonpcfunctions.AddCondition("lang","english");
   npc.base.autonpcfunctions.AddTraderTrigger("%NUMBER chips","Hier sind %NUMBER Chips zum Spielen. Viel Spaß.");
   npc.base.autonpcfunctions.AddConsequence("money","-","%NUMBER");
   --npc.base.autonpcfunctions.AddCondition("money",">=","%NUMBER")
   npc.base.autonpcfunctions.AddConsequence("qpg","+",buyIn);
   npc.base.autonpcfunctions.AddCondition("lang","german");

   npc.base.autonpcfunctions.AddTraderTrigger("money","No chips, no money.");
   npc.base.autonpcfunctions.AddCondition("qpg","=",0);
   npc.base.autonpcfunctions.AddTraderTrigger("geld","Keine Chips, kein Geld.");
   npc.base.autonpcfunctions.AddCondition("qpg","=",0);
   
   npc.base.autonpcfunctions.AddTraderTrigger("money","Here is your money.");
   --npc.base.autonpcfunctions.AddCondition("qpg",">",0);
   npc.base.autonpcfunctions.AddConsequence("money","+",cashOut);
   
   npc.base.autonpcfunctions.AddTraderTrigger("geld","Da hast du dein Geld.");
   --npc.base.autonpcfunctions.AddCondition("qpg",">",0);
   npc.base.autonpcfunctions.AddConsequence("money","+",cashOut);

   -- ********* END DYNAMIC PART ********
   TradSpeakLang={0,1};
   TradStdLang=0;
   
   npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
   thisNPC.activeLanguage=TradStdLang;
 end

 function nextCycle() -- ~10 times per second
   initializeNpc();
   npc.base.autonpcfunctions.SpeakerCycle();
 end

 function receiveText(texttype, message, originator)
   if npc.base.autonpcfunctions.BasicNPCChecks(originator,2) then
  if npc.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
 debugText="";
 if debugMode then
   if QuestID~=nil then
  QeSt=originator:getQuestProgress( QuestID );
  if QeSt~=nil then
 debugText="QS="..QeSt;
  else
 debugText="QS=0";
  end
   end
   St=NPCStatus[originator.id]
   if St~=nil then
  debugText=debugText.." St="..St;
   else
  debugText=debugText.." St=0";
   end
   thisNPC:talk(Character.say,"Debug Info: "..debugText);
 end
 --thisNPC:talkLanguage(Character.say, Player.german, "before npc.base.autonpcfunctions.TellSmallTalk");
 npc.base.autonpcfunctions.TellSmallTalk(message,originator);
 --thisNPC:talkLanguage(Character.say, Player.german, "after npc.base.autonpcfunctions.TellSmallTalk");
  else
 npc.base.autonpcfunctions.Confused(
  "#me sieht dich leicht verwirrt an",
  "#me looks at you a little confused"
 );
  end
   end
 end
