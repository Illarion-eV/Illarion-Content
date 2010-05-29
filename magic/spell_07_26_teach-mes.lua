--[[
    Teach rune: MES
    Rune 07 & 26
        MES BHONA

    Teaching-Spell

    SQL:    INSERT INTO spells VALUES (2^6+2^25,0,'m_07_26_teach-mes.lua');
]]

require("magic.base.teachspell");
module("magic.spell_07_26_teach-mes", package.seeall)
-- Informations about the rune
Rune = {
    ["name"] = "MES",   -- name of the rune
    ["class"] = 1,      -- class of the rune ( 1 = weak, 2 = normal, 3 = strong )
    ["value"] = 6       -- value of the rune
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
