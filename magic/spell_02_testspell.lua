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
-- TestScript für neues Magie System
-- Rune 2 - RA
-- INSERT INTO spells VALUES (1,0,'m_01_testspell.lua');
-- Flächen Zauber
-- Effekt Zauber
module("magic.spell_02_testspell", package.seeall)

function CastMagic(Caster,ltstate)
	Caster:inform("moep");
	
    find, magicEffect =  Caster.effects:find(600);
    if find then
    
    	found,magicWaterNew = magicEffect:findValue("magicWater");    -- get the strength of the effect water
	found,magicFireNew = magicEffect:findValue("magicFire");    -- get the strength of the effect fire
	Caster:inform("Ui...ein Wasserspruch!");
	if found then
	       magicWaterNew=magicWaterNew+1;
	       magicFireNew=magicFireNew-1;
	Caster:inform("Wasserskill erhöht - Feuerskill gesenkt");
	end
    end
    magicEffect:addValue("magicWater",magicWaterNew);
    magicEffect:addValue("magicFire",magicFireNew);
	
	Caster:inform("moepEnde");
	
end

function CastMagicOnCharacter(Caster,TargetCharacter,ltstate)
end

function CastMagicOnField(Caster,Targetpos,ltstate)
end

function CastMagicOnItem(Caster,TargetItem,ltstate)
end
