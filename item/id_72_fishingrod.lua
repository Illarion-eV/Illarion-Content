-- Angeln mit neuem Collecting-System
-- Blay09

-- UPDATE common SET com_script='item.id_72_fishingrod' WHERE com_itemid=72;

require("item.general.wood")
require("base.common")
require("content.gathering")

module("item.id_72_fishingrod", package.seeall, package.seeall(item.general.wood))


function UseItemWithField(User, SourceItem, TargetPos, Counter, Param, ltstate)
	content.gathering.InitGathering();
	
    base.common.ResetInterruption(User, ltstate);
	if (ltstate == Action.abort) then -- Arbeit unterbrochen
        if (User:increaseAttrib("sex", 0) == 0) then
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

    if not base.common.CheckItem(User, SourceItem) then -- Sicherheitscheck
        return
    end
	
	-- Angeln unterirdisch nicht m�glich
    if (TargetPos.z < 0) then
    	base.common.InformNLS(User, "In unterirdischen Wasserl�chern wird das Angeln kaum erfolgreich sein.", "Fishing in underground waterholes wouldn't be successful.");
		return
    end
	
	if base.common.Encumbrence(User) then -- Behinderung
        base.common.InformNLS(User,
        "Deine R�stung behindert dich beim Fischen.",
        "Your armor disturbes you while fishing.");
        return
    end
	
	if (SourceItem:getType() ~= 4) then -- Angel in der Hand?
        base.common.InformNLS(User,
        "Du solltest die Angel in der Hand haben, wenn du angeln willst.",
        "You should have the fishing rod in your hand if you want to catch any fish.");
        return
    end
	
	if not base.common.IsLookingAt(User, TargetPos) then -- Drehen wenn n�tig
        base.common.TurnTo(User, TargetPos);
    end
	
	if (ltstate == Action.none) then -- Unt�tig: Starte Angeln!
        User:startAction(content.gathering.fishing:GenWorkTime(User, SourceItem), 0, 0, 0, 0);
        User:talkLanguage(CCharacter.say, CPlayer.german, "#me beginnt zu fischen.");
        User:talkLanguage(CCharacter.say, CPlayer.english, "#me starts fishing.");
        return
    end
	
	if not content.gathering.fishing:FindRandomItem(User) then
		return
	end
	
	-- Spieler fischt bereits
	local chance = math.random(10)
	if(chance <= 3) then -- Skill wird nur noch bei GenWorkTime beachtet, Chance betr�gt 30% f�r Lachs
		local notcreated = User:createItem(73, 1, 333, 0);
		if(notcreated > 0) then
			world:createItemFromId(73, notcreated, User.pos, true, 333, 0);
			base.common.InformNLS(User, "Du kannst nichts mehr halten!", "You can't carry anymore!");
			return false
		end
		User:learn(2, "fishing", 2, 100);
	elseif(chance <= 8) then -- Skill wird nur noch bei GenWorkTime beachtet, Chance betr�gt 60% f�r Forelle
		local notcreated = User:createItem(355, 1, 333, 0);
		if(notcreated > 0) then
			world:createItemFromId(355, notcreated, User.pos, true, 333, 0);
			base.common.InformNLS(User, "Du kannst nichts mehr halten!", "You can't carry anymore!");
			return false
		end
		User:learn(2, "fishing", 2, 100);
	else
		User:learn(2, "fishing", 1, 100);
	end
	
	-- GFX + Sound
	world:gfx(11,TargetPos);
    world:makeSound(9,TargetPos);
	
	if base.common.ToolBreaks(User, SourceItem, true) then -- Angel besch�digen
        User:talkLanguage(CCharacter.say, CPlayer.german, "#me l�sst die Angel aus den H�nden rutschen und die Angel sinkt auf den Grund.");
        User:talkLanguage(CCharacter.say, CPlayer.english, "#me lets the fishing rod slip out of the hands and it sinks to the ground.");
        return
    end
	
    User:startAction(content.gathering.fishing:GenWorkTime(User, SourceItem), 0, 0, 0, 0);

end

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
    if ((TargetItem.id==0) or (TargetItem==nil)) then
        UseItemWithField(User,SourceItem,base.common.GetFrontPosition(User),counter,param, ltstate);
    else
        UseItemWithField(User,SourceItem,TargetItem.pos,counter,param, ltstate);
    end
end

function LookAtItem( User, Item )
    world:itemInform( User, Item, base.lookat.GetItemDescription( User, Item, 2, false, false ));
end