-- Angeln mit neuem Collecting-System
-- Blay09

-- UPDATE common SET com_script='item.id_72_fishingrod' WHERE com_itemid=72;

require("item.general.wood")
require("base.common")
require("content.gathering")

module("item.id_72_fishingrod", package.seeall, package.seeall(item.general.wood))


function UseItem(User, SourceItem, TargetItem, Counter, Param, ltstate)
	content.gathering.InitGathering();
	
	TargetPos = base.common.GetFrontPosition(User);
	
    base.common.ResetInterruption(User, ltstate);
	if (ltstate == Action.abort) then -- Arbeit unterbrochen
        if (User:increaseAttrib("sex", 0) == 0) then
            gText = "seine";
            eText = "his";
        else
            gText = "ihre";
            eText = "her";
        end
        User:talkLanguage(Character.say, Player.german, "#me unterbricht "..gText.." Arbeit.");
        User:talkLanguage(Character.say, Player.english,"#me interrupts "..eText.." work.");
        return
    end

    if not base.common.CheckItem(User, SourceItem) then -- Sicherheitscheck
        return
    end
	
	-- Angeln unterirdisch nicht möglich
    if (TargetPos.z < 0) then
    	base.common.InformNLS(User, "In unterirdischen Wasserlöchern wird das Angeln kaum erfolgreich sein.", "Fishing in underground waterholes wouldn't be successful.");
		return
    end
	
	if base.common.Encumbrence(User) then -- Behinderung
        base.common.InformNLS(User,
        "Deine Rüstung behindert dich beim Fischen.",
        "Your armour disturbes you while fishing.");
        return
    end
	
	if (SourceItem:getType() ~= 4) then -- Angel in der Hand?
        base.common.InformNLS(User,
        "Du solltest die Angel in der Hand haben, wenn du angeln willst.",
        "You should have the fishing rod in your hand if you want to catch any fish.");
        return
    end
	
    if (world:getField(TargetPos):tile() ~= 6) then
        base.common.InformNLS(User,
        "Die Chance im Wasser einen Fisch zu fangen ist bedeutend höher als auf dem Land.",
        "The chance to catch a fish is much higher in the water than on the land.");
        return
    end
	
	if not base.common.IsLookingAt(User, TargetPos) then -- Drehen wenn nötig
        base.common.TurnTo(User, TargetPos);
    end
	
	local fishing = content.gathering.fishing;
	
	if (ltstate == Action.none) then -- Untätig: Starte Angeln!
        fishing.SavedWorkTime[User.id] = fishing:GenWorkTime(User, SourceItem);
		User:startAction(fishing.SavedWorkTime[User.id], 0, 0, 0, 0);
        User:talkLanguage(Character.say, Player.german, "#me beginnt zu fischen.");
        User:talkLanguage(Character.say, Player.english, "#me starts fishing.");
        return
    end
	
	if not fishing:FindRandomItem(User) then
		return
	end
	
	-- Spieler fischt bereits
	User:learn( fishing.LeadSkill, fishing.LeadSkillGroup, fishing.SavedWorkTime[User.id], 100, User:increaseAttrib(fishing.LeadAttribute,0) );
	
	User:inform(fishing.SavedWorkTime[User.id]);
	
	fishing.SavedWorkTime[User.id] = fishing:GenWorkTime(User, SourceItem);
	local chance = math.random(1,10)
	if(chance <= 3) then -- Skill wird nur noch bei GenWorkTime beachtet, Chance beträgt 30% für Lachs
		local notcreated = User:createItem(73, 1, 333, 0);
		if(notcreated > 0) then
			world:createItemFromId(73, notcreated, User.pos, true, 333, 0);
			base.common.InformNLS(User, "Du kannst nichts mehr halten!", "You can't carry anymore!");
			return false
		end
	elseif(chance <= 9) then -- Skill wird nur noch bei GenWorkTime beachtet, Chance beträgt 60% für Forelle
		local notcreated = User:createItem(355, 1, 333, 0);
		if(notcreated > 0) then
			world:createItemFromId(355, notcreated, User.pos, true, 333, 0);
			base.common.InformNLS(User, "Du kannst nichts mehr halten!", "You can't carry anymore!");
			return false
		end
	end
	
	-- GFX + Sound
	world:gfx(11,TargetPos);
    world:makeSound(9,TargetPos);
	
	if base.common.ToolBreaks(User, SourceItem, true) then -- Angel beschädigen
        User:talkLanguage(Character.say, Player.german, "#me lässt die Angel aus den Händen rutschen und die Angel sinkt auf den Grund.");
        User:talkLanguage(Character.say, Player.english, "#me lets the fishing rod slip out of the hands and it sinks to the ground.");
        return
    end
    User:startAction(fishing.SavedWorkTime[User.id], 0, 0, 0, 0);
end

function LookAtItem( User, Item )
    world:itemInform( User, Item, base.lookat.GetItemDescription( User, Item, 2, false, false ));
end
