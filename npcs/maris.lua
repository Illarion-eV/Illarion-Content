--Name:        Maris Maroqu
--Race:        Human
--Town:        Trolls Bane
--Function:    Public trader
--Position:    x=-107 y=-117 z=0
--Facing:      West
--Last Update: 03/11/2008
--Update by:   Lennier

dofile("npc_trader_functions.lua")
require("npcs.base.functions")

function useNPC(user,counter,param)
    -- logToFile("start useNPC (maris)");
    local value = useNPC_debug(user,counter,param)
    -- logToFile("end useNPC (maris)");
    return value;
end

function useNPC_debug(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(CCharacter.say, "Finger weg!") end
    if (lang==1) then thisNPC:talk(CCharacter.say, "Don't you touch me!") end
end

function initializeNpc()
    npcs.base.functions.InitTalkLists()
    InitItemLists()

    thisNPC:increaseSkill(1,"common language",100);
        --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    --            EPr ,ID  ,Am,SPr,SA,Qual ,Dura   ,Data,Catagory
    AddTraderItem(5   ,176 ,100,0  ,100,{3}  ,{33}   ,0   ,0     ); -- grey cloth
    AddTraderItem(9   ,174 , 70,1  ,100,{3}  ,{33}   ,0   ,0     ); -- red cloth
    AddTraderItem(9   ,175 , 70,1  ,100,{3}  ,{33}   ,0   ,0     ); -- black cloth
    AddTraderItem(9   ,179 , 70,1  ,100,{3}  ,{33}   ,0   ,0     ); -- blue cloth
    AddTraderItem(9   , 54 , 70,1  ,100,{3}  ,{33}   ,0   ,0     ); -- green cloth
    AddTraderItem(9   ,177 , 70,1  ,100,{3}  ,{33}   ,0   ,0     ); -- yellow cloth
    AddTraderItem(5   ,50  ,500,0  ,500,{3}  ,{33}   ,0   ,0     ); -- thread
    AddTraderItem(20  ,47  , 30,0  , 30,{4,6},{77,90},0   ,0     ); -- needle
    AddTraderItem(20  , 6  , 30,0  , 30,{4,6},{77,90},0   ,0     ); -- scissor
    AddTraderItem(30  ,2295, 11,2  , 20,{4,6},{44,66},0   ,0     ); -- cloth gloves
    AddTraderItem(100 ,385 , 10,10 , 20,{4,6},{44,66},0   ,0     ); -- blue dress
    AddTraderItem(40  ,34  , 10,4  , 20,{4,6},{44,66},0   ,0     ); -- black trousers
    AddTraderItem(30  ,180 , 10,3  , 20,{4,6},{44,66},0   ,0     ); -- red shirt
    AddTraderItem(30  ,182 , 10,3  , 20,{4,6},{44,66},0   ,0     ); -- black shirt
    AddTraderItem(30  ,55  , 10,3  ,20,{4,6},{44,66},0   ,0      ); -- green robe
    AddTraderItem(70  ,2380, 10,7  ,20,{4,6},{44,66},0   ,0      ); -- blue coat




    TraderCopper=1000;

    npcs.base.functions.AddTraderTrigger("[Gg]reetings","Greetings");
    npcs.base.functions.AddAdditionalTrigger("[Hh]ello");
    npcs.base.functions.AddAdditionalText("Hello");
    npcs.base.functions.AddTraderTrigger("[Gg]r[uü][sß]+","Grüß euch");
    npcs.base.functions.AddAdditionalTrigger("[Hh]allo");
    npcs.base.functions.AddAdditionalText("Hallo");
    npcs.base.functions.AddTraderTrigger("[Ww]hat.+sell","I sell grey and fine dyed cloth, red and black shirts, cloth gloves, blue dresses and coats, black trousers, needles, scissors and thread.");
    npcs.base.functions.AddTraderTrigger("[Ww]as.+verkauf","Ich verkaufe graue und gefärbte Stoffe, rote und schwarze Hemden, Stoffhandschuhe, blaue Kleider und Mäntel, schwarze Hose, Nadeln, Scheren und Garn.");
    npcs.base.functions.AddTraderTrigger("[Ww]hat.+buy","I buy dyed cloth, red and black shirts, cloth gloves, blue dresses and coats and black trousers.");
    npcs.base.functions.AddTraderTrigger("[Ww]as.+%skauf","Ich kaufe gefärbten Stoff, rote, blaue und schwarze Hemden, Stoff Handschuhe, blaue Kleider und schwarze Hosen.");
    npcs.base.functions.AddTraderTrigger("[Ww]ho.+you","I'm Maris Maroqué, tailor and trader of tailor needs");
    npcs.base.functions.AddTraderTrigger("[Ww]er.+[DdIi][uh]r*","Ich bin Maris Maroqué, Schneider und Händler für Schneidereibedarf.");
    npcs.base.functions.AddTraderTrigger("[Dd]yer","No, I'm not a dyer. Can't tell you any secrets.");
    npcs.base.functions.AddTraderTrigger("[Ff]ärber","Nein. Ich bin kein Färber. Ich kann dir keine Geheimnisse verraten.");
    npcs.base.functions.AddTraderTrigger("[Tt]ailor","Yes, I'm a tailor. If you want to be too, buy needle and scissor, thread and cloth and work with the tailoring table in the workshop.");
    npcs.base.functions.AddTraderTrigger("[Ss]chneider","Ja, ich bin Schneider. Wenn du selbst einer werden willst, besorg die Schere und Nadel, Garn und Stoff und arbeite am Schneidertisch in der Werkstatt.");
    npcs.base.functions.AddTraderTrigger("[Ww]orkshop","Yes, the workshop is in the western part of the town. There you also can find tools for tailors: a tailoring table, a spinning wheel and a loom");
    npcs.base.functions.AddTraderTrigger("[Ww]erkstatt","Ja, die Werkstatt befindet sich im westlichen teil der Stadt. Da findest du auch als Schneider Werkzeuge: Schneidertisch, Spinnrad und Webstuhl.");
	npcs.base.functions.AddTraderTrigger("[Ii]'m.+","Lovely to meet you. Care to buy anything?");
    npcs.base.functions.AddTraderTrigger("[Ii]ch.+[Bb]in","Freut mich euch kennen zu lernen. Wollt ihr etwas kaufen?");
    npcs.base.functions.AddTraderTrigger("[Ff]arewell","Farewell");
    npcs.base.functions.AddAdditionalTrigger("[Gg]oodbye");
    npcs.base.functions.AddAdditionalText("Come back soon");
    npcs.base.functions.AddTraderTrigger("[Bb]is.+[Bb]ald","Auf bald");
    npcs.base.functions.AddAdditionalTrigger("[Aa]uf.+[Bb]ald");
    npcs.base.functions.AddAdditionalText("Auf bald");
    npcs.base.functions.AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'");
    npcs.base.functions.AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");

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
    -- logToFile("start nextCycle (maris)");
    local value = nextCycle_debug()
    -- logToFile("end nextCycle (maris)");
    return value;
end

function nextCycle_debug()
    if (TraderFirst == nil) then
        initializeNpc();
        npcs.base.functions.increaseLangSkill(TradSpeakLang)
        TraderStdCopper=TraderCopper;
        thisNPC.activeLanguage=TradStdLang;
    end
    TraderCycle();
    npcs.base.functions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    -- logToFile("start receiveText (maris)");
    local value = receiveText_debug(texttype, message, originator)
    -- logToFile("end receiveText (maris)");
    return value;
end

function receiveText_debug(texttype, message, originator)
    if npcs.base.functions.BasicNPCChecks(originator,2) then
        if (npcs.base.functions.LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            Status,Values=SayPriceSell(originator, message)
            if (Status==0) then Status,Values=SayPriceBuy(originator, message) end
            if (Status==0) then Status,Values=ShowItemList(originator, message) end
            if (Status==0) then Status,Values=Selling(originator, message) end
            if (Status==0) then Status,Values=Buying(originator, message) end
            if (Status==0) then Status,Values=npcs.base.functions.TellDate(originator, message, TraderMonths) end
            if (Status==0) then npcs.base.functions.TellSmallTalk(message) end

            ----------------------------EDIT BELOW HERE-----------------------------------
            if (Status==1) then -- Verkauf von mehreren Items erfolgreich // Selling of multible items succeed
                gText="Ihr möchtet "..Values[1].." "..world:getItemName(Values[2],0).." kaufen? Bitte sehr, macht dann"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want "..Values[1].." "..world:getItemName(Values[2],1).."? Here you are, that makes"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==2) then -- Item kann wegen Platzmangel nicht erstellt werden // Item can't created, cause of lag of space
                gText="Tut mir leid, aber Ihr habt nicht genug Platz in Eurem Inventar.";
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
            elseif (Status==6) then -- Verkauf eines einzelnen Items erfolgreich // Selling of a single item succeed
                gText=npcs.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr kaufen wollt? Bitte sehr, das macht"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want a "..world:getItemName(Values[2],1).."? Here you are, that makes"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==7) then -- Verkaufspreis Ansage für ein Item // selling price announcement for an item
                gText=npcs.base.functions.GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[1],0).." kostet"..MoneyText(0,Values[2],Values[3],Values[4],TraderLang)..".";
                eText="The "..world:getItemName(Values[1],1).." costs"..MoneyText(1,Values[2],Values[3],Values[4],TraderLang)..".";
            elseif (Status==8) then -- Einkaufspreis Ansage für ein Item // buying price announcement for an item
                gText=npcs.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." wäre mir"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang).." wert.";
                eText="I would pay"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang).." for "..Values[1]..world:getItemName(Values[2],1);
            elseif (Status==9) then -- Einkauf von mehreren Items erfolgreich // Buying of multible items succeed
                gText="Ihr wollt "..Values[1].." "..world:getItemName(Values[2],0).." verkaufen? Ich gebe euch"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell "..Values[1].." "..world:getItemName(Values[2],1).."? I give you"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==10) then -- Item das gekauft werden soll nicht vorhanden // item that should be buyed is not aviable
                gText="Kommt wieder wenn ihr das habt!";
                eText="Come back when you have that!";
            elseif (Status==11) then -- Händler hat nicht genug Geld // trader don't have enough money
                gText="Tut mir leid. Ich kann das nicht kaufen. Ich habe nicht genug Geld.";
                eText="Sorry, I cannot buy that. I do not have enough money.";
            elseif (Status==12) then -- Händler kauft das Item nicht // trader didn't buy the item
                gText="So etwas kaufe ich nicht. Tut mir leid.";
                eText="Sorry, I do not buy that item.";
            elseif (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // Buying of a single item succeed
                gText=npcs.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr verkaufen möchtet? Ich gebe euch"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==14) then -- Liste der Waren die der NPC verkauft ist nicht leer // List of the wares the NPC sells, is not empty
                gText="Ich verkaufe grauen und gefärbten Stoff, rote und schwarze Hemden, Stoffhandschuhe, blaue Kleider und Mäntel, schwarze Hosen, Nadeln, Scheren und Garn.";
                eText="I sell fine grey and dyed cloth, red and black shirts, cloth gloves, blue dress and coats, black trousers, needles, scissors and thread.";
            elseif (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                gText="Ich verkaufe nichts.";
                eText="I do not sell anything.";
            elseif (Status==16) then -- Liste der Waren die der NPC kauft ist nicht leer // List of the wares the NPC buys, is not empty
                gText="Ich kaufe gefärbten Stoff, rote und schwarze Hemden, Stoffhandschuhe, blaue Kleider und Mäntel und schwarze Hosen.";
                eText="I buy dyed cloth, red and black shirts, cloth gloves, blue dress and coats and black trousers.";
            elseif (Status==17) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is empty
                gText="Ich kaufe nichts.";
                eText="I do not buy anything.";
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
