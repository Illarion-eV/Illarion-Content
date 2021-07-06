--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
local M = {}

M.Runes = { -- [(1)Rune Number], [(2)Rune Name], [(3)Mana cost],[(4)Cast Time]
{1,"CUN","Small","Short"},
{2,"JUS","Small","Short"},
{3,"PEN","Small","Short"},
{4,"RA","Small","Short"},
{5,"SOLH","Small","Short"},
{6,"Anth","Small","Short"},
{7,"Bhona","Small","Short"},
{8,"Dun","Large","Long"},
{9,"Fhan","Large","Long"},
{10,"Fhen","Small","Short"},
{11,"Hept","Medium","Medium"},
{12,"Ira","Medium","Medium"},
{13,"Kah","Small","Short"},
{14,"Kel","Large","Long"},
{15,"Lev","Small","Short"},
{16,"Lhor","Small","Short"},
{17,"Luk","Medium","Medium"},
{18,"Mes","Small","Short"},
{19,"Orl","Large","Long"},
{20,"Pherc","Medium","Medium"},
{21,"Qwan","Large","Long"},
{22,"Sav","Medium","Medium"},
{23,"Sih","Large","Long"},
{24,"Sul","Medium","Medium"},
{25,"Tah","Medium","Medium"},
{26,"Taur","Medium","Medium"},
{27,"Ura","Medium","Medium"},
{28,"Yeg","Medium","Medium"},
{29,"Pera","Small","Short"}
}

function M.learnedRunesToQuestprogress(RuneNumber)
    if RuneNumber < 2^31 then
        return RuneNumber
    else
        return 2^31- 1 - RuneNumber
    end
end
function M.QuestprogressToLearnedRunes(questprogress)
    if tonumber(questprogress)<0 then
        return 2^31-1-tonumber(questprogress)
    else
        return tonumber(questprogress)
    end
end
function M.checkIfLearnedRune(User, TargetItem, RuneNumber, questorspell, spellnumber, spell)
local learnedRunes
    local retVal=false;
    local runeOffset=math.fmod(RuneNumber-1,32);
    if spell then
        learnedRunes = M.QuestprogressToLearnedRunes(spell)
    elseif questorspell == "isQuest" then
        learnedRunes = M.QuestprogressToLearnedRunes(User:getQuestProgress(7000))
    elseif questorspell == "isSpell" then
        learnedRunes = M.QuestprogressToLearnedRunes(TargetItem:getData(spellnumber))
    end
    if bit32.btest(bit32.lshift(1, runeOffset), learnedRunes) then
        retVal=true;
    end
    return retVal;
end
function M.checkSpellForRune(RuneNumber, spell)
    local retVal=false;
    local runeOffset=math.fmod(RuneNumber-1,32);
    local learnedRunes = M.QuestprogressToLearnedRunes(spell)
    if bit32.btest(bit32.lshift(1, runeOffset), learnedRunes) then
        retVal=true;
    end
    return retVal;
end

function M.checkSpellForRuneByName(RuneName, spell)
local runeNumber
    for i = 1, #M.Runes do
         if M.Runes[i][2] == RuneName then
            runeNumber = M.Runes[i][1]
            return M.checkSpellForRune(runeNumber, spell)
         end
    end
end
function M.learnRune(User, TargetItem, RuneNumber, questorspell, spellnumber)
    local runeOffset=math.fmod(RuneNumber-1,32);
    if questorspell == "isQuest" then
        local learnedRunes = M.QuestprogressToLearnedRunes(User:getQuestProgress(7000))
        User:setQuestProgress(7000,M.learnedRunesToQuestprogress(bit32.bor(2^runeOffset,learnedRunes)))
    elseif questorspell == "isSpell" then
        local learnedRunes = M.QuestprogressToLearnedRunes(TargetItem:getData(spellnumber))
        TargetItem:setData(spellnumber, M.learnedRunesToQuestprogress(bit32.bor(2^runeOffset,learnedRunes)))
        TargetItem:setData("owner",User.name)
        world:changeItem(TargetItem)
    end
end

function M.fetchElement(spell)
    if M.checkSpellForRuneByName("RA", spell) then
        return "Fire"
    end
    if M.checkSpellForRuneByName("SOLH", spell) then
        return "Earth"
    end
    if M.checkSpellForRuneByName("CUN", spell) then
        return "Water"
    end
    if M.checkSpellForRuneByName("JUS", spell) then
        return "Air"
    end
    if M.checkSpellForRuneByName("PEN", spell) then
        return "Spirit"
    end
end

return M
