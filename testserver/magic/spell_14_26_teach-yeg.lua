--[[
    Teach rune: YEG
    Rune 14 & 26
        YEG BHONA

    Teaching-Spell

    SQL:    INSERT INTO spells VALUES (2^13+2^25,0,'m_14_26_teach-yeg.lua');
]]

require("magic.base.teachspell");
module("magic.spell_14_26_teach-yeg", package.seeall)
-- Informations about the rune
Rune = {
    ["name"] = "YEG",   -- name of the rune
    ["class"] = 2,      -- class of the rune ( 1 = weak, 2 = normal, 3 = strong )
    ["value"] = 13      -- value of the rune
}

-- Teacher related informations
Teacher = {
    ["skill"] = {               -- The required skill of the teacher
        ["name"] = "commotio",  -- name of the skill that is required
        ["value"] = 50          -- value of the skill that is required
    },
    ["attribsum"] = 40          -- sum of attributes that are required
}

-- Student related informations
Student = {
    ["skill"] = {               -- Skill requirements to the student
        ["name"] = "commotio",   -- name of the skill that is required
        ["value"] = 20          -- value of the skill that is required
    },
    ["attribsum"] = 33         -- attribute requirements to the student
}
