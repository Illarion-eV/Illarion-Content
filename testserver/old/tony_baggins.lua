--Name:        Tony Baggins
--Race:        Halfling
--Town:        Trolls Bane
--Function:    Public trader
--Position:    x=-109 y=-95 z=0
--Facing:      South
--Last Update: 08/03/2008
--Update by:   Lennier

require("npc.base.trader_functions")
require("npc.base.functions")
module("npc.tony_baggins", package.seeall)

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
    thisNPC:increaseSkill(6,"halfling language",100);
--------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    --            EPr ,ID  ,Am,SPr,SA,Qual  ,Dura   ,Data,Catagory

    ------------npc.base.trader_functions.Selling of potions and dyes
	npc.base.trader_functions.AddTraderItem(50  ,2680 ,50,0  ,50,{5}  ,{55},0   ,0       ); -- blue dye
    npc.base.trader_functions.AddTraderItem(30  ,2681 ,50,0  ,50,{5}  ,{55},0   ,0       ); -- red dye
    npc.base.trader_functions.AddTraderItem(30  ,2682 ,50,0  ,50,{3}  ,{33},0   ,0       ); -- yellow dye
    npc.base.trader_functions.AddTraderItem(30  ,2679 ,50,0  ,50,{5}  ,{55},0   ,0       ); -- green dye
    npc.base.trader_functions.AddTraderItem(30  ,2678 ,50,0  ,50,{5}  ,{55},0   ,0       ); -- black dye
    npc.base.trader_functions.AddTraderItem(30  ,2683 ,50,0  ,50,{5}  ,{33},0   ,0       ); -- grey dye
    npc.base.trader_functions.AddTraderItem(50  ,58   ,50,0  ,50,{5,7},{77,90},0,0       ); -- mortar
    npc.base.trader_functions.AddTraderItem(50  ,2781 ,50,5  ,50,{5,7},{77,90},0,0       ); -- stirring rod
    ---------npc.base.trader_functions.Buying of ressources for potions and dyes
    npc.base.trader_functions.AddTraderItem(0   ,51   ,200 ,2  ,30,{5} ,{55},0   ,0       ); -- empty bucket
    npc.base.trader_functions.AddTraderItem(0   ,253  ,200 ,10 ,50,{5} ,{55},0   ,0       ); -- raw sapphire
    npc.base.trader_functions.AddTraderItem(0   ,21   ,200 ,1  ,50,{5} ,{55},0   ,0       ); -- coal
    npc.base.trader_functions.AddTraderItem(0   ,136  ,200 ,1  ,50,{3} ,{33},0   ,0       ); -- angerberries
    npc.base.trader_functions.AddTraderItem(0   ,157  ,200 ,1  ,50,{5} ,{55},0   ,0       ); -- rotten bark
    npc.base.trader_functions.AddTraderItem(0   ,161  ,200,1  ,50,{5} ,{55},0   ,0       ); -- herder mushroom
    npc.base.trader_functions.AddTraderItem(10  ,148  ,200,1  ,50,{3} ,{33},0   ,0       ); -- firnis blossom
    npc.base.trader_functions.AddTraderItem(10  ,153  ,200,1  ,50,{3} ,{33},0   ,0       ); -- foot leaf
    npc.base.trader_functions.AddTraderItem(10  ,133  ,200,1  ,50,{3} ,{33},0   ,0       ); -- sun herb
    npc.base.trader_functions.AddTraderItem(10  ,144  ,200,1  ,50,{3} ,{33},0   ,0       ); -- virgins weed
    npc.base.trader_functions.AddTraderItem(10  ,145  ,200,1  ,50,{3} ,{33},0   ,0       ); -- heat flower
    npc.base.trader_functions.AddTraderItem(10  ,155  ,200,1  ,50,{3} ,{33},0   ,0       ); -- sibanac leaf
    npc.base.trader_functions.AddTraderItem(15  ,178  ,200,1  ,50,{3} ,{33},0   ,0       ); -- white cloth/bandage
    npc.base.trader_functions.AddTraderItem(60  ,2744 ,50 ,5  ,10,{3} ,{33},0   ,0       ); -- pipe

    TraderCopper=5000;

    npc.base.functions.AddTraderTrigger("[Gg]reetings","Hiho. How can I help you?");
    npc.base.functions.AddAdditionalTrigger("[Hh]ello");
    npc.base.functions.AddAdditionalText("Hello. Do you need something? I'm alchemist and dyes of all colors. All are selfmade!");
    npc.base.functions.AddTraderTrigger("[Gg]rü[ßs]+e","Hiho! Wie kann ich dir helfen? Ich habe allerhand Farben. Alle selbst gemacht!");
    npc.base.functions.AddAdditionalTrigger("[Hh]allo");
    npc.base.functions.AddAdditionalText("Hallo. Wer bist du denn?");
    npc.base.functions.AddTraderTrigger("[Yy]ou.+[Tt]rader","Yes, i trade with dyes and ingredients to make them.");
    npc.base.functions.AddTraderTrigger("[DdIi][uh]r*.+[Hh][äa]ndler","Ja, ich handle mit Farben und Zutaten zur Herstellung von Farben.");
    npc.base.functions.AddTraderTrigger("[Yy]ou.+[Hh]ealer","No, i am not. I am alchemist and sell dyes");
    npc.base.functions.AddTraderTrigger("[DdIi][uh]r*.+[Hh]eiler","Nein bin ich nicht. Ich bin Alchemist und verkaufe Farben.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+sell","Do you want that i list my wares? Here take a look at the best dyes you can find!");
    npc.base.functions.AddTraderTrigger("[Ww]as.+verkauf","Willst du eine Liste meiner Waren sehen? Hier, schau. Das sind die besten Farben die du finden wirst");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Ww]ares","I trade with dyes and ingredients to make them.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Ww]aren","Ich handele mit Farben und Zutaten zu deren Herstellung.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Pp]otion","I have no potions anymore. I only trade with dyes and ingredients to make them.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Tt]ränke","Ich habe keine Tränke mehr. Ich handele nur noch mit Farben und Zutaten zu deren Herstellung.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Cc]loth","I don't trade with cloth anymore. The business with cloths didn't work.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Kk]leidung","Ich habe keine Kleidung mehr im Angebot. Das Geschäft mit den abgetragenen Klamotten lief nicht gut.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Mm]ore","I need different tools and goods to make dyes");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Mm]ehr","Ich brauche verschiedene Werkzeuge und Sachen um Farben herzustellen.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Dd]ye","I'm an alchemist and prepare differnet dyes. You are interested in red, blue, yellow or other?");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Ff]arbe","Ja, ich bin Alchemist und verkaufe verschiedene Farben. Bist du vielleicht an Rot oder Blau interessiert? Was anderes?");
    npc.base.functions.AddTraderTrigger("[Gg]oodbye","Have a nice day. Oldra my bless you.");
    npc.base.functions.AddAdditionalTrigger("[Bb]ye");
    npc.base.functions.AddAdditionalTrigger("[Ff]arewell");
    npc.base.functions.AddAdditionalText("Farewell!");
    npc.base.functions.AddAdditionalText("Good day.");
    npc.base.functions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Schönen Tag noch! Oldra segne euch!");
    npc.base.functions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npc.base.functions.AddAdditionalText("Schönen Tag!");
    npc.base.functions.AddTraderTrigger("[Ww]ho.+you?","My name is Tony Baggins. I am an alchemist and I work here. But I come from Greenbriar. Do you know my home village?");
    npc.base.functions.AddTraderTrigger("[Ww]er.+[DdIi][uh]r*","Ich bin Tony Baggins. Ich bin Alchemist und arbeite hier. Aber ich komme von Greenbriar. Kennst du mein Heimatdorf?");
    npc.base.functions.AddTraderTrigger("I'm .+","Nice to meet you. Do you need my help?");
    npc.base.functions.AddTraderTrigger("[Ii]ch.+[Bb]in","Freut mich! Kann ich dir helfen?");
    npc.base.functions.AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?', 'Tell <something>'");
    npc.base.functions.AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?', 'Erzähl über <etwas>'");

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
            elseif (Status==3) then -- Nicht genug Geld um das Item zu bezahlen // not enough money to buy the item
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
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." wäre mir"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang).." wert.";
                eText="I would pay"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang).." for "..Values[1]..world:getItemName(Values[2],1)..".";
            elseif (Status==9) then -- Einkauf von mehreren Items erfolgreich // npc.base.trader_functions.Buying of multible items succeed
                gText="Du willst "..Values[1].." "..world:getItemName(Values[2],0).." verkaufen? Ich gebe dir"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell "..Values[1].." "..world:getItemName(Values[2],1).."? I give you"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==10) then -- Item das gekauft werden soll nicht vorhanden // item that should be buyed is not aviable
                gText="Komm wieder wenn du das hast!";
                eText="Come back when you have that!";
            elseif (Status==11) then -- Händler hat nicht genug Geld // trader don't have enough money
                gText="Tut mir leid. Ich kann das nicht kaufen. Ich hab' nicht genug Geld.";
                eText="Sorry, I cannot buy that. I do not have enough money.";
            elseif (Status==12) then -- Händler kauft das Item nicht // trader didn't buy the item
                gText="So etwas kaufe ich nicht. Tut mir leid.";
                eText="Sorry, I do not buy that item.";
            elseif (Status==13) then -- Einkauf eines einzelnen Items erfolgreich // npc.base.trader_functions.Buying of a single item succeed
                gText=npc.base.functions.GenusSel(Values[2],"Ein","Eine","Ein").." "..world:getItemName(Values[2],0).." ist es, was du verkaufen willst? Ich geb' dir"..npc.base.trader_functions.MoneyText(0,Values[3],Values[4],Values[5],TraderLang)..".";
                eText="You want to sell a "..world:getItemName(Values[2],1).."? I give you"..npc.base.trader_functions.MoneyText(1,Values[3],Values[4],Values[5],TraderLang)..".";
            elseif (Status==14) then -- Liste der Waren die der NPC verkauft ist nicht leer // List of the wares the NPC sells, is not empty
                gText="Ich verkaufe verschiedene Farben. Alle selbst gemacht!";
                eText="I sell different dyes. All i made with my own hands!";
            elseif (Status==15) then -- Liste der Waren die der NPC verkauft ist leer // List of the wares the NPC sells, is empty
                gText="Ich verkaufe nichts.";
                eText="I do not sell anything.";
            elseif (Status==16) then -- Liste der Waren die der NPC kauft ist leer // List of the wares the NPC buys, is not empty
                gText="Ich kaufe Zutaten um Farben und Tränke herzustellen.";
                eText="I buy ingredients to make dyes and potions.";
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
        output[0]="Ein laufender Meter, der da ans Fass lehnt und sich mit einem Fächer aus Blättern Luft zuwedelt. Er ist ganz in grün gekleidet und hat Sommersprossen um die Nase.";
        output[1]="A midget leaning against that barrel there waving himself some air with a fan made of leaves. He is completely clad in green fabric and his nose is covered with freckles.";
        initLook=1;
    end
    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end
