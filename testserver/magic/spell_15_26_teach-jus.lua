--[[
    Teach rune: JUS
    Rune 15 & 26
        JUS BHONA

    Teaching-Spell

    SQL:    INSERT INTO spells VALUES (2^14+2^25,0,'m_15_26_teach-jus.lua');
]]

require("magic.base.teachspell");
module("magic.spell_15_26_teach-jus", package.seeall)
-- Informations about the rune
Rune = {
    ["name"] = "JUS",   -- name of the rune
    ["class"] = 1,      -- class of the rune ( 1 = weak, 2 = normal, 3 = strong )
    ["value"] = 14      -- value of the rune
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
