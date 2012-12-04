--[[
    Teach rune: SAV
    Rune 13 & 26
        SAV BHONA

    Teaching-Spell

    SQL:    INSERT INTO spells VALUES (2^12+2^25,0,'m_13_26_teach-sav.lua');
]]

require("magic.base.teachspell");
module("magic.spell_13_26_teach-sav", package.seeall)
-- Informations about the rune
Rune = {
    ["name"] = "SAV",   -- name of the rune
    ["class"] = 2,      -- class of the rune ( 1 = weak, 2 = normal, 3 = strong )
    ["value"] = 12      -- value of the rune
}

-- Teacher related informations
Teacher = {
    ["skill"] = {               -- The required skill of the teacher
        ["name"] = "transformo",  -- name of the skill that is required
        ["value"] = 0          -- value of the skill that is required
    },
    ["attribsum"] = 40          -- sum of attributes that are required
}

-- Student related informations
Student = {
    ["skill"] = {               -- Skill requirements to the student
        ["name"] = "transformo",   -- name of the skill that is required
        ["value"] = 0          -- value of the skill that is required
    },
    ["attribsum"] = 33         -- attribute requirements to the student
}
