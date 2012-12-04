-- Getting a snowball from a snow tile

-- UPDATE tiles SET til_script='tile.id_10_snow' WHERE til_id = 10;

module("tile.id_10_snow", package.seeall)

function useTile(User,Position,counter,param)
    User:talkLanguage(Character.say, Player.german, "#me formt einen Schneeball.");
    User:talkLanguage(Character.say, Player.english,"#me makes a snowball.");
    User:createItem(456,1,333,nil);
end
