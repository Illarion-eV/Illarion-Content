--Name:        Morgan Gronwan
--Race:        Human
--Town:        Trolls Bane
--Function:    Restricted trader
--Position:    x=-56 y=-96 z=0
--Facing:      West
--Last Update: 04/26/2006
--Update by:   Nitram

require("npc.base.trader_functions")
require("npc.base.functions")
module("npc.morgan", package.seeall)

function useNPC(user)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(Character.say, "Finger weg!") end
    if (lang==1) then thisNPC:talk(Character.say, "Don't you touch me!") end
end

function initializeNpc()
    npc.base.functions.InitTalkLists()
    npc.base.trader_functions.InitItemLists()

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    --            EPr ,ID  ,Am,SPr,SA,Qual ,Dura   ,Data,Catagory
    
    npc.base.trader_functions.AddTraderItem(150 ,48  ,20,5  ,15,{5,7},{55,88},0   ,0       ); -- leather gloves
    npc.base.trader_functions.AddTraderItem(300 ,53  ,20,5  ,15,{5,7},{55,88},0   ,0       ); -- leather boot
    npc.base.trader_functions.AddTraderItem(500 ,367 ,20,8  ,10,{5,7},{55,88},0   ,0       ); -- short leather leg
    npc.base.trader_functions.AddTraderItem(900 ,366 ,20,15 ,5 ,{5,7},{55,88},0   ,0       ); -- long leather leg
    npc.base.trader_functions.AddTraderItem(400 ,2113,5 ,35 ,5 ,{2,4},{33,66},0   ,0       ); -- Fellhose
    npc.base.trader_functions.AddTraderItem(0   ,362 ,5 ,35 ,5 ,{5,7},{55,88},0   ,0       ); -- full leatherarmor
    npc.base.trader_functions.AddTraderItem(0   ,363 ,5 ,15 ,5 ,{5,7},{55,88},0   ,0       ); -- leather scale armor
    npc.base.trader_functions.AddTraderItem(0   ,364 ,5 ,55 ,10,{5,7},{55,88},0   ,0       ); -- light hunting armor
    npc.base.trader_functions.AddTraderItem(0   ,365 ,10,15 ,10,{5,7},{55,88},0   ,0       ); -- half leather armor
    npc.base.trader_functions.AddTraderItem(250 ,27  ,5 ,3  ,20,{5,7},{55,88},0   ,0       ); -- simple dagger
    npc.base.trader_functions.AddTraderItem(550 ,189 ,5 ,5  ,10,{5,7},{55,88},0   ,0       ); -- sharp dagger
    npc.base.trader_functions.AddTraderItem(750 ,78  ,5 ,7  ,10,{5,7},{55,88},0   ,0       ); -- short sword
    npc.base.trader_functions.AddTraderItem(10 ,293 ,100,2  ,10,{5,7},{55,88},0   ,0       ); -- throwing spear
    npc.base.trader_functions.AddTraderItem(4   ,237 ,60,1  ,40,{3}  ,{33}   ,0   ,0       ); -- crossbow bolt
    npc.base.trader_functions.AddTraderItem(0   ,70  ,5 ,10 ,5 ,{5,7},{55,88},0   ,0       ); -- crossbow
    npc.base.trader_functions.AddTraderItem(15  ,306 ,50,1  ,50,{3}  ,{33}   ,0   ,0       ); -- ham
    npc.base.trader_functions.AddTraderItem(120 ,2456,20,10 ,15,{5,7},{55,88},0   ,0       ); -- mushroom soup
    npc.base.trader_functions.AddTraderItem(20  ,49  ,50,5  ,50,{3}  ,{33}   ,0   ,0       ); -- bread
    npc.base.trader_functions.AddTraderItem(5   ,2529,40,0  ,15,{3}  ,{33}   ,0   ,0       ); -- honeycomb

    
    TraderCopper=5000;

    npc.base.functions.AddTraderTrigger("[Gg]reet.+","Greetings. How I can help you?");
    npc.base.functions.AddAdditionalTrigger("[Hh]ello");
    npc.base.functions.AddAdditionalText("Hello. You are hungry? I have a very good mushroom soup. Or do you need something of my leather wares?");
    npc.base.functions.AddTraderTrigger("[Gg]rüße","Grüße. Wie kann ich euch helfen?");
    npc.base.functions.AddAdditionalTrigger("[Hh]allo");
    npc.base.functions.AddAdditionalTrigger("[Gg]rüse");
    npc.base.functions.AddAdditionalText("Hallo. Bist du hungrig? Ich habe sehr gute Pilzsuppe. Oder brauchst du etwas von meinen Lederwaren?");
    npc.base.functions.AddTraderTrigger("[Yy]ou.+[Tt]rader","I'm a trader of goods for hunters. Do you need something of my leather wares or weapons? I also have food as proviant for long travels.");
    npc.base.functions.AddTraderTrigger("[DdIi][uh]r*.+[Hh]ändler","Nunja, ich handle mit Sachen für den Jagdbedarf. Brauchst du vielleicht etwas von meinen Lederwaren oder Waffen? ich biete auch Proviant für Reisende an.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+sell","I trade with leather cloths, leather armors, weapons, food and more.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+verkauf","Ich handel mit Lederkleidung, Lederrüstungen, Waffen, Nahrung und mehr.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Ww]are","I have leather cloths, leather armors, weapons, food and more.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Ww]are","Ich habe Leder Kleidung, Leder Rüstungen, Waffen, Nahrung und mehr.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Cc]loth","See I made good leather gloves, leather boots, short and long leather legs.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Kk]leidung","Schau, ich habe gute Leder Handschuhe, Stiefel und kurze und lange Leder Hosen.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Aa]rmor","Lets me show you. Here, I have the best leather armors you can find: full leatherarmor, leather scale armor, light hunting armor, half leather armor.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Rr]üstung","Lass sie mich euch zeigen. Ich habe beste Lederrüstungen. Volle und halbe Lederrüstung, Lederschuppenrüstung und die leichte Jagtrüstung.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Ww]eapon","Take a look at my sortiment. I trade with simple daggers, sharp daggers, short swords, throwing spear, crossbow and crossbow bolts.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Ww]affe","Schaut euch mein Sortiment an. Ich handel mit einfachen und scharfen Dolche, Kurzschwertern, Wurfspeeren, Armbrüste und Armbrustbolzen.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Ff]ood","I trade with ham, mushroom soup and bread.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Nn]ahrung","Ich handel mit Schinken, Pilzsuppe und Brot.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Mm]ore","I have thread and honeycomb.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Mm]ehr","Ich habe Garn und Honigwaben.");
    npc.base.functions.AddTraderTrigger("[Gg]oodbye","Have a good day");
    npc.base.functions.AddAdditionalTrigger("[Bb]ye");
    npc.base.functions.AddAdditionalTrigger("[Ff]arewell");
    npc.base.functions.AddAdditionalText("Good day.");
    npc.base.functions.AddAdditionalText("Farewell friend!");
    npc.base.functions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Schönen Tag noch");
    npc.base.functions.AddAdditionalTrigger("[BB]is.+[Bb]ald");
    npc.base.functions.AddTraderTrigger("[Ww]ho.+you?","Morgan Gronwan I am called. I am ranger and life in the woods");
    npc.base.functions.AddTraderTrigger("[Ww]er.+[DdIi][uh]r*","Morgan Gronwan werde ich genannt. Ich bin Jäger und lebe in den Wäldern.");
    npc.base.functions.AddTraderTrigger("I'm .+","Nice to meet you. Sit down if you want. ... Do you want to taste my mushroom soup?");
    npc.base.functions.AddTraderTrigger("[Ii]ch.+[Bb]in","Freut mich euch kennen zu lernen. Setzt euch wenn ihr wollt. Wollt ihr meine Pilzsuppe kosten?");
    npc.base.functions.AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'");
    npc.base.functions.AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");

    TraderLang={"Gold","gold","Silber", "silver","Kupfer","copper","stücke","pieces"};
    TraderMonths={"Elos","Tanos","Zhas","Ushos","Siros","Ronas","Bras","Eldas","Irmas","Malas","Findos","Olos","Adras","Naras","Chos","Mas"};

    RefreshTime={10000,40000};

    TradSpeakLang={0,1};
    TradStdLang=0;
    --common language=0
    --human language=1
    --dwarf language=2
    --elf language=3
    --lizard language=4
    --orc language=5
    --halfling language=6
    --fairy language=7
    --gnome language=8
    --goblin language=9
    --ancient language=10

end

--------------------------------------------- *** DON'T EDIT BELOW HERE ***--------------------------------------

function nextCycle()  -- ~10 times per second
    if (TraderFirst == nil) then
        initializeNpc();
        npc.base.functions.increaseLangSkill(TradSpeakLang)
        TraderStdCopper=TraderCopper;
        thisNPC.activeLanguage=TradStdLang;
    end
    npc.base.trader_functions.TraderCycle();
    npc.base.functions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npc.base.functions.BasicNPCChecks(originator,2) then
        if (npc.base.functions.LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            Status,Values=npc.base.trader_functions.SayPriceSell(originator, message)
            if (Status==0) then Status,Values=npc.base.trader_functions.SayPriceBuy(originator, message) end
            if (Status==0) then Status,Values=npc.base.trader_functions.ShowItemList(originator, message) end
            if (Status==0) then Status,Values=npc.base.trader_functions.Selling(originator, message) end
            if (Status==0) then Status,Values=npc.base.trader_functions.Buying(originator, message) end
            if (Status==0) then Status,Values=npc.base.functions.TellDate(originator, message, TraderMonths) end
            if (Status==0) then npc.base.functions.TellSmallTalk(message) end

            ----------------------------EDIT BELOW HERE-----------------------------------
            if (Status==1) then -- Verkauf von mehreren Items erfolgreich // npc.base.trader_functions.Selling of multible items succeed
                gText="Ihr möchtet "..Values[1].." "..world:getItemName(Values[2],0).." kaufen? Bitte sehr, macht dann"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want "..Values[1].." "..world:getItemName(Values[2],1).."? Here you are, that makes"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            end
            if (Status==2) then -- Item kann wegen Platzmangel nicht erstellt werden // Item can't created, cause of lag of space
                gText="Tut mir leid, aber Ihr habt nicht genug Platz in Eurem Inventar.";
                eText="Sorry, you do not have enough space in your inventory.";
            end
            if (Status==3) then -- Nicht genug Geld um das Item zu bezahlen // not enough money to buy the item
                gText="Kommt wieder wenn ihr genug Geld habt!";
                eText="Come back when you have enough money!";
            end
            if (Status==4) then -- Item ausverkauft // item out of stock
                gText="Tut mir leid. Ich habe das im Moment nicht. Kommt doch bitte später wieder.";
                eText="I am sorry, I don't have this currently. Come back later.";
            end
            if (Status==5) then -- Item wird nicht verkauft // item
                gText="Tut mir Leid. Ich verkaufe das nicht.";
                eText="Sorry, I do not sell that item.";
            end
            if (Status==6) then -- Verkauf eines einzelnen Items erfolgreich // npc.base.trader_functions.Selling of a single item succeed
                gText=npc.base.functions.GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr kaufen wollt? Bitte sehr, das macht"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want a "..world:getItemName(Values[2],1).."? Here you are, that makes"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            end
            if (Status==7) then -- Verkaufspreis Ansage für ein Item // selling price announcement for an item
                gText=npc.base.functions.GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[1],0).." kostet"..npc.base.trader_functions.MoneyText(0,Values[2],Values[3],Values[4],TraderLang)..".";
                eText="The "..world:getItemName(Values[1],1).." costs"..npc.base.trader_functions.MoneyText(1,Values[2],Values[3],Values[4],TraderLang)..".";
            end
           
		    if (Status==8) then -- Einkaufspreis Ansage für ein Item // buying price announcement for an item
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." wäre mir"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang).." wert.";
                eText="I would pay"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang).." for "..Values[1]..world:getItemName(Values[2],1);					
			end
            if (Status==9) then -- Einkauf von mehreren Items erfolgreich // npc.base.trader_functions.Buying of multible items succeed
                gText="Ihr wollt "..Values[1].." "..world:getItemName(Values[2],0).." verkaufen? Ich gebe euch"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell "..Values[1].." "..world:getItemName(Values[2],1).."? I give you"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            end
            if (Status==10) then -- Item das gekauft werden soll nicht vorhanden // item that should be buyed is not aviable
                gText="Kommt wieder wenn ihr das habt!";
                eText="Come back when you have that!";
            end
            if (Status==11) then -- Händler hat nicht genug Geld // trader don't have enough money
                gText="Tut mir leid. Ich kann das nicht kaufen. Ich habe nicht genug Geld.";
                eText="Sorry, I cannot buy that. I do not have enough money.";
            end
            if (Status==12) then -- Händler kauft das Item nicht // trader didn't buy the item
                gText="So etwas kaufe ich nicht. Tut mir leid.";
                eText="Sorry, I do not buy that item.";
            end
            if (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // npc.base.trader_functions.Buying of a single item succeed
                gText=npc.base.functions.GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr verkaufen möchtet? Ich gebe euch"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            end
            if (Status==14) then -- Liste der Waren die der NPC verkauft ist nicht leer // List of the wares the NPC sells, is not empty
                gText="Ich verkaufe Lederkleidung, Lederrüstungen, Waffen, Nahrung und mehr.";
                eText="I sell leather cloth, leather armors, weapons, food and more.";
            end
            if (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                gText="Ich verkaufe nichts.";
                eText="I do not sell anything.";
            end
            if (Status==16) then -- Liste der Waren die der NPC kauft ist nicht leer // List of the wares the NPC buys, is not empty
                gText="Ich kaufe Lederkleidung, Lederrüstungen, Waffen, Nahrung und mehr.";
                eText="I buy leather cloth, leather armors, weapons and food.";
            end
            if (Status==17) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is empty
                gText="Ich kaufe nichts.";
                eText="I do not buy anything.";
            end
            if (Status==18) then
                gText="Es ist der "..Values[1]..". Tag des Monates "..Values[2].." im Jahre "..Values[3]..".";
                local seleced=math.random(1,2)
                if (seleced==1) then
                    eText="It's day "..Values[1].." of "..Values[2].." of the year "..Values[3]..".";
                elseif (seleced==2) then
                    eText="It's the "..npc.base.functions.EnglDigit(Values[1]).." of "..Values[2].." of the year "..Values[3]..".";
                end
            end

            if (Status~=0) then
                outText=npc.base.functions.GetNLS(originator,gText,eText);
                thisNPC:talk(Character.say,outText);
            end

            ---------------------------------- DON'T EDIT BELOW HERE ------------------------------
            if (string.find(message,"[sS]tatus")~=nil and originator:isAdmin()==true) then
                thisNPC:talk(Character.say,"Copper="..TraderCopper ..", next delivery: "..nextDelivery.."cycCount:"..cycCount);
                statusString="Wares: ";
                for itnCnt=1,table.getn(TraderItemId) do
                    if string.len(statusString)+string.len(world:getItemName(TraderItemId[itnCnt],1))>240 then    -- line too long
                        originator:inform(statusString);                     -- say everything until here
                        statusString="";
                    end
                    statusString=statusString..world:getItemName(TraderItemId[itnCnt],1).."="..TraderItemNumber[itnCnt]..", ";
                end
                originator:inform(statusString);
            end
            if (string.find(message,"[Rr]efill")~=nil and originator:isAdmin()==true) then
                for itnCnt=1,table.getn(TraderItemId) do
                    refill(itnCnt);
                    if (TraderCopper<TraderStdCopper) then TraderCopper=TraderStdCopper end
                end
            end -- string find buy/sell/list...
        else
            if (verwirrt==false) then
                gText="#me sieht dich leicht verwirrt an";
                eText="#me looks at you a little confused";
                outText=npc.base.functions.GetNLS(originator,gText,eText);
                thisNPC:talk(Character.say,outText);
                verwirrt=true;
            end
        end
    end --id
end--function
