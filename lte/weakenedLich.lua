-- Turns a weakened lich back to a normal one

module("lte.weakenedLich", package.seeall)

function addEffect(theEffect, weakendLich)               				

end

function callEffect(theEffect, weakendLich) 

	weakendLich:increaseAttrib("hitpoints",-10000)
	local strongLich = world:createMonster(205,weakendLich.pos,-20)
	world:gfx(51,strongLich.pos)
	strongLich:talk(Character.say,"#me wird von einer unheiligen Flamme umhüllt und seine Knochen beginnen rot zu leuchten. 'Ich bin wieder da, närrische Sterbliche!', schreit er.","#me is enwrapped by an unholy flame and his bones start to glow red.'I am back, foolish mortals!', he cries.")
	world:makeSound(25,strongLich.pos)
	
	return false
end

function removeEffect(theEffect, weakendLich) 

end

function loadEffect(theEffect, weakendLich)           			

end