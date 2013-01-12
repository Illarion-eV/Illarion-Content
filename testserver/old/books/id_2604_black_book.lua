require("base.books")
require("content.books.about_humans")
require("content.books.cultureorcs")
require("content.books.founding_silverbrand")

module("item.book.id_2604_black_book", package.seeall)

-- UPDATE common SET com_script='item.book.id_2604_black_book' WHERE com_itemid = 2604;

function UseItem(User, SourceItem)
    if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then
        world:erase(SourceItem,1);
    else
        if base.books.InitBook() then
            content.books.cultureorcs.loadBook(0);
            content.books.founding_silverbrand.loadBook(1);
            content.books.about_humans.loadBook(2);
        end
    end
    base.books.SendBookPage(User,SourceItem.data,Counter);
end  -- function


function LookAtItem( User, Item )
    if base.books.InitTitle() then
        content.books.cultureorcs.loadTitle(0);
        content.books.founding_silverbrand.loadTitle(1);
        content.books.about_humans.loadTitle(2);
    end
    base.books.GetBookItemInform(User,Item);
end
