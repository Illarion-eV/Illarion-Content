-- Fishing Script für Echsen

-- UPDATE tiles SET til_script='tile.id_6_water' WHERE til_id = 6;

require("base.common")

module("tile.id_6_water", package.seeall)

Interrupt_Messages = { 	add = function (self,gText,eText)
							table.insert(self, {["german"] = gText, ["english"] = eText});
						end,
						getRandom = function (self)
							local msg = math.random(1,table.getn(self));
							return self[msg].german, self[msg].english;
						end
};

Interrupt_Messages:add(	"Ein schwarzer Fleck huscht durch das Wasser. Etwas erschrocken weichst du zurück.",
						"You notice a large black dot in the water, you decide not to disturb it.");
Interrupt_Messages:add(	"Dein Blick verliert sich für kurze Zeit in deinem Spiegelbild und du bist abgelenkt.",
						"You take a while to admire that good-looking person staring at you from your reflection.");
Interrupt_Messages:add(	"Der Boden unter dir rutscht leicht weg, sodass du gerade noch das Gleichgewicht halten kannst.",
						"Some stones slip away from the bank, disturbing all the fish.");

function GenWorkTime(User) -- generate work time
	local Skill  = User:getSkill(Character.fishing);
	local Attrib = User:increaseAttrib( "dexterity", 0 );
	return math.floor( ( ( -0.2 * (Skill+Attrib) + 50) + math.random(0,40) )/2);
end

function useTile(User,Position,counter,param,ltstate)
	if (User:getRace()~=5) then
	    return
	end

	base.common.ResetInterruption( User, ltstate )
    if ( ltstate == Action.abort ) then -- Arbeit unterbrochen
        if (User:increaseAttrib("sex",0) == 0) then
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

    -- Angeln unterirdisch nicht möglich
    if (Position.z < 0) then
    	base.common.InformNLS(User,"In unterirdischen Wasserlöchern wird das Angeln kaum erfolgreich sein.","Fishing in underground waterholes won't be successful.");
	    return
    end

    if not base.common.IsLookingAt( User, TargetPos ) then
        base.common.TurnTo( User, TargetPos );
    end

    if ( ltstate == Action.none ) then -- Arbeit noch nicht begonnen -> Los gehts
        User:startAction( GenWorkTime(User), 0, 0, 0, 0);
        User:talkLanguage( Character.say, Player.german, "#me beginnt zu fischen.");
        User:talkLanguage( Character.say, Player.english, "#me starts fishing.");
        return
    end

    local rand = math.random(350);
    if (rand==1) and BT_createMap( Char ) then
        base.common.InformNLS(User,
        "Statt eines Fisches hast du eine Karte in der Klaue.",
        "Instead of a fish you find a map in your claw.");
        return
    end

     if ( (rand==2) or (rand==3) ) then
         base.common.InformNLS(User,
         "Auf einmal hast du das Gefühl eine Hand würde nach deiner Klaue greifen. Noch während du dich wunderst, teilt sich das Wasser vor dir und eine glitschige Wasserleiche steigt aus den Wellen empor.",
         "Suddenly you have the feeling a hand should grap your claw. While you are wondering what it could be, the water in front of you ripples and a slimy mummy climbs out of the water.");

         world:createMonster(101,TargetPos,20);
         world:gfx(1,TargetPos);
         world:gfx(37,TargetPos);
         world:makeSound(1,TargetPos);
	     return
     end

    if base.common.IsInterrupted( User ) then
		base.common.InformNLS( User, Interrupt_Messages:getRandom() );
		return
    end

    world:gfx(11,TargetPos);
    world:makeSound(9,TargetPos);

    local FishTry=(User:increaseAttrib("perception",0)+(User:increaseAttrib("dexterity",0)/2)+(User:increaseAttrib("agility",0)/4))+RaceBon(User)+10+math.max(1,(User:getSkill("fishing")-10));

    if (FishTry>math.random(0,100)) then
        local FTry=math.random(0,1000);
        -- Forelle
        if (FTry<660) then
            User:createItem(73,1,333,0)
        -- Lachs
        elseif (FTry>=660 and FTry<920) then
            User:createItem(355,1,333,0)
        -- Stiefel
        elseif (FTry>=920 and FTry<940) then
            User:createItem(53,1,100,0)
            base.common.InformNLS(User,"Ein alter, durchlöcherter Lederstiefel findet sich in deiner Klaue.","An old, perforated leather boot is in your claw.");
        -- Ã–lampe
        elseif (FTry>=940 and FTry<990) then
            User:createItem(92,1,333,0);
            base.common.InformNLS(User,"Du ziehst eine glitzernde Öllampe aus dem Wasser. Wo die wohl herkommt...?","You pull a sparkling oil lamp out of the water. Where did that come from?");
        -- Eimer
        elseif (FTry>=990 and FTry<=1000) then
            User:createItem(51,1,333,0)
            base.common.InformNLS(User,"Du ergreifst einen Eimer im Wasser und ziehst ihn heraus. Den hat hier wohl jemand verloren.","You grap a bucket and drag it out of the water. Someone has lost it here.");
        end
	    --User:learn(2,"fishing",2,100);
		--Replace with new learn function, see learn.lua 
	    base.common.GetHungry( User, 100 ); -- Hunger
    else
        --User:learn(2,"fishing",1,100);
		--Replace with new learn function, see learn.lua 
        base.common.GetHungry( User, 100 ); -- Hunger
    end
end
