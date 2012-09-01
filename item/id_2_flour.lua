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


	User:inform("Testing possessions")
	bag=User:getBackPack();
	valB=0;
	if bag then
        copper=bag:countItem(3076);
        silver=bag:countItem(3077);
        gold=bag:countItem(61);
        valBag=copper+100*silver+10000*gold;
	end
    
    depNr={101,104};
    valDepot={0,0};
    for i=1,2 do
        depot=User:getDepot(depNr[i]); -- 101-104
        if depot then
            copper=depot:countItem(3076);
            silver=depot:countItem(3077);
            gold=depot:countItem(61);
            valDepot[i]=copper+100*silver+10000*gold;
        end
    end

    copper=User:countItemAt("all",3076);
    silver=User:countItemAt("all",3077);
    gold=User:countItemAt("all",61);
    valBody=copper+100*silver+10000*gold;

    val=valBag+valBody+valDepot[1]+valDepot[2];

    User:inform("Sum: "..val);

    tax=math.round(val*0.1);
    
    User:inform("trying to get from you: "..tax.."Depot1: "..valDepot[1].."Depot2: "..valDepot[2].."Body: "..valBody.."Bag: "..valBag);
    
    -- try to get it from homedepot:
    if tax<=valDepot[1] then
        TakeMoneyFromDepot(User,tax,depNr[1]);
    elseif tax<=valDepot[2] then    -- if not possible, just take it from the pub-depot:
        TakeMoneyFromDepot(User,tax,depNr[2]);
    elseif tax<=valDepot[1]+valDepot[2] then    -- try both, for god's sake!
        TakeMoneyFromDepot(User,valDepot[1],depNr[1]);
        tax=tax-valDepot[1];
        TakeMoneyFromDepot(User,tax,depNr[2]);
    else    -- last, but not least, get it from wherever you can!
        TakeMoneyFromDepot(User,valDepot[1],depNr[1]);
        tax=tax-valDepot[1];
        User:inform("after d1: "..tax)
        TakeMoneyFromDepot(User,valDepot[2],depNr[2]);
        tax=tax-valDepot[2];
        User:inform("after d2: "..tax)
        TakeMoneyFromChar(User,tax);
        User:inform("User has left: "..CharCoinsToMoney(User))
    end

    ScriptVars:set("MTest",43);
    there,hans=ScriptVars:find("MTest");
    if there then
        User:inform("TESTVAR: "..hans);
    end
    ScriptVars:save();
end
