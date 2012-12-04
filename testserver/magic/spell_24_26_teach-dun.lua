--[[
    Teach rune: DUN
    Rune 24 & 26
        DUN BHONA

    Teaching-Spell

    SQL:    INSERT INTO spells VALUES (2^23+2^25,0,'m_24_26_teach-dun.lua');
]]

require("magic.base.teachspell");
module("magic.spell_24_26_teach-dun", package.seeall)
-- Informations about the rune
Rune = {
    ["name"] = "DUN",   -- name of the rune
    ["class"] = 3,      -- class of the rune ( 1 = weak, 2 = normal, 3 = strong )
    ["value"] = 23       -- value of the rune
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
