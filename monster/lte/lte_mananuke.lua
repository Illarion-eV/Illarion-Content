require("base.common");
module("monster.lte.lte_mananuke", package.seeall);

-- INSERT INTO longtimeeffects VALUES (500, 'satk_mananuke', 'monster.lte.mananuke');

function addEffect(manaNuke, User)
	local magicResistance = User:getSkill(Skill.magicResistance);
	local essence = User:increaseAttrib("essence", 0);
	
	local resistance = math.ceil(magicResistance / 10) + math.ceil(essence / 10);
	
	local steal = 20 - resistance;
	manaNuke:addValue("manaPerCall", steal);
	
    return true;
end

function loadEffect(manaNuke, User)

end

function callEffect(manaNuke, User)
	local foundManaPerCall, ManaPerCall = manaNuke:findValue("manaPerCall");
	if not foundManaPerCall then
		return false;
	end
	
	local foundManaStolen, ManaStolen = manaNuke:findValue("manaStolen");
	if not foundManaStolen then
		ManaStolen = 0;
	end
	manaNuke:addValue("manaStolen", ManaStolen + ManaPerCall);
	
	local ManaPoints = User:increaseAttrib("mana", -ManaPerCall);	
	if(ManaPoints <= 0) then
		doExplosion(manaNuke, User);
		return false;
	end
    return true;
end

function doExplosion(manaNuke, User)
	local foundManaStolen, ManaStolen = manaNuke:findValue("manaStolen");
	if not foundManaStolen then
		return;
	end
	local Range = base.common.Limit(0, 20, math.ceil(ManaStolen / 1000));
	local Damage = math.ceil(ManaStolen / 2);
	
	local minX = base.common.Limit(0, 1024, User.pos.x - Range);
	local maxX = base.common.Limit(0, 1024, User.pos.x + Range);
	local minY = base.common.Limit(0, 1024, User.pos.y - Range);
	local maxY = base.common.Limit(0, 1024, User.pos.y + Range);
	
	base.common.InformNLS(User, "[EXPLODINGNOWDE]", "[EXPLODINGNOWEN]");
	world:makeSound(1, User.pos);
	for x = minX, maxX do
		for y = minY, maxY do
			world:gfx(44, position(x, y, User.pos.z));
			if(world:isCharacterOnField(position(x, y, User.pos.z))) then
				local target = world:getCharacterOnField(position(x, y, User.pos.z));
				target:increaseAttrib("hitpoints", -Damage);
			end
		end
	end
end

function removeEffect(manaNuke, User)

end
