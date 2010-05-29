--[[
    Teach rune: SOLH
    Rune 17 & 26
        SOLH BHONA

    Teaching-Spell

    SQL:    INSERT INTO spells VALUES (2^16+2^25,0,'m_17_26_teach-solh.lua');
]]

require("magic.base.teachspell");
module("magic.spell_17_26_teach-solh", package.seeall)
-- Informations about the rune
Rune = {
    ["name"] = "SOLH",   -- name of the rune
    ["class"] = 1,      -- class of the rune ( 1 = weak, 2 = normal, 3 = strong )
    ["value"] = 16      -- value of the rune
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
