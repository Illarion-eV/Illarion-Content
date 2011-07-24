
module("monster.mon_241_pig", package.seeall)

function onSpawn(thisPig)
    red,green,blue=thisPig:getSkinColor();
    red=math.min(255,red-60+random(120));
    green=math.min(255,green-60+random(120));
    blue=math.min(255,blue-60+random(120));
    
    thisPig:setSkinColor(red,green,blue);
end