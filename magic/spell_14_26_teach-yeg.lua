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
--[[
    Teach rune: YEG
    Rune 14 & 26
        YEG BHONA

    Teaching-Spell

    SQL:    INSERT INTO spells VALUES (2^13+2^25,0,'m_14_26_teach-yeg.lua');
]]

local teachspell = require("magic.base.teachspell")
module("magic.spell_14_26_teach-yeg", package.seeall)
-- Informations about the rune
Rune = {
    ["name"] = "YEG",   -- name of the rune
    ["class"] = 2,      -- class of the rune ( 1 = weak, 2 = normal, 3 = strong )
    ["value"] = 13      -- value of the rune
}

-- Teacher related informations
Teacher = {
    ["skill"] = {               -- The required skill of the teacher
        ["name"] = "commotio",  -- name of the skill that is required
        ["value"] = 50          -- value of the skill that is required
    },
    ["attribsum"] = 40          -- sum of attributes that are required
}

-- Student related informations
Student = {
    ["skill"] = {               -- Skill requirements to the student
        ["name"] = "commotio",   -- name of the skill that is required
        ["value"] = 20          -- value of the skill that is required
    },
    ["attribsum"] = 33         -- attribute requirements to the student
}
