-- Basisscript fï¿½r NPC Hï¿½ndlerfunktionen
-- Nitram

require("content.genus")
require("base.factions")

module("npc.base.trader_functions", package.seeall)

-- Auffï¿½llen der Itembestï¿½nde
function refillItems(itNumb)
    if (TraderItemNumber[itNumb] == 4294967295) then
        return
    end
    if (TraderItemNumber[itNumb]>TraderItemStandard[itNumb]) then
        TraderItemNumber[itNumb]=TraderItemNumber[itNumb]-math.random(0,TraderItemNumber[itNumb]-TraderItemStandard[itNumb]);
    elseif (TraderItemNumber[itNumb]<TraderItemStandard[itNumb]) then
        TraderItemNumber[itNumb]=TraderItemNumber[itNumb]+math.random(0,TraderItemStandard[itNumb]-TraderItemNumber[itNumb]);
    end
end

-- Auffï¿½llen der Geldbestï¿½nde
function refillMoney()
    if TraderCopper<TraderStdCopper/2 then
        TraderCopper=TraderCopper+math.random(TraderStdCopper/100,TraderStdCopper/10);
    elseif TraderCopper>2*TraderStdCopper then
        TraderCopper=TraderCopper-math.random(TraderStdCopper/100,TraderStdCopper/10);
    end
end

-- Definieren aller Hï¿½ndler relevanter Listen
function InitItemLists()
    TraderItemPrice={};
    TraderItemId={};
    TraderItemNumber={};
    TraderItemSellPrice={};
    TraderItemStandard={};
    TraderItemQuality={};
    TraderItemDura={};
    TraderItemData={};
    TraderItemName={};
    TraderItemCate={};
    TraderCat={};
end

-- Preiskalkulation
-- Preis abhï¿½nig von Itembestand und Standartbestand
-- Return 1: Preis(Int)
function CalcPrice(stdPrice,actAmount,stdAmount)  -- TraderItemPrice[..]->CalcPrice(TraderItemPrice[..],TraderItemNumber[..],TraderItemStandard);
    if (stdAmount == 4294967295) then
        return stdPrice;
    else 
        if (actAmount*2<stdAmount) then    --less than 1/2 of standard
            return math.floor(stdPrice*1.5);
        elseif (actAmount<=2*stdAmount) then      -- 1/2 to 2*standard
            return stdPrice;
        else
            return math.floor(stdPrice*0.75);   -- >2 times standard
        end
    end;
end

-- Aufspalten der Kosten in Kupfer in Kupfer und Silbermï¿½nzen
-- Wechselwert: 1 Goldmï¿½nze   = 100 Silbermï¿½nzen
--              1 Silbermï¿½nze = 100 Kupfermï¿½nzen
-- Return 1: Goldmï¿½nzen(Int)
-- Return 2: Silbermï¿½nzen(Int)
-- Return 3: Kupfermï¿½nzen(Int)
function CalcSilverCopper(CAmount)
    local GAmount=math.floor(CAmount/10000);
    local SAmount=math.floor((CAmount-GAmount*10000)/100);
    local CAmount=CAmount-(SAmount*100+GAmount*10000);
    return GAmount,SAmount,CAmount
end

--TLang={"Gold,"gold","Silber","silver","Kupfer","copper","stï¿½cke","pieces"};
-- Erstellt Text fï¿½r die Kosten
-- Return 1: Text(Str)
function MoneyText(lang,Gold,Silver,Copper,TLang)
    local retText="";
    local GText="";
    local SText="";
    local CText="";
    local EndText="";
    if (Gold>0) then
        GText=Gold.." "..TLang[lang+1];
        EndText=Zeitform(Gold,TLang[lang+7]);
    end
    if (Silver>0) then
        SText=Silver.." "..TLang[lang+3];
        EndText=Zeitform(Silver,TLang[lang+7]);
    end
    if (Copper>0) then
        CText=Copper.." "..TLang[lang+5];
        EndText=Zeitform(Copper,TLang[lang+7]);
    end
    retText=GText;
    if (SText~="") then
        if (retText~="") then
            if (CText~="") then
                retText=retText..", "..SText;
            else
                if (lang == 0) then
                    retText=retText.." und "..SText;
                else
                    retText=retText.." and "..SText;
                end
            end
        else
            retText=SText;
        end
    end
    if (CText~="") then
        if (retText~="") then
            if (lang == 0) then
                retText=retText.." und "..CText;
            else
                retText=retText.." and "..CText;
            end
        else
            retText=CText;
        end
    end
    retText=" "..retText..EndText;
    return retText
end

-- Erstellt Sigular von Wï¿½rtern
-- Funktionstï¿½chtig in Deutsch und englisch
function Zeitform(Zahl,Word)
    if (Zahl==1) then
        local retStr="";
        local cursor=string.len(Word);
        local finish=false;
        repeat
            lett=string.sub(Word,cursor,cursor)
            if ((lett~="e" and lett~="s") or finish==true)  then
                retStr=lett..retStr;
            else
                finish=true;
            end
            cursor=cursor-1;
        until (cursor==0)
        return retStr;
    else
        return Word;
    end
end

-- Geldprï¿½fung
-- Return 1 (bool) genug Geld - nicht genug Geld
function CheckMoney(User,Gold,Silber,Kupfer)
    local UserGold=User:countItem(61);
    local UserSilber=User:countItem(3077);
    local UserKupfer=User:countItem(3076);
    local Amount=(Gold*10000)+(Silber*100)+Kupfer;
    local UserAmount=(UserGold*10000)+(UserSilber*100)+UserKupfer;
    if (Amount<=UserAmount) then
        return true
    else
        return false
    end
end

-- Bezahlen Funktion
-- Versucht Silber/Kupfermï¿½nzen passend zu nehmen
-- Wenn nicht mï¿½glich: Weicht auf andere Mï¿½nzen aus

-- Folgende Liste wird nicht korrekt zurï¿½ckgegeben (Gold fehlt). Die ts-Version hat sie nicht (Schlamperei).  An Vilarion wenden(dalli).
-- Return 1: Liste {Bezahltes Silber (int), Bezahltes Kupfer (int)}
function Pay(User,Gold,Silber,Kupfer)
    
    local GoldID=61;
    local SilberID=3077;
    local KupferID=3076;
    local PayGold=0;
    local PaySilber=0;
    local PayKupfer=0;
    local MissGold=Gold;
    local MissSilber=Silber;
    local MissKupfer=Kupfer;
    local UserGold=User:countItem(GoldID);
    local UserSilber=User:countItem(SilberID);
    local UserKupfer=User:countItem(KupferID);
    local Amount=(Gold*10000)+(Silber*100)+Kupfer;
    local GoldAlsKupfer=0;
    local SilberAlsKupfer=0;
    local GoldAlsSilber=0;
    
    GoldAlsKupfer = math.min( MissGold, math.floor( UserKupfer/10000 ) );
    PayKupfer = GoldAlsKupfer * 10000;
    MissGold = MissGold - GoldAlsKupfer;
    UserKupfer = UserKupfer - PayKupfer;
    
    GoldAlsKupfer = math.floor( UserKupfer/100 );
    GoldAlsSilber = 100 - GoldAlsKupfer;
    if ((MissGold > 0) and (GoldAlsKupfer > 0) and (UserSilber >= GoldAlsSilber)) then
        PayKupfer = PayKupfer + 100 * GoldAlsKupfer;
        PaySilber = PaySilber + GoldAlsSilber;
        MissGold = MissGold - 1;
        UserKupfer = UserKupfer - 100 * GoldAlsKupfer;
        UserSilber = UserSilber - GoldAlsSilber;
    end;
    
    SilberAlsKupfer = math.min( MissSilber, math.floor( UserKupfer/100 ) );
    PayKupfer = PayKupfer + SilberAlsKupfer * 100;
    MissSilber = MissSilber - SilberAlsKupfer;
    UserKupfer = UserKupfer - SilberAlsKupfer * 100;
    
    if (UserKupfer >= MissKupfer) then
        PayKupfer = PayKupfer + MissKupfer;
    else
        MissSilber = MissSilber + 1;
        PayKupfer = PayKupfer + MissKupfer - 100;
    end;
    
    GoldAlsSilber = math.min( MissGold, math.floor( UserSilber/100 ) );
    PaySilber = PaySilber + GoldAlsSilber * 100;
    MissGold = MissGold - GoldAlsSilber;
    UserSilber = UserSilber - GoldAlsSilber * 100;
    
    if (UserSilber >= MissSilber) then
        PayGold = MissGold;
        PaySilber = PaySilber + MissSilber;
    else
        PayGold = MissGold + 1;
        PaySilber = PaySilber + MissSilber - 100;
    end;
    
        
    if (PayGold>0) then
        User:eraseItem(GoldID,PayGold);
    end
    if (PaySilber>0) then
        User:eraseItem(SilberID,PaySilber);
    elseif (PaySilber<0) then
        User:createItem(SilberID,PaySilber*(-1),333,0);
    end
    if (PayKupfer>0) then
        User:eraseItem(KupferID,PayKupfer);
    elseif (PayKupfer<0) then
        User:createItem(KupferID,PayKupfer*(-1),333,0);
    end
end

-- Generiert aus ItemID passenden TriggerText, fï¿½r die Suche nach dem Item im Text
function MakeTrigger(ItemID,lang)
    local retString="";
    ItemName=world:getItemName(ItemID,lang);
    for i=1,string.len(ItemName) do
        Char=string.sub(ItemName,i,i);
        NextChar=string.sub(ItemName,i+1,i+1);
        if (string.upper(Char)==Char) then
            retString=retString..string.lower(Char);
        elseif (Char=="ß") then
            retString=retString.."[ßs]+";
        elseif (Char=="'") then
            retString=retString.."[' ]*";
        elseif (NextChar==" " or NextChar=="-") then
            if (Char=="r" or Char=="s") then
                retString=retString.."[rs]*.*";
            else
                retString=retString..Char..".*";
            end
            i=i+1;
        elseif (Char=="ü") then
            retString=retString.."[üu]e*";
        elseif (Char=="ö") then
            retString=retString.."[öo]e*";
        elseif (Char=="ä") then
            retString=retString.."[äa]e*";
        else
            retString=retString..Char;
        end
    end
    return retString;
end

-- Erstellt Item Quality Wert aus den Gegebenen Grï¿½ï¿½en
function GenQual(QualList,DuraList)
    local Qualcount=table.getn(QualList);
    local Duracount=table.getn(DuraList);
    local retQual=0;
    local Qual=0;
    local Dura=0;
    if (Qualcount==2 and QualList[1]<10 and QualList[2]<10 and QualList[1]>0 and QualList[2]>0 and QualList[1]<QualList[2]) then
        Qual=math.random(QualList[1],QualList[2]);
    elseif (Qualcount==1 and QualList[1]<10) then
        Qual=QualList[1];
    else
        Qual=5;
    end
    if (Duracount==2 and DuraList[1]<100 and DuraList[2]<100 and DuraList[1]>0 and DuraList[2]>0 and DuraList[1]<DuraList[2]) then
        Dura=math.random(DuraList[1],DuraList[2]);
    elseif (Duracount==1 and DuraList[1]<100 and DuraList[1]>0) then
        Dura=DuraList[1];
    else
        Dura=55;
    end
    retQual=(Qual*100)+Dura;
    return retQual
end

--function QualPrice(StdPrice,Itemqual,QualList)
--    local retPrice=0;
--    if (table.getn(QualList)==0) then
--        retPrice=StdPrice;
--    else
--        local ItemQuality=math.floor(Itemqual/100);
--        local ItemDurability=Itemqual-(ItemQuality*100);
--        retPrice=0.2*StdPrice*(1+0.4*(ItemDurability-50)^3/50^3+0.4*(ItemQuality-4.5)^3/4.5^3)
--        if (retPrice<1) then retPrice=1 end
--    end
--    return retPrice
--end

-- Item verkaufen Funktion
-- Return 1: Status Value (Int)
-- Return 2: Zusï¿½tzliche Variablen (List)

-- Status:
--  0 - keine Aktion
--  1 - ein Item verkauft
--  2 - Inventar voll
--  3 - Zu wenig Geld
--  4 - Hï¿½ndler hat Item nicht mehr
--  5 - Item wird nicht verkauft
--  6 - mehrere Items verkauft

-- Zusï¿½tzliche Variablen:
--  Bei Status 1 oder 6:
--   Liste: {Anzahl der verkauften Items (Int),ItemID (Int),Kosten Silberstï¿½cke (Int),Kosten Kupferstï¿½cke (Int)}
--  Bei Status 0 oder 2-5:
--   Liste: {nil}
function Buying(originator, message)
    local a=nil;
    local retStatus=0;
    local retValues={};
    local found=false
    if (string.find(message,"buy")~=nil or string.find(message,"%skauf")~=nil) then
        found=true;
        a,b,countStr=string.find(message,"(%d+)")               -- ...want to buy <number> <itemS>
    end
    if found then
        if (countStr==nil) then
            count=1;
        else
            count=countStr+1-1;
        end
        message=string.lower(message);
        foundItem=false;
        itnCnt=1;
        repeat
            if CheckItemTrigger(message,itnCnt) then
                --originator:inform("TraderItemPrice: "..TraderItemPrice[itnCnt]);
                ActPrice=CalcPrice(TraderItemPrice[itnCnt],TraderItemNumber[itnCnt]+count,TraderItemStandard[itnCnt]);
                if (ActPrice~=0) then                                -- if he sells it
                    if(TraderItemNumber[itnCnt]>=count) then                         -- if he has enough of it
                        GPrice,SPrice,CPrice=CalcSilverCopper(ActPrice*count);                        
                        if CheckMoney(originator,GPrice,SPrice,CPrice) then   -- if he has enough money
                            created=originator:createItem(TraderItemId[itnCnt],count,GenQual(TraderItemQuality[itnCnt],TraderItemDura[itnCnt]),TraderItemData[itnCnt])
                            if (created ~=0 ) then
                                retStatus=2;
                                if (count-created>0) then originator:eraseItem(TraderItemId[itnCnt],count-created) end
                            else
                                Coins=Pay(originator,GPrice,SPrice,CPrice);
                                if (count==1) then
                                    retStatus=6;
                                else
                                    retStatus=1;
                                end
                                retValues={count,TraderItemId[itnCnt],GPrice,SPrice,CPrice};                                
                                if (TraderItemNumber[itnCnt] ~= 4294967295) then
                                    PayTheTax(math.floor(ActPrice*count*0.4));
                                    TraderCopper=TraderCopper +ActPrice*count;
                                    TraderItemNumber[itnCnt]=TraderItemNumber[itnCnt]-count;
                                end
                            end
                        else        -- not enough money
                            retStatus=3;
                        end -- enough money
                    else
                        retStatus=4;
                    end
                    foundItem=true;
                else
                    retStatus=5;
                end
                foundItem=true;
            end
            itnCnt = itnCnt+1;
        until ((itnCnt==table.getn(TraderItemId)+1) or foundItem)           -- until no more items or we found one
        if (foundItem==false) then
            retStatus=5;
        end
    end
    return retStatus,retValues;
end

-- Ansage Verkaufspreis
-- Return 1: Status Value (Int)
-- Return 2: Zusï¿½tzliche Variablen (List)

-- Status:
--  0 - keine Aktion
--  5 - Item wird nicht verkauft
--  7 - Item wird verkauft

-- Zusï¿½tzliche Variablen:
--  Bei Status 7:
--   Liste: {ItemID (Int),Kosten Silberstï¿½cke (Int),Kosten Kupferstï¿½cke (Int)}
--  Bei Status 0,5:
--   Liste: {nil}
function SayPriceSell(originator, message)
    local foundItem=false;
    local retStatus=0;
    local retValues={};
    local i=0;
    message=string.lower(message);
    if (string.find(message,"price.+") ~= nil or string.find(message,"what.+cost")~=nil or
    string.find(message,"preis.+") ~= nil or string.find(message,"was.+kost")~=nil or string.find(message,"wieviel.+kost")~=nil) then     -- if asked for price...
        repeat
            i=i+1;
            if CheckItemTrigger(message,i) then
                GPrice,SPrice,CPrice=CalcSilverCopper(CalcPrice(TraderItemPrice[i],TraderItemNumber[i],TraderItemStandard[i]));
                foundItem=true;
                if (SPrice+CPrice+GPrice==0) then
                    retStatus=5;
                    retValues={};
                else
                    retStatus=7;
                    retValues={TraderItemId[i],GPrice,SPrice,CPrice};
                end
            end
        until (i==table.getn(TraderItemId) or foundItem)
    end
    return retStatus,retValues
end

-- Ansage Einkaufspreis
-- Return 1: Status Value (Int)
-- Return 2: Zusï¿½tzliche Variablen (List)

-- Status:
--  0 - keine Aktion
--  12 - Item wird nicht eingekauft
--  8 - Item wird eingekauft

-- Zusï¿½tzliche Variablen:
--  Bei Status 8:
--   Liste: {Engl. Artikel (Str),ItemID (Int),Kosten Silberstï¿½cke (Int),Kosten Kupferstï¿½cke (Int)}
--  Bei Status 0,12:
--   Liste: {nil}
function SayPriceBuy(originator, message)
    local foundItem=false;
    local retStatus=0;
    local retValues={};
    local artic="";
    local i=0;
    message=string.lower(message);
    if (string.find(message,"you.+pay.+") ~= nil or string.find(message,"how much.+for.+")~=nil or
    string.find(message,"wieviel zahlt .+für.+")~=nil or string.find(message,"was zahlt .+für.+")~=nil ) then
        repeat                           -- run through all triggers
            i=i+1;
            if CheckItemTrigger(message,i) then
                foundItem=true;
                GPrice,SPrice,CPrice=CalcSilverCopper(CalcPrice(TraderItemSellPrice[i],TraderItemNumber[i],TraderItemStandard[i]));
                if (GPrice+SPrice+CPrice==0) then
                    retStatus=12;
                    retValues={};
                else
                    retStatus=8;
                    artic=EngGenusSel(TraderItemId[i]);
                    retValues={artic,TraderItemId[i],GPrice,SPrice,CPrice};
                end
            end --if
        until (i==table.getn(TraderItemId) or foundItem)
    end
    return retStatus,retValues
end

-- Item einkaufen Funktion
-- Return 1: Status Value (Int)
-- Return 2: Zusï¿½tzliche Variablen (List)

-- Status:
--  0 - keine Aktion
--  2 - Inventar voll
--  9 - mehrere Items eingekauft
-- 10 - Item beim Spieler nicht in nï¿½tiger Anzahl vorhanden
-- 11 - Hï¿½ndler hat zu wenig Geld
-- 12 - Item wird nicht eingekauft
-- 13 - ein Item eingekauft

-- Zusï¿½tzliche Variablen:
--  Bei Status 13 oder 9:
--   Liste: {Anzahl der eingekauften Items (Int),ItemID (Int),Kosten Silberstï¿½cke (Int),Kosten Kupferstï¿½cke (Int)}
--  Bei Status 0,2,10,11,12:
--   Liste: {nil}
function Selling(originator, message)
    local retStatus=0;
    local retValues={};
    local a=nil;
    local found=false
    if (string.find(message,"sell")~=nil or string.find(message,"verkauf")~=nil) then
        found=true;
        a,b,countStr=string.find(message,"(%d+)")      -- ...want to sell <number> <itemS>
    end
    if found then
        message=string.lower(message);
        if (countStr==nil) then
            count=1;
        else
            count=countStr+1-1;
        end
        foundItem=false;
        itnCnt=1;
        repeat
            if CheckItemTrigger(message,itnCnt) then
                ActPrice=CalcPrice(TraderItemSellPrice[itnCnt],TraderItemNumber[itnCnt]-count,TraderItemStandard[itnCnt]);
                if (ActPrice~=0) then
                    if (TraderCopper >=ActPrice*count) then
                        GPrice,SPrice,CPrice=CalcSilverCopper(ActPrice*count);
                        if (originator:countItem(TraderItemId[itnCnt])>=count) then -- if he has enough of that
                            MissGold  =originator:createItem(  61,GPrice,333,0);
                            MissSilver=originator:createItem(3077,SPrice,333,0);
                            MissCopper=originator:createItem(3076,CPrice,333,0);
                            if (MissSilver ~=0 or MissCopper ~= 0 or MissGold ~= 0) then
                                retStatus=2;
                                originator:eraseItem(  61,GPrice-MissGold);
                                originator:eraseItem(3077,SPrice-MissSilver);
                                originator:eraseItem(3076,CPrice-MissCopper);
                            else
                                if (count==1) then
                                    retStatus=13;
                                else
                                    retStatus=9;
                                end
                                retValues={count,TraderItemId[itnCnt],GPrice,SPrice,CPrice}
                                originator:eraseItem(TraderItemId[itnCnt],count);
                                if (TraderItemNumber[itnCnt] ~= 4294967295) then
                                    PayTheTax(math.floor(ActPrice*count*0.05));
                                    TraderCopper=TraderCopper -ActPrice*count;
                                    TraderItemNumber[itnCnt]=TraderItemNumber[itnCnt]+count;
                                end
                            end
                        else        -- not enough money
                            retStatus=10;
                        end -- enough money
                    else
                        retStatus=11;
                    end
                else
                    retStatus=12;
                end
                foundItem=true;
            end --string find (itemname)
            itnCnt = itnCnt + 1;
        until ((itnCnt==table.getn(TraderItemId)+1) or foundItem)           -- until no more items or we found one
        if (foundItem==false) then
            retStatus=12;
        end
    end
    return retStatus,retValues
end

-- Ausgabe der Liste der Item die eingekauft werden
-- Return 1: Status Value (Int)
-- Return 2: {nil}

-- Status:
--  0 - keine Aktion
--  16 - Liste enthï¿½lt Items
--  17 - Liste leer
function ShowItemList(originator,message)
    if not NPCStatus then
        NPCStatus = { };
    end
    
    local retStatus=0;
    local retValues={};
    local Itemthere=false;
    local Kauf=false;
    message=string.lower(message);
    if (string.find(message,"what.+buy")~=nil or string.find(message,"what.+sell")~=nil or string.find(message,"[Ll]ist.+[Yy]ou.+[Ww]are")~=nil or
    string.find(message,"was.*kauf.*")~=nil or string.find(message,"welch.+%s[Ww]aren.*kauf.*")~=nil) then                -- asked for a list of wares he buys
        local priceList=nil;
        if (string.find(message,"sell")~=nil or string.find(message,"verkauf")~=nil or string.find(message,"[Ll]ist.+[Yy]ou.+[Ww]are")~=nil) then
            priceList=TraderItemPrice;
            NPCStatus[originator.id] = 0;
        else
            priceList=TraderItemSellPrice;
            NPCStatus[originator.id] = 1;
            Kauf=true;
        end
        local i=0;
        local CatFound=false;
        local View=0;
        if (table.getn(TraderCat)>1) then
        	  --originator:inform("Categories!");
            repeat
                i=i+1;
                if CheckCatTrigger(message,i) then
                    CatFound=true;
                    View=i;
                end
            until (CatFound or i==table.getn(TraderCat))
            --originator:inform("Searching finished");
            if (View==0) then
            	  --originator:inform("And there really is one");
                ItemListMenu=MenuStruct();
                --originator:inform("so we create a Menu");
                if Kauf then
                    CheckVal=3;
                else
                    CheckVal=4;
                end
                --originator:inform("And got if it is selling or buying");
                for itnCnt=1,table.getn(TraderCat) do
                	  --originator:inform("Now Run throw the categories");
                    if TraderCat[itnCnt][CheckVal] then
                    	  --originator:inform("Got the correnct one");
                        ItemListMenu:addItem(TraderCat[itnCnt][1]);
                        --originator:inform("and view it");
                        Itemthere=true;
                    end
                end
            end
        end
        if not Itemthere then
            Status=1;
            ItemListMenu=MenuStruct();        
            for itnCnt=1,table.getn(TraderItemId) do
                if (priceList[itnCnt]~=0 and TraderItemCate[itnCnt]==View) then
                    Itemthere=true;
                    ItemListMenu:addItem(TraderItemId[itnCnt]);
                end
            end
        end
        if (Itemthere==true) then
            if Kauf then
                retStatus=16;
            else
                retStatus=14;
            end
            retValues={View};
            originator:sendMenu(ItemListMenu);
            originator:changeSource( thisNPC );
        else
            if Kauf then
                retStatus=17;
            else
                retStatus=15;
            end
        end
    end
    return retStatus,retValues
end

-- Hinzufï¿½gen eines Items In Hï¿½ndler Liste
-- Erwartete Werte:
--  1. Verkaufspreis (Int)
--  2. ItemID (Int)
--  3. Itemanzahl beim Laden des Scripts (Int)
--  4. Einkaufspreis (Int)
--  5. Angestrebte Itemmenge (Int)
--  6. Qualitï¿½tsbereich (List) - Werte zwischen 1 - 9
--      Listen Format 1: {max. Qualitï¿½t (Int), min. Qualitï¿½t(Int)}
--      Listen Format 2: {Qualitï¿½t (Int)}
--  7. Haltbarkeitsbereich (List) - Werte zwischen 1 - 99
--      Listen Format 1: {max. Haltbarkeit (Int), min. Haltbarkeit(Int)}
--      Listen Format 2: {Haltbarkeit (Int)}
--  8. Datawert des Items (Int)
function AddTraderItem(BuyPrice,ItemId,ItemNumber,SellPrice,ItemStandard,Qual,Dura,DataVal,Category)
    table.insert(TraderItemPrice,BuyPrice);
    table.insert(TraderItemId,ItemId);
    table.insert(TraderItemNumber,ItemNumber);
    table.insert(TraderItemSellPrice,SellPrice);
    table.insert(TraderItemStandard,ItemStandard);
    table.insert(TraderItemQuality,Qual);
    table.insert(TraderItemDura,Dura);
    table.insert(TraderItemData,DataVal);
    if (Category==nil) then
        table.insert(TraderItemCate,0);
    else
        table.insert(TraderItemCate,Category);
    end        
end

-- Next Cycle Funktion fï¿½r Hï¿½ndler
function TraderCycle()
--[[ Whoever wrote this crap can fix this himself. Hint: You might want to google what a 'parameter' is
    if (cycCount==nil or nextDelivery==nil) then
        cycCount=1;
        nextDelivery=math.random(RefreshTime[1],RefreshTime[2]);
    else
        cycCount=cycCount+1;
        if (cycCount+1>nextDelivery+1) then
            --thisNPC:talk(Character.say, "Next");
            nextDelivery=math.random(RefreshTime[1],RefreshTime[2]);
            cycCount=1;
            --thisNPC:talk(Character.say, "Next delivery in "..nextDelivery.." CycCount: "..cycCount);
            for itnCnt=1,table.getn(TraderItemNumber) do
                refillItems(itnCnt);
            end
            refillMoney();
        end
    end
--]]
end

-- Zusï¿½tzlichen ItemTrigger Anfï¿½gen
-- Eingabe Werte:
--  1. Trigger Text
function AddItemTrigger(TrigText)
    local CurrentItem=table.getn(TraderItemId)
    if (TraderItemName[CurrentItem]==nil) then
        TraderItemName[CurrentItem]={};
    end
    table.insert(TraderItemName[CurrentItem],TrigText);
end

-- Erstellt neue Item Kategorie
-- Input als Liste
-- Englische und Deutsche Begriffe als Kategorie Trigger in Liste
function CreateCategory(CatItemID,CatNames,Buy,Sell)
    table.insert(TraderCat,{CatItemID,CatNames,Buy,Sell});
end

function CheckCatTrigger(message,Category)
    local TriggerList=TraderCat[Catagory][2]
    local found=false;
    local k=1;
    repeat
        if (string.find(message,Triggerlist[k])~=nil) then
            found=true;
        else
            k=k+1;
        end
    until (k==table.getn(TriggerList) or found)
    return found
end

-- ï¿½berprï¿½ft ob der Text einen ItemTrigger enthï¿½lt
function CheckItemTrigger(message,ItemPoint)
    if (string.find(message,MakeTrigger(TraderItemId[ItemPoint],0))~=nil or
    string.find(message,MakeTrigger(TraderItemId[ItemPoint],1))~=nil) then
        return true
    else
        if (TraderItemName[ItemPoint]~=nil) then
            local retVal=false;
            local t=0;
            repeat
                t=t+1;
                if (string.find(message,TraderItemName[ItemPoint][t])~=nil) then
                    retVal=true;
                end
            until (retVal or (t==table.getn(TraderItemName[ItemPoint])))
            return retVal
        else
            return false
        end
    end
end

function PayTheTax(amount)
  	local location = base.factions.setLocation(thisNPC);

	if location ==     1 then --cadomyr
        TaxVar = "cadomyr";
	elseif location == 2 then --runewick
	    TaxVar = "runewick";
	elseif location == 3 then --galmair
	    TaxVar = "galmair";
	else return; end


	found, currentAmount = ScriptVars:find( TaxVar );
	if found then
		ScriptVars:set( TaxVar, amount+currentAmount);
	else
		ScriptVars:set( TaxVar, amount);
	end

  --[[  if ((thisNPC.pos.x <= -51) and (thisNPC.pos.x >= -146) and (thisNPC.pos.y <= -66) and (thisNPC.pos.y >= -155) and (thisNPC.pos.z <= 3) and (thisNPC.pos.z >= -3)) then
        file = "trollsbane.dat";
    elseif ((thisNPC.pos.x <= -356) and (thisNPC.pos.x >= -424) and (thisNPC.pos.y <= 103) and (thisNPC.pos.y >= 47) and (thisNPC.pos.z <= 1) and (thisNPC.pos.z >= 0)) then
        file = "greenbriar.dat";
    elseif ((thisNPC.pos.x <= 160) and (thisNPC.pos.x >= 70) and (thisNPC.pos.y <= -170) and (thisNPC.pos.y >= -237) and (thisNPC.pos.z <= 0) and (thisNPC.pos.z >= -9)) then
        file = "silverbrand.dat";
    elseif ((thisNPC.pos.x <= 286) and (thisNPC.pos.x >= 230) and (thisNPC.pos.y <= -290) and (thisNPC.pos.y >= -354) and (thisNPC.pos.z <= 3) and (thisNPC.pos.z >= 0)) then
        file = "varshikar.dat";
    elseif ((thisNPC.pos.x <= 453) and (thisNPC.pos.x >= 306) and (thisNPC.pos.y <= 267) and (thisNPC.pos.y >= 131) and (thisNPC.pos.z <= 3) and (thisNPC.pos.z >= -3)) then
        file = "vanima.dat";
    else
        return
    end
    coins = amount+1-1;
    filepoint,errmsg=io.open("/home/nitram/money/"..file,"r+");
    if (filepoint~=nil) then
        filepoint:seek("set");
        coins = coins + filepoint:read("*n");
        filepoint:seek("set");
        filepoint:write(""..coins);
        filepoint:close();
    end ]]--

	 
end

function NPCUsed(user)
    if not NPCStatus then
        NPCStatus = { };
    end
    if (param == 0) then    
        local newMenu = MenuStruct();
        newMenu:addItem( 3076 );
        newMenu:addItem( 3077 );
        user:sendMenu( newMenu );   
    elseif ( param == 3076 ) then
        ShowItemList(user,"what sell"); 
        NPCStatus[user.id] = 0;
    elseif ( param == 3077 ) then
        ShowItemList(user,"what buy"); 
        NPCStatus[user.id] = 1;
    elseif ( NPCStatus[user.id] == 0 ) then
        Buying( user, "buy" .. world:getItemName(param, user:getPlayerLanguage()));
    elseif ( NPCStatus[user.id] == 1 ) then
        Selling( user, "sell" .. world:getItemName(param, user:getPlayerLanguage()));
    end;
end

function EngGenusSel(ItemID)
	local ItemName=world:getItemName(ItemID,1);
	local vocals={"[Aa]","[Ee]","[Ii]","[Oo]","[Uu]"};
	local vocalFound=false;

	for i, vocal in pairs(vocals) do
		anfang,ende= string.find(ItemName,vocals[i]);
		if ende==1 then
			vocalFound=true;
		end
	end

	if vocalFound then
		artic="an ";
	else
		artic="a ";
	end
	vocalFound=false;

	return artic;
end
