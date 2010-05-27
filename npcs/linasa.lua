--Name:        Linasa
--Race:        Elf
--Town:        Tol Vanima
--Function:    Travel Trader
--Position:    x=362 y=214 z=1
--Facing:      West
--Last Update: 11/27/2005
--Update by:   Nitram

-- INSERT INTO npc VALUES (71,3, 362, 214,1,6,'f','Linasa','npc_linasa.lua',1);

require("npcs.base.trader_functions")
require("npcs.base.functions")
module("npcs.linasa")

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(CCharacter.say, "Finger weg!") end
    if (lang==1) then thisNPC:talk(CCharacter.say, "Don't you touch me!") end
end

function initializeNpc()
    npcs.base.functions.InitTalkLists()
    npcs.base.trader_functions.InitItemLists()
    useIDTrigger=false;

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    --            EPr ,ID  ,Am,SPr,SA,Qual ,Dura   ,Data,Catagory
    npcs.base.trader_functions.AddTraderItem(100  ,1061,4 ,0  ,5 ,{1}  ,{01}   ,0   ,0       ); -- Trolls Bane
    npcs.base.trader_functions.AddItemTrigger("[Jj]ourney.+to.+[Tt]rolls.*[Bb]ane");
    npcs.base.trader_functions.AddItemTrigger("[Rr]eise.+nach.+[Tt]rolls.*[Bb]ane");
    npcs.base.trader_functions.AddItemTrigger("[Jj]ourney.+to.+[Tt]roll's.*[Bb]ane");
    npcs.base.trader_functions.AddItemTrigger("[Rr]eise.+nach.+[Tt]roll's.*[Bb]ane");
    npcs.base.trader_functions.AddTraderItem(100  ,1061,4 ,0  ,4 ,{1}  ,{02}   ,0   ,0       ); -- Lighthouse
    npcs.base.trader_functions.AddItemTrigger("[Jj]ourney.+to.+[Ll]ighthouse");
    npcs.base.trader_functions.AddItemTrigger("[Rr]eise.+zum.+[Ll]euchtturm");
    npcs.base.trader_functions.AddTraderItem(100  ,1061,2 ,0  ,5 ,{1}  ,{03}   ,0   ,0       ); -- Eldan
    npcs.base.trader_functions.AddItemTrigger("[Jj]ourney.+to.+[Ee]ldan");
    npcs.base.trader_functions.AddItemTrigger("[Rr]eise.+zum.+[Ee]ldan.+[Kk]loster");
    npcs.base.trader_functions.AddTraderItem(100  ,1061,4 ,0  ,6 ,{1}  ,{04}   ,0   ,0       ); -- Harbor
    npcs.base.trader_functions.AddItemTrigger("[Jj]ourney.+to.+[Hh]arbor");
    npcs.base.trader_functions.AddItemTrigger("[Rr]eise.+zum.+[Hh]afen");
    npcs.base.trader_functions.AddTraderItem(100  ,1061,4 ,0  ,9 ,{1}  ,{05}   ,0   ,0       ); -- Greenbriar
    npcs.base.trader_functions.AddItemTrigger("[Jj]ourney.+to.+[Gg]reen.*[Bb]riar");
    npcs.base.trader_functions.AddItemTrigger("[Rr]eise.+nach.+[Gg]reen.*[Bb]riar");
    npcs.base.trader_functions.AddTraderItem(100  ,1061,3 ,0  ,3 ,{1}  ,{06}   ,0   ,0       ); -- Tol Vanima
    npcs.base.trader_functions.AddItemTrigger("[Jj]ourney.+to.+[Tt]ol.*[Vv]anima");
    npcs.base.trader_functions.AddItemTrigger("[Rr]eise.+nach.+[Tt]ol.*[Vv]anima");
    npcs.base.trader_functions.AddTraderItem(100  ,1061,4 ,0  ,3 ,{1}  ,{07}   ,0   ,0       ); -- Varshikar
    npcs.base.trader_functions.AddItemTrigger("[Jj]ourney.+to.+[Vv]arshikar");
    npcs.base.trader_functions.AddItemTrigger("[Rr]eise.+nach.+[Vv]arshikar");
    npcs.base.trader_functions.AddTraderItem(100  ,1061,3 ,0  ,3 ,{1}  ,{08}   ,0   ,0       ); -- Silverbrand
    npcs.base.trader_functions.AddItemTrigger("[Jj]ourney.+to.+[Ss]ilverbrand");
    npcs.base.trader_functions.AddItemTrigger("[Rr]eise.+nach.+[Ss]ilberbrand");

    TraderCopper=500;

    npcs.base.functions.AddTraderTrigger("[Gg]reetings","Greetings, traveler. Can I help you? Need to travel somewhere?");
    npcs.base.functions.AddAdditionalTrigger("[Hh]ello");
    npcs.base.functions.AddAdditionalText("Good day. Do you need something?");
    npcs.base.functions.AddTraderTrigger("[Gg]rü[ßs]+e","Grüße, Reisender. Kann ich euch helfen? Wollt ihr irgendwohin reisen?");
    npcs.base.functions.AddAdditionalTrigger("[hH]allo");
    npcs.base.functions.AddAdditionalText("Guten Tag. Braucht ihr etwas?");
    npcs.base.functions.AddTraderTrigger("[Yy]ou.+[Tt]rader","I am a trader, yes. I trade with magic journeys.");
    npcs.base.functions.AddTraderTrigger("[DdIi][uh]r*.+[Hh]ändler","Ich bin Händler, Ja. Ich handel mit Magischen Reisen.");
    npcs.base.functions.AddTraderTrigger("[Ww]hat.+sell","I sell all kinds journeys to the nicest places.");
    npcs.base.functions.AddTraderTrigger("[Ww]as.+verkauf","Ich verkaufe Reisen zu den schönsten Orten dieser Insel.");
    npcs.base.functions.AddTraderTrigger("[Ww]hat.+[Jj]ourneys","To big cities and some special locations.");
    npcs.base.functions.AddTraderTrigger("[Ww]as.+[Rr]eisen","Zu großen Städten und zu einigen speziellen Orten.");
    npcs.base.functions.AddTraderTrigger("[Pp]laces","I sell journeys to the following places: The harbor, Eldan monastery, Lighthouse.");
    npcs.base.functions.AddTraderTrigger("[Oo]rt","Ich verkaufe Reisen zu folgenden Orten: Zum Hafen, zum Eldan Kloster, zum Leuchtturm.");
    npcs.base.functions.AddTraderTrigger("[Tt]ell.+[Ss]omething","I am a trader and a traveler.");
    npcs.base.functions.AddTraderTrigger("[Ee]rzähl.+[Ww]as","Ich bin ein Händler und ein Reisender.");
    npcs.base.functions.AddTraderTrigger("[Gg]oodbye","Have a nice journey!");
    npcs.base.functions.AddAdditionalTrigger("[Bb]ye");
    npcs.base.functions.AddAdditionalTrigger("[Ff]arewell");
    npcs.base.functions.AddAdditionalText("Farewell!");
    npcs.base.functions.AddAdditionalText("Good bye.");
    npcs.base.functions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Gute Reise!");
    npcs.base.functions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npcs.base.functions.AddAdditionalText("Auf bald");
    npcs.base.functions.AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'");
    npcs.base.functions.AddTraderTrigger("[Tt]ravel","Yes, you can travel with the help of the journeys I sell.");
    npcs.base.functions.AddTraderTrigger("[Rr]eise","Ja, du kannst mit den Reisen die ich verkaufe, reisen.");
    npcs.base.functions.AddTraderTrigger("[Cc]ities","I sell journeys to the cities of Troll's Bane, Silverbrand, Varshikar, Greenbriar and Tol Vanima, the elven town.");
    npcs.base.functions.AddTraderTrigger("[Ss]t[aä]dt","Ich verkaufe Reisen in die Städte Trolls Bane, Silverbrand, Varshikar, Greenbriar und Tol Vanima, die Elfen Stadt.");
    npcs.base.functions.AddTraderTrigger("[Tt]owns","I sell journeys to the towns of Troll's Bane, Silverbrand, Varshikar, Greenbriar and Tol Vanima, the elven town.");
    npcs.base.functions.AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");

    TraderLang={"Gold","gold","Silber", "silver","Kupfer","copper","stücke","pieces"};
    TraderMonths={"Elos","Tanos","Zhas","Ushos","Siros","Ronas","Bras","Eldas","Irmas","Malas","Findos","Olos","Adras","Naras","Chos","Mas"};

    RefreshTime={10000,20000};

    TradSpeakLang={0,3};
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
        npcs.base.functions.increaseLangSkill(TradSpeakLang)
        TraderStdCopper=TraderCopper;
        thisNPC.activeLanguage=TradStdLang;
    end
    npcs.base.trader_functions.TraderCycle();
    npcs.base.functions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npcs.base.functions.BasicNPCChecks(originator,2) then
        if (npcs.base.functions.LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            Status,Values=npcs.base.trader_functions.SayPriceSell(originator, message)
            if (Status==0) then Status,Values=npcs.base.trader_functions.SayPriceBuy(originator, message) end
            if (Status==0) then Status,Values=npcs.base.trader_functions.ShowItemList(originator, message) end
            if (Status==0) then Status,Values=npcs.base.trader_functions.Selling(originator, message) end
            if (Status==0) then Status,Values=npcs.base.trader_functions.Buying(originator, message) end
            if (Status==0) then Status,Values=npcs.base.functions.TellDate(originator, message, TraderMonths) end
            if (Status==0) then npcs.base.functions.TellSmallTalk(message) end

            ----------------------------EDIT BELOW HERE-----------------------------------
            if (Status==1) then -- Verkauf von mehreren Items erfolgreich // npcs.base.trader_functions.Selling of multible items succeed
                gText="Ihr möchtet "..Values[1].." "..world:getItemName(Values[2],0).." kaufen? Bitte sehr, macht dann"..npcs.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want "..Values[1].." "..world:getItemName(Values[2],1).."? Here you are, that makes"..npcs.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==2) then -- Item kann wegen Platzmangel nicht erstellt werden // Item can't created, cause of lag of space
                gText="Tut mir leid, aber Ihr habt nicht genug Platz in Eurem Inventar.";
                eText="Sorry, you do not have enough space in your inventory.";
            elseif (Status==3) then -- Nicht genug Geld um das Item zu bezahlen // not enougth money to buy the item
                gText="Kommt wieder wenn ihr genug Geld habt!";
                eText="Come back when you have enough money!";
            elseif (Status==4) then -- Item ausverkauft // item out of stock
                gText="Tut mir leid. Ich habe das im Moment nicht. Kommt doch bitte später wieder.";
                eText="I am sorry, I don't have this currently. Come back later.";
            elseif (Status==5) then -- Item wird nicht verkauft // item
                gText="Tut mir Leid. Ich verkaufe das nicht.";
                eText="Sorry, I do not sell that item.";
            elseif (Status==6) then -- Verkauf eines einzelnen Items erfolgreich // npcs.base.trader_functions.Selling of a single item succeed
                gText=npcs.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr kaufen wollt? Bitte sehr, das macht"..npcs.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want a "..world:getItemName(Values[2],1).."? Here you are, that makes"..npcs.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==7) then -- Verkaufspreis Ansage für ein Item // selling price announcement for an item
                gText=npcs.base.functions.GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[1],0).." kostet"..npcs.base.trader_functions.MoneyText(0,Values[2],Values[3],Values[4],TraderLang)..".";
                eText="The "..world:getItemName(Values[1],1).." costs"..npcs.base.trader_functions.MoneyText(1,Values[2],Values[3],Values[4],TraderLang)..".";
            elseif (Status==8) then -- Einkaufspreis Ansage für ein Item // buying price announcement for an item
                gText=npcs.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." wäre mir"..npcs.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang).." wert.";
                eText="I would pay"..npcs.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang).." for "..Values[1]..world:getItemName(Values[2],1);
            elseif (Status==9) then -- Einkauf von mehreren Items erfolgreich // npcs.base.trader_functions.Buying of multible items succeed
                gText="Ihr wollt "..Values[1].." "..world:getItemName(Values[2],0).." verkaufen? Ich gebe euch"..npcs.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell "..Values[1].." "..world:getItemName(Values[2],1).."? I give you"..npcs.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==10) then -- Item das gekauft werden soll nicht vorhanden // item that should be buyed is not aviable
                gText="Kommt wieder wenn ihr das habt!";
                eText="Come back when you have that!";
            elseif (Status==11) then -- Händler hat nicht genug Geld // trader don't have enougth money
                gText="Tut mir leid. Ich kann das nicht kaufen. Ich habe nicht genug Geld.";
                eText="Sorry, I cannot buy that. I do not have enough money.";
            elseif (Status==12) then -- Händler kauft das Item nicht // trader didn't buy the item
                gText="So etwas kaufe ich nicht. Tut mir leid.";
                eText="Sorry, I do not buy that item.";
            elseif (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // npcs.base.trader_functions.Buying of a single item succeed
                gText=npcs.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr verkaufen möchtet? Ich gebe euch"..npcs.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..npcs.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==14) then -- Liste der Waren die der NPC verkauft ist nicht leer // List of the wares the NPC sells, is not empty
                gText="Ich verkaufe Reisen nach Trolls Bane, Varshikar, Greenbriar, Silberbrand und Tol Vanima und zum Leuchtturm, zum Eldankloster und zum Hafen.";
                eText="I sell journeys to Trolls Bane, Varshikar, Greenbriar, Silverbrand, Tol Vanima, the Harbour, the Lighthouse and to the Eldan monestary.";
            elseif (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                gText="Ich verkaufe nichts.";
                eText="I sell nothing.";
            elseif (Status==16) then -- Liste der Waren die der NPC kauft ist nicht leer // List of the wares the NPC buys, is not empty
                gText="Ich kaufe Reisen.";
                eText="I buy journeys.";
            elseif (Status==17) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is empty
                gText="Ich kaufe nichts.";
                eText="I buy nothing.";
            elseif (Status==18) then
                gText="Es ist der "..Values[1]..". Tag des Monates "..Values[2].." im Jahre "..Values[3]..".";
                local seleced=math.random(1,2)
                if (seleced==1) then
                    eText="It's day "..Values[1].." of "..Values[2].." of the year "..Values[3]..".";
                elseif (seleced==2) then
                    eText="It's the "..npcs.base.functions.EnglDigit(Values[1]).." of "..Values[2].." of the year "..Values[3]..".";
                end
            end

            if (Status~=0) then
                outText=npcs.base.functions.GetNLS(originator,gText,eText);
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
                outText=npcs.base.functions.GetNLS(originator,gText,eText);
                thisNPC:talk(CCharacter.say,outText);
                verwirrt=true;
            end
        end
    end --id
end--function
