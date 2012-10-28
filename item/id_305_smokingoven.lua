-- RÄUCHEROFEN

-- Roher Schinken(307) zu Schinken(306)
-- oder
-- Forelle (73) zu Räucherfisch (455)
-- oder
-- Lachs (355) zu Räucherfisch (455)
--
-- Arbeitscyclus: 2s - 5s

-- UPDATE common SET com_script='item.id_305_smokingoven' WHERE com_itemid IN (305,304);

require("base.common")

module("item.id_305_smokingoven", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
    base.common.ResetInterruption( User, ltstate )
    if ( ltstate == Action.abort ) then
        if (User:increaseAttrib("sex",0) == 0) then
            gText = "seine";
            eText = "his";
        else
            gText = "ihre";
            eText = "her";
        end
        User:talkLanguage(Character.say, Player.german, "#me unterbricht "..gText.." Arbeit.");
        User:talkLanguage(Character.say, Player.english,"#me interrupts "..eText.." work.");
        if (SourceItem.id ~= 304) then
            world:swap(SourceItem,304,0);
        end
        return
    end
    
    if not base.common.CheckItem( User, SourceItem, {305,304} ) then
        if (SourceItem.id ~= 304) then
            world:swap(SourceItem,304,0);
        end
        return
    end
    
    if base.common.Encumbrence(User) then -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert dich beim räuchern",
        "Your armor disturbs you roasting ham or fish" );
        if (SourceItem.id ~= 304) then
            world:swap(SourceItem,304,0);
        end
        return
    end
    
    if not base.common.IsLookingAt( User, SourceItem.pos ) then
        base.common.TurnTo( User, SourceItem.pos );
    end
    
    if not base.common.FitForWork( User ) then
        if (SourceItem.id ~= 304) then
            world:swap(SourceItem,304,0);
        end
        return
    end
    
    if ( (User:countItemAt("belt",307) < 1)  and (User:countItemAt("belt",355) < 1) and (User:countItemAt("belt",73) < 1) ) then
        if (ltstate ~= Action.success) then
            base.common.InformNLS( User, 
            "Du benötigst rohen Schinken oder rohen Fisch um diesen hier zu räuchern.", 
            "You need raw ham or raw fish to roast it here." );
        end
        if (SourceItem.id ~= 304) then
            world:swap(SourceItem,304,0);
        end
        return
    end
    
    if ( ltstate == Action.none ) then
        User:startAction( GenWorkTime(User), 0, 0, 0, 0);
        User:talkLanguage( Character.say, Player.german, "#me beginnt zu räuchern.");
        User:talkLanguage( Character.say, Player.english, "#me starts to roast.");
        if (SourceItem.id ~= 305) then
            world:swap(SourceItem,305,0);
        end
        return
    end
    
    if base.common.IsInterrupted( User ) then
        base.common.InformNLS(User,
        "Du verbrennst dir die Finger an dem heissen Ofen.",
        "You burn your fingers on the hot oven.");
        if (SourceItem.id ~= 304) then
            world:swap(SourceItem,304,0);
        end
        return
    end
    
    if (User:countItemAt("all",307) > 0) then
        User:eraseItem( 307, 1 );
        local notcreated = User:createItem(306, 1, 333 ,0 );
        if (notcreated > 0) then
            world:createItemFromId( 306, 1, User.pos, true, 333 ,0);
            base.common.InformNLS(User,
            "Du kannst nichts mehr halten.",
            "You can't carry any more.");
            if (SourceItem.id ~= 304) then
                world:swap(SourceItem,304,0);
            end
        else
            User:startAction( GenWorkTime(User), 0, 0, 0, 0 );
        end
    elseif (User:countItemAt("all",355) > 0) then
        User:eraseItem( 355, 1 );
        local notcreated = User:createItem(455, 1, 333 ,0 );
        if (notcreated > 0) then
            world:createItemFromId( 455, 1, User.pos, true, 333 ,0);
            base.common.InformNLS(User,
            "Du kannst nichts mehr halten.",
            "You can't carry any more.");
            if (SourceItem.id ~= 304) then
                world:swap(SourceItem,304,0);
            end
        else
            User:startAction( GenWorkTime(User), 0, 0, 0, 0 );
        end
    elseif (User:countItemAt("all",73) > 0) then
        User:eraseItem( 73, 1 );
        local notcreated = User:createItem(455, 1, 333 ,0 );
        if (notcreated > 0) then
            world:createItemFromId( 455, 1, User.pos, true, 333 ,0);
            base.common.InformNLS(User,
            "Du kannst nichts mehr halten.",
            "You can't carry any more.");
            if (SourceItem.id ~= 304) then
                world:swap(SourceItem,304,0);
            end
        else
	    User:startAction( GenWorkTime(User), 0, 0, 0, 0 );
	end
    end

    base.common.GetHungry( User, 100 );
    --User:learn( 2, "baking", 2, 10 );
	--Replace with new learn function, see learn.lua 
    
end -- function

function GenWorkTime(User)
    local Attrib = User:increaseAttrib("dexterity",0); -- Geschicklichkeit: 0 - 20
    local Skill  = User:getSkill(Character.cooking);     -- Backen & Kochen: 0 - 100
    
    return math.floor(-0.3 * (Attrib + Skill) + 50);
end
