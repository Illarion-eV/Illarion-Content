-- General Testscript

-- UPDATE common SET com_script='item.id_2_flour' WHERE com_itemid IN (2);

require "bla.blubb"

module("item.id_2_flour", package.seeall)

globtest1 = 7;
_G.globtest2 = 9;

function UseItem( User, SourceItem, TargetItem, counter, Param, ltstate )
    
    User:inform("globtest1: "..item.id_2_flour.globtest1);
    User:inform("globtest2: ".._G.globtest2);

    bla.blubb.Success(User);
end