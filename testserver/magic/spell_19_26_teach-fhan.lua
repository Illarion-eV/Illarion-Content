--[[
    Teach rune: FHAN
    Rune 19 & 26
        FHAN BHONA

    Teaching-Spell

    SQL:    INSERT INTO spells VALUES (2^18+2^25,0,'m_19_26_teach-fhan.lua');
]]

require("magic.base.teachspell");
module("magic.spell_19_26_teach-fhan", package.seeall)
-- Informations about the rune
Rune = {
    ["name"] = "FHAN",   -- name of the rune
    ["class"] = 3,      -- class of the rune ( 1 = weak, 2 = normal, 3 = strong )
    ["value"] = 18       -- value of the rune
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
