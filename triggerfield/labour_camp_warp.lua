-- INSERT INTO triggerfields VALUES (-495,-484,-40,'triggerfield.labour_camp_warp');

require("base.common")

module("triggerfield.labour_camp_warp", package.seeall)

function MoveToField(User)
    if User:getQuestProgress(25) > 0 then -- char wants to go, but his work isn't done; makes the labour camp leader grumpy
	    local myNpc = world:getNPCSInRangeOf(position(-495,-484,-40),10)
        myNpc[1]:talkLanguage(Character.say,Character.german,"#me wendet seinen Blick wütend zum Teleporter und schreit los:")
        myNpc[1]:talkLanguage(Character.say,Character.english,"#me looks with anger to the teleporter and starts to shout:")
        myNpc[1]:talkLanguage(Character.yell,Character.german,"Mach gefälligst deine Arbeit, du fauler Hund!")
        myNpc[1]:talkLanguage(Character.yell,Character.english,"Finish your work, you lazy bum!")

	else -- the char is allowed to leave
        local ItemListe = {49,234,2536,22,21,2763};    --delete ores, coal, pickaxe, gold nuggets and bread
		for i, Item in pairs(ItemListe) do
			local amount = User:countItem(ItemListe[i]);
			User:eraseItem( ItemListe[i], amount);
		end --items deleted;

		local Faction = base.factions.get(User); -- lookup to which faction the Character belongs to
		local dest
		if     Faction.tid == 1 then 
		       dest = position(140,630,0) --cadomyr
		elseif Faction.tid == 2 then 
		       dest = position(788,826,0) --runewick
		elseif Faction.tid == 3 then 
		       dest = position(424,245,0) --galmair
		else 
		    dest = position(730, 226, 0) --no town member teleport him to the Wilderland	
		end

		User:pageGM("This character did their work in the labour camp and left it now.")
        -- Warp him home with some SFX and GFX		
		world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
		User:forceWarp(dest);
        world:gfx(41,User.pos);
        world:makeSound(13,User.pos);
    end	
end