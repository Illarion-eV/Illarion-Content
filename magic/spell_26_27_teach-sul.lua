--[[
    Teach rune: SUL
    Rune 26 & 27
        SUL BHONA

    Teaching-Spell

    SQL:    INSERT INTO spells VALUES (2^26+2^25,0,'m_26_27_teach-sul.lua');
]]

require("magic.base.teachspell");
module("magic.spell_26_27_teach-sul", package.seeall)
-- Informations about the rune
Rune = {
    ["name"] = "SUL",   -- name of the rune
    ["class"] = 2,      -- class of the rune ( 1 = weak, 2 = normal, 3 = strong )
    ["value"] = 26      -- value of the rune
}

-- Teacher related informations
Teacher = {
    ["skill"] = {               -- The required skill of the teacher
        ["name"] = "desicio",  -- name of the skill that is required
        ["value"] = 50          -- value of the skill that is required
    },
    ["attribsum"] = 40          -- sum of attributes that are required
}

-- Student related informations
Student = {
    ["skill"] = {               -- Skill requirements to the student
        ["name"] = "desicio",   -- name of the skill that is required
        ["value"] = 20          -- value of the skill that is required
    },
    ["attribsum"] = 33         -- attribute requirements to the student
}
