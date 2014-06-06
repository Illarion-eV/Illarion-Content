--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
-- INSERT INTO triggerfields VALUES (-495,-484,-40,'triggerfield.labour_camp_warp');

require("base.common")

module("triggerfield.labour_camp_warp", package.seeall)

function MoveToField(User)
    if User:getQuestProgress(25) > 0 then -- char wants to go, but his work isn't done; makes the labour camp leader grumpy
	    
		-- check for spam and put a new spam marker in case it is no spam
		local noSpam = false
		local foundEffect, myEffect = User.effects:find(55)
		if foundEffect then
		    local findCounter,spamProtection_1 = myEffect:findValue("spamProtection_1")
		    if findCounter then
			    if spamProtection_1 < 1 then
				    noSpam = true
			        myEffect:addValue("spamProtection_1",5)
				end
			else
			    noSpam = true
			    myEffect:addValue("spamProtection_1",5)
			end
		else 
		    noSpam = true
		    local myEffect=LongTimeEffect(55,5)
			myEffect:addValue("spamProtection_1",5)
		    User.effects:addEffect( myEffect )
		end
		
		if noSpam == true then -- we don't spam
			local myNpc = world:getNPCSInRangeOf(position(-495,-484,-40),10)
			for i=1,#myNpc do
				if myNpc[i].name == "Percy Dryless" then -- check if it is the camp leader  
					myNpc[i]:talk(Character.say, "#me wendet seinen Blick wütend zum Teleporter und schreit los:", "#me looks with anger to the teleporter and starts to shout:")
					myNpc[i]:talk(Character.say, "Mach gefälligst deine Arbeit zu Ende, du fauler Hund!", "Finish your work, you lazy bum!")
					break
				end
			end
		end
		base.common.InformNLS(User,"Der Teleporter scheint dir den Dienster zu verweigern, bis deine Strafe abgearbeitet ist.","The teleporter seems to be not working for you as long as you haven't served your sentence.")
		
	else -- the char is allowed to leave
	
	    local ItemListe = {21, 22, 234, 2534, 2536, 1062,  251, 252, 253, 254, 255, 256, 257, 49, 2763};    --delete ores, coal, nuggets, raw gems, pick-axe and bread
		for i, Item in pairs(ItemListe) do
			local amount = User:countItem(ItemListe[i]);
			User:eraseItem( ItemListe[i], amount);
		end --items deleted;

		local Faction = base.factions.getFaction(User); -- lookup to which faction the Character belongs to
		local dest
		if     Faction.tid == 1 then 
		       dest = position(127,647,0) --cadomyr
		elseif Faction.tid == 2 then 
		       dest = position(836, 813, 0) --runewick
		elseif Faction.tid == 3 then 
		       dest = position(424,245,0) --galmair
		else 
		    dest = position(730, 226, 0) --no town member teleport him to the Wilderland	
		end

		User:pageGM("This character did his/her work in the labour camp and left it now.")
        -- Warp him home with some SFX and GFX		
		world:gfx(46,User.pos);
	    world:makeSound(13,User.pos);
		User:forceWarp(dest);
        world:gfx(46,User.pos);
        world:makeSound(13,User.pos);
    end	
end