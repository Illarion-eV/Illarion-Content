function giveUniqueItem( User, ItemID, Data, De, En, QuestId, QuestFlag )

    local progress = User:getQuestProgress( QuestId );
    if LuaAnd( progress, QuestFlag ) == 0  then
        local lang=User:getPlayerLanguage();
        if (User:createItem( ItemID, 1, 999, Data ) == 0 ) then
            User:setQuestProgress( QuestId, LuaOr( progress, QuestFlag ) );
            if lang==0 then
                User:inform(De);
            else
                User:inform(En);
            end
        else
            if lang==0 then
                User:inform("Du kannst jedoch nicht mehr tragen.");
            else
                User:inform("But you cannot carry more.");
            end;
        end;
    end;

end
