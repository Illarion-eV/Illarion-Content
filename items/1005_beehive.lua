-- Honig Sammeln mit neuem Collecting-System
-- Blay09

-- UPDATE common SET com_script='items.1005_beehive' WHERE com_itemid=1005;

require("base.common")
require("content.gathering")

module("items.1005_beehive", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	content.gathering.InitGathering();
	local honeygathering = content.gathering.honeygathering;
	
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
	
	if base.common.Encumbrence(User) then -- Behinderung
        base.common.InformNLS(User,
        "Deine R�stung behindert dich beim Honig Sammeln.",
        "Your armor disturbs you while collecting honeycombs.");
        return
    end
	
	if (ltstate == Action.none) then -- Unt�tig: Starte Honig Sammeln!
        User:startAction(honeygathering:GenWorkTime(User, nil), 0, 0, 0, 0);
        User:talkLanguage(CCharacter.say, CPlayer.german, "#me beginnt nach Honig zu suchen.");
        User:talkLanguage(CCharacter.say, CPlayer.english, "#me starts to search for honey.");
        return
    end
	
	if not honeygathering:FindRandomItem(User, SourceItem) then
		return
	end
	
	-- Spieler sammelt bereits Honig
	if(math.random(10) <= 6) then -- Skill wird nur noch bei GenWorkTime beachtet, Chance betr�gt 60%
		local notcreated = User:createItem(2529, 1, 333, 0);
		if(notcreated > 0) then
			world:createItemFromId(2529, notcreated, User.pos, true, 333, 0);
			base.common.InformNLS(User, "Du kannst nichts mehr halten!", "You can't carry anymore!");
			return false
		end
		User:learn(2, "peasantry", 2, 100);
	else
		User:learn(2, "peasantry", 1, 100);
	end
	
	User:startAction(honeygathering:GenWorkTime(User, SourceItem), 0, 0, 0, 0);
end
