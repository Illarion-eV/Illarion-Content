--Name:        	Rijana Thelingham
--Race:        	Human
--Town:        	Magic academie
--Function:    	Restricted trader
--Position:    	x=-16 y=-4 z=-57
--Facing:      	East
--Create		05.12.07
--Create by		Kadiya
--Last Update: 		10.06.08 (New place)
--Update by:   		Kadiya

require("npc.base.trader_functions")
require("npc.base.functions")
module("npc.rijana", package.seeall)

function useNPC(user,counter,param)
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
    -- Epr	= Verkaufpreis
    -- ID
    -- Am 	= Amount (Idealmenge, die der Char haben sollte. Ist die Echte Menge darüber, so sinkt der Einkaufspreis.)
    -- SPr 	= Ankaufpreis
    -- SA 	= Anzahl auf Lager
    -- Qual	= Qualität
    -- Dura	= Haltbarkeit
    -- Data	= Datawert
    -- Catagory
    --            EPr ,ID  ,Am,SPr,SA,Qual ,Dura   ,Data,Catagory
    npc.base.trader_functions.AddTraderItem(35  ,3109 ,5 ,5  ,0 ,{3}  ,{33}   ,0   ,0       ); -- offene Pergamentrollen
    npc.base.trader_functions.AddTraderItem(60  ,329  ,5 ,5  ,5 ,{3}  ,{33}   ,0   ,0       ); -- Tinte
    npc.base.trader_functions.AddTraderItem(1000,323  ,5 ,0  ,5 ,{3}  ,{33}   ,0   ,0       ); -- Magierstab
    npc.base.trader_functions.AddTraderItem(1000,547  ,5 ,0  ,5 ,{3}  ,{33}   ,0   ,0       ); -- Novizenrobe
    npc.base.trader_functions.AddTraderItem(1500,548  ,5 ,0  ,5 ,{3}  ,{33}   ,0   ,0       ); -- Magierrobe
    npc.base.trader_functions.AddTraderItem(0   ,164  ,5 ,3  ,0 ,{3}  ,{33}   ,0   ,0       ); -- Leere Flasche

    TraderCopper=400;

    npc.base.functions.AddTraderTrigger("[Gg]reetings","Welcome. Can I help you?");
    npc.base.functions.AddAdditionalTrigger("[Hh]ello");
    npc.base.functions.AddAdditionalTrigger("[Hh]i");
    npc.base.functions.AddAdditionalText("A good day to you.");
    npc.base.functions.AddTraderTrigger("[Yy]ou.+[Tt]rader","I am "..thisNPC.name..", I sell some usefull things. Do you need something?");
    npc.base.functions.AddTraderTrigger("[Tt]ell.+[Aa]cademy","I'm not good in history. If you want to know something about the magic academy better ask someone else.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+sell","I sell potions and some usefull stuff for mages.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Pp]otion","I sell mana potions and antidots. And I have some bottles of ink.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Bb]ottle","I trade with empty bottles.");
    npc.base.functions.AddTraderTrigger("[Gg]oodbye","You are going? Good luck for your studies.");
    npc.base.functions.AddAdditionalTrigger("[Bb]ye");
    npc.base.functions.AddAdditionalText("Take care of you.");
    npc.base.functions.AddAdditionalTrigger("[Ff]arewell");
    npc.base.functions.AddAdditionalText("Farewell. I hope you will come back soon.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+buy","I buy empty bottles, open pells and ink.");
    npc.base.functions.AddTraderTrigger("[Ww]ho.+you?","My name is "..thisNPC.name..".");
    npc.base.functions.AddTraderTrigger("I'm .+","Nice to meet you. Did you need anything?");
    npc.base.functions.AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'");

    npc.base.functions.AddTraderTrigger("[Gg]r[üu][ßs]+","Seid gegrüßt. Kann ich euch behilflich sein?");
    npc.base.functions.AddAdditionalTrigger("[Hh]allo");
    npc.base.functions.AddAdditionalText("Guten Tag.");
    npc.base.functions.AddTraderTrigger("[Dd]u.+[Hh]ändler","Ich bin "..thisNPC.name..". Ich verkaufe einige nützliche Dinge hier. Braucht ihr etwas?");
    npc.base.functions.AddTraderTrigger("[Ww]as.+verkauf","Ich verkaufe Tränke sowie diverse Ausrüstung für Magier.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Tt]r[aä]nk","Ich verkaufe Manatranke und Gegengifte. Ich hab sogar ein paar Flaschen Tinte.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Ff]lasch","Ich handel mit leeren Flaschen");
    npc.base.functions.AddTraderTrigger("[Ee]rzähl.+[Aa]kademie","Ich bin nicht so gut in Geschichte. Am besten fragt ihr deswegen jemand anderes.");
    npc.base.functions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Willst du schon gehen? Viel Glück bei deinen Studien.");
    npc.base.functions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npc.base.functions.AddAdditionalText("Du gehst schon? Gib auf dich acht, ich hoffe wir sehen uns bald wieder");
    npc.base.functions.AddTraderTrigger("[Ww]as.+%s[Kk]auf","Ich kaufe leere Flaschen, offene Pergamentrollen und Tinte.");
    npc.base.functions.AddTraderTrigger("[Ww]er.+[DdIi][uh]r*?","Ich werde "..thisNPC.name.." genannt.");
    npc.base.functions.AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");
    
	npc.base.functions.AddCycleText("#me notiert ein paar Zahlen auf ein Stück Pergament.","#me notes a few numbers on a piece of pergament.");
    npc.base.functions.AddCycleText("#me sortiert ein paar Dinge in ihrer Truhe neu.","#me rearranges some things in her chest. ");

    TraderLang={"Gold","gold","Silber", "silver","Kupfer","copper","stücke","pieces"};
    TraderMonths={"Elos","Tanos","Zhas","Ushos","Siros","Ronas","Bras","Eldas","Irmas","Malas","Findos","Olos","Adras","Naras","Chos","Mas"};

    RefreshTime={10000,40000};

    TradSpeakLang={0,1,10};
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
                gText="Ihr wollt "..Values[1].." "..wTraderItemNameD[Values[2]].." verkaufen? Ich gebe euch"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell "..Values[1].." "..TraderItemNameE[Values[2]].."? I give you"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==10) then -- Item das gekauft werden soll nicht vorhanden // item that should be buyed is not aviable
                gText="Kommt wieder wenn ihr das habt!";
                eText="Come back when you have that!";
            elseif (Status==11) then -- Händler hat nicht genug Geld // trader don't have enougth money
                gText="Tut mir leid. Ich kann das nicht kaufen. Ich habe nicht genug Geld.";
                eText="Sorry, I cannot buy that. I do not have enough money.";
            elseif (Status==12) then -- Händler kauft das Item nicht // trader didn't buy the item
                gText="So etwas kaufe ich nicht. Tut mir leid.";
                eText="Sorry, I do not buy that item.";
            elseif (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // npc.base.trader_functions.Buying of a single item succeed
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr verkaufen möchtet? Ich gebe euch"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==14) then -- Liste der Waren die der NPC verkauft ist nicht leer // List of the wares the NPC sells, is not empty
                gText="Ich verkaufe Tränke sowie diverse Ausrüstung für Magier.";
                eText="I sell potions and some usefull stuff for mages.";
            elseif (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                gText="Ich verkaufe nichts.";
                eText="I sell nothing.";
            elseif (Status==16) then -- Liste der Waren die der NPC kauft ist nicht leer // List of the wares the NPC buys, is not empty
                gText="Ich kaufe leere Flaschen, offene Pergamentrollen und Tinte.";
                eText="I buy empty bottles, open pells and ink.";
            elseif (Status==17) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is empty
                gText="Ich kaufe nichts.";
                eText="I buy nothing.";
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
