
module("monster.mon_241_pig", package.seeall)

function onSpawn(thisPig)
    red,green,blue=thisPig:getSkinColor();
    red=red-15+random(30);
    green=green-15+random(30);
    blue=blue-15+random(30);
    thisPig:setSkinColor(red,green,blue);
end