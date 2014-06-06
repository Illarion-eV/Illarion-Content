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
module("base.gems", package.seeall)

-- calculates the gem bonus and returns it in %
function getGemBonus(item)
    gemStrength={};
    gemStrength[1]=extractNum(item:getData("magicalEmerald"));
    gemStrength[2]=extractNum(item:getData("magicalRuby"));
    gemStrength[3]=extractNum(item:getData("magicalTopaz"));
    gemStrength[4]=extractNum(item:getData("magicalAmethyst"));
    gemStrength[5]=extractNum(item:getData("magicalSapphire"));
    gemStrength[6]=extractNum(item:getData("magicalObsidian"));

    gemSum=0;
    gemMin=1000;   -- arbitrarily high number

    for _, gStrength in pairs(gemStrength) do
        gemSum=gemSum+gStrength;
        if gStrength<gemMin then gemMin=gStrength end;
    end

    return gemSum+gemMin*6;

end

function extractNum(text)
    if text=="" then
        return 0
    end
    return tonumber(text)
end

