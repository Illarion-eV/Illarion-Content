-- ID 29
-- Effects for parish of Nargun

require("base.common")
module("lte.parish_nargun", package.seeall)

cycleCounter = {};
PN_FriendlyRaces = {18,24,37,38};
PN_Waypoints = {position(-80,-207,0), position(-222,-196,0), position(-200,-270,0), position(-384,-206,0)};

function addEffect(Effect, Char)
	
	local effectType = PN_GetEffectType(Effect);
	
	if effectType >= 1 and effectType <= 4 then
		Effect:addValue("saveRace", Char:getRace() );
		Char:setAttrib("racetyp", PN_FriendlyRaces[math.random(1,table.getn(PN_FriendlyRaces))]);
		world:gfx(31,Char.pos);
		base.common.InformNLS(Char,
			"Du fühlst dich auf einmal so seltsam distanziert von deinem Körper.",
			"You suddenly feel strangely dissociated from your body.");
		cycleCounter[Char.id] = 40;
	end
end

function callEffect(Effect, Char)
	local effectType = PN_GetEffectType(Effect);
	Effect.nextCalled = 10;
	if effectType >= 1 and effectType <= 4 then
		return PN_LeadToPoint(Char, effectType);
	end
	return false;
end

function removeEffect(Effect, Char)
	local effectType = PN_GetEffectType(Effect);
	if effectType >= 1 and effectType <= 4 then
		local foundSaveRace, saveRace = Effect:findValue("saveRace");
		if not foundSaveRace then
			saveRace = 0;
		end
		Char:setAttrib("racetyp", saveRace);
		world:gfx(31,Char.pos);
		local gText, eText = "", "";
		if effectType == 1 then
			gText = "Irgendwie bekommst du Lust auf ein paar saftige Früchte.";
			eText = "Somehow you have appetite for some juicy fruits.";
		elseif effectType == 2 then
			gText = "Plötzlich steigt fürchterliche Wut in dir hoch und du willst auf ein Tier einschlagen, ihm das Fleisch herausreißen.";
			eText = "Suddenly you feel tremendous anger arising and you want to smash on an animal, rip out its meat."
		elseif effectType == 3 then
			gText = "Deine Kehle schnürt sich zu, eine einzelne Träne rinnt dir über die Wange, als du voller Mitleid an die armen Tiere denkst.";
			eText = "With a lump in your throat, a single tear runs down your cheek as you think of those pity animals.";
		elseif effectType == 4 then
			gText = "Ein wohliges Gefühl überkommt dich, als ob du hier hingehörst.";
			eText = "A cosy feeling comes over you, as if you belong here.";
		end
		base.common.InformNLS(Char,gText,eText);
	end
end

function loadEffect(Effect, Char)
	local effectType = PN_GetEffectType(Effect);
	if effectType >= 1 and effectType <= 4 then
		Char.effects:removeEffect(29);
	end
end

function PN_GetEffectType(Effect)
	
	local foundEffectType, effectType = Effect:findValue("effectType");
	if not foundEffectType then
		effectType = 0
	end
	return effectType;
end

function PN_LeadToPoint( Char, effectType )
    if (cycleCounter[Char.id]==nil) then
        cycleCounter[Char.id]=40;
    end
	
	local thepos = PN_Waypoints[effectType];
	local distance=Char:distanceMetricToPosition(thepos);
	
    if (distance <= 5) or (cycleCounter[Char.id]>=40) then
	    if (Char.pos.z>=0 and Char.pos.z<=3) then
       	    
       	    local dir = base.common.GetDirection( Char.pos, thepos );
       	    local dirText;

       	    if (dir == 0) then dirText = base.common.GetNLS( Char, "NORDEN", "NORTH" )
       	    elseif (dir == 1) then dirText = base.common.GetNLS( Char, "NORDOSTEN", "NORTHEAST" )
       	    elseif (dir == 2) then dirText = base.common.GetNLS( Char, "OSTEN", "EAST" )
       	    elseif (dir == 3) then dirText = base.common.GetNLS( Char, "SÜDOSTEN", "SOUTHEAST" )
       	    elseif (dir == 4) then dirText = base.common.GetNLS( Char, "SÜDEN", "SOUTH" )
       	    elseif (dir == 5) then dirText = base.common.GetNLS( Char, "SÜDWESTEN", "SOUTHWEST" )
       	    elseif (dir == 6) then dirText = base.common.GetNLS( Char, "WESTEN", "WEST" )
       	    elseif (dir == 7) then dirText = base.common.GetNLS( Char, "NORDWESTEN", "NORTHWEST" )
       	    else return true
       	    end;

		    if ( distance <= 5 ) then
				base.common.InformNLS(Char,
					"Genau hier solltest du hin. Du fühlst wie eine Last von dir genommen wird.",
					"This is where you was to go. You feel a burden is taken off you.");
					return false;
			elseif ( distance <= 30 ) then
			    base.common.InformNLS( Char,
			    "Dein Ziel ist ganz in der Nähe. Gehe weiter nach "..dirText,
				"You are close to your destination. Keep going "..dirText);
                cycleCounter[Char.id]=30;
		    else
			    base.common.InformNLS( Char,
				"Eine seltsame Macht zieht dich nach "..dirText,
				"A strange power leads you "..dirText);
				cycleCounter[Char.id]=20;
		    end;
	    else
	     	base.common.InformNLS( Char,
				"Irgendetwas sagt dir, dass es eine gute Idee wäre wieder zur Erdoberfläche zu gelangen.",
				"Something tells you it would be a good idea to get back to the surface.");
	  		cycleCounter[Char.id]=1;
	    end
    else
        cycleCounter[Char.id]=cycleCounter[Char.id]+1;
    end
	return true;
end
