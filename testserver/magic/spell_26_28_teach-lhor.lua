--[[
    Teach rune: LHOR
    Rune 26 & 28
        LHOR BHONA

    Teaching-Spell

    SQL:    INSERT INTO spells VALUES (2^25+2^27,0,'m_26_28_teach-lhor.lua');
]]

require("magic.base.teachspell");
module("magic.spell_26_28_teach-lhor", package.seeall)
-- Informations about the rune
Rune = {
    ["name"] = "LHOR",   -- name of the rune
    ["class"] = 1,      -- class of the rune ( 1 = weak, 2 = normal, 3 = strong )
    ["value"] = 27      -- value of the rune
}

-- Teacher related informations
Teacher = {
    ["skill"] = {               -- The required skill of the teacher
        ["name"] = "pervestigatio",  -- name of the skill that is required
        ["value"] = 40          -- value of the skill that is required
    },
    ["attribsum"] = 33          -- sum of attributes that are required
}

-- Student related informations
Student = {
    ["skill"] = nil,            -- Skill requirements to the student
    ["attribsum"] = nil         -- attribute requirements to the student
}
