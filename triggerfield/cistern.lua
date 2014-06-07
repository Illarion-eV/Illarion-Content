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
-- triggerfields for better atmosphere

--[[ SQL Statements:
INSERT INTO triggerfields VALUES (X,Y,Z,'triggerfield.cistern');

]]

require("base.common")

module("triggerfield.cistern", package.seeall)

--[[
position: coordinates
direction: array with directions, 0=North,2=East,4=South,6=West. Set nil for always
german/english: text
hours: array with hours when text shall be shown, in range of 0 to 23. Set to nil for always.
months: array with months when text shall be shown, in range of 1 to 16. Set to nil for always.
chance: Chance that this triggerfield is triggered in percent (integer)

for script:
cisternList:add( position(x,y,z), {0,1,7}, "german", "english", {0,1,23}, {1,2,16}, chance );

for db:
INSERT INTO triggerfields VALUES (x,y,z,'triggerfield.cistern');
]]


cisternList = {	add = function ( self, pos, direction, german, english, hours, months, chance )
						if not self[pos.x] then
							self[pos.x] = {};
						end
						if not self[pos.x][pos.y] then
							self[pos.x][pos.y] = {};
						end
						if not self[pos.x][pos.y][pos.z] then
							self[pos.x][pos.y][pos.z] = {};
						end
						local this = self[pos.x][pos.y][pos.z];
						table.insert(this, {
                            direction = direction or {0,1,2,3,4,5,6,7};
							german = german or "";
							english = english or "";
							hours = hours or {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
							months = months or {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
                            chance = chance or 100;
							} );
				end
}

--cistern_dungeon triggers using Ambient.lua as a guide
cisternList:add( position(840,848,-6),nil,"Die Brücke knarrt laut und unheilvoll während du darüber läufst.","The bridge creaks ominously and loud as you walk over it.",nil,nil,30); --cistern_dungeon_-6
cisternList:add( position(823,832,-6),nil,"Du hörst das Trippeln vieler kleiner Füsse, als du um die Ecke gehst.","You hear the scurrying of lots of little feet as you round the corner.",nil,nil,30); --cistern_dungeon_-6
cisternList:add( position(822,832,-6),nil,"Du hörst das Trippeln vieler kleiner Füsse, als du um die Ecke gehst.","You hear the scurrying of lots of little feet as you round the corner.",nil,nil,30); --cistern_dungeon_-6
cisternList:add( position(821,832,-6),nil,"Du hörst das Trippeln vieler kleiner Füsse, als du um die Ecke gehst.","You hear the scurrying of lots of little feet as you round the corner.",nil,nil,30); --cistern_dungeon_-6
cisternList:add( position(820,832,-6),nil,"Du hörst das Trippeln vieler kleiner Füsse, als du um die Ecke gehst.","You hear the scurrying of lots of little feet as you round the corner.",nil,nil,30); --cistern_dungeon_-6
cisternList:add( position(838,836,-6),nil,"Da ist ein lautes Krachen als du versuchst durch einen Engen Platz zu gehen. Als du rüber schaust, wirst du wohl viele Paare leuchtender Augen entdecken, die von den Stalagmiten und Steinen zu dir rüberschauen","There's a loud crash as you are trying to get through a tight space, as you look over, you see many sets of glowing eyes looking at you from within the stalagmites and rocks.",nil,nil,30); --cistern_dungeon_-6
cisternList:add( position(847,844,-6),nil,"Als du über den Stein wischt, erreicht dich eine Klaue von irgendwoher versteckt dahinter und kratzt herüber zu deiner Hand. Glücklicherweise berührt sie dich kaum dabei.","As you brush past the rock, a claw reaches out from somewhere hidden behind it and scratches across your hand, thankfully, barely touching you.",nil,nil,30); --cistern_dungeon_-6
cisternList:add( position(837,840,-3),nil,"Eine Bohle bricht, dein Fuß schlittert durch ein Loch ins Wasser und den Schlamm darunter.","A board cracks, breaking apart, your foot slips through the hole, slamming down into the water and mud below.",nil,nil,30); --cistern_dungeon_-3
cisternList:add( position(832,831,-3),nil,"Auf dem riesigen felsigen Pfeiler über dir hörst du ein Geräusch. Als du hochschaust siehst du wie eine riesige Ratte über deinen Kopf springt auf einem Stalagmiten landet und in die Dunkelheit davon huscht.","You hear something over your head atop the rocky mountainous pile. As you look up, you see a huge rat fling itself over your head and land on a stalagmite and scurry away into the dark.",nil,nil,30); --cistern_dungeon_-3
cisternList:add( position(839,823,-6),nil,"Ein seltsamer Geruch verpestet die Luft, als du dich umschaust, siehst du, dass jemand den Kadaver einer Ratte in das Feuer geworfen hat.","A strange smell permeates the air, looking around, you can see someone has thrown the carcass of a rat on the fire.",nil,nil,30); --cistern_dungeon_-6

--cistern_storage triggers using Ambient.lua as a guide
cisternList:add( position(355,471,-6),nil,"Du hörst etwas über deinem Kopf, als du hochschaust siehst du wie sich eine riesige Ratte über deinen Kopf katapultiert, auf einem Stalagmiten landet und in die Dunkelheit davon huscht.","You hear something over your head. As you look up, you see a huge rat fling itself over your head and land on a stalagmite and scurry away into the dark.",nil,nil,30); --cistern_storage
cisternList:add( position(354,471,-6),nil,"Du hörst etwas über deinem Kopf, als du hochschaust siehst du wie sich eine riesige Ratte über deinen Kopf katapultiert, auf einem Stalagmiten landet und in die Dunkelheit davon huscht.","You hear something over your head. As you look up, you see a huge rat fling itself over your head and land on a stalagmite and scurry away into the dark.",nil,nil,30); --cistern_storage
cisternList:add( position(360,464,-6),nil,"Als du durch die Tür schaust, hörst du ein Scharren auf der anderen Seite.","As you look through the door, you hear lots of scrabbling on the other side.",nil,nil,30); --cistern_storage
cisternList:add( position(360,465,-6),nil,"Als du durch die Tür schaust, hörst du ein Scharren auf der anderen Seite.","As you look through the door, you hear lots of scrabbling on the other side.",nil,nil,30); --cistern_storage
cisternList:add( position(368,471,-6),nil,"Die Brücke knarrt laut und unheilvoll während du darüber läufst.","The bridge creaks ominously and loud as you walk over it.",nil,nil,30); --cistern_storage
cisternList:add( position(368,470,-6),nil,"Die Brücke knarrt laut und unheilvoll während du darüber läufst.","The bridge creaks ominously and loud as you walk over it.",nil,nil,30); --cistern_storage
cisternList:add( position(382,482,-6),nil,"Eine Riesige Kanalratte springt überraschend hinter dem großen glühendem Pilz hervor und erschreckt dich.","A giant sewer rat jumps out from behind the huge glowing mushroom, startling the unprepared mind.",nil,nil,30); --cistern_storage

-- cistern_cave triggers using Ambient.lua as a guide
cisternList:add( position(105,580,-6),nil,"Wenn Du dich umsiehst erkennst Du, das alle möglichen Dinge herumgeschleppt und in Haufen gelagert worden.","As you look around, you can see where things have been carried off and stored in little piles all around.",nil,nil,30); --cistern_cave
cisternList:add( position(114,583,-6),nil,"Wenn Du dich umsiehst erkennst Du, das alle möglichen Dinge herumgeschleppt und in Haufen gelagert worden.","As you look around, you can see where things have been carried off and stored in little piles all around.",nil,nil,30); --cistern_cave
cisternList:add( position(115,560,-6),nil,"Ein strenger Geruch liegt in der Luft. Beim Umsehen erkennst Du, das jemand einen Rattenkadaver ins Feuer geworfen hat.","A strange smell permeates the air, looking around, you can see someone has thrown the carcass of a rat on the fire.",nil,nil,30); --cistern_cave
cisternList:add( position(135,556,-6),nil,"Ein strenger Geruch liegt in der Luft. Beim Umsehen erkennst Du, das jemand einen Rattenkadaver ins Feuer geworfen hat.","A strange smell permeates the air, looking around, you can see someone has thrown the carcass of a rat on the fire.",nil,nil,30); --cistern_cave
cisternList:add( position(105,563,-6),nil,"Die Brücke knarrt laut und unheilvoll während du darüber läufst.","The bridge creaks ominously and loud as you walk over it.",nil,nil,30); --cistern_cave
cisternList:add( position(113,570,-6),nil,"Eine Riesige Kanalratte springt überraschend hinter dem großen glühendem Pilz hervor und erschreckt dich.","A giant sewer rat jumps out from behind the huge glowing mushroom, startling the unprepared mind.",nil,nil,30); --cistern_cave

function MoveToField(Char)
	local this = getcistern(Char);
	if this then
		base.common.InformNLS(Char,this.german,this.english);
	end
end

function getcistern(Char)
	local pos = Char.pos;
	local dir = Char:getFaceTo();
	if cisternList[pos.x] and cisternList[pos.x][pos.y] and cisternList[pos.x][pos.y][pos.z] then
		local this = cisternList[pos.x][pos.y][pos.z];
		local list = {};
		for _,cistern in pairs(this) do
			local timeOk, monthOk, dirOk = false, false, false;
			for _,that in pairs(cistern.hours) do
				if that==world:getTime("hour") then
					timeOk = true;
					break;
				end
			end
			for _,that in pairs(cistern.months) do
				if that==world:getTime("month") then
					monthOk = true;
					break;
				end
			end
			for _,that in pairs(cistern.direction) do
				if that==dir then
					dirOk = true;
					break;
				end
			end
			if timeOk and monthOk and dirOk and math.random(0,99)<cistern.chance then --chance!
				table.insert(list,cistern);
			end
		end
		if table.getn(list)>0 then
			return list[math.random(1,table.getn(list))];
		end
	end
	return nil;
end
