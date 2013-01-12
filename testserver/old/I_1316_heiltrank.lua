-- Item ID: 1316
-- Name: healing potion

-- include base.common for additional functions
require("base.common")


-- UserItem --> drink the potion
-- Parameters:
-- -- User        - Charakter who wants to drink the potion
-- -- SourceItem  - The healing potion
-- -- TargetItem  - Item the potion is used with ( should be nothing normaly )
-- -- Param       - ItemID of the Item selected from a possible menu. Useless for this script.
-- -- ltstate     - LongTime State for interrupted scripts
function UseItem(User, SourceItem, ltstate)

    -- check for ltstate == Action.abort
    -- means the script got interrupted before the time needed was up (-> drinking was not finished!)
    if (ltstate == Action.abort) then

        -- Cast forced emotes from the Charakter who uses our potion (german for germans, english for the rest)
        User:talkLanguage(Character.say, Player.german, "#me verschüttet den Trank.");
        User:talkLanguage(Character.say, Player.english, "#me spills the potion.");

        -- remove the potion item
        world:erase(SourceItem,1);

        -- choose by random to create an empty bottle or not.
        -- Chance for a new bottle 19/20
        if( math.random( 20 ) == 1 ) then
            -- Sadly our user does not get a new bottle
            -- So we tell him the bad news in german and english
            base.common.InformNLS( User,
            "Die Flasche zerbricht.",
            "The bottle breaks.");
        else
            -- Our lucky user gets a empty bottle
            -- Lets create 1 bottle with ID 1317, quality 333 and data 0
            User:createItem( 1317, 1, 333,0);
        end

        -- since the user failed to drink the potion we are done now
        return
    end

    -- Lets check if the one who wants to drink the potion fights
    if User.attackmode then
        -- It appears that our user hits someone
        -- So he can't drink something
        -- Lets tell him about that...
        base.common.InformNLS(User,
        "Du kannst nichts trinken während du kämpfst.",
        "You can't drink something while fighting.");

        -- We are done with the script, lets leave. The user fights so he gets no additional health
        return
    end

    -- Now we check if the character is drinking the potion currently or not (since the drinking process needs some time)
    if (ltstate == Action.none) then
        -- Action.none so the character does nothing. Lets open the bottle and drink the potion

        -- Start the action!
        -- 2,0 seconds until the action is done
        -- GFX id 0 is shown while the waiting time ( so no gfx )
        -- every 0 seconds the GFX is shown ( so never )
        -- SFX id 12 is played ( drinking sound )
        -- every 2,5 seconds. So the sound is only played once
        User:startAction(20,0,0,12,25);

        -- lets tell everyone that our User drink a potion by a forced emote
        User:talkLanguage(Character.say, Player.german, "#me beginnt einen Trank zu trinken.");
        User:talkLanguage(Character.say, Player.english, "#me starts to drink a potion.");

        -- And quit the script since we are done now and waiting for the next call
        return
    end

    -- since we are here the character started allready to drink. Now we offer some results

    -- lets delete the potion item
    world:erase(SourceItem,1);

    -- choose by random to create a empty bottle or not.
    -- Chance for a new bottle 19/20
    if( math.random( 20 ) == 1 ) then
        -- Sadly our user does not get a new bottle
        -- So we tell him the bad news in german and english
        base.common.InformNLS( User,
        "Die Flasche zerbricht.",
        "The bottle breaks.");
    else
        -- Our lucky user gets an empty bottle
        -- Lets create 1 bottle with ID 164, quality 333 and data 0
        User:createItem( 1317, 1, 333,0);
    end

    -- now we slowly give the User some healthpoints
    -- 150 Healthpoints, every 2 seconds, 30 times
    -- so we gain 4500 HP in 60 seconds
    User:LTIncreaseHP(150,30,2);

    -- Such a potion fills up the foodpoints as well
    -- Lets give the User 2000 FP
    User:increaseAttrib("foodlevel",2000);

    -- And since we want to slow down the drinking User slightly, lets take some Movepoints
    User.movepoints = User.movepoints - 20;

    -- Now lets see if our user has too much foodpoints
    -- Maybe he becomes sick by it and looses some health
    if (User:increaseAttrib("foodlevel",0) > 60000) then
        -- User has more then 60000 foodpoints
        -- that was one barbecued halfling to much

        -- Lets inform the player that he ate too much
        base.common.InformNLS( User,
        "Du bekommst kaum noch was runter und dir wird schlecht.",
        "You hardly manage to eat something more and get sick!");

        -- And take away some of his health.
        -- 1000 points less health instandly
        User:increaseAttrib("hitpoints",-1000);
    elseif  (User:increaseAttrib("foodlevel",0) > 40000) then
        -- The User has already eaten alot.
        -- Lets tell him that he is stuffed!
        base.common.InformNLS( User,
        "Du bist satt.",
        "You are stuffed.");
    else
        -- Still much space in the stomach. Just say him what the potion does to his body
        base.common.InformNLS( User,
        "Du trinkst die Flasche aus und fühlst wie neue Stärke dich durchströmt.",
        "You drink up the bottle, and you feel the new strength that flows through your body.");
    end
end
