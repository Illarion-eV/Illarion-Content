-- spell_10_combine_gem.lua / Rune 6
-- Druidensystem
-- Blay09

require("base.common")
require("druid.base.alchemy")

module("druid.spell.spell_10_combine_gem", package.seeall(druid.base.alchemy))

-- INSERT INTO spells VALUES (2^10,3,'druid.spell.spell_10_combine_gem');

function CastMagic(Caster,ltstate)
	base.common.InformNLS(Caster, "Dieser Zauber lässt sich nur auf magische Edelsteine wirken.", "Dieser Zauber lässt sich nur auf magische Edelsteine wirken.");
end

function CastMagicOnCharacter(Caster,TargetCharacter,ltstate)
	base.common.InformNLS(Caster, "Dieser Zauber lässt sich nur auf magische Edelsteine wirken.", "Dieser Zauber lässt sich nur auf magische Edelsteine wirken.");
end

function CastMagicOnField(Caster,Targetpos,ltstate)
	base.common.InformNLS(Caster, "Dieser Zauber lässt sich nur auf magische Edelsteine wirken.", "Dieser Zauber lässt sich nur auf magische Edelsteine wirken.");
end

function CastMagicOnItem(Caster,TargetItem)
	if(Init == nil) then
		GemList = {45, 46, 197, 198, 283, 284, 285};
		DustList = {448, 447, 450, 451, 449, 446, 452};
		Init = true;
	end
	
	local isgem = false;
	local gemidx = 0;
	for i,v in pairs(GemList) do
		if(TargetItem.id == v) then
			isgem = true;
			gemidx = i;
			break
		end
	end
	if (isgem == false) then
		base.common.InformNLS(Caster, "Dieser Zauber lässt sich nur auf magische Edelsteine wirken.", "Dieser Zauber lässt sich nur auf magische Edelsteine wirken.");
		return
	end
	
	if(TargetItem.data < 1 or TargetItem.data > 9) then
		base.common.InformNLS(Caster, "Dieser Zauber lässt sich nur auf magische Edelsteine wirken.", "Dieser Zauber lässt sich nur auf magische Edelsteine wirken.");
		return
	end
	
	if(TargetItem.number ~= 3) then
		base.common.InformNLS(Caster, "Du musst den Zauber auf drei magische Edelsteine verwenden.", "You have to cast this spell with three magical gems.");
		return
	end
	
	if destroyGem(TargetItem.data) then
		world:gfx(5,Caster.pos);
		world:gfx(37,Caster.pos);
		world:makeSound(24,Caster.pos);
		TargetItem.data = TargetItem.data + 1;
		TargetItem.number=TargetItem.number-2;
		world:changeItem(TargetItem);
	else 
		world:gfx(1,Caster.pos);
		world:makeSound(18,Caster.pos);
		base.common.InformNLS(Caster, "Die Edelsteine zerfallen zu Staub. Das hat wohl nicht geklappt...", "The gems break into dust. Seems like it did not work...");
		Caster:createItem(DustList[gemidx], 1, 333, 0);
		world:erase(TargetItem,3);
	end
end

function destroyGem (gemData)
	-- 1 -> 2 =  0% fail
	-- 2 -> 3 =  0% fail
	-- 3 -> 4 =  0% fail
	-- 4 -> 5 = 10% fail
	-- 5 -> 6 = 20% fail
	-- 6 -> 7 = 30% fail
	-- 7 -> 8 = 40% fail
	-- 8 -> 9 = 50% fail
	-- 9 ->10 = 60% fail
	if ( (gemData==4) and (math.random(1,10)<=1) ) then
		return false;
	elseif ( (gemData==5) and (math.random(1,10)<=2) ) then
		return false;
	elseif ( (gemData==6) and (math.random(1,10)<=3) ) then
		return false;
	elseif ( (gemData==7) and (math.random(1,10)<=4) ) then
		return false;
	elseif ( (gemData==8) and (math.random(1,10)<=5) ) then
		return false;
	elseif ( (gemData==9) and (math.random(1,10)<=6) ) then
		return false;
	else
		return true;
	end
end
