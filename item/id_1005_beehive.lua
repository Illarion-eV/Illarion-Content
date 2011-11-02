-- Honig Sammeln mit neuem Collecting-System
-- Blay09

-- UPDATE common SET com_script='item.id_1005_beehive' WHERE com_itemid=1005;

require("base.common")
require("content.gathering")

module("item.id_1005_beehive", package.seeall)

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
        User:talkLanguage(Character.say, Player.german, "#me unterbricht "..gText.." Arbeit.");
        User:talkLanguage(Character.say, Player.english,"#me interrupts "..eText.." work.");
        return
    end
	
	if not base.common.CheckItem(User, SourceItem) then -- Sicherheitscheck
        return
    end
	
	if base.common.Encumbrence(User) then -- Behinderung
        base.common.InformNLS(User,
        "Deine Rüstung behindert dich beim Honigsammeln.",
        "Your armor disturbs you while collecting honeycombs.");
        return
    end
	
	if (ltstate == Action.none) then -- Untätig: Starte Honig Sammeln!
        honeygathering.SavedWorkTime[User.id] = honeygathering:GenWorkTime(User,nil);
		debug("worktime: " .. honeygathering.SavedWorkTime[User.id]);
		User:startAction(honeygathering.SavedWorkTime[User.id], 0, 0, 0, 0);
        User:talkLanguage(Character.say, Player.german, "#me beginnt nach Honig zu suchen.");
        User:talkLanguage(Character.say, Player.english, "#me starts to search for honey.");
        return
    end
	debug("waiting done");
	
	if not honeygathering:FindRandomItem(User, SourceItem) then
		return
	end
	
	-- Spieler sammelt bereits Honig
	if(math.random(10) <= 6) then -- Skill wird nur noch bei GenWorkTime beachtet, Chance beträgt 60%
		local notcreated = User:createItem(2529, 1, 333, 0);
		if(notcreated > 0) then
			world:createItemFromId(2529, notcreated, User.pos, true, 333, 0);
			base.common.InformNLS(User, "Du kannst nichts mehr halten!", "You can't carry anymore!");
			return false
		end
	end
	User:learn( honeygathering.LeadSkill, honeygathering.LeadSkillGroup, honeygathering.SavedWorkTime[User.id], 100, User:increaseAttrib(honeygathering.LeadAttribute,0) );
	honeygathering.SavedWorkTime[User.id] = honeygathering:GenWorkTime(User,nil);
	User:startAction(honeygathering.SavedWorkTime[User.id], 0, 0, 0, 0);
end
