require("base.class")

module("handler.createmonster", package.seeall)



createMonster = base.class.class(function(cremonst, posi, ID, mvpoints, amnt)
	cremonst.pos=posi;
	cremonst.monsterID=ID;
	cremonst.movepoints=mvpoints;
	cremonst.amnt=amnt;
end);
	
function createMonster:execute()
	for i, amnt in pairs() do 
	world:createMonster(self.monsterID, self.pos, self.movepoints);
	end
end