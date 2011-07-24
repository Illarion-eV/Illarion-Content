
module("monster.mon_241_pig", package.seeall)

function onSpawn(thisPig)
    red,green,blue=thisPig:getSkinColor();
    --red=red-30+random(60);
    --green=green-30+random(60);
    --blue=blue-30+random(60);
    red=100;
    green=40;
    blue=40;
    
    thisPig:setSkinColor(red,green,blue);
end