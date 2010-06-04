-- General Testscript

-- UPDATE common SET com_script='item.id_2_flour' WHERE com_itemid IN (2);

require "bla.blubb"

module("item.id_2_flour", package.seeall)

globtest1 = 7;

function UseItem( User, SourceItem, TargetItem, counter, Param, ltstate )
    globtest2 = 9;
    User:inform("globtest1a: "..item.id_2_flour.globtest1);
    User:inform("globtest2a: "..item.id_2_flour.globtest2);
    User:inform("globtest1b: ".._G.globtest1);
    User:inform("globtest2b: ".._G.globtest2);
    bla.blubb.Success(User);
end