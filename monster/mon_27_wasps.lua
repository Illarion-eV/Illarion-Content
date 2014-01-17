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
require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
require("monster.base.kills")
require("base.arena")
require("base.explosion")
module("monster.mon_27_wasps", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages

msgs = base.messages.Messages();
msgs:addMessage("#me fliegt, ein hohes, weinerlich klingendes Geräusch machend umher.", "#me flies around, making a high pitched whining sound.");
msgs:addMessage("#me landet nur um wieder abheben zu können begleitet von einem kurzen Summen.", "#me lands, only to take off again with a short buzz.");
msgs:addMessage("#me peitscht, einen Landeplatz suchend durch die Luft.", "#me whips about in the air, searching for somewhere to land.");
msgs:addMessage("#me schwirrt drohend in keine bestimmte Richtung.", "#me angrily buzzes around in no particular direction.");
msgs:addMessage("Bzzz.", "Bzzz.");
msgs:addMessage("#me fliegt in wilden Kreisen und man kann das Gift an ihrem Stachel aufglänzen sehen.", "#me darts around, one can see venom dripping from its sting.");
msgs:addMessage("#me fährt ihren spitzen Stachel aus.", "#me extends its sting.");
msgs:addMessage("Summ, summ.", "Buzz, buzz.");
msgs:addMessage("Bsss.", "Bsss.");
msgs:addMessage("#mes Flügel verbreiten ein hochfrequentes Summen, welches in den Ohren schmerzt.", "#me's wings exude a buzzing with high frequency, it hurts one's ears.");

end

function enemyNear(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end

    local MonID=Monster:getMonsterType();
    if (MonID==278) then
        world:gfx(9,Monster.pos);
    end
    return false
end

function enemyOnSight(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while

    local MonID=Monster:getMonsterType();
    if (MonID==278) then
        world:gfx(9,Monster.pos);
    end
    if monster.base.drop.DefaultSlowdown( Monster ) then
        return true
    else
        return false
    end
end

function onAttacked(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onCasted(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onDeath(Monster)

    if base.arena.isArenaMonster(Monster) then
        return
    end

    local MonID=Monster:getMonsterType();
    if (MonID==278) then -- wasp of Fire!!!
		base.explosion.CreateExplosion(Monster.pos);
    end

	monster.base.drop.ClearDropping();
    monster.base.drop.AddDropItem(2529,1,100,333,0,1); --honeycombs
    monster.base.drop.Dropping(Monster);
end
