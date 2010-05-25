require("base.common")
--make 'lightning strikes nearby' impossible to hit char, 
function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
--failsafe
--x = x + 1
--if x = 5 then
--return
User:inform("1st line")
--end

--if doesItThunder = 0 then
--return
--end
--Usercheck


--for i, User in pairs(UserList) do
  --      potentialRoofPos=position(User.pos.x, User.pos.y, User.pos.z+1);
    --    potRoof=world:getField(potentialRoofPos);
--end
     --   if potRoof~=nil then  
	--	User:inform("Safe inside")
		--return
		
		
if (math.random( 1 ) == 1 ) then 
User:inform("2d line");
    --lightning strikes nearby
	a = math.random(-3, 3)
	b = math.random(-3, 3) 
	if a == 0 then a = 1
	 world:gfx( 2, position (User.pos.x + a, User.pos.y + b, User.pos.z) )
	 world:makeSound( 4, position (User.pos.x + a, User.pos.y + b, User.pos.z) )
	    -- if lightning hits someone else than the User.. make it miss
		--if ...
		--end
			if (math.random( 1 ) == 1 )  then
			User:inform("3d line");
	-- Fire onstrike
			world:createItemFromID( 359, 1, position(User.pos.x + a, User.pos.y + b, User.pos.z), true, math.random(200,800), 0 )
			world:makeSound( 7, position (User.pos.x + a, User.pos.y + b, User.pos.z) )
	        return
			elseif (math.random( 1 ) == 1 )  then
			User:inform("4th line");
	-- Glass onstrike
			world:createItemFromID( 41, 1, position(User.pos.x + a, User.pos.y + b, User.pos.z), true, 333, 0 )
            return
			
			elseif (math.random( 1 ) == 1 )  then
			User:inform("5th line");
	-- Pure Earth onstrike
			world:createItemFromID( 2552, 1, position(User.pos.x + a, User.pos.y + b, User.pos.z), true, 333, 0 )
			base.common.InformNLS( User,
			"placeholder for german.",
			"The powerfull lightningstrike crashed into the earth and revealed a long-lost treasure.");
	 return
	end
elseif (math.random( 200 ) == 1 ) then
      User:inform("This is supposed to hurt me.")
world:gfx( 2, position (User.pos.x, User.pos.y, User.pos.z) )
world:makeSound( 4, position (User.pos.x, User.pos.y, User.pos.z) )
    User:LTIncreaseHP(math.random(-6000,-11000),1,1)
	base.common.InformNLS( User,
            "Der Blitz schlägt vom Himmel herunter direkt in deinen Kopf und ein ungeheurer Schmerz erfüllt deinen Körper.",
            "The lightningbolt crashes down right onto your head and an immense pain fills your body.");
         return 
	     end
     end
end

