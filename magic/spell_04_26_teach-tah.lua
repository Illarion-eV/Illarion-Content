--[[
    Teach rune: TAH
    Rune 04 & 26
        TAH BHONA

    Teaching-Spell

    SQL:    INSERT INTO spells VALUES (2^3+2^25,0,'m_04_26_teach-tah.lua');
]]

require("magic.base.teachspell");
module("magic.spell_04_26_teach-tah", package.seeall)
-- Informations about the rune
Rune = {
    ["name"] = "TAH",   -- name of the rune
    ["class"] = 1,      -- class of the rune ( 1 = weak, 2 = normal, 3 = strong )
    ["value"] = 3       -- value of the rune
}

-- Teacher related informations
Teacher = {
    ["skill"] = {               -- The required skill of the teacher
        ["name"] = "transfreto",-- name of the skill that is required
        ["value"] = 0           -- value of the skill that is required
    },
    ["attribsum"] = 33          -- sum of attributes that are required
}

-- Student related informations
Student = {
    ["skill"] = nil,            -- Skill requirements to the student
    ["attribsum"] = nil         -- attribute requirements to the student
}
