--Name:        Leonard Hierbe
--Race:        Human
--Town:        Lighthouse
--Function:    Public trader
--Position:    x=-391 y=-208 z=0
--Facing:      North
--Last Update: 04/26/2005
--Update by:   Nitram

require("npcs.base.trader_functions")
require("npcs.base.functions")
module("npcs.leonard")

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(CCharacter.say, "Finger weg!") end
    if (lang==1) then thisNPC:talk(CCharacter.say, "Don't you touch me!") end
end

function initializeNpc()
    npcs.base.functions.InitTalkLists()
    npcs.base.trader_functions.InitItemLists()

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    --            EPr ,ID  ,Am,SPr,SA,Qual ,Dura   ,Data,Catagory
    npcs.base.trader_functions.AddTraderItem(5   ,155 ,48,0  ,48,{3}  ,{33}   ,0   ,0       ); -- sibanac
    npcs.base.trader_functions.AddTraderItem(75  ,2744,6 ,0  ,6 ,{4,6},{44,66},0   ,0       ); -- pipe
    npcs.base.trader_functions.AddTraderItem(12  ,1909,0 ,8  ,11,{5}  ,{50}   ,0   ,0       ); -- beer
    npcs.base.trader_functions.AddTraderItem(0   ,1318,0 ,15 ,11,{5}  ,{50}   ,0   ,0       ); -- elven wine
    npcs.base.trader_functions.AddTraderItem(400 ,332 ,3 ,80 ,9 ,{4,6},{44,66},0   ,0       ); -- harp
    npcs.base.trader_functions.AddTraderItem(500 ,335 ,3 ,100,9 ,{4,6},{44,66},0   ,0       ); -- lute
    npcs.base.trader_functions.AddTraderItem(40  ,333 ,5 ,6  ,8 ,{4,6},{44,66},0   ,0       ); -- horn
    npcs.base.trader_functions.AddTraderItem(40  ,150 ,23,3  ,43,{4,6},{44,66},0   ,0       ); -- fir seedling
    npcs.base.trader_functions.AddItemTrigger("[Bb]aby.+[Ff]ir.+[Tt]ree");
    npcs.base.trader_functions.AddItemTrigger("[Tt]annenbaum.+[Kk]ind");
    npcs.base.trader_functions.AddTraderItem(55  ,51  ,6 ,5  ,12,{4,6},{44,66},0   ,0       ); -- bucket

    TraderCopper=400;

    npcs.base.functions.AddTraderTrigger("[Gg]reet","Hello sunshine!");
    npcs.base.functions.AddAdditionalTrigger("[Hh]ello");
    npcs.base.functions.AddTraderTrigger("[Gg]r[uü][sß+]","Hallo Sonnenschein!");
    npcs.base.functions.AddAdditionalTrigger("[Hh]allo");
    npcs.base.functions.AddAdditionalText("Hallöchen Sonnenschein");
    npcs.base.functions.AddTraderTrigger("[Ww]hat.+sell","I don't sell anything, but I trade plants, pipes, beer, elven wine, baby fir trees, buckets, and nice noise-makers for those shiny things");
    npcs.base.functions.AddTraderTrigger("[Ww]as.+verkauf","Ich verkaufe nichts, aber ich handel mit Pflanzen, Pfeifen, Bier, Elbenwein, Tannen Kindern, Eimern und nette Geräusche Macher für diese glitzernden Stückchen");
    npcs.base.functions.AddTraderTrigger("[Pp]lants","Yes, plants. I have a sibanac farm right here and pipes to go with it.");
    npcs.base.functions.AddTraderTrigger("[Pp]flanz","Ja. Pflanzen. Ich habe hier eine Sibanac Farm und Pfeifen um es zu rauchen.");
    npcs.base.functions.AddTraderTrigger("[Ww]hat.+do","I watch plants grow.");
    npcs.base.functions.AddTraderTrigger("[Ww]as.+[mt][au][cst]","Ich sehe den Pflanzen beim Wachsen zu.");
    npcs.base.functions.AddTraderTrigger("[Rr]umor","You talking about rumors? I have a fact to tell you, much better than rumors. The other day I saw gnolls dancing in the moonlight. I think they were having fun.");
    npcs.base.functions.AddTraderTrigger("[Gg]erüch","Du sprichst von Gerüchten? Ich habe etwas wahres was viel besser ist. Ich habe an einem anderen Tag Gnolle, im Mondlicht tanzen sehen. Ich denke sie hatten Spass.");
    npcs.base.functions.AddTraderTrigger("[Nn]ews","You interested in the latest news? A priest of Sirani told me that the goddess herself told his cousin that all spiders should be loved as our friends. That, my friend, is what happens when you mix 'shrooms with Sibanac.");
    npcs.base.functions.AddTraderTrigger("[Nn]euigkeit","Du bist an Neuigkeiten interessiert? Ein Priesterin von Sirani hat mir gesagt das ihr Göttin persönlich, ihrem Cousin gesagt hat, das alle Spinnen von unseren Freunden geliebt werden sollen. Das mein Freund, passiert wenn man Pilze und Sibanac mischt.");
    npcs.base.functions.AddTraderTrigger("[Ww]hat.+buy","I'll give you round shiny things for cylindrical vessels containing hop-flavored brew, or that sweet elven stuff. I’ll even trade buckets, harps, lutes, or even horns! I can get a nice fir tree seedling! Isn’t a tree much nicer than copper?");
    npcs.base.functions.AddTraderTrigger("[Ww]as.+%skauf","Ich gebe dir diese runden glitzernden Dinger für zylindrische Gefäße, befüllt mit, mit Hopfen gewürztem, Gebräu oder mit dem süßen Elbenzeugs. Ich handle auch mit Eimern und Instrumenten. Und ich kauf auch Tannen Setzlinge.");
    npcs.base.functions.AddTraderTrigger("[Ii]'m.+","Good for you, sunshine");
    npcs.base.functions.AddTraderTrigger("[Ii]ch.+bin","Gut für dich, Sonnenschein");
    npcs.base.functions.AddTraderTrigger("[Bb]aby [Ff]ir [Tt]rees","Yes, I sell baby fir trees. You might call them fir tree seedlings. I buy them, too.");
    npcs.base.functions.AddTraderTrigger("[Tt]annenbaum.+[Kk]ind","Ja. Ich verkaufe Tannenbaum Kinder. Du sagst vielleicht Tannen Baum Setzlinge dazu. Die kaufe ich auch.");
    npcs.base.functions.AddTraderTrigger("[Ff]arewell","Farewell, sunshine");
    npcs.base.functions.AddAdditionalTrigger("[Gg]oodbye");
    npcs.base.functions.AddAdditionalText("Bye, sunshine");
    npcs.base.functions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Auf bald, Sonnenschein.");
    npcs.base.functions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
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
            if (Status==6) then -- Verkauf eines einzelnen Items erfolgreich // npcs.base.trader_functions.Selling of a single item succeed
                gText=npcs.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr kaufen wollt? Bitte sehr, das macht"..npcs.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want a "..world:getItemName(Values[2],1).."? Here you are, that makes"..npcs.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            end
            if (Status==7) then -- Verkaufspreis Ansage für ein Item // selling price announcement for an item
                gText=npcs.base.functions.GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[1],0).." kostet"..npcs.base.trader_functions.MoneyText(0,Values[2],Values[3],Values[4],TraderLang)..".";
                eText="The "..world:getItemName(Values[1],1).." costs"..npcs.base.trader_functions.MoneyText(1,Values[2],Values[3],Values[4],TraderLang)..".";
            end
            if (Status==8) then -- Einkaufspreis Ansage für ein Item // buying price announcement for an item
                gText=npcs.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." wäre mir"..npcs.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang).." wert.";
                eText="I would pay"..npcs.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang).." for "..Values[1]..world:getItemName(Values[2],1);
            end
            if (Status==9) then -- Einkauf von mehreren Items erfolgreich // npcs.base.trader_functions.Buying of multible items succeed
                gText="Ihr wollt "..Values[1].." "..world:getItemName(Values[2],0).." verkaufen? Ich gebe euch"..npcs.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell "..Values[1].." "..world:getItemName(Values[2],1).."? I give you"..npcs.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
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
            if (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // npcs.base.trader_functions.Buying of a single item succeed
                gText=npcs.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was ihr verkaufen möchtet? Ich gebe euch"..npcs.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..npcs.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
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