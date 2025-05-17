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

return function()
    local self = {}

    function self.add(pos, direction, german, english, hours, months, chance)
        if not self[pos.x] then
            self[pos.x] = {}
        end
        if not self[pos.x][pos.y] then
            self[pos.x][pos.y] = {}
        end
        if not self[pos.x][pos.y][pos.z] then
            self[pos.x][pos.y][pos.z] = {}
        end
        local this = self[pos.x][pos.y][pos.z]
        table.insert(this, {
            direction = direction or {0,1,2,3,4,5,6,7},
            german = german or "",
            english = english or "",
            hours = hours or {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23},
            months = months or {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16},
            chance = chance or 100
        })
    end

    function self.get(Char)
        local pos = Char.pos
        local dir = Char:getFaceTo()

        if self[pos.x] and self[pos.x][pos.y] and self[pos.x][pos.y][pos.z] then
            local this = self[pos.x][pos.y][pos.z]
            local list = {}
            for _, ambient in pairs(this) do
                local timeOk, monthOk, dirOk = false, false, false
                for _, that in pairs(ambient.hours) do
                    if that == world:getTime("hour") then
                        timeOk = true
                        break
                    end
                end
                for _, that in pairs(ambient.months) do
                    if that == world:getTime("month") then
                        monthOk = true
                        break
                    end
                end
                for _, that in pairs(ambient.direction) do
                    if that == dir then
                        dirOk = true
                        break
                    end
                end
                if timeOk and monthOk and dirOk and math.random(0,99) < ambient.chance then
                    table.insert(list, ambient)
                end
            end
            if #list > 0 then
                return list[math.random(1, #list)]
            end
        end
        return nil
    end

    return self
end
