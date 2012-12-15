-- UPDATE common SET com_script='item.id_266_bookshelf' WHERE com_itemid IN (266, 267);

require("base.common")

module("item.id_266_bookshelf", package.seeall)

ALCHEMY = 0
CRAFTING = 1
FAIRYTALES = 2

function addBookshelf(pos, books)
    bookshelves = bookshelves or {}
    bookshelves[pos.x] = bookshelves[pos.x] or {}
    bookshelves[pos.x][pos.y] = bookshelves[pos.x][pos.y] or {}
    bookshelves[pos.x][pos.y][pos.z] = books
end

addBookshelf(position(10, 10, 0), {CRAFTING, FAIRYTALES})
addBookshelf(position(7, 7, 0), {CRAFTING})


function LookAtItem(user, item)
    local lookAt = base.lookat.GenerateLookAt(user, item)
    
    if source:getType() == scriptItem.field then 
        local pos = item.pos
        local bookshelf = bookshelves and bookshelves[pos.x] and bookshelves[pos.x][pos.y] and bookshelves[pos.x][pos.y][pos.z]

        if bookshelf then
            local books = #bookshelf

            if books == 0 then
                lookAt.description = base.common.GetNLS(user, "Dieses Regal ist leer.", "This bookshelf is empty.")
            elseif books == 1 then
                lookAt.description = base.common.GetNLS(user, "Hier steht ein einzelnes Buch.", "There is one single book.")
            else
                lookAt.description = base.common.GetNLS(user, "Hier stehen " .. books .. " Bücher.", "There are " .. books .. " books here.")
            end
        else
            lookAt.description = base.common.GetNLS(user, "Dieses Regal ist leer.", "This bookshelf is empty.")
        end
    end

    world:itemInform(user, item, lookAt)
end

function UseItem(user, item, target, counter, param, ltstate)

end
