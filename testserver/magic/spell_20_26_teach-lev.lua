--[[
    Teach rune: LEV
    Rune 20 & 26
        LEV BHONA

    Teaching-Spell

    SQL:    INSERT INTO spells VALUES (2^19+2^25,0,'m_20_26_teach-lev.lua');
]]

require("magic.base.teachspell");
module("magic.spell_20_26_teach-lev", package.seeall)
-- Informations about the rune
Rune = {
    ["name"] = "LEV",   -- name of the rune
    ["class"] = 3,      -- class of the rune ( 1 = weak, 2 = normal, 3 = strong )
    ["value"] = 19       -- value of the rune
}

-- Teacher related informations
Teacher = {
    ["skill"] = {               -- The required skill of the teacher
        ["name"] = "transformo",   -- name of the skill that is required
        ["value"] = 0          -- value of the skill that is required
    },
    ["attribsum"] = 50          -- sum of attributes that are required
}

-- Student related informations
Student = {
    ["skill"] = {               -- Skill requirements to the student
        ["name"] = "transformo",   -- name of the skill that is required
        ["value"] = 0          -- value of the skill that is required
    },
    ["attribsum"] = 40         -- attribute requirements to the student
}
