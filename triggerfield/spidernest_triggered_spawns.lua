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
-- INSERT INTO triggerfields VALUES (901, 530, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (844, 484, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (874, 494, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (903, 470, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (909, 467, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (889, 454, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (850, 464, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (888, 505, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (849, 536, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (848, 533, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (921, 542, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (918, 517, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (910, 521, -6,'triggerfield.spidernest_triggered_spawns');

-- INSERT INTO triggerfields VALUES (844, 472, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (837, 462, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (844, 480, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (834, 453, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (856, 471, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (866, 476, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (884, 477, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (873, 501, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (865, 520, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (908, 508, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (898, 519, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (844, 527, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (894, 529, -6,'triggerfield.spidernest_triggered_spawns');


require("base.common")

module("triggerfield.spidernest_triggered_spawns", package.seeall)

--This script handles scripted events on "Spider Nest" quest map
--Various events and fields are handled here for a better overview

function Init()

    if InitDone then
        return
    end

    waypoint={}; --a list with positions of the event triggers
    waypoint[1]=position(901, 530, -6); -- small spider swarm
    waypoint[2]=position(844, 484, -6);
    waypoint[3]=position(874, 494, -6);
    waypoint[4]=position(903, 470, -6);
	waypoint[5]=position(909, 467, -6);
    waypoint[6]=position(889, 454, -6);
    waypoint[7]=position(850, 464, -6);
    waypoint[8]=position(888, 505, -6);
    waypoint[9]=position(849, 536, -6);
    waypoint[10]=position(848, 533, -6);
	waypoint[11]=position(921, 542, -6);
    waypoint[12]=position(918, 517, -6);
    waypoint[13]=position(910, 521, -6);

	waypoint[14]=position(844, 472, -6); -- one big spider
    waypoint[15]=position(837, 462, -6);
    waypoint[16]=position(844, 480, -6);
    waypoint[17]=position(834, 453, -6);
	waypoint[18]=position(856, 471, -6);
    waypoint[19]=position(866, 476, -6);
    waypoint[20]=position(884, 477, -6);
    waypoint[21]=position(873, 501, -6);
    waypoint[22]=position(865, 520, -6);
    waypoint[23]=position(908, 508, -6);
	waypoint[24]=position(898, 519, -6);
    waypoint[25]=position(844, 527, -6);
    waypoint[26]=position(894, 529, -6);

    messageG={}; --German informs
    messageG[1]="Du bringst ein Nest durcheinander und wirst von Spinnen umzingelt!";
    messageG[2]="Du schreckts eine spinne auf und wirst sofort angegriffen!";

    messageE={}; --English informs
    messageE[1]="You disturb a nest of spiders and are swarmed!";
    messageE[2]="You disturb a spider and are immediately attacked!";

    InitDone = true;

end

function MoveToField(User)

    Init(); --Initialising

    if User:getType() == 0 and User:increaseAttrib("hitpoints",0)>0 and math.random(1,4) == 1 then --only player characters trigger the triggerfield at a chance of 20%

		local theWaypoint;
		for i = 1, #waypoint do
			if User.pos == waypoint[i] then
				theWaypoint = i;
				break;
			end
		end

		if theWaypoint >= 0 and theWaypoint <= 13 then -- small spider swarm

            base.common.InformNLS(User,messageG[1],messageE[1]); --sending a message

			for i = 1, math.random(3,9) do -- random count
				local monPos = getFreePos( waypoint[theWaypoint], 3 ); -- radius 3 around triggerfile
				world:createMonster(196, monPos, 0); -- small spider
				world:gfx(41, monPos); -- swirly
			end

		elseif theWaypoint >= 14 and theWaypoint <= 26 then -- one big spider

            base.common.InformNLS(User,messageG[2],messageE[2]); --sending a message

			local monList = {191,192,262,231} -- Rekrap, Pitservant, Soulpain, Kingsfright
			local monPos = getFreePos( waypoint[theWaypoint], 2 ); -- radius 2 around triggerfield
			world:createMonster(monList[math.random(1, #monList)], monPos, 0); -- 1 random spider of our list
			world:gfx(41, monPos); -- swirly

		end --all events handled

    end --triggerfield

end --function



function getFreePos(CenterPos, Rad)
	local tarPos;
	local countPos = 0;
	while true do
		tarPos = position(CenterPos.x+math.random(-Rad,Rad),CenterPos.y+math.random(-Rad,Rad),CenterPos.z);
		if not world:isItemOnField( tarPos ) and not world:isCharacterOnField( tarPos ) then
			tileID = world:getField( tarPos ):tile();
			if tileID ~= 0 and tileID ~= 5 and tileID ~= 6 and tileID~=42 and tileID ~= 43 and tileID~= 34 then --no inpassable tiles
				countPos = 0;
				return tarPos;
			else
				countPos = countPos +1;
				if countPos > 50 then
					countPos = 0;
					return CenterPos;
				end
			end
		else
			countPos = countPos +1;
			if countPos > 50 then
				countPos = 0;
				return CenterPos;
			end
		end
	end
end

