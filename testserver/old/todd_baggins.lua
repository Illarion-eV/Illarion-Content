--Name:        Todd Baggins
--Race:        Halfling
--Town:        Greenbriar
--Function:    Public trader
--Position:    x=-403 y=77 z=0
--Facing:      West
--Last Update: 11/26/2005
--Update by:   Nitram

require("npc.base.trader_functions")
require("npc.base.functions")
module("npc.todd_baggins", package.seeall)

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(Character.say, "Hee! Finger weg!") end
    if (lang==1) then thisNPC:talk(Character.say, "Hee! Don't you touch me!") end
end

function initializeNpc()
    npc.base.functions.InitTalkLists()
    npc.base.trader_functions.InitItemLists()
thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    --            EPr ,ID  ,Am  ,SPr,SA  ,Qual ,Dura   ,Data,Catagory
    npc.base.trader_functions.AddTraderItem(120 ,180 ,200 ,12 ,100 ,{5,7},{55,77},0   ,0   ); -- shirt
    npc.base.trader_functions.AddTraderItem(140 ,183 ,200 ,14 ,100 ,{5,7},{55,77},0   ,0   ); -- trousers
    npc.base.trader_functions.AddTraderItem(100 ,369 ,200 ,10 ,100 ,{5,7},{55,77},0   ,0   ); -- shoes
    npc.base.trader_functions.AddTraderItem(10  ,191 ,500 ,1  ,100 ,{3}  ,{33},0   ,0      ); -- roll
    npc.base.trader_functions.AddTraderItem(20  ,306 ,500 ,2  ,100 ,{3}  ,{33},0   ,0      ); -- ham
    npc.base.trader_functions.AddTraderItem(100 ,353 ,200 ,8  ,100 ,{3}  ,{33},0   ,0       ); -- apple pie
    npc.base.trader_functions.AddTraderItem(100 ,354 ,200 ,8  ,100 ,{3}  ,{33},0   ,0       ); -- strawberry cake
    npc.base.trader_functions.AddTraderItem(100 ,303 ,200 ,8  ,100 ,{3}  ,{33},0   ,0       ); -- cherry cake
    npc.base.trader_functions.AddTraderItem(20  ,49  ,200 ,2  ,100 ,{3}  ,{33},0   ,0       ); -- bread
    npc.base.trader_functions.AddTraderItem(5   ,201 ,500 ,1  ,100 ,{3}  ,{33},0   ,0       ); -- onions
    npc.base.trader_functions.AddTraderItem(5   ,2493,500 ,1  ,100 ,{3}  ,{33},0   ,0       ); -- cabbage

    TraderCopper=5000;

    npc.base.functions.AddTraderTrigger("[Gg]reetings","Hi ho, friend! Do you need something?");
    npc.base.functions.AddAdditionalTrigger("[Hh]ello");
    npc.base.functions.AddAdditionalText("Good day! Is there something you need?");
    npc.base.functions.AddTraderTrigger("I'm .+","Oh! A pleasure, friend.");
    npc.base.functions.AddTraderTrigger("[Ww]ho.+you?","I'm "..thisNPC.name.." ! I live here in Greenbriar with the other halflings. Wouldn't want to live anywhere else at all!");
    npc.base.functions.AddTraderTrigger("[Tt]ell.+[Ss]omething","If you ever go picking 'shrooms in the forest, be sure to look out for fireflies! I hear the tiny fairies ride on those.");
    npc.base.functions.AddTraderTrigger("[Gg]oodbye","Buh-bye, friend! Come around Greenbriar again when you can.");
    npc.base.functions.AddAdditionalTrigger("[Ff]arewell");
    npc.base.functions.AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'");
    npc.base.functions.AddTraderTrigger("[Gg]rü[ßs]+e","Grüß' dich!");
    npc.base.functions.AddAdditionalTrigger("[Hh]allo");
    npc.base.functions.AddAdditionalText("Hiho!");
    npc.base.functions.AddTraderTrigger("[Ww]er.+[DdIi][uh]r*","Ich bin "..thisNPC.name.."! Ich leb hier in Greenbriar mit den anderen Halblingen. Und würd nicht um alles in der Welt hier weggehen!");
    npc.base.functions.AddTraderTrigger("[Ee]rzähl.+[Ww]as","Wenn du jemals in den Wald gehst und Pilze sammelst, pass auf Leuchtkäfer auf. Ich hab gehört das Feen auf denen reiten.");
    npc.base.functions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Du gehst schon? Ach schade... Na, dann mach's mal gut!");
    npc.base.functions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npc.base.functions.AddAdditionalText("Ich hoffe, du kommst mal wieder vorbei!");
    npc.base.functions.AddTraderTrigger("[Ww]er.+du?","Ich werde "..thisNPC.name.." genannt.");
    npc.base.functions.AddTraderTrigger("Ich bin .+","Huhu! Schön, dich kennenzulernen!");
    npc.base.functions.AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");

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
                gText="Du willst "..Values[1].." "..world:getItemName(Values[2],0).." kaufen? Bitte sehr, macht dann"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want "..Values[1].." "..world:getItemName(Values[2],1).."? Here you are, that makes"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==2) then -- Item kann wegen Platzmangel nicht erstellt werden // Item can't created, cause of lag of space
                gText="Tut mir leid, aber du hast nicht genug Platz in deinem Inventar!";
                eText="Sorry, you do not have enough space in your inventory.";
            elseif (Status==3) then -- Nicht genug Geld um das Item zu bezahlen // not enougth money to buy the item
                gText="Komm wieder wenn du genug Geld hast!";
                eText="Come back when you have enough money!";
            elseif (Status==4) then -- Item ausverkauft // item out of stock
                gText="Tut mir leid. Ich hab' das im Moment nicht. Komm doch bitte später wieder.";
                eText="I am sorry, I don't have this currently. Come back later.";
            elseif (Status==5) then -- Item wird nicht verkauft // item
                gText="Tut mir Leid. Ich verkauf' das nicht.";
                eText="Sorry, I do not sell that item.";
            elseif (Status==6) then -- Verkauf eines einzelnen Items erfolgreich // npc.base.trader_functions.Selling of a single item succeed
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was du kaufen willst? Bitte sehr, das macht"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want a "..world:getItemName(Values[2],1).."? Here you are, that makes"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==7) then -- Verkaufspreis Ansage für ein Item // selling price announcement for an item
                gText=npc.base.functions.GenusSel(Values[1],"Ein","Eine","Ein").." "..world:getItemName(Values[1],0).." kostet"..npc.base.trader_functions.MoneyText(0,Values[2],Values[3],Values[4],TraderLang)..".";
                eText="The "..world:getItemName(Values[1],1).." costs"..npc.base.trader_functions.MoneyText(1,Values[2],Values[3],Values[4],TraderLang)..".";
            elseif (Status==8) then -- Einkaufspreis Ansage für ein Item // buying price announcement for an item
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..Tworld:getItemName(Values[2],0).." wäre mir"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang).." wert.";
                eText="I would pay"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang).." for "..Values[1]..world:getItemName(Values[2],1)..".";
            elseif (Status==9) then -- Einkauf von mehreren Items erfolgreich // npc.base.trader_functions.Buying of multible items succeed
                gText="Du willst "..Values[1].." "..world:getItemName(Values[2],0).." verkaufen? Ich gebe dir"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell "..Values[1].." "..world:getItemName(Values[2],1).."? I give you"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==10) then -- Item das gekauft werden soll nicht vorhanden // item that should be buyed is not aviable
                gText="Komm wieder wenn du das hast!";
                eText="Come back when you have that!";
            elseif (Status==11) then -- Händler hat nicht genug Geld // trader don't have enougth money
                gText="Tut mir leid. Ich kann das nicht kaufen. Ich hab' nicht genug Geld.";
                eText="Sorry, I cannot buy that. I do not have enough money.";
            elseif (Status==12) then -- Händler kauft das Item nicht // trader didn't buy the item
                gText="So etwas kaufe ich nicht. Tut mir leid.";
                eText="Sorry, I do not buy that item.";
            elseif (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // npc.base.trader_functions.Buying of a single item succeed
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was du verkaufen willst? Ich geb' dir"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==14) then -- Liste der Waren die der NPC verkauft ist nicht leer // List of the wares the NPC sells, is not empty
                gText="Ich verkauf' Kleidung, leckeres Essen und Kräuter!";
                eText="I sell clothes, tasty food and herbs!";
            elseif (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                gText="Ich verkaufe nichts.";
                eText="I sell nothing.";
            elseif (Status==16) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is not empty
                gText="Ich kaufe Kleidung, leckeres Essen und Kräuter!";
                eText="I buy clothes, tasty food and herbs!";
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

function lookAtNpc(Char, mode)
    if initLook==nil then
        output={};
        output[0]="Ein weiterer Halbling, der auf einem löchrigen Sack sitzt, der mit Karotten gefüllt ist. Er putzt gerade eine Zwiebel, sieht aber hungrig auf die Torten, die er verkaufen möchte.";
        output[1]="Another halfling sitting on a holey bag filled with carrots. He is cleaning an onion tossing hungry looks at some pies and cakes that he sells.";
        initLook=1;
    end
    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end
