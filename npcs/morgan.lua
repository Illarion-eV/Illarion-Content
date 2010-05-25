--Name:        Morgan Gronwan
--Race:        Human
--Town:        Trolls Bane
--Function:    Restricted trader
--Position:    x=-56 y=-96 z=0
--Facing:      West
--Last Update: 04/26/2006
--Update by:   Nitram

dofile("npc_trader_functions.lua")
dofile("npc_functions.lua")

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(CCharacter.say, "Finger weg!") end
    if (lang==1) then thisNPC:talk(CCharacter.say, "Don't you touch me!") end
end

function initializeNpc()
    npcs.base.autonpcfunctions.InitTalkLists()
    InitItemLists()

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    --            EPr ,ID  ,Am,SPr,SA,Qual ,Dura   ,Data,Catagory
    
    AddTraderItem(150 ,48  ,20,5  ,15,{5,7},{55,88},0   ,0       ); -- leather gloves
    AddTraderItem(300 ,53  ,20,5  ,15,{5,7},{55,88},0   ,0       ); -- leather boot
    AddTraderItem(500 ,367 ,20,8  ,10,{5,7},{55,88},0   ,0       ); -- short leather leg
    AddTraderItem(900 ,366 ,20,15 ,5 ,{5,7},{55,88},0   ,0       ); -- long leather leg
    AddTraderItem(400 ,2113,5 ,35 ,5 ,{2,4},{33,66},0   ,0       ); -- Fellhose
    AddTraderItem(0   ,362 ,5 ,35 ,5 ,{5,7},{55,88},0   ,0       ); -- full leatherarmor
    AddTraderItem(0   ,363 ,5 ,15 ,5 ,{5,7},{55,88},0   ,0       ); -- leather scale armor
    AddTraderItem(0   ,364 ,5 ,55 ,10,{5,7},{55,88},0   ,0       ); -- light hunting armor
    AddTraderItem(0   ,365 ,10,15 ,10,{5,7},{55,88},0   ,0       ); -- half leather armor
    AddTraderItem(250 ,27  ,5 ,3  ,20,{5,7},{55,88},0   ,0       ); -- simple dagger
    AddTraderItem(550 ,189 ,5 ,5  ,10,{5,7},{55,88},0   ,0       ); -- sharp dagger
    AddTraderItem(750 ,78  ,5 ,7  ,10,{5,7},{55,88},0   ,0       ); -- short sword
    AddTraderItem(10 ,293 ,100,2  ,10,{5,7},{55,88},0   ,0       ); -- throwing spear
    AddTraderItem(4   ,237 ,60,1  ,40,{3}  ,{33}   ,0   ,0       ); -- crossbow bolt
    AddTraderItem(0   ,70  ,5 ,10 ,5 ,{5,7},{55,88},0   ,0       ); -- crossbow
    AddTraderItem(15  ,306 ,50,1  ,50,{3}  ,{33}   ,0   ,0       ); -- ham
    AddTraderItem(120 ,2456,20,10 ,15,{5,7},{55,88},0   ,0       ); -- mushroom soup
    AddTraderItem(20  ,49  ,50,5  ,50,{3}  ,{33}   ,0   ,0       ); -- bread
    AddTraderItem(5   ,2529,40,0  ,15,{3}  ,{33}   ,0   ,0       ); -- honeycomb

    
    TraderCopper=5000;

    npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]reet.+","Greetings. How I can help you?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh]ello");
    npcs.base.autonpcfunctions.AddAdditionalText("Hello. You are hungry? I have a very good mushroom soup. Or do you need something of my leather wares?");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]rüße","Grüße. Wie kann ich euch helfen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh]allo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Gg]rüse");
    npcs.base.autonpcfunctions.AddAdditionalText("Hallo. Bist du hungrig? Ich habe sehr gute Pilzsuppe. Oder brauchst du etwas von meinen Lederwaren?");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Yy]ou.+[Tt]rader","I'm a trader of goods for hunters. Do you need something of my leather wares or weapons? I also have food as proviant for long travels.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[DdIi][uh]r*.+[Hh]ändler","Nunja, ich handle mit Sachen für den Jagdbedarf. Brauchst du vielleicht etwas von meinen Lederwaren oder Waffen? ich biete auch Proviant für Reisende an.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+sell","I trade with leather cloths, leather armors, weapons, food and more.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+verkauf","Ich handel mit Lederkleidung, Lederrüstungen, Waffen, Nahrung und mehr.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+[Ww]are","I have leather cloths, leather armors, weapons, food and more.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+[Ww]are","Ich habe Leder Kleidung, Leder Rüstungen, Waffen, Nahrung und mehr.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+[Cc]loth","See I made good leather gloves, leather boots, short and long leather legs.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+[Kk]leidung","Schau, ich habe gute Leder Handschuhe, Stiefel und kurze und lange Leder Hosen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+[Aa]rmor","Lets me show you. Here, I have the best leather armors you can find: full leatherarmor, leather scale armor, light hunting armor, half leather armor.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+[Rr]üstung","Lass sie mich euch zeigen. Ich habe beste Lederrüstungen. Volle und halbe Lederrüstung, Lederschuppenrüstung und die leichte Jagtrüstung.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+[Ww]eapon","Take a look at my sortiment. I trade with simple daggers, sharp daggers, short swords, throwing spear, crossbow and crossbow bolts.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+[Ww]affe","Schaut euch mein Sortiment an. Ich handel mit einfachen und scharfen Dolche, Kurzschwertern, Wurfspeeren, Armbrüste und Armbrustbolzen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+[Ff]ood","I trade with ham, mushroom soup and bread.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+[Nn]ahrung","Ich handel mit Schinken, Pilzsuppe und Brot.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+[Mm]ore","I have thread and honeycomb.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+[Mm]ehr","Ich habe Garn und Honigwaben.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]oodbye","Have a good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Bb]ye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ff]arewell");
    npcs.base.autonpcfunctions.AddAdditionalText("Good day.");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell friend!");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Schönen Tag noch");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[BB]is.+[Bb]ald");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]ho.+you?","Morgan Gronwan I am called. I am ranger and life in the woods");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]er.+[DdIi][uh]r*","Morgan Gronwan werde ich genannt. Ich bin Jäger und lebe in den Wäldern.");
    npcs.base.autonpcfunctions.AddTraderTrigger("I'm .+","Nice to meet you. Sit down if you want. ... Do you want to taste my mushroom soup?");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ii]ch.+[Bb]in","Freut mich euch kennen zu lernen. Setzt euch wenn ihr wollt. Wollt ihr meine Pilzsuppe kosten?");
    npcs.base.autonpcfunctions.AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");

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
        npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
        TraderStdCopper=TraderCopper;
        thisNPC.activeLanguage=TradStdLang;
    end
    TraderCycle();
    npcs.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npcs.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if (npcs.base.autonpcfunctions.LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            Status,Values=SayPriceSell(originator, message)
            if (Status==0) then Status,Values=SayPriceBuy(originator, message) end
            if (Status==0) then Status,Values=ShowItemList(originator, message) end
            if (Status==0) then Status,Values=Selling(originator, message) end
            if (Status==0) then Status,Values=Buying(originator, message) end
            if (Status==0) then Status,Values=TellDate(originator, message, TraderMonths) end
            if (Status==0) then npcs.base.autonpcfunctions.TellSmallTalk(message) end

            ----------------------------EDIT BELOW HERE-----------------------------------
            if (Status==1) then -- Verkauf von mehreren Items erfolgreich // Selling of multible items succeed
                gText="Ihr möchtet "..Values[1].." "..world:getItemName(Values[2],0).." kaufen? Bitte sehr, macht dann"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want "..Values[1].." "..world:getItemName(Values[2],1).."? Here you are, that makes"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
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
            if (Status==6) then -- Verkauf eines einzelnen Items erfolgreich // Selling of a single item succeed
                gText=GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr kaufen wollt? Bitte sehr, das macht"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want a "..world:getItemName(Values[2],1).."? Here you are, that makes"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            end
            if (Status==7) then -- Verkaufspreis Ansage für ein Item // selling price announcement for an item
                gText=GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[1],0).." kostet"..MoneyText(0,Values[2],Values[3],Values[4],TraderLang)..".";
                eText="The "..world:getItemName(Values[1],1).." costs"..MoneyText(1,Values[2],Values[3],Values[4],TraderLang)..".";
            end
           
		    if (Status==8) then -- Einkaufspreis Ansage für ein Item // buying price announcement for an item
                gText=GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." wäre mir"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang).." wert.";
                eText="I would pay"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang).." for "..Values[1]..world:getItemName(Values[2],1);					
			end
            if (Status==9) then -- Einkauf von mehreren Items erfolgreich // Buying of multible items succeed
                gText="Ihr wollt "..Values[1].." "..world:getItemName(Values[2],0).." verkaufen? Ich gebe euch"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell "..Values[1].." "..world:getItemName(Values[2],1).."? I give you"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
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
            if (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // Buying of a single item succeed
                gText=GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr verkaufen möchtet? Ich gebe euch"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
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
                    eText="It's the "..EnglDigit(Values[1]).." of "..Values[2].." of the year "..Values[3]..".";
                end
            end

            if (Status~=0) then
                outText=npcs.base.npcautofunction.GetNLS(originator,gText,eText);
                thisNPC:talk(CCharacter.say,outText);
            end

            ---------------------------------- DON'T EDIT BELOW HERE ------------------------------
            if (string.find(message,"[sS]tatus")~=nil and originator:isAdmin()==true) then
                thisNPC:talk(CCharacter.say,"Copper="..TraderCopper ..", next delivery: "..nextDelivery.."cycCount:"..cycCount);
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
                outText=npcs.base.npcautofunction.GetNLS(originator,gText,eText);
                thisNPC:talk(CCharacter.say,outText);
                verwirrt=true;
            end
        end
    end --id
end--function
