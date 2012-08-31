-- General Testscript
require("handler.sendmessage")
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

	User:inform("Testing possessions")
	bag=User:getBackPack();
	--depot=User:getDepot(101); -- 101-104
	User:inform("2")
	val=0;
	if bag then
        val=val+bagValue(User,bag);
	end

    ScriptVars:set("MTest",43);
    there,hans=ScriptVars:find("MTest");
    if there then
        User:inform("TESTVAR: "..hans);
    end
    ScriptVars:save();
end

function bagValue(chr,theBag)
    chr:inform("now counting bag:")
	local cnt = 0;
	local value = 0;
	nrSlots=theBag:getSlotCount()-1;
	--while theBag:viewItemNr(cnt) do
	for cnt=0,nrSlots do
	    local fnd, TestItem, newBag = theBag:viewItemNr(cnt);
        if fnd then
            mult=TestItem.number;
            myIt=world:getItemStats(TestItem)
            value=value+(myIt.Worth)*mult;
            chr:inform("Value: "..value);
            if newBag~=nil then
                value=value+bagValue(newBag);
            end
        end

		--cnt = cnt+1;
	end
    return value
end