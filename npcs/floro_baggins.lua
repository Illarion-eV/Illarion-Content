--Name:        Floro Baggins
--Race:        Halfling
--Town:        Greenbriar
--Function:    Restricted trader
--Position:    x=-381 y=69 z=0
--Facing:      South
--Last Update: 06/14/2006
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
    --            EPr ,ID  ,Am  ,SPr,SA  ,Qual ,Dura   ,Data,Catagory
    AddTraderItem(8   ,136 ,500 ,1  ,1000,{3}  ,{33}   ,9004   ,0    ); -- pious berry
    AddTraderItem(8   ,137 ,500 ,1  ,1000,{3}  ,{33}   ,0   ,0       ); -- flamegoblet blossom
    AddTraderItem(8   ,138 ,500 ,1  ,1000,{3}  ,{33}   ,0   ,0       ); -- night angels blossom
    AddTraderItem(8   ,140 ,500 ,1  ,1000,{3}  ,{33}   ,0   ,0       ); -- donf blade
    AddTraderItem(8   ,142 ,500 ,1  ,1000,{3}  ,{33}   ,0   ,0       ); -- sand berry
    AddTraderItem(8   ,146 ,500 ,1  ,1000,{3}  ,{33}   ,0   ,0       ); -- desert sky capsule
    AddTraderItem(8   ,148 ,500 ,1  ,1000,{3}  ,{33}   ,0   ,0       ); -- firnis blossom
    AddTraderItem(20  ,164 ,500 ,5  ,1000,{3}  ,{33}   ,0   ,0       ); -- large empty bottle
    AddTraderItem(25  ,1317,500 ,5  ,1000,{3}  ,{33}   ,0   ,0       ); -- small empty bottle


    TraderCopper=5000;

    AddTraderTrigger("[Gg]reetings","Welcome to Greenbriar my friend! Can I help you?");
    AddAdditionalTrigger("[Hh]ello");
    AddAdditionalTrigger("[Hh]i");
    AddAdditionalText("A good day to you my friend! You look fine today.");
    AddTraderTrigger("[Yy]ou.+[Tt]rader","I am "..thisNPC.name..", one of Greenbriar's best traders!");
    AddTraderTrigger("[Tt]ell.+[Gg]reenbriar","I'm not as good in history as Timo is. If you want to now something of Greensbriar talk to him my friend.");
    AddTraderTrigger("[Ww]ho.+[Tt]imo","Timo is the trader over there my friend.");
    AddTraderTrigger("[Ww]here.+[Tt]imo","#me points right to the halfling near the house");
    AddTraderTrigger("[Ww]hat.+sell","I sell herbs.");
    AddTraderTrigger("[Ww]hat.+[Hh]erb","I trade with all kinds of different herbs. Firnis blossoms for example. What to you my list of wares?");
    AddTraderTrigger("[Ww]hat.+[Pp]otion","I do not have any potions anymore");
    AddTraderTrigger("[Ww]hat.+[Bb]ottle","I trade with big and small empty bottles.");
    AddTraderTrigger("[Gg]oodbye","You are going my friend? Take care of yourself.");
    AddAdditionalTrigger("[Bb]ye");
    AddAdditionalText("You are already on the way my friend? Take care of yourself and have a good meal.");
    AddAdditionalTrigger("[Ff]arewell");
    AddAdditionalText("Farewell. I hope you will come back soon my friend.");
    AddTraderTrigger("[Ww]hat.+buy","I prefer to buy herbs and bottles.");
    AddTraderTrigger("[Ww]ho.+you?","My name is "..thisNPC.name.." my friend.");
    AddTraderTrigger("I'm .+","That is the name of a good friend. Nice to meet you!");
    AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'");

    AddTraderTrigger("[Gg]r[üu][ßs]+","Hallo mein Freund, du siehst heute wieder gut aus.");
    AddAdditionalTrigger("[Hh]allo");
    AddAdditionalText("Guten Tag mein Freund! Wie geht es dir mein Freund?");
    AddTraderTrigger("[Dd]u.+[Hh]ändler","Ich bin "..thisNPC.name..", einer von Greenbriars besten Händlern mein Freund!");
    AddTraderTrigger("[Ww]as.+verkauf","Ich verkauf' Pflanzen und Flaschen.");
    AddTraderTrigger("[Ww]as.+[Pp]flanz","Ich handel ne ganze Menge Pflanzen und Kräuter. Firnisblüten zum Beispiel.");
    AddTraderTrigger("[Ww]as.+[Tt]r[aä]nk","Ich habe keine Tränke mehr.");
    AddTraderTrigger("[Ww]as.+[Ff]lasch","Ich handel mit großen und kleinen leeren Flaschen");
    AddTraderTrigger("[Ee]rzähl.+[Gg]reenbriar","Ich bin bei weitem nicht so gut in Geschichte wie Timo. Am besten sprichst du mit ihm mein Freund.");
    AddTraderTrigger("[Ww]er.+[Tt]imo","Timo ist der Händler dort drüben mein Freund.");
    AddTraderTrigger("[Ww]o.+[Tt]imo","#me deutet nach Rechts auf den Halbling neben dem Haus");
    AddTraderTrigger("[Aa]uf.+[Bb]ald","Du bist schon auf dem Weg mein Freund? Pass auf dich auf und komm bald wieder!");
    AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    AddAdditionalText("Du gehst schon mein Freund? Gib auf dich acht und iss was Gutes!");
    AddTraderTrigger("[Ww]as.+%s[Kk]auf","Ich kauf' Pflanzen und Tränke. Hast du sowas dabei?");
    AddTraderTrigger("[Ww]er.+[DdIi][uh]r*?","Ich werde "..thisNPC.name.." genannt mein Freund.");
    AddTraderTrigger("[Ii]ch.+bin","Das ist der Name eines guten Freundes. Schön dich kennen zu lernen!");
    AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");

    TraderLang={"Gold","gold","Silber", "silver","Kupfer","copper","stücke","pieces"};
    TraderMonths={"Elos","Tanos","Zhas","Ushos","Siros","Ronas","Bras","Eldas","Irmas","Malas","Findos","Olos","Adras","Naras","Chos","Mas"};

    RefreshTime={10000,40000};

    TradSpeakLang={0,6};
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
                gText="Ihr wollt "..Values[1].." "..wTraderItemNameD[Values[2]].." verkaufen? Ich gebe euch"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell "..Values[1].." "..TraderItemNameE[Values[2]].."? I give you"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
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
                gText="Ich verkauf' Pflanzen und Flaschen.";
                eText="I sell herbs and bottles.";
            elseif (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                gText="Ich verkaufe nichts.";
                eText="I sell nothing.";
            elseif (Status==16) then -- Liste der Waren die der NPC kauft ist nicht leer // List of the wares the NPC buys, is not empty
                gText="Ich kauf' Pflanzen und Flaschen.";
                eText="I buy herbs and bottles.";
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
        output[0]="Ein Halbling, gekleidet wie sein Zwilling in Bane, in Grün und Sommersprossen zieren sein Gesicht. Er untersucht gerade einige getrocknete Blumen.";
        output[1]="One more Halfling clad just like his twin in Bane, with green clothes and freckles covering his face. At the moment he is examining some dried flowers.";
        initLook=1;
    end
    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end