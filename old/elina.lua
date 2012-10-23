--Name:        Elinas
--Race:        Elf
--Town:        Vanima
--Function:    Restricted trader
--Position:    x=371 y=209 z=2
--Facing:      South
--Last Update: 08/3/2008
--Update by:   Lennier

require("npc.base.trader_functions")
require("npc.base.functions")
module("npc.elina", package.seeall)

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(Character.say, "Fasst mich nicht an!") end
    if (lang==1) then thisNPC:talk(Character.say, "Don't you touch me!") end
end

function initializeNpc()
    npc.base.functions.InitTalkLists()
    npc.base.trader_functions.InitItemLists()

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------

    --            EPr ,ID  ,Am  ,SPr,SA  ,Qual ,Dura   ,Data,Catagory
    npc.base.trader_functions.AddTraderItem(5   ,64  ,1000,1  ,1000,{5  },{77,90},0   ,0); -- arrow
    npc.base.trader_functions.AddTraderItem(80  ,65  ,90  ,8  ,20  ,{5,6},{77,90},0   ,0); -- short bow
    npc.base.trader_functions.AddTraderItem(120 ,2714,90  ,12 ,20  ,{5,6},{77,90},0   ,0); -- hunting bow
    npc.base.trader_functions.AddTraderItem(150 ,2646,90  ,16 ,20  ,{5,6},{77,90},0   ,0); -- serinjah rider's bow
    npc.base.trader_functions.AddTraderItem(500 ,2718,90  ,50 ,20  ,{5,6},{77,90},0   ,0); -- elven composite longbow
    npc.base.trader_functions.AddTraderItem(200 ,2708,90  ,20 ,20  ,{5,6},{77,90},0   ,0); -- long bow
    npc.base.trader_functions.AddTraderItem(100 ,90  ,90  ,10 ,20  ,{5,6},{77,90},0   ,0); -- flute
    npc.base.trader_functions.AddTraderItem(400 ,335 ,90  ,40 ,20  ,{5,6},{77,90},0   ,0); -- lute
    npc.base.trader_functions.AddTraderItem(500 ,332 ,90  ,50 ,20  ,{5,6},{77,90},0   ,0); -- harp
    npc.base.trader_functions.AddTraderItem(200 ,2445,90  ,20 ,20  ,{5,6},{77,90},0   ,0); -- small wooden shield
    npc.base.trader_functions.AddTraderItem(100 ,17  ,90  ,10 ,20  ,{5,6},{77,90},0   ,0); -- wooden shield
    npc.base.trader_functions.AddTraderItem(200 ,2194,90  ,20 ,20  ,{5,6},{77,90},0   ,0); -- small hardwood greaves
    npc.base.trader_functions.AddTraderItem(400 ,2193,90  ,40 ,20  ,{5,6},{77,90},0   ,0); -- hardwood greaves
    npc.base.trader_functions.AddTraderItem(250 ,207 ,90  ,25 ,20  ,{5,6},{77,90},0   ,0); -- battle staff
    npc.base.trader_functions.AddTraderItem(500 ,208 ,90  ,50 ,20  ,{5,6},{77,90},0   ,0); -- ornate mage's staff
    npc.base.trader_functions.AddTraderItem(500 ,209 ,90  ,50 ,20  ,{5,6},{77,90},0   ,0); -- elven mage's staff



    TraderCopper=7000;

    npc.base.functions.AddTraderTrigger("[Gg]reetings","The five with you. Can I help you?");
    npc.base.functions.AddAdditionalTrigger("[Hh]ello");
    npc.base.functions.AddAdditionalText("Be blessed, my friend. Do you need something?");
    npc.base.functions.AddTraderTrigger("[Yy]ou.+[Tt]rader","I am a trader, yes. I trade different carpentry tools.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+sell","I sell all kinds of carpentry tools");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Tt]ools","I sell tools for carpenters. Saws, axes, planes and carving tools.");
    npc.base.functions.AddTraderTrigger("[Tt]ell.+[Ss]omething","This is Tol Vanima, the home of us elves.");
    npc.base.functions.AddTraderTrigger("[Gg]oodbye","The five with you!");
    npc.base.functions.AddAdditionalTrigger("[Bb]ye");
    npc.base.functions.AddAdditionalText("May the gods bless your path!");
    npc.base.functions.AddAdditionalTrigger("[Ff]arewell");
    npc.base.functions.AddAdditionalText("Farewell, my friend!");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+buy","I buy all kinds of bows and crossbows.");
    npc.base.functions.AddTraderTrigger("[Ww]ho.+you?","My name is "..thisNPC.name..".");
    npc.base.functions.AddTraderTrigger("I'm .+","Be greeted!");
    npc.base.functions.AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'");

    npc.base.functions.AddTraderTrigger("[Gg]r[üu][ßs]+","Die Fünf zum Gruße, kann ich euch helfen?");
    npc.base.functions.AddAdditionalTrigger("[Hh]allo");
    npc.base.functions.AddAdditionalText("Möge euer Pfad gesegnet sein! Wie kann ich euch helfen?");
    npc.base.functions.AddTraderTrigger("[DdIi][uh]r*.+[Hh]ändler","Ich bin ein Händler, ja, und ich verkaufe unter anderem Werkzeuge.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+verkauf","Ich verkaufe Werkzeuge für jede Art von Tischlerei.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Ww]erkzeug","Nun, ich verkaufe Tischlerwerkzeug...Sägen, Äxte, Hobel und Schnitzwerkzeuge.");
    npc.base.functions.AddTraderTrigger("[Ee]rzähl.+[Ww]as","Dies ist Tol Vanima, die Heimat von uns Elfen.");
    npc.base.functions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Die Fünf seien mit euch. Bis bald!");
    npc.base.functions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npc.base.functions.AddAdditionalText("Bis bald, mein Freund, der Segen der Fünf mit euch!");
    npc.base.functions.AddTraderTrigger("[Ww]as.+%s[Kk]auf","Ich kaufe alle Arten von Bögen und Armbrüsten.");
    npc.base.functions.AddTraderTrigger("[Ww]er.+[IiDd][hu]r*","Ich bin "..thisNPC.name..".");
    npc.base.functions.AddTraderTrigger("Ich bin .+","So grüße ich euch, mein Freund!");
    npc.base.functions.AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");

    npc.base.functions.AddCycleText("#me schnitzt mit eleganten Bewegungen an einer kleinen Holzstatue herum","#me carves on a small wooden statue with a elegant motions");
    npc.base.functions.AddCycleText("#me blickt sich kurz um","#me looks around a moment");
    npc.base.functions.AddCycleText("#me betrachtet einen Pfeil prüfend","#me looks on an arrow with a checking glance");

    TraderLang={"Gold","gold","Silber", "silver","Kupfer","copper","stücke","pieces"};
    TraderMonths={"Elos","Tanos","Zhas","Ushos","Siros","Ronas","Bras","Eldas","Irmas","Malas","Findos","Olos","Adras","Naras","Chos","Mas"};

    RefreshTime={10000,40000};

    TradSpeakLang={3};
    TradStdLang=3;
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
                eText="Sorry, you do not have enough spaces in your inventory.";
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
                eText="The "..world:getItemName(Values[1],0).." costs"..npc.base.trader_functions.MoneyText(1,Values[2],Values[3],Values[4],TraderLang)..".";
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
                gText="Ich verkaufe verschiedene Holzwaren.";
                eText="I sell different wares of wood.";
            elseif (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                gText="Ich verkaufe nichts.";
                eText="I do not sell anything.";
            elseif (Status==16) then -- Liste der Waren die der NPC kauft ist nicht leer // List of the wares the NPC buys, is not empty
                gText="Ich kaufe verschiedenste Holzwaren an.";
                eText="I buy different wares made of wood.";
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
