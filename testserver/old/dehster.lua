--Name:        Dehster
--Race:        Elf
--Town:        Vanima
--Function:    Public trader
--Position:    x=356 y=153 z=0
--Facing:      South
--Last Update: 08/3/2008
--Update by:   Lennier

require("npc.base.trader_functions")
require("npc.base.functions")
module("npc.dehster", package.seeall)

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
    --            EPr ,ID  ,Am  ,SPr,SA  ,Qual ,Dura   ,Data,Catagory
    npc.base.trader_functions.AddTraderItem(25  ,312 ,100  ,2 ,50,{4,5},{77,90},0   ,0); -- wooden shovel
    npc.base.trader_functions.AddTraderItem(25  ,227 ,100  ,2 ,50,{4,5},{77,90},0   ,0); -- cooking spoon
    npc.base.trader_functions.AddTraderItem(25  ,121 ,100  ,2 ,50,{4,5},{77,90},0   ,0); -- Ofenschieber
    npc.base.trader_functions.AddTraderItem(25  ,118 ,100  ,2 ,50,{4,5},{77,90},0   ,0); -- rolling peel
    npc.base.trader_functions.AddTraderItem(25  ,2781,100  ,2 ,50,{4,5},{77,90},0   ,0); -- stirring rod
    npc.base.trader_functions.AddTraderItem(40  ,126 ,100  ,4 ,50,{4,5},{77,90},0   ,0); -- sickle
    npc.base.trader_functions.AddTraderItem(40  ,9   ,100  ,4 ,50,{4,5},{77,90},0   ,0); -- saw
    npc.base.trader_functions.AddTraderItem(40  ,74  ,100  ,4 ,50,{4,5},{77,90},0   ,0); -- axe
    npc.base.trader_functions.AddTraderItem(50  ,2715,100  ,5 ,50,{4,5},{77,90},0   ,0); -- plane
    npc.base.trader_functions.AddTraderItem(50  ,2752,100  ,5 ,50,{4,5},{77,90},0   ,0); -- carving tools
	npc.base.trader_functions.AddTraderItem(5   ,1001,100  ,0 ,50,{5,6},{77,90},0   ,0); -- plate
    npc.base.trader_functions.AddTraderItem(5   ,2935,100  ,0 ,50 ,{5,6},{77,90},0   ,0); -- soup bowl
	npc.base.trader_functions.AddTraderItem(25  ,429 ,100  ,2  ,50 ,{5}  ,{77,90},0   ,0); -- Kerzenform
	npc.base.trader_functions.AddTraderItem(150 ,399 ,100 ,10 ,50 ,{5,7},{77,90},0   ,0); -- candlestick
	npc.base.trader_functions.AddTraderItem(10  ,43  ,500 ,2  ,200,{5,7},{77,90},0   ,0); -- candles
    npc.base.trader_functions.AddTraderItem(20  ,49  ,200 ,4 ,200,{4,5},{77,90},0   ,0); -- bread
    npc.base.trader_functions.AddTraderItem(30  ,2923,200  ,4 ,50 ,{4,5},{77,90},0   ,0); -- onion soup
    npc.base.trader_functions.AddTraderItem(50  ,556 ,200  ,5 ,50 ,{4,5},{77,90},0   ,0); -- salmon dish




    TraderCopper=5000;

    npc.base.functions.AddTraderTrigger("[Gg]reet","Greetings. I'm "..thisNPC.name..", travelling hawker");
    npc.base.functions.AddAdditionalTrigger("[Hh]ello");
    npc.base.functions.AddAdditionalText("Hello. I'm "..thisNPC.name..", travelling hawker.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+do","I m here to trade. I come from Gobaith to sell different tools and buy other things from here.");
    npc.base.functions.AddTraderTrigger("[Ll]ist.+wares","I trade with different things. Take a look.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+sell","I sell tools and food.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+buy","I buy different things.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Tt]ool","Of every kind what people can need here. Axes and saws for lumberjacks, craving tools and planes for carpenters and some other for bakers and cooks.");
    npc.base.functions.AddTraderTrigger("[Ff]arewell","Farewell.");
    npc.base.functions.AddAdditionalTrigger("[Gg]oodbye");
    npc.base.functions.AddAdditionalText("Bye!");
    npc.base.functions.AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?', 'Tell <something>'");

    npc.base.functions.AddTraderTrigger("[Gg]rü[ßs]+e","Willkommen, ich bin "..thisNPC.name..", ein fliegender Händler.");
    npc.base.functions.AddAdditionalTrigger("[Hh]allo");
    npc.base.functions.AddAdditionalText("Guten Tag, ich bin "..thisNPC.name..", ein fliegender Händler.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+machst","Ich bin von Gobaith und bringe jeden Tag Dinge des täglichen Bedarfs mit.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+verkauf","Ich verkaufe vor allem Werkzeuge und mancherlei anderes. Schau selbst!");
    npc.base.functions.AddTraderTrigger("[Ww]as.kauf","Ich kaufe verschiedene Dinge an.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Ww]erkzeu","Alles was die Leute hier gebrauchen können: Äxte udn Sägen für die Holzfäller, Schnitzmesser und Hobel für Schreiner und mancherlei mehr für Köche und Bäker.");
    npc.base.functions.AddTraderTrigger("[Tt]schüs","Schönen Tag noch.");
    npc.base.functions.AddAdditionalTrigger("[Aa]uf.+[Bb]ald");
    npc.base.functions.AddAdditionalText("Bis bald.");
    npc.base.functions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npc.base.functions.AddAdditionalText("Auf bald!");
    npc.base.functions.AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");

    npc.base.functions.AddCycleText("#me blickt sich nach neuen Kunden um","#me looks around for a new cosmtumer.");
    npc.base.functions.AddCycleText("#me summt eine glückliche Melodie","#me hums a happy melodie");
    npc.base.functions.AddCycleText("#me sieht sich mit einem Lächeln auf den Lippen um","#me looks around with a smile on his face");

    TraderLang={"Gold","gold","Silber", "silver","Kupfer","copper","stücke","pieces"};
    TraderMonths={"Elos","Tanos","Zhas","Ushos","Siros","Ronas","Bras","Eldas","Irmas","Malas","Findos","Olos","Adras","Naras","Chos","Mas"};

    RefreshTime={10000,40000};

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
            elseif (Status==2) then -- Item kann wegen Platzmangel nicht erstellt werden // Item can't created, cause of lag of space
                gText="Tut mir leid, aber ihr habt nicht genug Platz in eurem Inventar.";
                eText="Sorry, you do not have enough space in your inventory.";
            elseif (Status==3) then -- Nicht genug Geld um das Item zu bezahlen // not enough money to buy the item
                gText="Kommt wieder wenn ihr genug Geld habt!";
                eText="Come back when you have enough money!";
            elseif (Status==4) then -- Item ausverkauft // item out of stock
                gText="Tut mir leid. Ich habe das im Moment nicht. Kommt doch bitte später wieder.";
                eText="I am sorry, I don't have this currently. Come back later.";
            elseif (Status==5) then -- Item wird nicht verkauft // item
                gText="Tut mir Leid. Ich verkaufe das nicht.";
                eText="Sorry, I do not sell that item.";
            elseif (Status==6) then -- Verkauf eines einzelnen Items erfolgreich // npc.base.trader_functions.Selling of a single item succeed
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr kaufen wollt? Bitte sehr, das macht"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want a "..world:getItemName(Values[2],1).."? Here you are, that makes"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==7) then -- Verkaufspreis Ansage für ein Item // selling price announcement for an item
                gText=npc.base.functions.GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[1],0).." kostet"..npc.base.trader_functions.MoneyText(0,Values[2],Values[3],Values[4],TraderLang)..".";
                eText="The "..world:getItemName(Values[1],1).." costs"..npc.base.trader_functions.MoneyText(1,Values[2],Values[3],Values[4],TraderLang)..".";
            elseif (Status==8) then -- Einkaufspreis Ansage für ein Item // buying price announcement for an item
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." wäre mir"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang).." wert.";
                eText="I would pay"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang).." for "..Values[1]..world:getItemName(Values[2],1);
            elseif (Status==9) then -- Einkauf von mehreren Items erfolgreich // npc.base.trader_functions.Buying of multible items succeed
                gText="Ihr wollt "..Values[1].." "..world:getItemName(Values[2],0).." verkaufen? Ich gebe euch"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell "..Values[1].." "..world:getItemName(Values[2],1).."? I give you"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==10) then -- Item das gekauft werden soll nicht vorhanden // item that should be buyed is not aviable
                gText="Kommt wieder wenn ihr das habt!";
                eText="Come back when you have that!";
            elseif (Status==11) then -- Händler hat nicht genug Geld // trader don't have enough money
                gText="Tut mir leid. Ich kann das nicht kaufen. Ich habe nicht genug Geld.";
                eText="Sorry, I cannot buy that. I do not have enough money.";
            elseif (Status==12) then -- Händler kauft das Item nicht // trader didn't buy the item
                gText="So etwas kaufe ich nicht. Tut mir leid.";
                eText="Sorry, I do not buy that item.";
            elseif (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // npc.base.trader_functions.Buying of a single item succeed
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr verkaufen möchtet? Ich gebe euch"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==14) then -- Liste der Waren die der NPC verkauft ist nicht leer // List of the wares the NPC sells, is not empty
                gText="Ich verkaufe alle Arten von Waren für den täglichen Gebrauch.";
                eText="I sell all kinds of wares for everyday useage.";
            elseif (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                gText="Ich verkaufe nichts.";
                eText="I do not sell anything.";
            elseif (Status==16) then -- Liste der Waren die der NPC kauft ist nicht leer // List of the wares the NPC buys, is not empty
                gText="Ich kaufe verschiedenes.";
                eText="I buy different things.";
            elseif (Status==17) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is empty
                gText="Ich kaufe nichts.";
                eText="I do not buy anything.";
            elseif (Status==18) then
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
            thisNPC.activeLanguage=TradStdLang;
        else
            if (verwirrt==false) then
                gText="#me sieht dich leicht verwirrt an";
                eText="#me looks at you a little confused";
                outText=npc.base.functions.GetNLS(originator,gText,eText);
                thisNPC:talk(Character.say,outText);
                verwirrt=true;
            end
        end
    end
end--function

