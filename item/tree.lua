-- Tree Script
-- Envi
require("base.common")
require("content.tree")

module("item.tree", package.seeall)

-- UPDATE common SET com_script='item.tree' WHERE com_itemid IN (308, 586, 1804, 1807, 1808, 1809, 1817);

function LookAtItemIdent(User,Item)
    local test = "no value";
	if (first==nil) then
        content.tree.InitTree()
        first=1;
    end

    -- fetching local references
    local signTextDe     = content.tree.signTextDe;
    local signTextEn     = content.tree.signTextEn;
    local signCoo        = content.tree.signCoo;
    local signItemId     = content.tree.signItemId;
    local signPerception = content.tree.signPerception;

    found = false;
    UserPer = User:increaseAttrib("perception",0);
    tablePosition = Item.pos.x .. Item.pos.y .. Item.pos.z;
	if signCoo ~= nil then
		if (signCoo[tablePosition] ~= nil) then
			for i, signpos in pairs(signCoo[tablePosition]) do
				if equapos(Item.pos,signpos) then
					if (UserPer >= signPerception[tablePosition][i]) then
						found = true;
						world:itemInform(User,Item,base.common.GetNLS(User,string.gsub(signTextDe[tablePosition][i],"currentChar",User.name),string.gsub(signTextEn[tablePosition][i],"currentChar",User.name)));
						test = signTextDe[tablePosition][i];
					end
				end
			end
		end
	end

	local outText = checkNoobiaSigns(User,Item.pos);
	if outText and not found then
		world:itemInform(User,Item,outText);
		found = true;
	end

	if not found then
        world:itemInform(User,Item,base.common.GetNLS(User,"Du siehst ","You see ")..world:getItemName(Item.id,User:getPlayerLanguage()));
    end

		User:inform("in LookAtItem of base_wegweiser.lua");
		User:inform(test);
end

--[[
	LookAtItemIdent
	identity of LookAtItem
]]
LookAtItem = LookAtItemIdent;

function checkNoobiaSigns( User,TargetPos )

	if NoobiaSigns == nil then
		NoobiaSigns = {};
		NoobiaSigns[1] = {position(68,35,101),"Troll's Bane.","Troll's Bane."};
		NoobiaSigns[2] = {position(68,32,101),"Silberbrand, Stadt der Zwerge.","Silverbrand, town of the dwarves."};
		NoobiaSigns[3] = {position(70,32,101),"Tol Vanima, Insel der Elben.","Tol Vanima, island of the elves."};
		NoobiaSigns[4] = {position(72,34,101),"Greenbriar, Stadt der Halblinge.","Greenbriar, town of the halflings."};
		NoobiaSigns[5] = {position(72,36,101),"Varshikar, die Wüstenstadt.","Varshikar, the desert town."};
		--[[
		NoobiaSigns[1] = {position(68,35,101),"Troll's Bane. Derzeitige Bevölkerung: %POPULATION","Troll's Bane. Current population: %POPULATION"};
		NoobiaSigns[2] = {position(68,32,101),"Silberbrand, Stadt der Zwerge. Derzeitige Bevölkerung: %POPULATION","Silverbrand, town of the dwarves. Current population: %POPULATION"};
		NoobiaSigns[3] = {position(70,32,101),"Tol Vanima, Insel der Elben. Derzeitige Bevölkerung: %POPULATION","Tol Vanima, island of the elves. Current population: %POPULATION"};
		NoobiaSigns[4] = {position(72,34,101),"Greenbriar, Stadt der Halblinge. Derzeitige Bevölkerung: %POPULATION","Greenbriar, town of the halflings. Current population: %POPULATION"};
		NoobiaSigns[5] = {position(72,36,101),"Varshikar, die Wüstenstadt. Derzeitige Bevölkerung: %POPULATION","Varshikar, the desert town. Current population: %POPULATION"};
		]]
	end
	for i=1,5 do
		if equapos(TargetPos,NoobiaSigns[i][1]) then
			local lang = User:getPlayerLanguage();
			local pop = getPopulation(i);
			local outText = base.common.GetNLS(User,string.gsub(NoobiaSigns[i][lang+2],"%%POPULATION",""..pop..""),string.gsub(NoobiaSigns[i][lang+2],"%%POPULATION",""..pop..""));
			return outText;
		end
	end
	return nil;
end

function getPopulation( Number )

	local retVal = 0;
	if Number == 1 then
		retVal = retVal + getPlayersOnLevel(position(-100,-110,0),50);
		retVal = retVal + getPlayersOnLevel(position(-100,-110,1),50);
	elseif Number == 2 then
		retVal = retVal + getPlayersOnLevel(position(114,-208,2),30);
	elseif Number == 3 then
		retVal = retVal + getPlayersOnLevel(position(330,230,0),30);
		retVal = retVal + getPlayersOnLevel(position(330,230,1),30);
		retVal = retVal + getPlayersOnLevel(position(330,230,2),30);
		retVal = retVal + getPlayersOnLevel(position(370,216,0),16);
		retVal = retVal + getPlayersOnLevel(position(370,216,1),16);
		retVal = retVal + getPlayersOnLevel(position(370,216,2),16);
		retVal = retVal + getPlayersOnLevel(position(370,216,-3),16);
	elseif Number == 4 then
		retVal = retVal + getPlayersOnLevel(position(-386,72,0),50);
		retVal = retVal + getPlayersOnLevel(position(-386,72,1),50);
	elseif Number == 5 then
		retVal = retVal + getPlayersOnLevel(position(262,-305,0),25);
		retVal = retVal + getPlayersOnLevel(position(238,-326,0),16);
	end
	return retVal;
end

function getPlayersOnLevel( Position, Range )

	local retVal = 0;
	local PlayerList = world:getPlayersInRangeOf(Position,Range);
	for a,Char in pairs(PlayerList) do
		if Char.pos.z == Position.z then
			retVal = retVal +1;
		end
	end
	return retVal;
end
