--Name:        Leonard Hierbe
--Race:        Human
--Town:        Lighthouse
--Function:    Public trader
--Position:    x=-391 y=-208 z=0
--Facing:      North
--Last Update: 04/26/2005
--Update by:   Nitram

require("npc.base.trader_functions")
require("npc.base.functions")
module("npc.leonard", package.seeall)

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
    --            EPr ,ID  ,Am,SPr,SA,Qual ,Dura   ,Data,Catagory
    npc.base.trader_functions.AddTraderItem(5   ,155 ,48,0  ,48,{3}  ,{33}   ,0   ,0       ); -- sibanac
    npc.base.trader_functions.AddTraderItem(75  ,2744,6 ,0  ,6 ,{4,6},{44,66},0   ,0       ); -- pipe
    npc.base.trader_functions.AddTraderItem(12  ,1909,0 ,8  ,11,{5}  ,{50}   ,0   ,0       ); -- beer
    npc.base.trader_functions.AddTraderItem(0   ,1318,0 ,15 ,11,{5}  ,{50}   ,0   ,0       ); -- elven wine
    npc.base.trader_functions.AddTraderItem(400 ,332 ,3 ,80 ,9 ,{4,6},{44,66},0   ,0       ); -- harp
    npc.base.trader_functions.AddTraderItem(500 ,335 ,3 ,100,9 ,{4,6},{44,66},0   ,0       ); -- lute
    npc.base.trader_functions.AddTraderItem(40  ,333 ,5 ,6  ,8 ,{4,6},{44,66},0   ,0       ); -- horn
    npc.base.trader_functions.AddTraderItem(40  ,150 ,23,3  ,43,{4,6},{44,66},0   ,0       ); -- fir seedling
    npc.base.trader_functions.AddItemTrigger("[Bb]aby.+[Ff]ir.+[Tt]ree");
    npc.base.trader_functions.AddItemTrigger("[Tt]annenbaum.+[Kk]ind");
    npc.base.trader_functions.AddTraderItem(55  ,51  ,6 ,5  ,12,{4,6},{44,66},0   ,0       ); -- bucket

    TraderCopper=400;

    npc.base.functions.AddTraderTrigger("[Gg]reet","Hello sunshine!");
    npc.base.functions.AddAdditionalTrigger("[Hh]ello");
    npc.base.functions.AddTraderTrigger("[Gg]r[uü][sß+]","Hallo Sonnenschein!");
    npc.base.functions.AddAdditionalTrigger("[Hh]allo");
    npc.base.functions.AddAdditionalText("Hallöchen Sonnenschein");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+sell","I don't sell anything, but I trade plants, pipes, beer, elven wine, baby fir trees, buckets, and nice noise-makers for those shiny things");
    npc.base.functions.AddTraderTrigger("[Ww]as.+verkauf","Ich verkaufe nichts, aber ich handel mit Pflanzen, Pfeifen, Bier, Elbenwein, Tannen Kindern, Eimern und nette Geräusche Macher für diese glitzernden Stückchen");
    npc.base.functions.AddTraderTrigger("[Pp]lants","Yes, plants. I have a sibanac farm right here and pipes to go with it.");
    npc.base.functions.AddTraderTrigger("[Pp]flanz","Ja. Pflanzen. Ich habe hier eine Sibanac Farm und Pfeifen um es zu rauchen.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+do","I watch plants grow.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[mt][au][cst]","Ich sehe den Pflanzen beim Wachsen zu.");
    npc.base.functions.AddTraderTrigger("[Rr]umor","You talking about rumors? I have a fact to tell you, much better than rumors. The other day I saw gnolls dancing in the moonlight. I think they were having fun.");
    npc.base.functions.AddTraderTrigger("[Gg]erüch","Du sprichst von Gerüchten? Ich habe etwas wahres was viel besser ist. Ich habe an einem anderen Tag Gnolle, im Mondlicht tanzen sehen. Ich denke sie hatten Spass.");
    npc.base.functions.AddTraderTrigger("[Nn]ews","You interested in the latest news? A priest of Sirani told me that the goddess herself told his cousin that all spiders should be loved as our friends. That, my friend, is what happens when you mix 'shrooms with Sibanac.");
    npc.base.functions.AddTraderTrigger("[Nn]euigkeit","Du bist an Neuigkeiten interessiert? Ein Priesterin von Sirani hat mir gesagt das ihr Göttin persönlich, ihrem Cousin gesagt hat, das alle Spinnen von unseren Freunden geliebt werden sollen. Das mein Freund, passiert wenn man Pilze und Sibanac mischt.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+buy","I'll give you round shiny things for cylindrical vessels containing hop-flavored brew, or that sweet elven stuff. I'll even trade buckets, harps, lutes, or even horns! I can get a nice fir tree seedling! Isn't a tree much nicer than copper?");
    npc.base.functions.AddTraderTrigger("[Ww]as.+%skauf","Ich gebe dir diese runden glitzernden Dinger für zylindrische Gefäße, befüllt mit, mit Hopfen gewürztem, Gebräu oder mit dem süßen Elbenzeugs. Ich handle auch mit Eimern und Instrumenten. Und ich kauf auch Tannen Setzlinge.");
    npc.base.functions.AddTraderTrigger("[Ii]'m.+","Good for you, sunshine");
    npc.base.functions.AddTraderTrigger("[Ii]ch.+bin","Gut für dich, Sonnenschein");
    npc.base.functions.AddTraderTrigger("[Bb]aby [Ff]ir [Tt]rees","Yes, I sell baby fir trees. You might call them fir tree seedlings. I buy them, too.");
    npc.base.functions.AddTraderTrigger("[Tt]annenbaum.+[Kk]ind","Ja. Ich verkaufe Tannenbaum Kinder. Du sagst vielleicht Tannen Baum Setzlinge dazu. Die kaufe ich auch.");
    npc.base.functions.AddTraderTrigger("[Ff]arewell","Farewell, sunshine");
    npc.base.functions.AddAdditionalTrigger("[Gg]oodbye");
    npc.base.functions.AddAdditionalText("Bye, sunshine");
    npc.base.functions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Auf bald, Sonnenschein.");
    npc.base.functions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npc.base.functions.AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'");
    npc.base.functions.AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");

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
            end
            if (Status==2) then -- Item kann wegen Platzmangel nicht erstellt werden // Item can't created, cause of lag of space
                gText="Tut mir leid, aber Ihr habt nicht genug Platz in Eurem Inventar.";
                eText="Sorry, you do not have enough space in your inventory.";
            end
            if (Status==3) then -- Nicht genug Geld um das Item zu bezahlen // not enougth money to buy the item
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
            if (Status==6) then -- Verkauf eines einzelnen Items erfolgreich // npc.base.trader_functions.Selling of a single item succeed
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr kaufen wollt? Bitte sehr, das macht"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want a "..world:getItemName(Values[2],1).."? Here you are, that makes"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            end
            if (Status==7) then -- Verkaufspreis Ansage für ein Item // selling price announcement for an item
                gText=npc.base.functions.GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[1],0).." kostet"..npc.base.trader_functions.MoneyText(0,Values[2],Values[3],Values[4],TraderLang)..".";
                eText="The "..world:getItemName(Values[1],1).." costs"..npc.base.trader_functions.MoneyText(1,Values[2],Values[3],Values[4],TraderLang)..".";
            end
            if (Status==8) then -- Einkaufspreis Ansage für ein Item // buying price announcement for an item
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." wäre mir"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang).." wert.";
                eText="I would pay"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang).." for "..Values[1]..world:getItemName(Values[2],1);
            end
            if (Status==9) then -- Einkauf von mehreren Items erfolgreich // npc.base.trader_functions.Buying of multible items succeed
                gText="Ihr wollt "..Values[1].." "..world:getItemName(Values[2],0).." verkaufen? Ich gebe euch"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell "..Values[1].." "..world:getItemName(Values[2],1).."? I give you"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            end
            if (Status==10) then -- Item das gekauft werden soll nicht vorhanden // item that should be buyed is not aviable
                gText="Kommt wieder wenn ihr das habt!";
                eText="Come back when you have that!";
            end
            if (Status==11) then -- Händler hat nicht genug Geld // trader don't have enougth money
                gText="Tut mir leid. Ich kann das nicht kaufen. Ich habe nicht genug Geld.";
                eText="Sorry, I cannot buy that. I do not have enough money.";
            end
            if (Status==12) then -- Händler kauft das Item nicht // trader didn't buy the item
                gText="So etwas kaufe ich nicht. Tut mir leid.";
                eText="Sorry, I do not buy that item.";
            end
            if (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // npc.base.trader_functions.Buying of a single item succeed
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr verkaufen möchtet? Ich gebe euch"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            end
            if (Status==14) then -- Liste der Waren die der NPC verkauft ist nicht leer // List of the wares the NPC sells, is not empty
                gText="Ich verkaufe Sibanac, Pfeifen, Bier, Harfen, Lauten, Hörner, Tannen Kinder und Eimer.";
                eText="I sell sibanc, pipes, beer, harps, lutes, horns, baby fir trees and buckets.";
            end
            if (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                gText="Ich verkaufe nichts.";
                eText="I sell nothing.";
            end
            if (Status==16) then -- Liste der Waren die der NPC kauft ist nicht leer // List of the wares the NPC buys, is not empty
                gText="Ich kaufe Bier, Elbenwein, Harfen, Lauten, Hörner, Tannen Kinder und Eimer.";
                eText="I buy beer, elven wine, harps, lutes, horns, baby fir trees and buckets.";
            end
            if (Status==17) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is empty
                gText="Ich kaufe nichts.";
                eText="I buy nothing.";
            end
            if (Status==18) then
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
        else
            if (verwirrt==false) then
                gText="#me sieht dich leicht verwirrt an";
                eText="#me looks at you a little confused";
                outText=npc.base.functions.GetNLS(originator,gText,eText);
                thisNPC:talk(Character.say,outText);
                verwirrt=true;
            end
        end
    end --id
end--function
