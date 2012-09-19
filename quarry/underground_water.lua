-- Water puddles in the underground of Trolls Bane
--
-- Include common functions
require("base.common")

-- Include triggerfield functions
require("triggerfield.base.triggerfield")

module("triggerfield.underground_water", package.seeall)

function MoveToField(User)
	-- Array with things that can happen. Each thing is an array: {function, odds}.
	events = {
		{
			-- If the user has no shoes on his feet (position 10), it gets a bit more disgusting.
			function()
				if User:getItemAt(10).number < 1 then
					base.common.InformNLS(User, "Du trittst barfuss in eine Pfuetze. Etwas kaltes, glitschiges und stinkendes quillt zwischen deinen Zehen hervor. Ieeeeeh!",
						"Something glibbery, cold and stinking quills up between your toes. Yuk, you really should wear boots down here!"); 
				else
					base.common.InformNLS(User, "Du trittst unvorsichtig in eine Pfuetze, und etwas Braunes quillt unter deinen Stiefeln hervor. Igitt!",
						"You step into a puddle of... something, and a brown goo emerges from under your boots. Yuk!"); 
				end
			end,
			10
		},
		{
			function() base.common.InformNLS(User, "Als du in die Pfuetze trittst, steigt ein abartiger Urin- und Kotgestank auf. Dir wird uebel.",
			"A horrid smell of urine and excrement fills your nose as you step into the puddle. You want to throw up."); end,
			10
		},
		{
			function() 
				base.common.InformNLS(User, 
					"Du trittst in die Pfuetze und rutscht aus. Patsch! Igitt, du willst gar nicht wissen, worin du gelandet bist, aber es stinkt hoellisch...",
					"You slip on something in the puddle. Splat! Bah, you don't even want to know what it is that you landed in, but it stinks like hell....");
				User:increasePoisonValue(20);
				User.movepoints = User.movepoints - 40;
			end,
			10
		},
		{
			function() 
				base.common.InformNLS(User, "Du rutscht auf irgendwas aus, aber kannst mit einem schnellen Schritt zum Glueck dein Gleichgewicht halten.",
					"You slip, but make a quick move forward and are able to keep your balance.");
				User:move(User:getFaceTo(), false);
			end,
			10
		},
		{
			function() end,
			60
		}
	}

	event = triggerfield.base.triggerfield.getEvent(events, ran); 
	event();
end
