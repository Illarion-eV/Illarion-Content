-- Entrance to the underground of Trolls Bane
--
-- Include common functions
require("base.common")

-- Include triggerfield functions
require("triggerfield.base.triggerfield")

module("triggerfield.underground_entrance", package.seeall)

function MoveToField(User)
	-- Array with things that can happen. Each thing is an array: {function, odds}.
	events = {
		{
			function() 
				base.common.InformNLS(User, 
					"Ein Luftzug kommt von unten an und bringt einen Gestank mit, der dir den Atem nimmt. Hast du etwa die Kanalisation gefunden?",
					"A draught of air engulfs you in a cloud of unbearable stench. Should you have found the canalization of Troll's Bane?"); 
			end,
			10
		},
		{
			function() 
				base.common.InformNLS(User, 
					"Ein unangenehmer, modriger Geruch zieht von der Oeffnung im Boden zu dir herueber.",
					"An unpleasant smell reaches you from the hole in the floor.");
			end,
			10
		},
		{
			function() 
				base.common.InformNLS(User, 
					"Der Gestank vom Loch im Boden ist nicht zu uebersehen. Ist das wirklich der richtige Ort, um Trinkwasser zu holen?",
					"The stench coming from the hole in the floor makes you wonder if the well is the right place for getting drinking water...");
			end,
			10
		},
	}

	event = triggerfield.base.triggerfield.getEvent(events, ran); 
	event();
end

