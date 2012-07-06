-- General Testscript
require("handler.sendmessage")
-- UPDATE common SET com_script='item.id_2_flour' WHERE com_itemid IN (2);

module("item.id_2_flour", package.seeall)

function UseItem( User, SourceItem, TargetItem, counter, Param, ltstate )

    if User.id==42 then
        UseItemMartin( User, SourceItem, TargetItem, counter, Param, ltstate )
        return
    end
    
    if User.id == 552556288 then
        local callback = function(dialog)
            User:inform("closed");
        end
        
        local dialog = MessageDialog("This is the title!", "This \n is \n the \n text!", callback);
        User:requestMessageDialog(dialog);
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
    ScriptVars:set("MTest",43);
    there,hans=ScriptVars:find("MTest");
    if there then
        User:inform("TESTVAR: "..hans);
    end
    ScriptVars:save();
end