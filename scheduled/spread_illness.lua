require("base.common")
module("scheduled.spread_illness", package.seeall)

function getClothes()
    -- Factors for protection:
    --   breast:  0.5
    --   coat:    0.8
    --   legs:    0.2
    --   head:    0.2
    --   hands:   0.05
    --   feet:    0.4 (they're small, but running around barefooted in the cold is rather dumb)
	factors = {
		["breast"] = 0.5,
		["coat"]   = 0.5,
		["legs"]   = 0.2,
		["hands"]  = 0.05,
		["head"]   = 0.1,
		["feet"]   = 0.1
	}

	-- Messages that will be output to the user when he is inadequately clothed. The first is the severity of underprotection (the higher, the worse),
	-- the second id the german message, and the third in the english message.
	messages = {
		["wind"] = 
			{
				{2, "Trotz deiner Kleidung spuerst du unangenehm den Wind.", "Even through your clothes you feel the wind."},
				{40, "Der Wind schneidet durch deine duenne Kleidung.", "The wind cuts through your thin clothes."},
				{80, "Deine viel zu duennen Kleider bieten keinerlei Schutz gegen diesen Wind, der wie tausend kleine Nadeln in deine Hat sticht.",
					"You much-too-thin clothes offer no protection against this wind that cuts into your skin like a razor blade."}
			},
		["water"] = 
			{
				{2, "Etwas Regenwasser tropft dir in den Nacken und du schuettelst dich.", "Some rainwater drips down your neck and you shiver."},
				{40, "Du versuchst vergeblich, dich so in deine Kleider zu wickeln, dass der Regen nicht zu dir durchgelangt.",
					"You try in vain to cover yourself from the rain in the thin clothes you have."},
				{80, "Der stroemende Regen durchnaesst deinen schutzlosen Koerper vollkommen.", "The pouring rain soaks you down to your very soul."}
			},
		["cold"] = 
			{
				{2, "Dir ist kalt, du haettest dich etwas waermer anziehen sollen.", "You are cold - you should have put on some warmer clothes."},
				{40, "Du bibberst vor Kaelte.", "The coldness makes you shiver."},
				{80, "Die bittere Kaelte laesst dich langsam das Gefuehl in den Fingerspitzen verlieren.",
					"You are freezing, and your fingertips start turning blue."}
			}
	}

    -- Each row is: item id, wind protection [0-100], water protection [0-100], cold protection [-100-100] (steel actually takes away
    -- heat from your body when it's cold outside...)
    -- windprotection 100 for a hat does NOT mean that the hat alone is 100% wind protection for the player, it
    -- just means that the hat offers the best wind protection that a hat can offer!
	--
	-- Currently, the best protection that can be reached in any of the three areas is around 180
	clothes = {
	-- Head:
           {  356, 20, 50, 40},  -- Schlapphut
           {  357, 20, 50, 30},  -- blauer Zauberhut
           {  358, 20, 50, 30},  -- roter Zauberhut
           {  370, 20, 50, 30},  -- bunter Zauberhut
           {  371, 20, 50, 30},  -- teurer Zauberhut
           {   94, 70, 70,-15},  -- Topfhelm
           {  184, 90, 90,-15},  -- Visierhelm
           {  185, 90, 90,-15},  -- schwarzer Visierhelm
           {  187, 20, 30, -5},  -- Stahlhut
           {  202, 10, 10, -5},  -- Stahlkappe
           {  225,  5,  5,  5},  -- Krone
           {  324, 10,  5, -5},  -- Kettenhelm
           { 2291, 80, 80, 20},  -- salkamaerischer Paladinhelm
           { 2286, 10, 70, 90},  -- Flammen-Helm
           { 2287, 20, 20, 10},  -- albarischer Soldatenhelm
           { 2290, 20, 30,  5},  -- runder Stahlhut
           { 2302, 20, 20, 10},  -- gynkesischer Sdnerhelm
           { 2303, 20, 20, 10},  -- Drowhelm
           { 2357, 20, 20, 10},  -- Schattenharnisch
           { 2363, 20, 20, 10},  -- Nachtharnisch
           { 2364, 20, 20,  5},  -- Stahlharnisch
           { 2444, 20, 20,  5},  -- Serinjah-Helm
           {    7, 10, 10,  5},  -- Hnerhelm
           {   16, 30, 20,  5},  -- Orkhelm
           { 2441, 20, 20,  5},  -- Sturmhaube

	-- Legs:
           {  366, 20, 10, 10},  -- Lederbeinschienen
           {  367, 10,  5,  5},  -- kurze Lederbeinschienen
           {   34, 50, 30, 90},  -- schwarze Hose
           {  183, 50, 30, 90},  -- gre Hose
           { 2111, 10, 10,  5},  -- Kettenhose
           { 2112,  5,  5,  5},  -- kurze Kettenhose
           { 2116, 20, 10,-10},  -- Stahlbeinschienen
           { 2117, 10,  5, -5},  -- kurze Stahlbeinschienen
           { 2113, 20, 10,-10},  -- bronzene Beinschienen
           { 2114, 10,  5, -5},  -- kurze bronzene Beinschienen
           { 2172, 20, 10,-10},  -- schwere Stahlbeinschienen
           { 2173, 10,  5, -5},  -- kurze Stahlbeinschienen
           { 2193, 20, 10, 10},  -- Hartholzbeinschienen
           { 2194, 10,  5,  5},  -- kurze Hartholzbeinschienen

	-- Hands:
           {  325, 99, 99,-10},  -- Stahlhandschuhe
           {  384, 50, 50, 20},  -- Diebeshandschuhe
           { 2295, 99, 70, 80},  -- Stoffhandschuhe
           {   48, 99, 99, 70},  -- Lederhandschuhe

	-- Feet:
           {  369, 70, 70, 50},  -- Lederschuhe
           {   53, 99, 99, 90},  -- Lederstiefel
           {  326, 99, 99,-20},  -- Stahlschuhe

	-- Breast:
           {  362, 80, 80, 10},  -- volle Lederrtung
           {  363, 40, 40, 10},  -- Lederschuppenrtung
           {  364, 35, 35, 10},  -- leichte Jagdrtung
           {  365, 35, 35, 10},  -- halbe Lederrtung
           {  101, 20, 20,  5},  -- Kettenhemd
           {  180, 30, 20, 20},  -- rotes Hemd
           {  181, 30, 20, 20},  -- blaues Hemd
           {  182, 30, 20, 20},  -- schwarzes Hemd
           { 2400, 50, 50, 10},  -- Elben-Prunkrsung
           { 2359, 50, 50, 10},  -- ldnerrtung
           { 2407, 40, 40, 10},  -- leichte Brustplatte
           { 2389, 50, 50, 10},  -- salkamaerische Rtung
           { 2358, 45, 45, 10},  -- albarische Offiziersrung
           { 2360, 50, 50, 10},  -- Lor-Angur-Whterrtung
           { 2365, 50, 50, 10},  -- salkamaersche Offiziersrtung
           { 2367, 50, 50, 10},  -- albarische Adeligenrtung
           { 2369, 60, 60, -5},  -- albarischer Stahlharnisch
           { 2390, 55, 55, 10},  -- Zwergen-Prunkrtung
           { 2392, 60, 60, -5},  -- schwerer roter Stahlharnisch
           { 2393, 60, 60, -5},  -- schwerer Stahlharnisch
           { 2395, 40, 40, 10},  -- Zwergenpanzer
           { 2399, 30, 30, 10},  -- leichte Elbenrtung
           { 2402, 30, 30, 10},  -- Drowrtung
           { 2403, 40, 40,  5},  -- Elben-Silberstahlrtung
           {    4, 40, 40, -5},  -- Plattenpanzer


	-- Coat: 
           {  368, 90, 90, 70},  -- gelbe Priesterrobe
           {   55, 90, 90, 70},  -- gre Robe
           {  193, 90, 90, 70},  -- blaue Robe
           {  194, 90, 90, 70},  -- schwarze Robe
           {  195, 90, 90, 70},  -- gelbe Robe
           {  196, 50, 50, 50},  -- grauer Mantel
           {  385, 30, 30, 40},  -- blaues Kleid
           { 2377, 70, 70, 50},  -- rote Magierrobe
           { 2378, 70, 70, 50},  -- Schwarzkult-Robe
           { 2380, 70, 70, 50},  -- blauer Mantel
           { 2384, 70, 70, 50},  -- schwarzer Mantel
           { 2416, 90, 90, 70},  -- braune Priesterrobe
           { 2418, 90, 90, 70},  -- graue Priesterrobe
           { 2419, 90, 90, 70},  -- rote Priesterrobe
           { 2420, 90, 90, 70},  -- schwarze Priesterrobe
           { 2421, 90, 90, 70},  -- wei Priesterrobe
           {  547, 50, 50, 30},  -- Novizen Magierrobe
           {  548, 70, 70, 50},  -- Magierrobe
           {  558, 70, 70, 50}   -- Magierrobe
	}

	return(clothes);
end

function init() 
	isSetup = true;
	clothes = getClothes();
	-- Build an array where the clothes' protection values are accessible by the item id of the thing worn.
	clothFactors = {};
	for i,v in ipairs(clothes) do
		itemId = v[1];
		clothFactors[itemId] = {};
		clothFactors[itemId]["wind"] = v[2]/2;
		clothFactors[itemId]["water"] = v[3]/2;
		clothFactors[itemId]["cold"] = v[4]/1.5;
	end
end

-- Entrance point for the scheduled script. Checks if the user is adequately protected against wind, water and rain,
-- informs him if that is not the case, and, if the user has bad luck, infects him with a cold.
function spreadIllness()
    
    return -- because it annoys me -- vilarion
end
--[[    
	-- If this is the first time the script gets called, do some initialization
	doSetup = false;
	if isSetup == nil then
		init();
		doSetup = true;
	end

	-- Get the list of potential victims
    victimList = world:getPlayersOnline();

    for i, victim in pairs(victimList) do
		-- If the tile above the user is nil, then there is no roof above his head. This is assumed to mean that he is
		-- outside and thus needs adequate protection against the weather.
        potentialRoofPos=position(victim.pos.x, victim.pos.y, victim.pos.z+1);
        potRoof=world:getField(potentialRoofPos);
        if potRoof == nil then 
    		weather = world.weather;
			protection = getProtection(victim);
			illnessOdds = getIllnessOdds(protection);
			-- Doesn't inform on every iteration, just sometimes.
			sumOdds = informAboutCold(victim, illnessOdds);
			infectUser(victim, sumOdds);
--        	debug(victim, "Temp: "..weather.temperature..", rain: "..weather.percipitation_strength..", wind:"..weather.gust_strength..", odds:"..illnessOdds["wind"]..","..illnessOdds["water"]..","..illnessOdds["cold"]);
        else
--            debug(victim, "got a roof over your head, no illness chance");
        end
    end
end
--]]

function infectUser(victim, sumOdds)
	avgOdds = sumOdds / 3;
	const = victim:increaseAttrib("constitution", 0);
	avgOdds = avgOdds/const;
	debug(victim, "const: "..const..", sumOdds: "..sumOdds..", final odds:"..avgOdds);
	if(math.random(100) < avgOdds) then
		if user.name == "Emhyr van Emreis" then
			victim.effects:addEffect(CLongTimeEffect(3), true);
		end
	end
end

-- Based on the odds of becoming ill from having too little protection against wind/cold/rain, this
-- function will inform the user that he feels cold/is wet/it's too windy.
-- Doesn't inform on every call. The higher the odds of becoming ill, the more likely the user will
-- be informed.
function informAboutCold(user, illnessOdds)
	sumOdds = 0;
	for i,v in pairs(illnessOdds) do
		sumOdds = sumOdds + v;
	end
	if sumOdds < 0.1 then
		return
	end
	messageGerman = "";
	messageEnglish = "";
	for typ,value in pairs(illnessOdds) do
		message = getMessage(value, typ);
		if message[2] ~= nil then 
			messageGerman = messageGerman .. message[2];
			messageEnglish = messageEnglish .. message[3];
		end
	end
	avgOdds = sumOdds / 3;

	-- The script is called every 10 seconds. Even if the user's very cold, that's a bit too often, so
	-- make the maximum odds of being informed 20% (-> about once every 50 seconds).
	if avgOdds > 20 then avgOdds = 20; end
	debug(user, messageGerman);
	if(math.random(100) < avgOdds) then
		base.common.InformNLS(user, messageGerman, messageEnglish);
	end
	return(sumOdds);
end

-- Gets the correct message from the messages array, based on the type of weather (cold, wind, water) and
-- the odds of becoming ill from too little protection against the given type of weather
function getMessage(odds, typ)
	diff = 100;
	message = {0, nil, nil};
	for i,v in pairs(messages[typ]) do
		if odds > v[1] then
			if odds - v[1] < diff then
				message = v;
				diff = odds - v[1];
			end
		end
	end
	return message;
end

-- Returns the odds of getting ill caused by inferior wind, water and cold protection
function getIllnessOdds(protection)
    weather = world.weather;
	weatherVals = {};
	weatherVals["wind"]  = weather.gust_strength;
	weatherVals["water"] = weather.percipitation_strength;
	weatherVals["cold"]  = 50 - weather.temperature; -- Because we want all in [0-100], with 0 being the best, and temperature is in [-50 - 50], with 50 being the best
	odds = {};
	for typ,val in pairs(weatherVals) do
		odds[typ] = math.max(0, val-protection[typ]);
	end
	return(odds);
end

-- Get the protection values offered by the clothing worn by the user.
-- Right now, the best protection values are around 180.
function getProtection(user)
	worn = {};
	worn["breast"] = user:getItemAt(3);
	worn["coat"] = user:getItemAt(11);
	worn["hands"] = user:getItemAt(4);
	worn["head"] = user:getItemAt(1);
	worn["legs"] = user:getItemAt(9);
	worn["feet"] = user:getItemAt(10);
	protection = {
		["wind"] = 0,
		["water"] = 0,
		["cold"] = 0,
	};
	for where,item in pairs(worn) do
		if item:getType() ~= 0 and clothFactors[item.id] ~= nil then
			for typ,val in pairs(protection) do
				protection[typ] = protection[typ] + (clothFactors[item.id][typ] * factors[where]);
			end
		end
	end
	-- Protection should never be exactly 0, because we'll be dividing by the protection value afterwards
	for typ,val in pairs(protection) do
		if val == 0 then protection[typ] = 1; end
	end
	return(protection);
end

function debug(user, message) 
	if user.name == "Emhyr van Emreis" then
		user:inform(message);
	end
end
