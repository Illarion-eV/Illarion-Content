-- Getting a snowball from a snow tile

-- UPDATE tiles SET til_script='tile.id_10_snow' WHERE til_id = 10;

module("tile.id_10_snow", package.seeall)

function useTile(User,Position)
    User:talk(Character.say, "#me formt einen Schneeball.", "#me makes a snowball.")
    User:createItem(456,1,333,nil);
end
