--[[
    Teach rune: LUK
    Rune 06 & 26
        LUK BHONA

    Teaching-Spell

    SQL:    INSERT INTO spells VALUES (2^5+2^25,0,'m_06_26_teach-luk.lua');
]]

require("magic.base.teachspell");
module("magic.spell_06_26_teach-luk", package.seeall)
-- Informations about the rune
Rune = {
    ["name"] = "LUK",   -- name of the rune
    ["class"] = 3,      -- class of the rune ( 1 = weak, 2 = normal, 3 = strong )
    ["value"] = 5       -- value of the rune
}

-- Teacher related informations
Teacher = {
    ["skill"] = {               -- The required skill of the teacher
        ["name"] = "desicio",   -- name of the skill that is required
        ["value"] = 60          -- value of the skill that is required
    },
    ["attribsum"] = 50          -- sum of attributes that are required
}

-- Student related informations
Student = {
    ["skill"] = {               -- Skill requirements to the student
        ["name"] = "desicio",   -- name of the skill that is required
        ["value"] = 40          -- value of the skill that is required
    },
    ["attribsum"] = 40         -- attribute requirements to the student
}
