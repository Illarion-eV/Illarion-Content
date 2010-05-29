--[[
    Teach rune: ANTH
    Rune 23 & 26
        ANTH BHONA

    Teaching-Spell

    SQL:    INSERT INTO spells VALUES (2^22+2^25,0,'m_23_26_teach-anth.lua');
]]

require("magic.base.teachspell");
module("magic.spell_23_26_teach-anth", package.seeall)
-- Informations about the rune
Rune = {
    ["name"] = "ANTH",   -- name of the rune
    ["class"] = 2,      -- class of the rune ( 1 = weak, 2 = normal, 3 = strong )
    ["value"] = 22      -- value of the rune
}

-- Teacher related informations
Teacher = {
    ["skill"] = {               -- The required skill of the teacher
        ["name"] = "pervestigatio",  -- name of the skill that is required
        ["value"] = 50          -- value of the skill that is required
    },
    ["attribsum"] = 40          -- sum of attributes that are required
}

-- Student related informations
Student = {
    ["skill"] = {               -- Skill requirements to the student
        ["name"] = "transformo",   -- name of the skill that is required
        ["value"] = 20          -- value of the skill that is required
    },
    ["attribsum"] = 33         -- attribute requirements to the student
}
