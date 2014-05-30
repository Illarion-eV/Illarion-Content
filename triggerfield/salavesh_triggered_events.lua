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
require("base.common")

module("triggerfield.salavesh_triggered_events", package.seeall)

--This script handles scripted events on "Errant Crusade" quest map
--Various events and fields are handled here for a better overview

function Init()

    if InitDone then
        return
    end

    waypoint={}; --a list with positions of the event triggers
    waypoint[1]=position(710,405,-3); --1: A firetrap
    waypoint[2]=position(749,442,-3); --2: A boss in the small alcove
    waypoint[3]=position(718,432,-3); --3: An ambush by mummies
    waypoint[4]=position(759,388,-3); --4: An icetrap and ambush by imps
	waypoint[5]=position(689,440,-3); --5: A boss in the big alcove
    waypoint[6]=position(698,449,-3); --6: An ambush by slime in the flooded tunnel

    messageG={}; --German informs
    messageG[1]="Ein Falle löst aus!";
    messageG[2]="Dein letzter Schritt war bei weitem der schlechteste am heutigen Tage...";
	messageG[3]="Von hirnlosen Wesen der Verdammnis in einen Hinterhalt gelockt zu werden ist ganz schön nervig, oder?";
	messageG[4]="Du hast eine lähmende Eisfalle ausgelöst. Kobolde fallen aus der Dunkelheit über dich her!";
	messageG[5]="Aus der Dunkelheit siehst du das fahle Schimmern einer unheimlichen Präsenz auf dich zuschlurfen...";
	messageG[6]="Ein widerlicher Gestank steigt in deine Nase. Aus dem trüben Wasser in diesem überfluteten Tunnel bewegen sich formlose Geschöpfe auf dich zu.";

    messageE={}; --English informs
    messageE[1]="You've sprung a trap!";
    messageE[2]="The last step you took was by far the worst today...";
	messageE[3]="Getting ambushed by mindless creatures of doom sucks, doesn't it?";
	messageE[4]="You've triggered a paralysing icetrap. Imps jump at you out of the darkness!";
	messageE[5]="Out of the darkness, you see the faint gleeming of a dark presence limping towards you...";
	messageE[6]="A disgusting stench reaches your nose. Out of the muddy water in this flooded tunnel, formless creatures approach you.";

    InitDone = true;

end

function MoveToField(User)

	if User:getType() ~= Character.player then
		return
	end

    Init(); --Initialising

    if math.random(1,5) == 1 then --only player characters trigger the triggerfield at a chance of 20%

		queststatus=User:getQuestProgress(121); --here, we save which events were triggered
		queststatuslist={};
		queststatuslist=base.common.Split_number(queststatus, 6); --reading the digits of the queststatus as table

		if User.pos == waypoint[1] and queststatuslist[1] == 0 then --the firetrap, only triggered once by each char

			queststatuslist[1]=1; --triggered it!
            base.common.InformNLS(User,messageG[1],messageE[1]); --sending a message
            User:setQuestProgress(121,queststatuslist[1]*100000+queststatuslist[2]*10000+queststatuslist[3]*1000+queststatuslist[4]*100+ queststatuslist[5]*10+ queststatuslist[6]*1); --saving the new queststatus
			queststatus=User:getQuestProgress(121); --and reading it again

			--The actual event
			world:gfx(9,User.pos); --Fireball!
			world:makeSound(5,User.pos); --BOOM!
		    User:increaseAttrib("hitpoints",math.random(-4999,-2499)); --damaging the User
			world:createItemFromId(359,1,User.pos,true,599,nil); --a flame
			world:createItemFromId(359,1,position(User.pos.x+1,User.pos.y,User.pos.z),true,599,nil); --another flame
			world:createItemFromId(359,1,position(User.pos.x-1,User.pos.y,User.pos.z),true,599,nil); --yet another
			world:createItemFromId(359,1,position(User.pos.x,User.pos.y+1,User.pos.z),true,599,nil); --pretty hot isn't it?
			world:createItemFromId(359,1,position(User.pos.x,User.pos.y-1,User.pos.z),true,599,nil); --BURN SUCKER!!!111

		elseif User.pos == waypoint[2] and queststatuslist[2] == 0 and User:getFaceTo() == 6 then --the boss in the small alcove, only triggered once by each char upon entering the alcove

			queststatuslist[2]=1; --triggered it!
            base.common.InformNLS(User,messageG[2],messageE[2]); --sending a message
            User:setQuestProgress(121,queststatuslist[1]*100000+queststatuslist[2]*10000+queststatuslist[3]*1000+queststatuslist[4]*100+ queststatuslist[5]*10+ queststatuslist[6]*1); --saving the new queststatus

			--The actual event
			monsterpos=position(744,443,-3);
            world:gfx(41,monsterpos); --swirly
            world:createMonster(534,monsterpos,0); --zombie giant
		    world:makeSound(25,monsterpos); --MWHAHAHA!

		elseif User.pos == waypoint[3] and queststatuslist[3] == 0 then --an ambush by mummies

			queststatuslist[3]=1; --triggered it!
            base.common.InformNLS(User,messageG[3],messageE[3]); --sending a message
            User:setQuestProgress(121,queststatuslist[1]*100000+queststatuslist[2]*10000+queststatuslist[3]*1000+queststatuslist[4]*100+ queststatuslist[5]*10+ queststatuslist[6]*1); --saving the new queststatus

			--The actual event
            world:gfx(41,position(721,429,-3));
            world:createMonster(101,position(721,429,-3),0); --mummy
			world:gfx(41,position(721,434,-3));
            world:createMonster(101,position(721,434,-3),0); --another mummy
            world:gfx(41,position(723,431,-3));
            world:createMonster(152,position(723,431,-3),0); --smelly mummy
			world:gfx(41,position(714,431,-3));
            world:createMonster(172,position(714,431,-3),0); --mummified temple servant
			world:gfx(41,position(716,434,-3));
            world:createMonster(701,position(716,434,-3),0); --Cherga's servant

		elseif User.pos == waypoint[4] and queststatuslist[4] == 0 then --icetrap and an ambush by imps

			queststatuslist[4]=1; --triggered it!
            base.common.InformNLS(User,messageG[4],messageE[4]); --sending a message
            User:setQuestProgress(121,queststatuslist[1]*100000+queststatuslist[2]*10000+queststatuslist[3]*1000+queststatuslist[4]*100+ queststatuslist[5]*10+ queststatuslist[6]*1); --saving the new queststatus

			--The actual event

			world:gfx(3,User.pos); --Iceball!
			world:makeSound(5,User.pos); --BOOM!
		    User:increaseAttrib("hitpoints",math.random(-2499,-1249)); --damaging the User
			User.movepoints=User.movepoints-50; --Paralysing the user

            world:gfx(41,position(756,391,-3));
            world:createMonster(551,position(756,391,-3),0); --imp
			world:gfx(41,position(761,393,-3));
            world:createMonster(551,position(761,393,-3),0); --another imp
			world:gfx(41,position(757,386,-3));
            world:createMonster(891,position(757,386,-3),0); --fire imp
            world:gfx(41,position(758,396,-3));
            world:createMonster(901,position(758,396,-3),0); --shadow imp

		elseif User.pos == waypoint[5] and queststatuslist[5] == 0 and User:getFaceTo() == 6 then --the boss in the small alcove, only triggered once by each char upon entering the alcove

			queststatuslist[5]=1; --triggered it!
            base.common.InformNLS(User,messageG[5],messageE[5]); --sending a message
            User:setQuestProgress(121,queststatuslist[1]*100000+queststatuslist[2]*10000+queststatuslist[3]*1000+queststatuslist[4]*100+ queststatuslist[5]*10+ queststatuslist[6]*1); --saving the new queststatus

			--The actual event
			monsterpos=position(679,441,-3);
            world:gfx(41,monsterpos); --swirly
            world:createMonster(203,monsterpos,0); --Unholy akolyth (demon skeleton)
		    world:makeSound(25,monsterpos); --MWHAHAHA!

		elseif User.pos == waypoint[6] and queststatuslist[6] == 0 then --an ambush by slime in the flooded tunnel

			queststatuslist[6]=1; --triggered it!
            base.common.InformNLS(User,messageG[6],messageE[6]); --sending a message
            User:setQuestProgress(121,queststatuslist[1]*100000+queststatuslist[2]*10000+queststatuslist[3]*1000+queststatuslist[4]*100+ queststatuslist[5]*10+ queststatuslist[6]*1); --saving the new queststatus

			--The actual event
            world:gfx(41,position(695,447,-3));
            world:createMonster(611,position(695,447,-3),0); --slime
            world:gfx(41,position(695,449,-3));
            world:createMonster(1042,position(695,449,-3),0); --wandering garbage
			world:gfx(41,position(695,450,-3));
            world:createMonster(612,position(695,450,-3),0); --slimy slime

		end --all events handled

    end --triggerfield

end --function
