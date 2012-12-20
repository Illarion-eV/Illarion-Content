-- Include common methods
require("base.common")
module("lte.cold", package.seeall)

-- Include functions for handling odds arrays (such as illnessMessages)


-- Initialize different important values for the levels of the illness.
function init()
	-- The attribute penalties for reaching the given level of the illness.
	-- These stack, so a character with a level 6 illness (heavy pneumonia)
	-- will have lost 8-9 points of costitution.
	-- These are initial values. It is checked that no attribute falls under
	-- a value of 3.
	penalties = {
		[1] = {
			[constitution] = math.random(1,2);
			[strength] = 1;
			[intelligence] = 1;
		},

		[2] = {
			[constitution] = 1;
			[agility] = math.random(1,2);
		},

		[3] = {
			[constitution] = 1;
			[dexterity] = 1;
			[strength] = math.random(1,2);
		},
		
		[4] = {
			[constitution] = 1;
			[strength] = 2;
			[dexterity] = 2;
		},
		
		[5] = {
			[constitution] = 2;
			[intelligence] = 2;
			[strength] = 2;
			[dexterity] = 2;
			[agility] = 2;
		},
		
		[6] = {
			[constitution] = 2;
			[intelligence] = 2;
			[strength] = 2;
			[dexterity] = 2;
			[agility] = 2;
		}
	}

	-- Informations given to a user when he enters or leaves the given illness level
	informations = {
		[1] = {
			[enter] = {
				"Du niest. Hast du dich etwa erkaeltet?",
				"You sneeze. Did you catch a cold?"
			},
			[leave] = {
				"Ach, ist das ein schoenes Gefuehl, wenn die Nase wieder frei ist! Du atmest tief durch.",
				"You take a deep breath. It's a wonderful feeling when the nose stops running!"
			}
		},
		[2] = {
			[enter] = {
				"Ugh. Deine Nase fuehlt sich an wie ein Bleipropfen. Du solltest bei diesem Wetter wirklich besser auf dich aufpassen.",
				"Your nose feels like a blob of lead. You should really be more careful in this kind of weather!"
			},
			[leave] = {
				"Du fuehlst dich ein wenig besser. Das Schlimmste der Erklaetung scheint ueberstanden zu sein.",
				"You feel a bit better. The worst part of the cold seems to be over."
			}
		},
		[3] = {
			[enter] = {
				"Du fuehlst, wie du langsam Halsschmerzen kriegst. Pass auf, sonst holst du dir hier draussen noch den Tod!",
				"Your throat starts to hurt. Be careful, or you'll get really ill out here!"
			},
			[leave] = {
				"Endlich kannst du wieder schmerzfrei schlucken! Doch das ist durch deine immer noch laufende Nase getruebt...",
				"You can finally swallow painlessly again! The joy is dampened by your still-runny nose though..."
			}
		},
		[4] = {
			[enter] = {
				"Dein Hals tut dir bei jedem Schlucken hoellisch weh. Du solltest dich wirklich schonen, wer weiss, was du dir sonst noch einfaengst.",
				"Your throat hurts really badly when you swallow. You should really take some rest, or you may catch something really dangerous!"
			},
			[leave] = {
				"Der pochende Schmerz in deinem Hals laesst nach, aber das Schlucken ist immer noch unangenehm.",
				"The throbbing pain in your throat dies down, but swallowing is still unpleasant."
			}
		},
		[5] = {
			[enter] = {
				"Jetzt spuerst du bei jedem Atemzug einen stechenden Schmerz in der Lunge. Wenn das so weitergeht, ist's bald um dich geschehen!",
				"Your lungs start aching with every breath you take. If this goes on, you'll have to kiss this world goodbye soon."
			},
			[leave] = {
				"Wenigstens die Lungenentzuendung scheint ueberstanden zu sein, doch die Halsschmerzen lassen dir immer noch keine Ruhe.",
				"At least the pneumonia seems to have gone. But your sore throat still won't let you come to a rest."
			}
		},
		[6] = {
			[enter] = {
				"Als du hustest, verbreitet sich vor dir ein kleines Woelkchen von Bluttropfen. Es ist wirklich schlecht um dich bestellt!",
				"As you cough, you spit out a few drops of blood and you feel a stinging pain in your chest. Is this the end?"
			},
			[leave] = {
				"Der Schmerz in deiner Lunge scheint nicht mehr ganz so schlimm zu sein, aber ganz ueberstanden ist die Lungenentzuendung noch nicht.",
				"The pain in your lungs seems not to be that bad anymore, but the pneumonia is still far from over."
			}
		}
	}

	-- Messages given to the user and the people around him at irregular intervals while he has an illness 
	-- of the given level.
	-- Format: Odds of the message appearing, german message, englich message, german message for others, 
	-- english message for others.
	-- Odds are NOT in percent. If the sum of the odds of all messages is 50, then 50 is 100%.
	illnessMessages = {
		[1] = {
			{10,
				{"Du niest.", "You sneeze",
				"niest.", "sneezes."}
			},
			{10, {nil, nil, nil, nil}}
		},
		[2] = {
			{10,
				{"Du niest heftig.", "You sneeze violently.",
				"niest heftig.", "sneezes violently."}
			},
			{10, {nil, nil, nil, nil}}
		},
		[3] = {
			{10,
				{"Als du schluckst, tut dir der Hals weh.", "You feel a pain in your throat as you swallow.",
				"schluckt und verzieht das Gesicht.", "swallows and makes a face."}
			},
			{10, {nil, nil, nil, nil}}
		},
		[4] = {
			{10,
				{"Du hustest heftig und spuerst einen stechenden Schmerz im Hals.", "You cough, and feel a stinging pain in your throat.",
				"hustet und reibt sich mit schmerzverzerrtem Gesicht den Hals.", "coughs and lets out a painful groan."}
			},
			{10, {nil, nil, nil, nil}}
		},
		[5] = {
			{10,
				{"Das Atmen faellt dir vor Schmerzen in der Lunge schwer.", "You find it hard to breathe for the pain in your lungs.",
				"sieht blass aus und keucht.", "gasps for air and looks very ill."}
			},
			{10, {nil, nil, nil, nil}}
		},
		[6] = {
			{10,
				{"Du hustest etwas Blut hervor.", "You cough up some blood.",
				"hustet etwas Blut hervor.", "coughs up some blood."}
			},
			{10, {nil, nil, nil, nil}}
		}
	}

	-- The effect will be called once every 10 seconds, and duration will be decreased 
	-- each call. A duration of 60 for level 1 would mean that the common cold (illness level 1)
	-- would last for 10 minutes.
	durations = {
		[1] = math.random( 60,180),   -- 10 to  30 minutes
		[2] = math.random( 60,180),   -- 10 to  30 minutes
		[3] = math.random(120,180),   -- 20 to  30 minutes
		[4] = math.random( 60,120),   -- 10 to  20 minutes
		[5] = math.random(240,360),   -- 40 to  60 minutes - you don't want this to happen to you.
		[6] = math.random(360,720),   -- 60 to 120 minutes - this one's really serious. 
	}
end

-- Called when the user's illness reaches the given level (on the way UP, not down!)
function enterLevel(effect, user, level, updateDuration)
	updateDuration = updateDuration or true;
	for diff, attr in pairs(penalties) do
		val = user:increaseAttrib(attr, 0);
		if(val - diff < 3) then
			-- If the penalty would bring the user's attribute to less than 3, don't apply the penalty.
			effect.addValue(attr..level, 0);
		else
			-- Otherwise, decrease the usre's attribute and document by how much it was decreased.
			user:increaseAttrib(attr, -1*diff);
			effect.addValue(attr..level, diff);
		end
	end
	if(updateDuration == true) then
		effect:addValue("duration", durations[level]);
		base.common.InformNLS(user, informations[level]["enter"][1], informations[level]["enter"][2]);
	end
end

-- Called when the user's illness leaves the given level (on the way DOWN, not up!)
function leaveLevel(effect, user, level)
	for v, attr in pairs(penalties) do
		found, diff = getOrWarn(effect, user, attr);
		if(found == true) then
			user:increaseAttrib(attr, diff);
		end
	end
	if(level > 1) then
		effect:addValue("duration", durations[level-1]);
	end
	base.common.InformNLS(user, informations[level]["leave"][1], informations[level]["leave"][2]);
end

-- Informs the user about the ill effects the illness is having on him.
function informUser(effect, user)
	found, level = getOrWarn(effect, user, "level");
	if(found) then
		oddsArray = illnessMessages[level];
		message = getFromOddsArray(oddsArray);
		if(message[1] ~= nil) then
			base.common.InformNLS(user, message[1], message[2]);
			-- TODO: Make this language specific. 
			user:talk(Character.say, message[1]);
		end
	end
end

-- Called the first time when the effect is added to the user.
function addEffect(effect, user)
	-- Initialize some global values
--	init();

	-- The level of the illness is 1 per default, it increases if the character gets
	-- a cold again while still ill. The possible levels are:
	--   1: common cold
	--   2: heavy common cold
	--   3: sore throat
	--   4: strong sore throat
	--   5: pneumonia
	--   6: severe pneumonia
	user:inform("Test");
	effect:addValue("level", 1);

	-- Automatic handling of duration and penalties when entering an illness level 
--	enterLevel(effect, user, 1);
end

-- Entry point for the longtime effect
function callEffect(effect, user)
	-- Call every 10 seconds
	effect.nextCalled = 100;

	if true then return true; end

	found, duration = getOrWarn(effect, user, "duration");
	if(duration < 1) then
		found, level = getOrWarn(effect, user, "level");
		leaveLevel(effect, user, level);
		if(level <= 1) then
			user.effects:removeEffect(effect.effectId);
			return(false);
		end
	end
	found, over = effect:findValue("over");
	if(found and over==1) then
		effect:addValue("over", false);
		found, level = getOrWarn(effect, user, "level");
		if(found) then
			for i=level,1,-1 do
				leaveLevel(effect, user, i, false);	
			end
		end
		return("false");
	end
	informUser(effect, user);
	return(true);
end

function removeEffect(effect, user)
end

-- Lower the attributes again, according to the saved illness level, because the attribute changes
-- are not saved to the database when the user logs out.
function loadEffect(effect, user)
	found, level = getOrWarn(effect, user, "level");
	if(found) then 
		for i=1,level do
			enterLevel(effect, user, i, false);
		end
	end
end

function doubleEffect(effect, user)
-- TODO: Increase the level of the illness. This is called when the effect is added to a user who already has it.
end

-- Get a value from the effect. Warn the user that the value has not been found if it's not there.
function getOrWarn(effect, user, attribute)
	found, value = effect:findValue(attribute);
	if(found == false) then
		base.common.InformNLS(user, 
			"Fehler in Krankheit: Attribut "..attribute.." nicht gefunden. Bitte einen Administrator informieren.",
			"Error in illness: Attribute "..attribute.." not found. Please inform an administrator.");
	end
	return found, value
end
