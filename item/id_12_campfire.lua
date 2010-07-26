-- UPDATE common SET com_script='item.id_12_campfire' where com_itemid=12;

require("base.common")
require("content.gathering")

module("item.id_12_campfire", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
    
	content.gathering.InitGathering();
	
    if ( ltstate == Action.abort ) then
        if (User:increaseAttrib("sex",0) == 0) then
            gText = "seine";
            eText = "his";
        else
            gText = "ihre";
            eText = "her";
        end
        User:talkLanguage(CCharacter.say, CPlayer.german, "#me unterbricht "..gText.." Arbeit.");
        User:talkLanguage(CCharacter.say, CPlayer.english,"#me interrupts "..eText.." work.");
        return
    end
    
    if not base.common.CheckItem( User, SourceItem, 12 ) then
        return
    end
    
    if base.common.Encumbrence(User) then -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert beim Asche herstellen.",
        "Your armor disturbes you while producing potash." );
        return
    end
    
    if not base.common.IsLookingAt( User, SourceItem.pos ) then
        base.common.TurnTo( User, SourceItem.pos );
    end

    if not base.common.FitForWork( User ) then
        return
    end
    
    if ((User:countItemAt("all",2560) == 0) and (User:countItemAt("all",543) == 0) and
       (User:countItemAt("all",544) == 0) and (User:countItemAt("all",3) == 0)) then
        if (ltstate ~= Action.success) then
            base.common.InformNLS(User,
            "Du benötigst Holz um daraus Asche herzustellen.",
            "You need wood to produce potash.");
        end
        return
    end
    
    if ( ltstate == Action.none ) then
        User:startAction(content.gathering.potashproducing:GenWorkTime(User), 0, 0, 7, 15);
        User:talkLanguage(CCharacter.say, CPlayer.german, "#me beginnt Asche herzustellen.");
        User:talkLanguage(CCharacter.say, CPlayer.english, "#me starts to produce potash.");
        return
    end
    
    if not content.gathering.potashproducing:FindRandomItem(User) then
		return
	end
    
    if (User:countItemAt("all",2560)>0) then
        User:eraseItem(2560,1);
        notCreated = User:createItem(314,3,333,0);
        if (notCreated > 0) then
            world:createItemFromId(314, notcreated, User.pos, true, 333 ,0);
            base.common.InformNLS(User,
            "Du kannst nichts mehr halten.",
            "You can't carry any more.");
        else
            User:startAction(content.gathering.potashproducing:GenWorkTime(User), 0, 0, 7, 15);
        end
    elseif (User:countItemAt("all",543)>0) then
        User:eraseItem(543,1);
        notCreated = User:createItem(314,3,333,0);
        if (notCreated > 0) then
            world:createItemFromId(314, notcreated, User.pos, true, 333 ,0);
            base.common.InformNLS(User,
            "Du kannst nichts mehr halten.",
            "You can't carry any more.");
        else
            User:startAction(content.gathering.potashproducing:GenWorkTime(User), 0, 0, 7, 15);
        end
    elseif (User:countItemAt("all",544)>0) then
        User:eraseItem(544,1);
        notCreated = User:createItem(314,3,333,0);
        if (notCreated > 0) then
            world:createItemFromId(314, notcreated, User.pos, true, 333 ,0);
            base.common.InformNLS(User,
            "Du kannst nichts mehr halten.",
            "You can't carry any more.");
        else
            User:startAction(content.gathering.potashproducing:GenWorkTime(User), 0, 0, 7, 15);
        end
    elseif (User:countItemAt("all",3)>0) then
        User:eraseItem(3,1);
        notCreated = User:createItem(314,3,333,0);
        if (notCreated > 0) then
            world:createItemFromId(314, notCreated, User.pos, true, 333 ,0);
            base.common.InformNLS(User,
            "Du kannst nichts mehr halten.",
            "You can't carry any more.");
        else
            User:startAction(content.gathering.potashproducing:GenWorkTime(User), 0, 0, 7, 15);
        end
    end
    base.common.GetHungry( User, 200 );
end -- function

function CharacterOnField(User)
    base.common.InformNLS( User,
      "Du fühlst Schmerzen vom brennenden Feuer.",
      "You can feel the pain from the burning fire." );
    if not (User:getQuestProgress(2) > 0) and not (User:increaseAttrib("hitpoints",0) < 2000) then
		User:increaseAttrib("hitpoints",-math.random(200,400));
	end
end