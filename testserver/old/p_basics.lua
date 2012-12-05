-- base functions for priest magic
--[[
QuestProgress: 18
	0 = none.
	Followers use QPG<100
	Priests use QPG>100
]]

require("base.common")
dofile("p_constants.lua");

--[[
@param string
@return string/nil
]]
function P_GetConversionSkill(text)
	local ret = nil;
	text = string.lower(text);
	for _,this in PRAYER_CONVERSION do
		if string.find(text,this.gText) or string.find(text,this.eText) then
			ret = this.skill;
			break;
		end
	end
	return ret;
end

--[[
@param charStruct
@param boolean  if a helping inform shall be shown
@return boolean
]]
function P_CheckAltarConversion(Char,Info)
	local god = P_GetDevotion(Char,false,true);
	if god then
		if Char:isInRangeToPosition(ALTARS[god],2) then
			return true;
		elseif Info then
			base.common.InformNLS(Char,
				"Für dieses Gebet solltest du den Altar deines Gottes aufsuchen.",
				"For this prayer you should seek the altar of your god.");
		end
	end
	return false;
end

--[[
@param charStruct
@param boolean  if follower devotion shall be checked
@param boolean  if priest devotion shall be checked
@return int/nil  the god constant if the char is properly devoted, else nil
]]
function P_GetDevotion(Char,followers,priests)
	local god = Char:getQuestProgress(18);
	if god==0 then
		return nil;
	end
	if not followers and god<100 then
		return nil;
	end
	if priests and god>100 then
		god = god-100;
	end
	for _,cur in GOD_LIST do
		if cur==god then
			return god;
		end
	end
	return nil;
end

--[[
@param charStruct
@param int
@return boolean
]]
function P_CheckPrayerFollower(Char,God)
	local text = string.lower(Char.lastSpokenText);
	local curGod = 0;
	local this = PRAYER_FOLLOWER[God];
	if string.find(text,this.gText) or string.find(text,this.eText) then
		return true;
	end
	return false;
end

--[[

]]
function P_CheckItemsFollower(Char,God,Info)
	local ret = true;
	for _,item in ITEMS_FOLLOWER[God] do
		if Char:countItem(item.id)<item.number then
			ret = false;
			break;
		end
	end
	if Info and not ret then
		base.common.InformNLS(Char,
			"Du hast nicht alle Opfergaben bei dir.",
			"You don't have all sacrificial offerings with you.");
	end
	return ret;
end

function P_CheckItemsPriest(Char,God,Info)
	local ret = true;
	for _,item in ITEMS_PRIEST[God] do
		if Char:countItem(item.id)<item.number then
			ret = false;
			break;
		end
	end
	if Info and not ret then
		base.common.InformNLS(Char,
			"Du hast nicht alle Opfergaben bei dir.",
			"You don't have all sacrificial offerings with you.");
	end
	return ret;
end

-- char, god
function P_CheckDevotionTime(Char,God,Info)
	local d = P_GetDevotion(Char,true,false);
	if d and d~=God then
		local days = P_GetFollowerElapsedDays(Char);
		if days and days<25 then
			base.common.InformNLS(Char,
				"Der Segen eines anderen Gottes liegt bereits auf dir. Versuche es in ".. 25-days .. ((25-days==1) and "Tag" or "Tagen") .. "wieder.",
				"The blessing of another god is already upon you. Try it again in ".. 25-days .. ((25-days==1) and "day" or "days") .. ".");
			return false;
		end
	end
	return true;
end

--[[
@param charStruct
@return int/nil
]]
function P_GetFollowerElapsedDays(Char)
	local fEffect = P_GetFollowerEffect(Char);
	if fEffect then
		local foundDay,day = fEffect:findValue("day");
		local foundMonth,month = fEffect:findValue("month");
		local foundYear,year = fEffect:findValue("year");
		if foundDay and foundMonth and foundYear then
			return P_GetElapsedDays(day,month,year);
		end
	end
	return nil;
end

function P_GetElapsedDays(year,month,day)
	return P_GetElapsedDaysIt(year,month,day,0);
end

function P_GetElapsedDaysIt(year,month,day,elapsed)
	local curYear = world:getTime("year");
	local curMonth = world:getTime("month");
	local curDay = world:getTime("day");
	if curYear==year and curMonth==month and curDay==day then
		return elapsed;
	end
	elapsed = elapsed + 1;
	if month==16 then
		day = math.mod(day+1,6);
	else
		day = math.mod(day+1,25);
	end
	if day==0 then
		day = 1;
		month = math.mod(month+1,17);
		if month==0 then
			month = 1;
			year = year + 1;
		end
	end
	return P_GetElapsedDaysIt(year,month,day,elapsed);
end

--[[
@param charStruct
@return effect,nil
]]
function P_GetFollowerEffect(Char)
	local found,effect = Char.effects:find(6);
	if found then
		return effect;
	end
	return nil;
end

--[[
@param charStruct
@return effect,nil
]]
function P_GetEffectPriest(Char)
	local found,effect = Char.effects:find(17);
	if found then
		return effect;
	end
	return nil;
end

function P_DeleteItemsFollower(Char,God)
	for _,item in ITEMS_FOLLOWER[God] do
		Char:eraseItem(item.id,item.number);
	end
end

function P_DeleteItemsPriest(Char,God)
	for _,item in ITEMS_PRIEST[God] do
		Char:eraseItem(item.id,item.number);
	end
end

-- char, god
function P_DevoteFollower(Char,God)
	Char:setQuestProgress(18,God);
	local fEffect = P_GetFollowerEffect(Char);
	if not fEffect then
		fEffect = LongTimeEffect(6,10);
		Char.effects:addEffect(fEffect);
	end
	fEffect:addValue("day",world:getTime("day"));
	fEffect:addValue("month",world:getTime("month"));
	fEffect:addValue("year",world:getTime("year"));
	world:gfx(37,Char.pos);
	world:makeSound(13,Char.pos);
end

-- char, god
function P_CheckPrayerPriest(Char,God)
	local text = string.lower(Char.lastSpokenText);
	local curGod = 0;
	local this = PRAYER_PRIEST[God];
	if string.find(text,this.gText) or string.find(text,this.eText) then
		return true;
	end
	return false;
end

--[[
@param charStruct
@return int/nil
]]
function P_GetGodOfAltar(Char)
	for god,pos in ALTARS do
		if Char:isInRangeToPosition(pos,2) then
			return god;
		end
	end
	return nil;
end

-- char, god
function P_CheckDevotionForOrdination(Char,God,Info)
	local cGod = P_GetDevotion(Char,true,false);
	if cGod then
		if cGod==God then
			local days = P_GetFollowerElapsedDays(Char);
			if days and days>=25 then
				return true;
			elseif Info then
				base.common.InformNLS(Char,
					"Wie kann ein Gott dir Vertrauen schenken, wenn du noch nicht einmal einen Monat ihm nachfolgst?",
					"How can a god place his trust in you, if you haven't even been following him for only one month?");
				return false;
			end
		end
	end
	if Info then
		base.common.InformNLS(Char,
			"Du bist nicht einmal ein Anhänger dieses Gottes.",
			"You aren't even a follower of this god.");
	end
	return false;
end

-- char, god
function P_GetChanceForOrdination(Char,God,Info)
	local players = world:getPlayersInRangeOf(Char.pos,5);
	local followers = {};
	local priests = {};
	local d = nil;
	for _,player in players do
		if player.id~=Char.id then
			d = P_GetDevotion(player,true,false);
			if d and d==God then
				table.insert(followers,player);
			else
				d = P_GetDevotion(player,false,true);
				if d and d==God then
					table.insert(priests,player);
				end
			end
		end
	end
	if table.getn(followers)+table.getn(priests) >= 2 then
		return 10*table.getn(followers) + 20*table.getn(priests);
	end
	if Info then
		base.common.InformNLS(Char,
			"Für eine Messe brauchst du mindestens noch zwei weitere Anhänger.",
			"For a mass you need at least two other followers.");
	end
	return nil;
end

-- char, god
function P_CharToPriest(Char,God)
	Char:setQuestProgress(18,100+God);
	Char.effects:removeEffect(6);
	Char.effects:addEffect(LongTimeEffect(17,10));
	Char:setMagicType(1);
	Char:teachMagic(1,RUNE_HEALING);
	Char:teachMagic(1,RUNE_SMALL);
	Char:increaseSkill(7,"belief",1-Char:getSkill("belief"));
	Char:increaseSkill(7,"healing",10-Char:getSkill("healing"));
	Char:increaseSkill(7,"alignment",50-Char:getSkill("alignment"));
	world:gfx(46,Char.pos);
	world:makeSound(13,Char.pos);
end
