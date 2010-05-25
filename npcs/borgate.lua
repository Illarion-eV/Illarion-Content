--Name:        Borgate Northoff
--Race:        Dwarf
--Town:        Trolls Bane
--Function:    Barkeeper
--Position:    x=-83 y=-101 z=0
--Facing:      West
--Last Update: 04/16/2006
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
    InitTalkLists()
    InitItemLists()

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    --            EPr ,ID  ,Am,SPr,SA,Qual ,Dura   ,Data,Catagory
    --AddTraderItem(15  ,2496,50 ,5,100,{4,6},{33,66},0   ,0       ); --blue bottle
    --AddTraderItem(25  ,2497,50 ,8 ,100,{4,6},{33,66},0   ,0       ); --orange bottle
    --AddTraderItem(25  ,2499,50 ,8 ,100,{4,6},{33,66},0   ,0       ); --green bottle
    --AddTraderItem(25  ,2500,50 ,8 ,100,{4,6},{33,66},0   ,0       ); --red bottle
    --AddTraderItem(25  ,2501,50 ,8 ,100,{4,6},{33,66},0   ,0       ); --black bottle
    --AddTraderItem(15  ,1860,100,0 ,500,{4,6},{33,66},0   ,0       ); --goblet with red wine
    --AddTraderItem(11  ,1855,100,0 ,500,{4,6},{33,66},0   ,0       ); --goblet with water
    --AddTraderItem(15  ,1859,100,0 ,500,{4,6},{33,66},0   ,0       ); --goblet with cider
    --AddTraderItem(15  ,1853,50 ,0 ,500,{4,6},{33,66},0   ,0       ); --goblet with mead
    --AddTraderItem(0   ,1908,50 ,2 ,100,{4,6},{33,66},0   ,0       ); --glass mug mug
    --AddTraderItem(15  ,1909,100,0 ,100,{4,6},{33,66},0   ,0       ); --beer mug
    --AddTraderItem(10  ,1858,50 ,2 ,100,{4,6},{33,66},0   ,0       ); --goblet
    --AddTraderItem(0   ,2498,20 ,1 ,100,{4,6},{33,66},0   ,0       ); --grey bottle

    TraderCopper=1000;

    --AddTraderTrigger("[Gg]reet","Aahr! Be greeted in 'The Fluffy Sheep Tavern'. What do you want to drink?");
    --AddAdditionalTrigger("[Hh]ello");
    --AddAdditionalText("Hello. What do I have to make you?");
    --AddTraderTrigger("[Ww]hat.+sell","Drinks and more. What do you thought? It's a Bar. And now, tell me: What do you want?");
    --AddTraderTrigger("[Yy]ou.+[Bb]arkeeper","What do you think I have to do here? What a stupid question. Aaarh! Drink or eat something or leave!");
    --AddTraderTrigger("[Ww]hat.+[Ww]are","It's a damned bar, what do you think I sell? But here, look at the list: drinks and more.");
    --AddTraderTrigger("[Ww]hat.+[Dd]rink","All kind: bottle of elven wine, of water, of mead, of cider, of red wine, of beer, beer mug, goblet red wine, goblet water, goblet cider, goblet mead. But the mugs, goblets and bottles - give them back when you are ready. There is a refund on them.");
    --AddTraderTrigger("[Ww]hat.+[Mm]ore","Oh, I need glass mugs, copper goblets and grey bottles for they everyday business. Do you have some of them?");
    --AddTraderTrigger("[Gg]oodbye","Good day!");
    --AddAdditionalTrigger("[Bb]ye");
    --AddAdditionalText("Aye. Come back whenever you are thirsty.");
    --AddAdditionalTrigger("[Ff]arewell");
    --AddAdditionalText("Farewell friend!");
    --AddTraderTrigger("[Ww]ho.+you?"..thisNPC.name..". I work here for Tialdin, the owner of this tavern.");
    --AddTraderTrigger("I'm .+","Great. I am "..thisNPC.name..", the barkeeper. Do you want something to drink?");
    --AddTraderTrigger("[Tt]ell.+[Ss]omething","Arr, Where shall I begin? I could tell you lots of what is spoken in this tavern, but if I would do that, no one would come back. No, I am not a traitor to my guests. Sorry!");
    AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?', 'Tell <something>'");

    --AddTraderTrigger("[Gg]rü[ßs]+e","Willkommen in der Fluffy Sheep Taverne, was willst Du trinken?");
    --AddAdditionalTrigger("[Hh]allo");
    --AddAdditionalText("Guten Tag. Was soll ich Dir machen?");
    --AddTraderTrigger("[IiDd][hu][r ].*[Ww]irt","Genau, ich bin hier der Wirt. Was willst Du trinken?");
    --AddTraderTrigger("[Ww]as.+verkauf","Ich verkaufe alles, was das Herz begehrt: Met, Wein, Bier, und so weiter. Willst du was?");
    --AddTraderTrigger("[Ww]as.+[Gg]etränke","Das hier ist 'ne Kneipe, was glaubst du, was wir hier verkaufen?");
    --AddTraderTrigger("[Ee]rzähl.+was","Ich höre viel und weiss eigentlich fast alles. Ich erzähl' dir aber nichts davon, das geht dich nunmal nichts an.");
    --AddTraderTrigger("[Tt]schüss","Schönen Tag noch.");
    --AddAdditionalTrigger("[Aa]uf.+[Bb]ald");
    --AddAdditionalText("Bis bald.");
    --AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    --AddAdditionalText("Auf bald!");
    --AddTraderTrigger("[Ww]er.+[IiDd][hu][r ]?","Ich bin "..thisNPC.name..". Ich arbeite hier für Tialdin als Wirt der Kneipe.");
    --AddTraderTrigger("Ich bin .+","Ich bin "..thisNPC.name..". Willst Du was trinken?");
    AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");

    --AddCycleText("#me trocknet einen Bierkrug ab","#me wipes a beer mug clean");
    --AddCycleText("#me sieht sich gelangweilt um","#me looks around bored");
    --AddCycleText("#me spielt mit einer Kupfermünze","#me plays with a copper coin");
    --AddCycleText("#me wischt über die Theke","#me wipes over the bar");
    AddCycleText("Arrr...","Arrr...");
    AddCycleText("Arrr!","Arrr!");
    AddCycleText("Arrr...?","Arrr...?");
    --AddCycleText("#me trinkt ein Bier","#me gulps down a beer");
    AddCycleText("#me brummt verärgert:'Ich streike!'","#me grumbles in anger:'I am on strike!'");

    TraderLang={"Gold","gold","Silber", "silver","Kupfer","copper","stücke","pieces"};
    TraderMonths={"Elos","Tanos","Zhas","Ushos","Siros","Ronas","Bras","Eldas","Irmas","Malas","Findos","Olos","Adras","Naras","Chos","Mas"};

    RefreshTime={10000,40000};

    TradSpeakLang={0,2};
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
        increaseLangSkill(TradSpeakLang)
        TraderStdCopper=TraderCopper;
        thisNPC.activeLanguage=TradStdLang;
    end
    TraderCycle();
    SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if BasicNPCChecks(originator,2) then
        if (LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            Status,Values=SayPriceSell(originator, message)
            if (Status==0) then Status,Values=SayPriceBuy(originator, message) end
            if (Status==0) then Status,Values=ShowItemList(originator, message) end
            if (Status==0) then Status,Values=Selling(originator, message) end
            if (Status==0) then Status,Values=Buying(originator, message) end
            if (Status==0) then Status,Values=TellDate(originator, message, TraderMonths) end
            if (Status==0) then TellSmallTalk(message) end

            ----------------------------EDIT BELOW HERE-----------------------------------
            if (Status==1) then -- Verkauf von mehreren Items erfolgreich // Selling of multible items succeed
                gText="Ihr möchtet "..Values[1].." "..world:getItemName(Values[2],0).." kaufen? Bitte sehr, macht dann"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want "..Values[1].." "..world:getItemName(Values[2],1).."? Here you are, that makes"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
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
            elseif (Status==6) then -- Verkauf eines einzelnen Items erfolgreich // Selling of a single item succeed
                gText=GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr kaufen wollt? Bitte sehr, das macht"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want a "..world:getItemName(Values[2],1).."? Here you are, that makes"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==7) then -- Verkaufspreis Ansage für ein Item // selling price announcement for an item
                gText=GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[1],0).." kostet"..MoneyText(0,Values[2],Values[3],Values[4],TraderLang)..".";
                eText="The "..world:getItemName(Values[1],1).." costs"..MoneyText(1,Values[2],Values[3],Values[4],TraderLang)..".";
            elseif (Status==8) then -- Einkaufspreis Ansage für ein Item // buying price announcement for an item
                gText=GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." wäre mir"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang).." wert.";
                eText="I would pay"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang).." for "..Values[1]..world:getItemName(Values[2],1);
            elseif (Status==9) then -- Einkauf von mehreren Items erfolgreich // Buying of multible items succeed
                gText="Ihr wollt "..Values[1].." "..world:getItemName(Values[2],0).." verkaufen? Ich gebe euch"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell "..Values[1].." "..world:getItemName(Values[2],1).."? I give you"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==10) then -- Item das gekauft werden soll nicht vorhanden // item that should be buyed is not aviable
                gText="Kommt wieder wenn ihr das habt!";
                eText="Come back when you have that!";
            elseif (Status==11) then -- Händler hat nicht genug Geld // trader don't have enougth money
                gText="Tut mir leid. Ich kann das nicht kaufen. Ich habe nicht genug Geld.";
                eText="Sorry, I cannot buy that. I do not have enough money.";
            elseif (Status==12) then -- Händler kauft das Item nicht // trader didn't buy the item
                gText="So etwas kaufe ich nicht. Tut mir leid.";
                eText="Sorry, I do not buy that item.";
            elseif (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // Buying of a single item succeed
                gText=GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr verkaufen möchtet? Ich gebe euch"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==14) then -- Liste der Waren die der NPC verkauft ist nicht leer // List of the wares the NPC sells, is not empty
                gText="Ich verkaufe Getränke, Getränke und man stell sich vor: Getränke!";
                eText="I sell drinks, drinks and hard to believe: drinks!";
            elseif (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                gText="Ich verkaufe nichts.";
                eText="I sell nothing.";
            elseif (Status==16) then -- Liste der Waren die der NPC kauft ist nicht leer // List of the wares the NPC buys, is not empty
                gText="Ich kaufe Getränke und Glaskrüge.";
                eText="I buy drinks and glass mugs.";
            elseif (Status==17) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is empty
                gText="Ich kaufe nichts.";
                eText="I buy nothing.";
            elseif (Status==18) then
                gText="Es ist der "..Values[1]..". Tag des Monates "..Values[2].." im Jahre "..Values[3]..".";
                local seleced=math.random(1,2)
                if (seleced==1) then
                    eText="It's day "..Values[1].." of "..Values[2].." of the year "..Values[3]..".";
                elseif (seleced==2) then
                    eText="It's the "..EnglDigit(Values[1]).." of "..Values[2].." of the year "..Values[3]..".";
                end
            end

            if (Status~=0) then
                outText=GetNLS(originator,gText,eText);
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
            thisNPC.activeLanguage=TradStdLang;
        else
            if (verwirrt==false) then
                gText="#me sieht dich leicht verwirrt an";
                eText="#me looks at you a little confused";
                outText=GetNLS(originator,gText,eText);
                thisNPC:talk(CCharacter.say,outText);
                verwirrt=true;
            end
        end
    end
end--function

function lookAtNpc(Char, mode)
    if initLook==nil then
        output={};
        output[0]="Ein breit lächelnder Zwergenwirt, dessen prächtiger Bart und Kleidung von Bierflecken übersät ist.";
        output[1]="A broadly smiling dwarfen barkeeper whose proud beard and clothes are covered with beer stains.";
        initLook=1;
    end
    
    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end