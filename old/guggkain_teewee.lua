--ds_npc_schleifer.lua
--NPC zur Herstellung von Edelsteinstaub
--Druidensystem
--Falk
--Race:        dwarf
--Location:    Harbour
--Function:    Public trader, handcrafter
--Position:    x=-280 y=29 z=0
--Facing:      South
--Last Update: //200x

require("npcs.functions")
require("npcs.trader_functions")

module("druid.npc.guggkain_teewee", package.seeall, package.seeall(npcs.functions), package.seeall(npcs.trader_functions))

--[[
INSERT INTO npc(npc_type, npc_posx, npc_posy, npc_posz, npc_faceto,          npc_name,                    npc_script, npc_sex, npc_hair, npc_beard, npc_hairred, npc_hairgreen, npc_hairblue, npc_skinred, npc_skingreen, npc_skinblue)
         VALUES(       8,     -208,       29,        0,          6, 'Guggkain Teewee', 'druid.npc.guggkain_teewee',       0,        0,         0,         255,           255,          255,        255,          255,          255);
]]

function initSchleifer()
	if firsttime==nil then
		firsttime = 1
		listGemProd = {}
	  listGemProd[1]= {"Amethyst",251,197,450}
	  listGemProd[2]= {"Schwarzstein",252,283,449}
	  listGemProd[3]= {"Blaustein",253,284,446}
	  listGemProd[4]= {"Diamant",254,485,452}
	  listGemProd[5]= {"Rubin",255,46,447}
	  listGemProd[6]= {"Smaragd",256,45,448}
	  listGemProd[7]= {"Topaz",257,198,451}
	  listGemProd[8]= {"Gold",234,234,234}
	end
end

function initializeNpc()
    InitTalkLists()
    InitItemLists()

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
   
    --            EPr ,ID  ,Am,SPr, SA,Qual ,Dura   ,Data,Catagory
    AddTraderItem(110 ,450 ,25,  5, 250,{2,4},{33,66},0   ,0); -- Amethyststaub
    AddTraderItem(110 ,449 ,25,  5, 250,{2,4},{33,66},0   ,0); -- Schwarzsteinstaub
    AddTraderItem(110 ,447 ,25,  5, 250,{2,4},{33,66},0   ,0); -- Blausteinstaub
    AddTraderItem(130 ,452 ,25,  5, 250,{2,4},{33,66},0   ,0); -- Diamantstaub
    AddTraderItem(120 ,446 ,25,  5, 250,{2,4},{33,66},0   ,0); -- Rubinstaub
    AddTraderItem(120 ,448 ,25,  5, 250,{2,4},{33,66},0   ,0); -- Smaragdstaub  
    AddTraderItem(120 ,451 ,25,  5, 250,{2,4},{33,66},0   ,0); -- Topazstaub
      
    AddTraderItem( 60 ,197 ,250,  5, 25,{2,4},{33,66},0   ,0); -- Amethyst
    AddTraderItem( 60 ,283 ,250,  5, 25,{2,4},{33,66},0   ,0); -- Schwarzstein
    AddTraderItem( 60 ,284 ,250,  5, 25,{2,4},{33,66},0   ,0); -- Blaustein
    AddTraderItem( 80 ,285 ,250,  5, 25,{2,4},{33,66},0   ,0); -- Diamant
    AddTraderItem( 70 , 46 ,250,  5, 25,{2,4},{33,66},0   ,0); -- Rubin
    AddTraderItem( 70 , 45 ,250,  5, 25,{2,4},{33,66},0   ,0); -- Smaragd
    AddTraderItem( 70 ,198 ,250,  5, 25,{2,4},{33,66},0   ,0); -- Topaz
     
    AddTraderItem( 10 ,251 ,250,  5, 25,{2,4},{33,66},0   ,0); -- Amethyst roh   
    AddTraderItem( 10 ,252 ,250,  5, 25,{2,4},{33,66},0   ,0); -- Schwarzstein roh
    AddTraderItem( 10 ,253 ,250,  5, 25,{2,4},{33,66},0   ,0); -- Blaustein roh
    AddTraderItem( 30 ,254 ,250,  5, 25,{2,4},{33,66},0   ,0); -- Diamant roh
    AddTraderItem( 20 ,255 ,250,  5, 25,{2,4},{33,66},0   ,0); -- Rubin roh
    AddTraderItem( 20 ,256 ,250,  5, 25,{2,4},{33,66},0   ,0); -- Smaragd roh
    AddTraderItem( 20 ,257 ,250,  5, 25,{2,4},{33,66},0   ,0); -- Topaz roh 
      
    TraderCopper=5000;

    AddTraderTrigger("[Gg]reet","Greetings. What is it you want? Jodele.");
    AddAdditionalTrigger("[Hh]ello");
    AddAdditionalText("Greetings. You are interested in my wares?");
    AddTraderTrigger("[Ww]hat.+sell","I trade with gems, raw and cutted ones. And with mineral dust. Jodele");
    AddTraderTrigger("[Ww]hat.+[Gg]em","Whatever you like: raw, cutted gems and gemdust");
    AddTraderTrigger("[Ww]hat.+[Kk]ind","All kind of gems: rubies, emerald, diamond, topaz, sapphire, obsidian and amethyst. Ask for my list of wares.");
    AddTraderTrigger("[Ww]hat.+[Dd]ust","All kind of gemdust: rubiydust, emerald-, diamond-, topaz-, blue- and obsidian- and amethystdust. Ask for my list of wares.");
    AddTraderTrigger("[Bb]ye","Good day. Someone may bless you. Jodele.");
    AddAdditionalTrigger("[Ff]arewell");
    AddAdditionalTrigger("[Bb]e [Ww]ell");
    AddAdditionalText("Jodele. Farewell. You are welcome to come back.");
    AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'");
    AddTraderTrigger("[Gg]rü[ßs]+e","Grüße. Was wollt Ihr? Jodele");
    AddAdditionalTrigger("[Hh]allo");
    AddAdditionalText("Grüssse. Habt ihr Interessse an meinen Waren? Jodele");
    AddTraderTrigger("[Ww]as.+kauf","Jodele. Ich handle mit rohen und geschliffenen Edelsteinen. Und Staub. Lasst Euch meine Liste zeigen.");
    AddTraderTrigger("[Ww]as.+[Ee]delstein","Was auch immer du brauchst: Rubine, Smaragde, Topaz, Diamant - alles da!  Lasst Euch meine Liste zeigen.");
    AddTraderTrigger("[Ww]as.+[Ss]taub","Besseres Mineralpulver werdet Ihr nirgendwo im Land bekommen. Lasst Euch meine Liste zeigen. Jodele!");
    AddTraderTrigger("[Aa]uf [Bb]ald","Auf bald. Irgendwer segne euch. Jodele.");
    AddAdditionalTrigger("[Bb]is [Bb]ald");
    AddAdditionalTrigger("[Mm]ach es [Gg]ut");
    AddAdditionalText("Jodele. Bis bald. Ihr könnt gern wieder kommen.");
    AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft Ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");
    
    AddCycleText("#me kaut auf einem dicken Käfer herum.","#me chews of a large beetle.");
    AddCycleText("#me schaut sich nach Kunden um.","#me looks around for customers.");
    AddCycleText("#me lässt seine Zunge hin und her schnalzen","#me clicks his tongue.");
    AddCycleText("#me zählt einige Münzen.","#me counts some coins");
    AddCycleText("Den besten Edelsteinstaub verkauf ich! Zum besten Preis.","Best gem dust for the best price, that's what I sell.");

    TraderLang={"Gold","gold","Silber", "silver","Kupfer","copper","stücke","pieces"};
    TraderMonths={"Elos","Tanos","Zhas","Ushos","Siros","Ronas","Bras","Eldas","Irmas","Malas","Findos","Olos","Adras","Naras","Chos","Mas"};

    RefreshTime={10000,40000};

    TradSpeakLang={0,1,4};
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
                gText="Ihr möchtet "..Values[1].." "..world:getItemName(Values[2],0).." kaufen? Bitte sehr, das macht"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want "..Values[1].." "..world:getItemName(Values[2],1).."? Here you are, that makes"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==2) then -- Item kann wegen Platzmangel nicht erstellt werden // Item can't created, cause of lag of space
                gText="Tut mir leid, aber Ihr habt nicht genug Platz in Eurem Beutel.";
                eText="Sorry, you do not have enough ssspacess in your inventory.";
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
                gText="Ssso etwasss kaufe ich nicht. Tut mir leid.";
                eText="Sssorry, I do not buy that item.";
            elseif (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // Buying of a single item succeed
                gText=GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist esss, was ihr verkaufen möchtet? Ich gebe euch"..MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==14) then -- Liste der Waren die der NPC verkauft ist nicht leer // List of the wares the NPC sells, is not empty
                gText="Ich verkaufe Edelsteine und Edelsteinstaub";
                eText="I sell gemssand gemdust. Jodele";
            elseif (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                gText="Ich verkaufe nichts.";
                eText="I sell nothing.";
            elseif (Status==16) then -- Liste der Waren die der NPC kauft ist nicht leer // List of the wares the NPC buys, is not empty
                gText="Ich kaufe Edelsteine, rohe und geschliffene und auch Edelsteinstaub, Jodele!";
                eText="I buy gems, both - cutted and raw and I buy gemdust too, Jodele.";
            elseif (Status==17) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is empty
                gText="Ich kaufe nichts.";
                eText="I buy nothing.";
            elseif (Status==18) then
                gText="Es ist der "..Values[1]..". Tag des Monates "..Values[2].." im Jahre "..Values[3]..".";
                local seleced=math.random(1,2)
                if (seleced==1) then
                    eText="It'sss day "..Values[1].." of "..Values[2].." of the year "..Values[3]..". sss";
                elseif (seleced==2) then
                    eText="It'sss the "..EnglDigit(Values[1]).." of "..Values[2].." of the year "..Values[3]..". sss";
                end
            end

            if (Status~=0) then
                outText=GetNLS(originator,gText,eText);
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
                outText=GetNLS(originator,gText,eText);
                thisNPC:talk(Character.say,outText);
                verwirrt=true;
            end
        end
    end
end--function

function useNPC(User,Counter,Param)
--
end





