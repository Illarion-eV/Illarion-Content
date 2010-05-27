require("base.books")
require("druids.content.druids")

module("items.books.109_black_book", package.seeall)

-- UPDATE common SET com_script='items.books.109_black_book' WHERE com_itemid = 109;

function UseItem(User, SourceItem, TargetItem, Counter, Param)
    if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then
        world:erase(SourceItem,1);
    else
        if base.books.InitBook() then
            druids.content.druids.loadBook(0);
        end
    end
    base.books.SendBookPage(User,SourceItem.data,Counter);
end  -- function


function LookAtItem( User, Item )
    if base.books.InitTitle() then
        druids.content.druids.loadTitle(0);
    end
    base.books.GetBookItemInform(User,Item);
end
