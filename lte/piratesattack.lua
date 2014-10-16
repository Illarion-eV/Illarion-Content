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
-- PiratesAttack, id 82
-- controll the pirates attack in base.seafaring

local common = require("base.common")
local seafaring = require("base.seafaring")
local M = {}

travlerslist={}

function M.addEffect(Effect,User)                               

end

function M.callEffect(Effect,User)
    local travlers = world:getPlayersInRangeOf(User.pos, 40) 
    travlerslist[User.name] = travlers
    local theQuestStatus=User:getQuestProgress(662)

    for i,player in ipairs(travlerslist[User.name]) do
        local theCounterStatus=player:getQuestProgress(663)
        if theCounterStatus == theQuestStatus then
        player:setQuestProgress(663,0)

            if theQuestStatus == 6 then
                seafaring.piratesTimeWarning(User)
            end 

            if theQuestStatus < 31 then
                if not seafaring.piratesPiratesAreThere(User) then
                    seafaring.piratesPiratesKill(User,seafaring.previousselected,seafaring.travlerslist[User.name])
                    return false
                else
                    for d=1,2 do
                        local checkDoor = world:getItemOnField(seafaring.pirateDoors[d])
                        if checkDoor.id == 3318 then
                            seafaring.piratesGeorgeBackstabRocks(User)
                            return false
                        end
                    end
                end
            end

        end
    end

    if theQuestStatus > 0 then 
        User:setQuestProgress(662,theQuestStatus-1) --cooling!
        User:setQuestProgress(663,theQuestStatus-1)
    else
        if seafaring.piratesPiratesAreThere(User) then
            seafaring.piratesPiratesRule(User)
        end
        return false
    end
    Effect.nextCalled = 100 --Effect gets called each 10 seconds
    return true
end

function M.removeEffect(Effect,User)

end

function M.loadEffect(Effect,User)                  			

end

return M

