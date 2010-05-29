--[[
    Teach rune: IRA
    Rune 11 & 26
        IRA BHONA

    Teaching-Spell

    SQL:    INSERT INTO spells VALUES (2^10+2^25,0,'m_11_26_teach-ira.lua');
]]

require("magic.base.teachspell");
module("magic.spell_11_26_teach-ira", package.seeall)
-- Informations about the rune
Rune = {
    ["name"] = "IRA",   -- name of the rune
    ["class"] = 2,      -- class of the rune ( 1 = weak, 2 = normal, 3 = strong )
    ["value"] = 10      -- value of the rune
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
