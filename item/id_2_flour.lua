-- General Testscript
require("handler.sendmessage")
require("base.money")
-- UPDATE common SET com_script='item.id_2_flour' WHERE com_itemid IN (2);

module("item.id_2_flour", package.seeall)

function UseItem( User, SourceItem, TargetItem, counter, Param, ltstate )

    if User.id==42 then
        UseItemMartin( User, SourceItem, TargetItem, counter, Param, ltstate )
        return
    end


    list=world:LoS(User.pos,position(User.pos.x+5,User.pos.y,User.pos.z));

    if list ~= nil then
        for key, value in pairs(list) do
            User:inform(" test : "..value.TYPE);
        end
    end

    --ScriptVars:set("test","Martin");
    isThere, value = ScriptVars:find("test");
    if isThere then
        User:inform("sv = "..value);
    end
    
    local value = User:eraseItem(1, 1, 3);
    if (value ~= 1) then
        User:inform("Delete of Item with Data 3 returned a false result: " .. value);
    end;
    
    value = User:eraseItem(1, 1, 0);
    if (value ~= 0) then
        User:inform("Delete of Item with Data 0 returned a false result: " .. value);
    end;
    
    value = User:eraseItem(1, 1, 1);
    if (value ~= 0) then
        User:inform("Delete of Item with Data 1 returned a false result: " .. value);
    end;
    
    value = User:eraseItem(1, 1);
    if (value ~= 0) then
        User:inform("Delete of Item returned a false result: " .. value);
    end;
    
    User:inform("All tests done.");
end;



function UseItemMartin( User, SourceItem, TargetItem, counter, Param, ltstate )

--cadomyr = 101
--runewick = 102 
--galmair = 103
--gasthof = 104 (der ist aber unwichtig, da das keine stadt ist)
    
    taxHeight=0.1;  -- 10% taxes for testing purposes
    -- *** DEPOT-LIST HAS TO BE CHANGED ACCORDING TO FACTION MEMBERSHIP! ***
    depNr={101,104};
    valDepot={0,0};
    for i=1,2 do
        valDepot[i]=base.money.DepotCoinsToMoney(User,depNr[i]);
    end

    valBody=base.money.CharCoinsToMoney(User);
    val=valBody+valDepot[1]+valDepot[2];
    tax=math.floor(val*taxHeight);
    totTax=tax;
    
    -- try to get it from homedepot:
    if tax<=valDepot[1] then
        base.money.TakeMoneyFromDepot(User,tax,depNr[1]);
    elseif tax<=valDepot[2] then    -- if not possible, just take it from the pub-depot:
        base.money.TakeMoneyFromDepot(User,tax,depNr[2]);
    elseif tax<=valDepot[1]+valDepot[2] then    -- try both, for god's sake!
        base.money.TakeMoneyFromDepot(User,valDepot[1],depNr[1]);
        tax=tax-valDepot[1];
        base.money.TakeMoneyFromDepot(User,tax,depNr[2]);
    else    -- last, but not least, get it from wherever you can!
        base.money.TakeMoneyFromDepot(User,valDepot[1],depNr[1]);
        tax=tax-valDepot[1];
        base.money.TakeMoneyFromDepot(User,valDepot[2],depNr[2]);
        tax=tax-valDepot[2];
        base.money.TakeMoneyFromChar(User,tax);
    end
    
    
    
    gp,sp,cp=MoneyToCoins(totTax)
    infText="You have thereby paid your monthly tribut. This month, it were "..gp.." gold, "..sp.." silver and "..cp.." copper, which result from a tribute rate of "..(taxHeight*100).."%";

    local closeTrib=function(onClose)
    -- do nothing
    end

    local dialog=MessageDialog("Tribute information",infText,closeTrib);

    User:requestMessageDialog(dialog);

    -- *** TAX-VARIABLE HAS TO BE CHANGED ACCORDING TO FACTION MEMBERSHIP! ***
    taxFound,taxTotal=ScriptVars:find("taxTotal");
    if taxFound then
        taxTotal=taxTotal+tax;
        ScriptVars:set("taxTotal",taxTotal);
    else
        ScriptVars:set("taxTotal",tax);
    end

    ScriptVars:set("MTest",43);
    there,hans=ScriptVars:find("MTest");
    if there then
        User:inform("TESTVAR: "..hans);
    end
    -- ScriptVars:save();
end
