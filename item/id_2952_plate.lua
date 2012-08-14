require("base.common")

module("item.id_2952_plate", package.seeall)

function LookAtItem(User,Item)
    if Item.pos == position(891,390,0) then -- cherga temple, infront of Mirror of Death
	    world:itemInform( User,Item,base.common.GetNLS( User, "Opferschale", "Sacrificial bowl") )
    else
        world:itemInform( User,Item,base.common.GetNLS( User, "Teller", "plate") )
    end
end

function CharacterOnField(User)
    if User.pos == position(891,390,0) then -- cherga temple, infront of Mirror of Death
	    User:increaseAttrib("hitpoints",-500)
		world:gfx(44,User.pos)
		User:move(6,true)
		base.common.HighInformNLS(User,"Deine Füße brennen schmerzhaft und du springst schnell weg.","Your feet brun painfully and you leap aside.")
	end	
end