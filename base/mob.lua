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
--[[The collection contains some function to cedign mobs]]
local common = require("base.common")

local M = {}

local mobs = {}
--[[
mobs[] = { nameDe="",
            nameEn="",
            monsters = {{id or {ids},min,max},{}}
          } ]]--
mobs[1] = { nameDe="Kapitän Molgans glausame Pilaten",
            nameEn="Kaptain Molgans feald pilates",
            monsters = {{2,1,1},{{3,4},1,2},{{2,12,22,42,52},0,7},{15,25,44},0,2},
            help = "human warrior, 0-7 warriors from all races; 1-2 necromancer or mages; 0-2 archer"
          }
mobs[2] = { nameDe="Sperlings Piraten",
            nameEn="Sperlings Pirates",
            monsters = {{2,1,4},{1,1,6},{5,0,5},{3,1,1}},
            help = "average human set, 1 mage"
          }
mobs[3] = { nameDe="Piraten vom großen Weiher",
            nameEn="Pirates of the large pond",
            monsters = {{2,1,1},{1,0,5},{5,0,5}},
            help = "human warrior, 0-10 human or human thieves"
          }
mobs[4] = { nameDe="Piraten in Ausbildung",
            nameEn="Pirate apprentices",
            monsters = {{1,1,2},{{5,23,43},2,5},{582,0,3}},
            help = "human, 2-5 thieves, 0-3 dogs"
          }
mobs[5] = { nameDe="Elfen des Meeres",
            nameEn="Elves of the sea",
            monsters = {{33,1,1},{{32,34},1,3},{{31,35},0,6}},
            help = "elves, priest, 1-3 mage or warrior, 0-6 elf or hunter"
          }
mobs[6] = { nameDe="Schwimmende Seeräuber",
            nameEn="Swimming pirates",
            monsters = {{52,1,1},{{53,54},1,1},{{51,55},0,6}},
            help = "1 lizzard warrior, priest or mage, 0-6 lizzards or thives"
          }
mobs[7] = { nameDe="Verlauste Seeräuber",
            nameEn="Lousy pirates",
            monsters = {{573,1,3},{{582,592,1031,1051,1111,1112},0,10}},
            help = "1-3 ratmen, 0-10 level 0 vermin"
          }
mobs[8] = { nameDe="Mumientanz in heller Nacht",
            nameEn="Mummys dance in a bright night",
            monsters = {{{111,152},1,3},{{171,115},0,1},{{101,103,114,151,172,762},0,10}},
            help = "1-3 skeletons, 0-1 low undead mage, 0-10 level 1 undeads, beetle"
          }
mobs[9] = { nameDe="Unbekannt und ungefürchtet",
            nameEn="Unknown and unfeared",
            monsters = {{23,1,2},{{21,24},0,7},{{582,592,1031,1051,1111,1112},0,10}},
            help = "1-2 halfling thief, 0-7 halflings, 0-10 level 0 vermin"
          }
mobs[10] = { nameDe="Ork Räuber",
             nameEn="Orc robber",
             monsters = {{42,1,3},{{45,44},2,1},{{41,43},0,6},{872,871,851},0,2},
             help = "1-3 orc warrior, schaman or hunter, 0-6 orc or thives, 0-2 hellhounds"
           }
mobs[100] = { nameDe="Armee des Liches",
              nameEn="Liche army",
              monsters = {{205,1,1},{{202,204,783},1,2},{{201,203,782},2,10},{{744,784,753},2,7},{{206,741,751},0,10},{{111,112,113,114},0,15}},
              help = "1 liche, 1-2 mages, 2-10 higher warrior, 2-7 archer, 0-10 lower special warriors, 0-15 skeletons"
            }
mobs[101] = { nameDe="Ratten",
              nameEn="rats",
              monsters = {{{1115,1116},1,1},{{1113,1114,1115},1,4},{1112,2,10}},
              help = "rat pack 1 xlvl 3; 1-4 xlvl 1; 2-10 xlvl 0"
            }

local DEFAULT_MOB_SIZE = 6

local function gmGetSpawnRange(item)
    local range = item:getData("mobspawnrange")
    if range ~= nil then
        range = tonumber(range)
    end
    if range == nil then
        range = 4
    end
    return range
end

local function gmSetSpawnRange(user,item)
    local thisInputDialog = function (dialog)
    
        if (not dialog:getSuccess()) then
            return
        end
        
        local input = dialog:getInput()
        
        if not common.IsNilOrEmpty(input) then
            local value = (tonumber(input))
            if value == nil then
                user:inform("This input is not valid: "..input)
            else
                user:inform("Spawn range changed to "..tostring(value).." tiles.")
                item:setData("mobspawnrange",value)
                world:changeItem(item)
            end
            M.gmSpawnMob(user,item)
        end
    end
    
    user:requestInputDialog(InputDialog("Spawn Mob Selection",
                                        "Enter the range for the spawn area\nCurrent range: "..tostring(gmGetSpawnRange(item)).." tiles",
                                        false, 255, thisInputDialog))
end

local function gmGetSpawnSize(item)
    local size = item:getData("mobspawnsize")
    if size ~= nil then
        size = tonumber(size)
    end
    if size == nil then
        size = 4
    end
    return size
end

local function gmSetSpawnSize(user,item)
    local thisInputDialog = function (dialog)
    
        if (not dialog:getSuccess()) then
            return
        end
        
        local input = dialog:getInput()
        
        if not common.IsNilOrEmpty(input) then
            local value = (tonumber(input))
            if value == nil then
                user:inform("This input is not valid: "..input)
            else
                user:inform("Spawn size changed to "..tostring(value).." monsters.")
                item:setData("mobspawnsize",value)
                world:changeItem(item)
            end
            M.gmSpawnMob(user,item)
        end
    end
    
    user:requestInputDialog(InputDialog("Spawn Mob Selection",
                                        "Enter the size for the mob\nCurrent size: "..tostring(gmGetSpawnSize(item)).." monsters",
                                        false, 255, thisInputDialog))
end

local function gmSpawnNow(user,mobId,amount,range)
    user:inform("Monster group "..mobs[mobId].nameEn.." ("..tostring(mobId)..") spawned with "..tostring(amount).." monsters.")
    local mob = M.getMonsters(mobId,amount)
    for _, monster in pairs (mob) do
        local pos = common.getFreePos(user.pos, range)
        world:createMonster(monster,pos,0)
    end
end

local function getCapability(user)
    local skillFight = math.max (user:getSkill(Character.concussionWeapons),
                                 user:getSkill(Character.distanceWeapons),
                                 user:getSkill(Character.punctureWeapons),
                                 user:getSkill(Character.slashingWeapons))
    local skillDefense = math.max (user:getSkill(Character.heavyArmour),
                                   user:getSkill(Character.lightArmour),
                                   user:getSkill(Character.mediumArmour))
    local skillMage = user:getSkill(Character.wandMagic)
    local skillParry = user:getSkill(Character.parry)
    local attAgility = user:getBaseAttribute("agility")
    local attConstitution = user:getBaseAttribute("constitution")
    local attDexterity = user:getBaseAttribute("dexterity")
    local attEssence = user:getBaseAttribute("essence")
    local attIntelligence = user:getBaseAttribute("intelligence")
    local attPerception = user:getBaseAttribute("perception")
    local attStrength = user:getBaseAttribute("strength")
    local attWillpower = user:getBaseAttribute("willpower")

    local capaFight = (100 + (attStrength-6)*3 + (attPerception-6) + (attDexterity-6) + (skillFight-20)*1.5 ) / 2.9
    local capaMage =  (100 + (attIntelligence-6)*3.5 + (attEssence-6)*1.1 + (skillMage-20)*1.5 ) / 2.82
    local capaDefense = attConstitution * skillDefense / 20
    local capaParry = skillParry / 5 * (0.5 + attAgility/10) * 2

    local capabilityTotal = 0.5 * math.max(capaFight, capaMage) + 0.38 * capaDefense + 0.12 * capaParry
    return capabilityTotal
end

function M.gmSpawnMob(user,item)
    local optionList = {}
    local dialogTitle
    local dialogAddText
    local SELECT_SETRANGE = -1
    local SELECT_SETSIZE = -2

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if (not dialog:getSuccess()) then
            return
        end
        local selected = dialog:getSelectedIndex()
        local selectedOption = optionList[selected+1]
        if selectedOption == SELECT_SETRANGE then
            gmSetSpawnRange(user,item)
        elseif selectedOption == SELECT_SETSIZE then
            gmSetSpawnSize(user,item)
        else
            gmSpawnNow(user,selectedOption,gmGetSpawnSize(item),gmGetSpawnRange(item))
        end
    end
    dialogTitle = "Spawn Mob Selection"
    dialogAddText = "Select the function"
    local dialog = SelectionDialog(dialogTitle, dialogAddText, callback)

    dialog:addOption(0, "Amount of monster in spawn: "..tostring(gmGetSpawnSize(item)).." monsters")
    table.insert(optionList, SELECT_SETSIZE)
    dialog:addOption(0, "Range of the spawn: "..tostring(gmGetSpawnRange(item)).." tiles")
    table.insert(optionList, SELECT_SETRANGE)
    for i, mob in pairs(mobs) do
        if not common.IsNilOrEmpty(mob.nameEn) and not common.IsNilOrEmpty(mob.help)then
            dialog:addOption(1, mob.nameEn.."\n"..mob.help)
            table.insert(optionList, i)
        end
    end
    user:requestSelectionDialog(dialog)
end

function M.getPartyFightCapability(partyMembers)
    local capabilityList = {}
    local countParty = 0
    for _, member in pairs (partyMembers) do
        table.insert(capabilityList, getCapability(member))
        countParty = countParty + 1
    end
    table.sort(capabilityList, function(a,b) return tonumber(a) > tonumber(b) end)
    local bestFighter = capabilityList[1]
    local totalParty = 0
    for i, rowValue in ipairs(capabilityList) do
        totalParty = totalParty + rowValue / i
    end
    return countParty, bestFighter, totalParty
end

function M.getMonsters(baseList, number, mobListExt)
    local workingMob
    if type(baseList) == "number" then
        workingMob = mobs[baseList]
    elseif type(baseList) == "table" then
        if baseList.monsters ~= nil then
            workingMob = baseList
        else
            workingMob = nil
        end
    else
        workingMob = nil
    end
    local mobList = mobListExt or {}
    local sizeMob = tonumber(number) or DEFAULT_MOB_SIZE
    if workingMob == nil then
        return {}
    end

    for _, mobRow in pairs(workingMob.monsters) do
        if mobRow[2] > 0 then
            for i=1, mobRow[2] do
                table.insert(mobList, common.getOneOutOfList(mobRow[1]))
                mobRow[3] = mobRow[3] - 1
                if #mobList >= sizeMob then
                    return mobList
                end
            end
        end
    end

    local tmpList = {}
    for _, mobRow in pairs(workingMob.monsters) do
        if mobRow[3] > 0 then
            for i=1, mobRow[3] do
                table.insert(tmpList, common.getOneOutOfList(mobRow[1]))
            end
        end
    end
    common.Shuffle(tmpList)
    for i=1, math.min(#tmpList, sizeMob - #mobList) do
        table.insert(mobList, tmpList[i])
    end

    if sizeMob > #mobList then
        M.getMonsters(baseList, number, mobList)
    end

    return mobList
end

return M
