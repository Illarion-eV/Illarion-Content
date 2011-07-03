--Name:        Eliza
--Race:        Lizard
--Town:        Troll's Bane
--Function:    Public trader
--Position:    x=-63 y=-120 z=0
--Facing:      South
--Last Update: 03/07/2008
--Update by:   Lennier

require("npc.base.trader_functions")
require("npc.base.functions")
require("base.common")
module("npc.eliza", package.seeall)

TraderInterface = {};
TraderInterface["page"] = {};
TraderInterface["amount"] = {};
TraderInterface["addItem"] = 	function(User)
								return "worked";
end

Wares = {};
--Wares["page"]

function lookAtNpc( player, mode )
	player:sendCharDescription( thisNPC.id , "Hier steht ein Fisch auf dem Flur." );
	base.common.InformNLS(player,
		"#b|0|61|Hier können Infos und Hilfe stehen.",
		"#b|0|62|Here you could read info and help.");
end

function useNPC(User,counter,param)
    if npc.base.functions.BasicNPCChecks(User,2) then
        if (npc.base.functions.LangOK(User,TradSpeakLang)==true) then
            User:inform("param "..param);
			if ( param == 228 ) then
               User:inform(TraderInterface:addItem(User));
			   --thisNPC:talk( Character.say, "How many will you be buying?" );
            else
               thisNPC:talk( Character.say, "Greetings friend. Have a look at my wares." );
               local newMenu = MenuStruct();
			   newMenu:addItem( 1 );
               newMenu:addItem( 228 );
			   newMenu:addItem( 4 );
			   
               User:sendMenu( newMenu );
            end
            
            --npc.base.trader_functions.NPCUsed(User,counter,param);
        end;
    end;
    --local lang=User:getPlayerLanguage();
    --thisNPC:increaseSkill(1,"common language",100);
    --thisNPC:talkLanguage(Character.say, Player.german , "Fassst mich nicht an! Parameter: "..param );
    --thisNPC:talkLanguage(Character.say, Player.english, "Don't touch me! Parameter: "..param );
end



function GetItems( User, ItemID, DataValue )
    local retList = {};
	local addItem =	function( theItem, bag )
						table.insert( retList, { ["item"]=theItem, ["bag"]=bag } );
	end
	local posList = {5,6,12,13,14,15,16,17};
	local myItem;
	
	retList[0] = 0;
	
    for _,i in posList do
        myItem = User:getItemAt( i );
        if ( myItem.id == ItemID and ( DataValue == nil or myItem.data == DataValue ) and myItem.quality >= 100) then
			addItem( myItem );
			retList[0] = retList[0] + myItem.number;
        end
    end

    local theBackpack=User:getBackPack();
    if theBackpack==nil then
        return retList;
    end
    local i = 0;
    local worked = true;
    local thisCont;
    repeat
        i = i + 1;
        worked,myItem,thisCont=theBackpack:viewItemNr(i);
        if worked then
            if ( myItem.id == ItemID and ( DataValue == nil or myItem.data == DataValue ) ) then
				addItem( myItem, i );
				retList[0] = retList[0] + myItem.number;
            end
        end
    until not worked;
    return retList;
end

function initializeNpc()
    npc.base.functions.InitTalkLists()
    npc.base.trader_functions.InitItemLists()

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    --            EPr ,ID  ,Am,SPr,SA,Qual ,Dura   ,Data,Catagory
    npc.base.trader_functions.AddTraderItem(60  ,18  ,100,5  ,50,{3,5},{33,66},0   ,0); -- leichter Metallschild
    npc.base.trader_functions.AddTraderItem(120 ,20  ,100,7  ,50,{3,5},{33,66},0   ,0); -- Ritterschild
    npc.base.trader_functions.AddTraderItem(300 ,186 ,100,10 ,50,{3,5},{33,66},0   ,0); -- Metallrundschild
    npc.base.trader_functions.AddTraderItem(90  ,19  ,100,7  ,50,{3,5},{33,66},0   ,0); -- großer Metallschild
    npc.base.trader_functions.AddTraderItem(400 ,325 ,100,25 ,50,{3,5},{33,66},0   ,0); -- Stahlhandschuhe
    npc.base.trader_functions.AddTraderItem(400 ,326 ,100,25 ,50,{3,5},{33,66},0   ,0); -- Stahlschuhe
    npc.base.trader_functions.AddTraderItem(1200,2359,100,80 ,5 ,{3,5},{33,66},0   ,0); -- Söldnerrüstung
    npc.base.trader_functions.AddTraderItem(0   ,2360,100,150,5 ,{3,5},{33,66},0   ,0); -- Lor-Angur-Wächterrüstung
    npc.base.trader_functions.AddTraderItem(0   ,2393,100,120,5 ,{3,5},{33,66},0   ,0); -- schwerer Stahlharnisch
    npc.base.trader_functions.AddTraderItem(1500,2364,100,100,5 ,{3,5},{33,66},0   ,0); -- Stahlharnisch
    npc.base.trader_functions.AddTraderItem(0   ,2731,100,30 ,50,{3,5},{33,66},0   ,0); -- Zweihänder
    npc.base.trader_functions.AddTraderItem(100 ,2675,100,6  ,50,{3,5},{33,66},0   ,0); -- Degen
    npc.base.trader_functions.AddTraderItem(150 ,1   ,100,8  ,50,{3,5},{33,66},0   ,0); -- Serinjahschwert
    npc.base.trader_functions.AddTraderItem(100 ,2658,100,6  ,50,{3,5},{33,66},0   ,0); -- Breitschwert
    npc.base.trader_functions.AddTraderItem(100 ,2701,100,6  ,50,{3,5},{33,66},0   ,0); -- Langschwert
    npc.base.trader_functions.AddTraderItem(400 ,2111,100,35 ,50 ,{3,5},{33,66},0  ,0); -- blaue Stahlbeinschienen
    npc.base.trader_functions.AddTraderItem(400 ,2116,100,35 ,50 ,{3,5},{33,66},0  ,0); -- rote Stahlbeinschienen

    TraderCopper=5000;

    npc.base.functions.AddTraderTrigger("[Gg]reet","Greetingsss. What isss it you want? Zss.");
    npc.base.functions.AddAdditionalTrigger("[Hh]ello");
    npc.base.functions.AddAdditionalText("Greetingsss. You are interesssted in my waresss?");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+sell","I trade with shieldsss, greavesss, armorsss and weaponsss. Everything made of metal. sss");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Ss]hield","Whatever you likesss: light, normal and large  metal shieldsss and round metalshieldsss");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Aa]rmor","Besst armosss: steel glovesss, steel bootsss, albarian officersss armorss, light mercenary armorss, Lor-Angur guardiansss armorss, steel plate, heavy red plate armorss and heavy plate armorss. For more goodsss asssk for my lissst of waresss.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Ww]eapon","I trade with two-handed swordss, rapierss, razor bladess, serinjah-swordss. For more goodsss asssk for my lissst of waresss.");
    npc.base.functions.AddTraderTrigger("[Ww]hat.+[Gg]reave","Look. I have: blue steel greavesss, brassss greavesss, red steel greavesss. For more goodsss asssk for my lissst of waresss!");
    npc.base.functions.AddTraderTrigger("[Bb]ye","Good day. Zhelphia may blesss you. Ssss.");
    npc.base.functions.AddAdditionalTrigger("[Ff]arewell");
    npc.base.functions.AddAdditionalTrigger("[Bb]e [Ww]ell");
    npc.base.functions.AddAdditionalText("Sss. Farewell. You are welcome to come back.");
    npc.base.functions.AddTraderTrigger("[hH]elp","'List your wares', 'I want to buy <number> <wares>', 'I want to buy a <ware>', 'I want to sell <number|a> <wares>', 'Price of ...','What do you pay for ...', 'What wares do you buy?'");
    npc.base.functions.AddTraderTrigger("[Gg]rü[ßs]+e","Grüssse. Wasss wollt ihr? Zsss");
    npc.base.functions.AddAdditionalTrigger("[Hh]allo");
    npc.base.functions.AddAdditionalText("Grüssse. Habt ihr Interessse an meinen Waren? Zsss");
    npc.base.functions.AddTraderTrigger("[Ww]as.+kauf","Sss. Ich handle mit Ssschilden, Beinschienen, Rüssstungen und Waffen. Alles aus Metall. ssss");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Ss]child","Wasss auch immer du brauchssst: leichte, normale und große Metallschilde und Metallrundsschilde");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Rr]üstung","Bessste Rüssstungen: Ssstahl Handschuhe und Ssstiefel, Albarische Offiziersss Rüssstungen, leicht Sssöldner Rüssstungen, Lor-Angur Wächter Rüssstungen, Ssstahl Plattenpanzer, ssschwere Rote und ssschwere Ssstahlpanzer.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Ww]affen","Ich handle mit Degen, Rasssierklingen, Ssserinjah-Ssschwertern und Zzweihänderr.");
    npc.base.functions.AddTraderTrigger("[Ww]as.+[Ss]chienen","Sssieh! Ich habe: blaue Ssstahl Beinssschienen, Bronze Beinssschienen und rote Ssstahl Beinssschienen.");
    npc.base.functions.AddTraderTrigger("[Aa]uf [Bb]ald","Auf bald. Zhelphia sssegne euch. Zsss.");
    npc.base.functions.AddAdditionalTrigger("[Bb]is [Bb]als");
    npc.base.functions.AddAdditionalTrigger("[Mm]achs [Gg]ut");
    npc.base.functions.AddAdditionalText("Sss. Bis bald. Ihr könnt gern wieder kommen.");
    npc.base.functions.AddTraderTrigger("[Hh]ilfe","'Welche Waren verkauft ihr', 'Ich möchte <Anzahl> <Ware> kaufen', 'Ich möchte <Ware> kaufen', 'Ich möchte <Anzahl> <Ware> verkaufen', 'Was ist der Preis von <Ware>','Was zahlt ihr für <Ware>', 'Was kauft ihr?'");
    
    npc.base.functions.AddCycleText("#me isst einen Fisch","#me eats a fish");
    npc.base.functions.AddCycleText("#me schaut sich nach Kunden um","#me looks around for customers");
    npc.base.functions.AddCycleText("#me lässt ihren Schwanz hin und her schnalzen","#me flicks her tail");
    npc.base.functions.AddCycleText("#me zählt einige Münzen","#me counts some coins");
    npc.base.functions.AddCycleText("Die besssten Ssschmiedewaren verkauf ich! Zzzum besssten Preisss.","I sssell the bessst smithsss productsss. For the bessst pricesss");

    TraderLang={"Gold","gold","Sssilber", "sssilver","Kupfer","copper","ssstücke","piecesss"};
    

TraderMonths={"Elosss","Tanosss","Zhasss","Ushosss","Sssirosss","Ronasss","Brasss","Eldasss","Irmasss","Malasss","Findosss","Olosss","Adrasss","Narasss","Chosss","Masss"};

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
            
            --- by abcfantasy --
            if not NPCItem then
               NPCItem = { };
            end
				
            if ( string.find( message, "greeting" ) ) ~= nil then
               useNPC( originator, nil, 0 );
            end
			
            if ( NPCItem[originator.id] ~= 0 ) and ( ( string.find( message, "one" ) ~= nil ) or ( string.find( message, "1" ) ~= nil ) ) then
               thisNPC:talk( Character.say, "You just bought one of the following item: " .. world:getItemName(NPCItem[originator.id],1) );
               NPCItem[originator.id] = 0;
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
