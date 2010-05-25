--Name:        Mugush
--Race:        Human
--Town:        Trolls Bane
--Function:    Restricted trader
--Position:    x=-62 y=-126 z=0
--Facing:      South
--Last Update: 12/07/2008
--Update by:   Lennier

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
    --            EPr ,ID  ,Am ,SPr,SA ,Qual ,Dura   ,Data,Catagory
    AddTraderItem(8   ,2   ,500,0  ,500,{3}  ,{33}   ,0   ,0       ); -- flour
    AddTraderItem(4   ,259 ,500,0  ,500,{3}  ,{33}   ,0   ,0       ); -- grain
    AddTraderItem(5   ,291 ,500,0  ,500,{3}  ,{33}   ,0   ,0       ); -- cabbage seeds
    AddTraderItem(5   ,3   ,500,0  ,500,{3}  ,{33}   ,0   ,0       ); -- logs of conifer wood
    AddTraderItem(5   ,21  ,1000,1 ,500,{3}  ,{33}   ,0   ,0       ); -- coal
    AddTraderItem(5   ,2536,1000,1 ,500,{3}  ,{33}   ,0   ,0       ); -- copper ore
    AddTraderItem(5   ,22  ,1000,1 ,500,{3}  ,{33}   ,0   ,0       ); -- iron ore
    AddTraderItem(10  ,2717,1000,2 ,500,{3}  ,{33}   ,0   ,0       ); -- pins and cotters
    AddTraderItem(5   ,2738,1000,1 ,500,{3}  ,{33}   ,0   ,0       ); -- pins
    AddTraderItem(100 ,97  ,500 ,10,200,{5,6},{50,90},0   ,0       ); -- leather bag
    AddTraderItem(30  ,2763,500,5  ,200,{5,6},{50,90},0   ,0       ); -- pickaxe
    AddTraderItem(30  ,9   ,500,5  ,200,{5,6},{50,90},0   ,0       ); -- saw
    AddTraderItem(30  ,74  ,500,5  ,200,{5,6},{50,90},0   ,0       ); -- axe
    AddTraderItem(50  ,2715,500,5  ,200,{5,6},{50,90},0   ,0       ); -- plane
    AddTraderItem(50  ,2752,500,5  ,200,{5,6},{50,90},0   ,0       ); -- carving tools
    AddTraderItem(25  ,126 ,500,5  ,200,{5,6},{50,90},0   ,0       ); -- sickle
    AddTraderItem(25  ,24  ,500,5  ,200,{5,6},{50,90},0   ,0       ); -- shovel
    AddTraderItem(25  ,23  ,500,5  ,200,{5,6},{50,90},0   ,0       ); -- hammer
    AddTraderItem(40  ,311 ,500,5  ,200,{5,6},{50,90},0   ,0       ); -- glass blow pipe

    TraderCopper=10000;
    
    AddTraderTrigger("[Gg]reetings","Welcome. How can I help you?");
    AddAdditionalTrigger("[Hh]ello");
    AddAdditionalText("Good day. Do you need something?");
    AddTraderTrigger("[Gg]rü[ßs]+e","Willkommen. Wie kann ich euch helfen?");
    AddAdditionalTrigger("[Hh]allo");
    AddAdditionalText("Guten Tag. Braucht ihr etwas?");
    AddTraderTrigger("[Yy]ou.+[Tt]rader","A trader I am, right. I trade very different wares.");
    AddTraderTrigger("[IiDd][hu][r ].*[Hh]ändler","Ich bin ein Händer, richtig. Ich handle mit verschiedenen Waren.");
    AddTraderTrigger("[Ww]hat.+sell","I sell all kinds of wares for everyday useage.");
    AddTraderTrigger("[Ww]as.+verkauf","Ich verkaufe alle Arten von Waren für den täglichen Gebrauch.");
    AddTraderTrigger("[Ww]hat.+[Ww]ares","Ressources, for example. Or different tools.");
    AddTraderTrigger("[Ww]as.+[Ww]are","Rohstoffe zum Beispiel. Oder verschiedene Werkzeuge.");
    AddTraderTrigger("[Tt]ell.+[Ss]omething","Once upon a time, I came here. Now I am here. Isn't that interesting?");
    AddTraderTrigger("[Ee]rzähl.+was","Es war einmal, da kam ich hier her. Jetzt bin ich da. Ist das nicht interessant?");
    AddTraderTrigger("[Gg]oodbye","Have a nice day.");
    AddAdditionalTrigger("[Ff]arewell");
    AddAdditionalTrigger("[Bb]ye");
    AddAdditionalText("Good bye.");
    AddAdditionalText("Farewell!");
    AddTraderTrigger("[Aa]uf.+[Bb]ald","Bis bald.");
    AddAdditionalTrigger("[Tt]schüs");
    AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    AddAdditionalText("Schönen Tag noch.");
    AddAdditionalText("Auf bald!");
    AddTraderTrigger("[Ww]ho.+you?","My name is "..thisNPC.name..".");
    AddTraderTrigger("[Ww]er.+[IiDd][hu][r ]?","Ich bin "..thisNPC.name..".");
    AddTraderTrigger("I'm .+","Nice to meet you.");
    AddTraderTrigger("Ich bin .+","Erfreut euch kennen zu lernen.");
    AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'");
    AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");

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
            elseif (Status==11) then -- Händler hat nicht genug Geld // trader don't have enough money
                gText="Tut mir leid. Ich kann das nicht kaufen. Ich habe nicht genug Geld.";
                eText="Sorry, I cannot buy that. I do not have enough money.";
            elseif (Status==12) then -- Händler kauft das Item nicht // trader didn't buy the item
                gText="So etwas kaufe ich nicht. Tut mir leid.";
                eText="Sorry, I do not buy that item.";
            elseif (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // Buying of a single item succeed
                gText=GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr verkaufen möchtet? Ich gebe euch"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==14) then -- Liste der Waren die der NPC verkauft ist nicht leer // List of the wares the NPC sells, is not empty
                gText="Ich verkaufe alle Arten von wichtigen Rohstoffen des täglichen Gebrauchs.";
                eText="I sell all kinds of wares for everyday useage.";
            elseif (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                gText="Ich verkaufe nichts.";
                eText="I do not sell anything.";
            elseif (Status==16) then -- Liste der Waren die der NPC kauft ist nicht leer // List of the wares the NPC buys, is not empty
                gText="Ich kaufe verschiedene Waren. Schau am besten selbst.";
                eText="I buy different goods. Take a look.";
            elseif (Status==17) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is empty
                gText="Ich kaufe nichts.";
                eText="I do not buy anything.";
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
        else
            if (verwirrt==false) then
                gText="#me sieht dich leicht verwirrt an";
                eText="#me looks at you a little confused";
                outText=GetNLS(originator,gText,eText);
                thisNPC:talk(CCharacter.say,outText);
                verwirrt=true;
            end
        end
    end --id
end--function
