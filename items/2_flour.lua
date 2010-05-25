-- General Testscript

-- UPDATE common SET com_script='items.2_flour' WHERE com_itemid IN (2);

require "bla.blubb"

module("items.2_flour", package.seeall())

function UseItem( User, SourceItem, TargetItem, counter, Param, ltstate )
    User:inform("package.cpath: "..package.cpath);
    User:inform("package.path: "..package.path);
    bla.blubb.Success(User);
end