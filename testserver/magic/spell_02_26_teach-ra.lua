--[[
    Teach rune: RA
    Rune 02 & 26
        RA BHONA

    Teaching-Spell

    SQL:    INSERT INTO spells VALUES (2^1+2^25,0,'m_02_26_teach-ra.lua');
]]

require("magic.base.teachspell");
module("magic.spell_02_26_teach-ra", package.seeall)

-- Informations about the rune
Rune = {
    ["name"] = "RA",   -- name of the rune
    ["class"] = 1,      -- class of the rune ( 1 = weak, 2 = normal, 3 = strong )
    ["value"] = 1       -- value of the rune
}

-- Teacher related informations
Teacher = {
    ["skill"] = {               -- The required skill of the teacher
        ["name"] = "commotio",  -- name of the skill that is required
        ["value"] = 40          -- value of the skill that is required
    },
    ["attribsum"] = 33          -- sum of attributes that are required
}

-- Student related informations
Student = {
    ["skill"] = nil,            -- Skill requirements to the student
    ["attribsum"] = nil         -- attribute requirements to the student
}
