require("base.common");
module("monster.lte.vampirism_desease", package.seeall);

-- INSERT INTO longtimeeffects VALUES (501, 'satk_vampirism_desease', 'monster.lte.vampirism_desease');

function addEffect(VampEffect, User)
    return true;
end

function loadEffect(VampEffect, User)

end

function callEffect(VampEffect, User)
	
	local hourTime = world:getTime("hour");
	if (hourTime < 6) and (hourTime > 20) then
		return true;
	end
	
	if (User.pos.z < 0) then
		return true;
	end
	
	local foundProtection, Protection = VampEffect:findValue("protection");
	if foundProtection then
		Protection = Protection - 1;
		if(Protection > 0) then
			VampEffect:addValue("protection", Protection);
		else
			VampEffect:removeValue("protection");
		end
		return true;
	end
	
	local rand = math.random(1000);
	if (rand == 1) then
		base.common.InformNLS(User,
			"Du verspürst das Verlangen danach, jemanden zu töten...",
			"You feel like killing someone...");
	end
	
	local foundHealthPerCall, HealthPerCall = VampEffect:findValue("healthpercall");
	if not foundHealthPerCall then
		HealthPerCall = 50;
		VampEffect:addValue("healthpercall", HealthPerCall);
	end
	
	local HealthPoints = User:increaseAttrib("hitpoints", -HealthPerCall);	
	if(HealthPoints <= 0) then
		return false;
	end
	
    return true;
end

function removeEffect(VampEffect, User)

end
