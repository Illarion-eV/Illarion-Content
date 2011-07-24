
module("monster.mon_241_pig", package.seeall)

function onSpawn(thisPig)
    var=30;
    red,green,blue=thisPig:getSkinColor();
    red=math.min(255,red-var+math.random(2*var));
    green=math.min(255,green-var+math.random(2*var));
    blue=math.min(255,blue-var+math.random(2*var));
    
    thisPig:setSkinColor(red,green,blue);
end