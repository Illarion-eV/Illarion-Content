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
-- INSERT INTO triggerfields VALUES (892, 492, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (910, 521, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (920, 500, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (905, 491, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (884, 542, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (866, 545, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (876, 528, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (849, 492, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (854, 498, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (856, 492, -6,'triggerfield.spidernest_triggered_spawns');

-- INSERT INTO triggerfields VALUES (844, 472, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (837, 462, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (852, 487, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (845, 452, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (856, 471, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (866, 476, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (884, 477, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (873, 501, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (865, 520, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (908, 508, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (898, 518, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (865, 528, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (894, 529, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (872, 542, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (884, 527, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (864, 509, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (882, 504, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (917, 493, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (920, 466, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (903, 456, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (858, 456, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (846, 476, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (836, 502, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (849, 516, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (836, 527, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (917, 517, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (918, 541, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (917, 544, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (926, 515, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (911, 502, -6,'triggerfield.spidernest_triggered_spawns');
-- INSERT INTO triggerfields VALUES (891, 483, -6,'triggerfield.spidernest_triggered_spawns');


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
    waypoint[12]=position(892, 492, -6);
    waypoint[13]=position(910, 521, -6);
	waypoint[14]=position(920, 500, -6);
	waypoint[15]=position(905, 491, -6);
	waypoint[16]=position(884, 542, -6);
	waypoint[17]=position(866, 545, -6);
	waypoint[18]=position(876, 528, -6);
	waypoint[19]=position(849, 492, -6);
	waypoint[20]=position(854, 498, -6);
	waypoint[21]=position(856, 492, -6);

	waypoint[22]=position(844, 472, -6); -- one big spider
    waypoint[23]=position(837, 462, -6);
    waypoint[24]=position(852, 487, -6);
    waypoint[25]=position(845, 452, -6);
	waypoint[26]=position(856, 471, -6);
    waypoint[27]=position(866, 476, -6);
    waypoint[28]=position(884, 477, -6);
    waypoint[29]=position(873, 501, -6);
    waypoint[30]=position(865, 520, -6);
    waypoint[31]=position(908, 508, -6);
	waypoint[32]=position(898, 518, -6);
    waypoint[33]=position(865, 528, -6);
    waypoint[34]=position(894, 529, -6);
	waypoint[35]=position(872, 542, -6);
	waypoint[36]=position(884, 527, -6);
	waypoint[37]=position(864, 509, -6);
	waypoint[38]=position(882, 504, -6);
	waypoint[39]=position(917, 493, -6);
	waypoint[40]=position(920, 466, -6);
	waypoint[41]=position(903, 456, -6);
	waypoint[42]=position(858, 456, -6);
	waypoint[43]=position(846, 476, -6);
	waypoint[44]=position(836, 502, -6);
	waypoint[45]=position(849, 516, -6);
	waypoint[46]=position(836, 527, -6);
	waypoint[47]=position(917, 517, -6);
	waypoint[48]=position(918, 541, -6);
	waypoint[49]=position(917, 544, -6);
	waypoint[50]=position(926, 515, -6);
	waypoint[51]=position(911, 502, -6);
	waypoint[52]=position(891, 483, -6);


    messageG={}; --German informs
    messageG[1]="Du bringst ein Nest durcheinander und wirst von Spinnen umzingelt!";
    messageG[2]="Du schreckst eine Spinne auf und wirst sofort angegriffen!";

    messageE={}; --English informs
    messageE[1]="You disturb a nest of spiders and are swarmed!";
    messageE[2]="You disturb a spider and are immediately attacked!";

    InitDone = true;

end

function MoveToField(User)

    Init(); --Initialising

    if User:getType() == 0 and User:increaseAttrib("hitpoints", 0) > 0 and math.random(1,4) == 1 then --only player characters trigger the triggerfield at a chance of 20%

		local theWaypoint;
		for i = 1, #waypoint do
			if User.pos == waypoint[i] then
				theWaypoint = i;
				break;
			end
		end

		-- skip if already tripped in the last 5 minutes
		if (world:isItemOnField(User.pos) == true) then
			local skele = world:getItemOnField(User.pos);
			local serverTime = world:getTime("unix");
			local trippingTime = skele:getData("tripping_time");

			if (trippingTime ~= "" and ((tonumber(trippingTime) + 300) > serverTime)) then
				return;
			end
		end

		if theWaypoint >= 1 and theWaypoint <= 21 then -- small spider swarm

            base.common.InformNLS(User,messageG[1],messageE[1]); --sending a message

			for i = 1, math.random(3,9) do -- random count
				local monPos = getFreePos( waypoint[theWaypoint], 3 ); -- radius 3 around triggerfile
				world:createMonster(196, monPos, 0); -- small spider
				world:gfx(41, monPos); -- swirly
			end

		elseif theWaypoint >= 22 and theWaypoint <= 52 then -- one big spider

            base.common.InformNLS(User,messageG[2],messageE[2]); --sending a message

			local monList = {191,192,262,231} -- Rekrap, Pitservant, Soulpain, Kingsfright
			local monPos = getFreePos( waypoint[theWaypoint], 2 ); -- radius 2 around triggerfield
			world:createMonster(monList[math.random(1, #monList)], monPos, 0); -- 1 random spider of our list
			world:gfx(41, monPos); -- swirly

		end --all events handled

		-- safe tripping time
		if (world:isItemOnField(User.pos) == true) then
			local skele = world:getItemOnField(User.pos);
			local serverTime = world:getTime("unix");
			skele:setData("tripping_time", serverTime);
			world:changeItem(skele);
		end
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

