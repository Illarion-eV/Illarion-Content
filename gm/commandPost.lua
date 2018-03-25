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

local scheduledFunction = require("scheduled.scheduledFunction")

local M = {}

local commandPosts = {}
local spawnInformations = {}
local commandMonsters = {}

local gmSelection
local pauseCommandPost
local deleteCommandPost
local setUpCommandPost
local initiateSpawns
local checkSpawnInformation
local runCommandPost
local spawnDoEffects
local spawnCommandPostMonster
local updateMonsters
local checkCommandPost
local createSpawnMarker
local entryToNumbers
local setCommandPostEffects
local setCommandPostMarker
local setCustomCommandPostMarker
local setCommandPostCooldown
local setCommandPostIntervals
local selectCommandPostSpawn
local setSpawnCoordinates
local setNumberOfPortals
local selectMonsters
local setCustomMonsterList
local setNumberOfMonsters

-- Present in Item scripts of:
-- Item: id_3109_open_pell
function M.UseItem(User, SourceItem)
    local commandPostPos = SourceItem.pos
    if SourceItem:getData("commandPost") == "true" then
        if SourceItem.itempos ~= 255 then
            User:inform("Place the command Post on the ground to use it.")
            --User:inform(tostring(SourceItem.itempos))
            return
        end
        if User:isAdmin() == true then
            gmSelection(User, SourceItem)
        else

            if SourceItem:getData("test") == "true" then
                gmSelection(User, SourceItem)
                return
            end
            if commandPosts[tostring(commandPostPos)] == nil then
                return
            end

                pauseCommandPost(User,SourceItem,commandPostPos)

        end
    end

end

function gmSelection(User, SourceItem)
    local commandPostPos = SourceItem.pos

    if commandPosts[tostring(commandPostPos)] == nil then
        setUpCommandPost(User, SourceItem, commandPostPos)
        return
    end

    local modes = {"Set Number of Spawn", "Locate Spawns", "Select Monsters", "Number of Monsters", "Effects", "Spawn Marker","Spawn Intervals","Cooldown Time", "Start Command Post","Capture","Remove Command Post"}
    local cbSetMode = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1
        if index == 1 then
            setUpCommandPost(User, SourceItem, commandPostPos)
        elseif index == 2 then
            selectCommandPostSpawn(User, SourceItem, commandPostPos, index)
        elseif index == 3 then
            selectCommandPostSpawn(User, SourceItem, commandPostPos, index)
        elseif index == 4 then
            selectCommandPostSpawn(User, SourceItem, commandPostPos, index)
        elseif index == 5 then
            setCommandPostEffects(User, SourceItem, commandPostPos)
        elseif index == 6 then
            setCommandPostMarker(User, SourceItem, commandPostPos)
        elseif index == 7 then
            setCommandPostIntervals(User, SourceItem, commandPostPos)
        elseif index == 8 then
            setCommandPostCooldown(User, SourceItem, commandPostPos)
        elseif index == 10 then
            pauseCommandPost(User,SourceItem,commandPostPos)
        elseif index == 11 then
            deleteCommandPost(User,SourceItem,commandPostPos)
        else
            local check = checkCommandPost(User, SourceItem, commandPostPos)

            if check == true then
                initiateSpawns(User, SourceItem, commandPostPos)
            end

        end
    end
    local sd = SelectionDialog("Set the mode of this Spawnpoint.", "To which mode do you want to change it?", cbSetMode)
    for _,m in ipairs(modes) do
        sd:addOption(0,m)
    end
    User:requestSelectionDialog(sd)

end

-- What will happen if the Command Post is used by a Player -> Either pause it or tell that it is already paused
function pauseCommandPost(User,SourceItem,targetPosition)
    if SourceItem:getData("descriptionDe") == "Aktiver Befehlsstand" then
    if User:getPlayerLanguage() == Player.english then
    User:inform("You have captured the Command Post. It will take a while till an enemy will appear here.")
    else
    User:inform("Du hast den Befehlsstand eingenommen. Es wird wohl eine Weile dauern bis sich wieder ein Feind hier her wagen wird.")
    end
    commandPosts[tostring(targetPosition)][1]["time"]= world:getTime("unix")+commandPosts[tostring(targetPosition)][1]["cooldown"]*60
    SourceItem:setData("descriptionDe","Eingenommener Befehlsstand")
    SourceItem:setData("descriptionEn","Captured Command Post")
    world:changeItem(SourceItem)
    elseif User:getPlayerLanguage() == Player.english then
    User:inform("The Command Post is already captured. It will take a while till an enemy will appear here.")
    else
    User:inform("Der Befehlsstand ist bereits eingenommen. Es wird wohl eine Weile dauern bis sich wieder ein Feind hier her wagen wird.")


    end
end

-- Remove a commandPost
function deleteCommandPost(User,SourceItem,commandPostPos)
    for i=#spawnInformations,1,-1 do
        if spawnInformations[i] == commandPosts[tostring(commandPostPos)] then
            table.remove(spawnInformations, i)
            table.remove(commandMonsters, i)
            commandPosts[tostring(commandPostPos)] = nil
        end
    end
end

-- Initialize the commandPost in the table
function setUpCommandPost(User, SourceItem, targetPosition)
    commandPosts[tostring(targetPosition)] = {}
    commandPosts[tostring(targetPosition)][1] = {"time","numberOfPortals","gfx","sfx","marker","intervals","cooldown","pos","intervalCounter"}
    commandPosts[tostring(targetPosition)][1]["time"]= world:getTime("unix")
    commandPosts[tostring(targetPosition)][1]["pos"] = targetPosition
    commandPosts[tostring(targetPosition)][1]["intervalCounter"] = 0
    setNumberOfPortals(User, SourceItem, targetPosition)
end

-- Initiate the Spawnpoint in the commandPosts table
function initiateSpawns(User, SourceItem, targetPosition)

    SourceItem:setData("nameDe","Befehlsstand")
    SourceItem:setData("nameEn","Command Post")
    SourceItem:setData("descriptionDe","Aktiver Befehlsstand")
    SourceItem:setData("descriptionEn","Active Command Post")
    world:changeItem(SourceItem)

    createSpawnMarker(User, targetPosition)
    local length = #spawnInformations +1
    local empty = {}
    local numberOfPortals = commandPosts[tostring(targetPosition)][1]["numberOfPortals"]
    if checkSpawnInformation(targetPosition) == false then
        table.insert(spawnInformations, length, commandPosts[tostring(targetPosition)])
        table.insert(commandMonsters, length, empty)
    else
        spawnInformations[checkSpawnInformation(targetPosition)] = commandPosts[tostring(targetPosition)]
    end

    scheduledFunction.registerFunction(2, function() runCommandPost() end)
end

-- Helpfunction for Spawnpoint initialization
function checkSpawnInformation(targetPosition)
    if spawnInformations == nil then
        return false
    end

    for i=1, #spawnInformations do
        if tostring(spawnInformations[i][1]["pos"]) == tostring(targetPosition) then
            return i
        end
    end

    return false

end

-- Scheduled function for spawning
function runCommandPost()
    if spawnInformations == nil then
        return
    end

    for i=1, #spawnInformations do
        local gfxId = spawnInformations[i][1]["gfx"]
        local sfxId = spawnInformations[i][1]["sfx"]
        local itemPosition = spawnInformations[i][1]["pos"]
        local spawnTime = spawnInformations[i][1]["time"]
        local currentTime = world:getTime("unix")
        local intervals = spawnInformations[i][1]["intervals"]
        local intervalCounter = spawnInformations[i][1]["intervalCounter"]

        if currentTime > spawnTime then
        local SourceItem = world:getItemOnField(itemPosition)
        SourceItem:setData("descriptionDe","Aktiver Befehlsstand")
        SourceItem:setData("descriptionEn","Active Command Post")
        world:changeItem(SourceItem)
        --world:gfx(1,position)
         if intervals > intervalCounter then
             spawnInformations[i][1]["intervalCounter"] = intervalCounter+1
         else

            for j=2, #spawnInformations[i] do
                updateMonsters(i,j-1)
                if spawnCommandPostMonster(i,j-1) == true then
                    local spawnPos =spawnInformations[i][j]["Coordinates"]
                    spawnDoEffects(gfxId, sfxId,spawnPos)
                end

                spawnInformations[i][1]["intervalCounter"] = 0
            end
        end
        end
    end

    scheduledFunction.registerFunction(2, function() runCommandPost() end)
end


-- Effects on Spawn
function spawnDoEffects(gfxId, sfxId, coordinates)
    if gfxId == nil then
        return
    else
        world:gfx(gfxId,coordinates)
        if sfxId == nil then
            return
        end
        world:makeSound(sfxId,coordinates)
    end
end


-- Spawning new monsters when needed
function spawnCommandPostMonster(indexA, indexB)
    local monsterIds = entryToNumbers(spawnInformations[indexA][indexB+1]["Monsters"])
    local coordinates = spawnInformations[indexA][indexB+1]["Coordinates"]
    local limit = spawnInformations[indexA][indexB+1]["NumberOfMonsters"]
    local monsterId = monsterIds[math.random(1,#monsterIds)]
    if commandMonsters[indexA][indexB] == nil then
        commandMonsters[indexA][indexB] = {}
        local monster = world:createMonster(monsterId,coordinates,10)
        table.insert(commandMonsters[indexA][indexB],monster)
        return true
    elseif #commandMonsters[indexA][indexB] < limit then
        local monster = world:createMonster(monsterId,coordinates,10)
        table.insert(commandMonsters[indexA][indexB],monster)
        return true
    end
end

-- Removing dead monsters
function updateMonsters(indexA, indexB)
    if commandMonsters == nil then
       return
    end
   if commandMonsters[indexA][indexB] == nil then
       return
   else
       for i= #commandMonsters[indexA][indexB], 1, -1 do
        local testMonster = commandMonsters[indexA][indexB][i]
           if not isValidChar(testMonster) then
               table.remove(commandMonsters[indexA][indexB],i)
           end
       end
   end
end

-- Check before initialization of Command Post
function checkCommandPost(User, SourceItem, targetPosition)
    local flag = true
    for i=1, #commandPosts[tostring(targetPosition)][1]-2 do
        local identifyer = commandPosts[tostring(targetPosition)][1][i]

        if commandPosts[tostring(targetPosition)][1][identifyer] ~= nil then
        --    User:inform(tostring(commandPosts[tostring(targetPosition)][1][identifyer]))
        elseif identifyer == "gfx" then
            User:inform("Opdtional " .. identifyer .." is not set!")
        elseif identifyer == "sfx" then
            User:inform("Optional " .. identifyer .." is not set!")
        else
            User:inform(identifyer .. " is not set!")
            flag=false
        end

    end

    for i=2, #commandPosts[tostring(targetPosition)] do
        for j=1, #commandPosts[tostring(targetPosition)][i] do
            local identifyer = commandPosts[tostring(targetPosition)][i][j]
            if commandPosts[tostring(targetPosition)][i][identifyer] == nil then
            User:inform(identifyer .. " of Spawn Point " .. tostring(i-1) .. " is missing!")
            flag = false
            end

        end
    end

    return flag

end

-- Placing the chosen Items
function createSpawnMarker(User, targetPosition)
    local itemId = tonumber(commandPosts[tostring(targetPosition)][1]["marker"])
    local itemQual = 333

    for i=2, #commandPosts[tostring(targetPosition)] do
    local markerPos = commandPosts[tostring(targetPosition)][i]["Coordinates"]

        local newItem = world:createItemFromId(itemId, 1, markerPos, true, itemQual, nil)
        newItem.wear = 255
        world:changeItem(newItem)

    end
end

-- Turns the string monster list into an array of ints
function entryToNumbers(entry)
    local counter = 0
    local fin = 1
    local monsterIds = {}

    while fin <= string.len(entry) do

        if (string.find(entry,"(%d+)",fin) ~= nil) then

            local a, b, value = string.find(entry,"(%d+)",fin)
            fin = b + 1
            counter = counter +1
            monsterIds[counter]    = tonumber(value)

        end
    end
    return monsterIds;
end


-- Setter for the GFX and SFX
function setCommandPostEffects(User, SourceItem, targetPosition)
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+) (%d+)") ~= nil) then
            local a, b, gfxId, sfxId = string.find(input,"(%d+) (%d+)")
            commandPosts[tostring(targetPosition)][1]["gfx"] = tonumber(gfxId)
            commandPosts[tostring(targetPosition)][1]["sfx"] = tonumber(sfxId)
        elseif (string.find(input,"(%d+)") ~= nil) then
            local a, b, gfxId = string.find(input,"(%d+)")
            commandPosts[tostring(targetPosition)][1]["gfx"] = tonumber(gfxId)
        end
    end
    User:requestInputDialog(InputDialog("Set the graphic and sound appearing at spawn", "Usage: Enter a gfxId [sfxId]" ,false, 255, cbInputDialog))
end

-- Setter for the items
function setCommandPostMarker(User, SourceItem, targetPosition)
    local items = {10,798,2832,498,2937,512,2926,2069}

        local cbSetMode = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1

            if index <= #items then
                commandPosts[tostring(targetPosition)][1]["marker"] = tostring(items[index])
            else
                setCustomCommandPostMarker(User, SourceItem, targetPosition)
            end

    end
    local sd = SelectionDialog("Spawn Marker", "Select a Marker for the Spawn Points", cbSetMode)
    for i=1,#items do
        local itemName = world:getItemName(items[i], Player.english)
        sd:addOption(items[i],itemName)
    end
    sd:addOption(0,"Enter Item ID")
    User:requestSelectionDialog(sd)
end


-- Entrypoint for custom itemID
function setCustomCommandPostMarker(User, SourceItem, targetPosition)
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            local a, b, numberOfPortals = string.find(input,"(%d+)")
            commandPosts[tostring(targetPosition)][1]["marker"] = tonumber(numberOfPortals)
        end
    end
    User:requestInputDialog(InputDialog("Custom Spawn Marker", "Usage: Enter a Custom Spawn Marker" ,false, 255, cbInputDialog))
end

-- Setter for the CooldownTime
function setCommandPostCooldown(User, SourceItem, targetPosition)
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            local a, b, cooldown = string.find(input,"(%d+)")
            commandPosts[tostring(targetPosition)][1]["cooldown"] = tonumber(cooldown)
        end
    end
    User:requestInputDialog(InputDialog("Cooldown Time", "Usage: Enter a the time the spawn will stop after the post is captured" ,false, 255, cbInputDialog))
end

-- Setter for the SpawnIntervals
function setCommandPostIntervals(User, SourceItem, targetPosition)
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            local a, b, intervals = string.find(input,"(%d+)")
            commandPosts[tostring(targetPosition)][1]["intervals"] = tonumber(intervals)
        end
    end
    User:requestInputDialog(InputDialog("Spawn Intervals", "Usage: Set Number of (roughly) 7 Seconds Intervals between Spawns" ,false, 255, cbInputDialog))
end

-- Selection of different related spawns
function selectCommandPostSpawn(User, SourceItem, targetPosition, selection)
    local modes = {}
    local spawnInformationSet = {"Coordinates", "Monsters", "NumberOfMonsters"}
    if commandPosts[tostring(targetPosition)][1]["numberOfPortals"] == nil then
        User:inform("Set up command post first!")
        return
    end

    for i=1, commandPosts[tostring(targetPosition)][1]["numberOfPortals"] do
        if commandPosts[tostring(targetPosition)][i+1][spawnInformationSet[selection-1]] == nil then
           modes[i] = "Spawn " .. tostring(i)
        else
           modes[i] = "Spawn " .. tostring(i) .. ": " .. tostring(commandPosts[tostring(targetPosition)][i+1][spawnInformationSet[selection-1]])
        end

    end

    local cbSetMode = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1
            --User:inform(modes[index])
            if selection == 2 then
            setSpawnCoordinates(User, SourceItem, targetPosition, index+1)
            elseif selection == 3 then
            selectMonsters(User, SourceItem, targetPosition, index+1)
            elseif selection == 4 then
            setNumberOfMonsters(User, SourceItem, targetPosition, index+1)
            end

    end
    local sd = SelectionDialog("Spawn Coordinates", "Select a Spawn Point", cbSetMode)
    for _,m in ipairs(modes) do
        sd:addOption(0,m)
    end
    User:requestSelectionDialog(sd)

end

-- Setter for the spawn coordinates
function setSpawnCoordinates(User, SourceItem, targetPosition, index)
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+) (%d+) (%d+)") ~= nil) then
            local a, b, xCoords, yCoords, zCoords = string.find(input,"(%d+) (%d+) (%d+)")
            local target = position(tonumber(xCoords),tonumber(yCoords),tonumber(zCoords))
            local targetField = world:getField(target)

            if targetField ~= nil then
            local check = targetField:isPassable()
                if check == true then
                commandPosts[tostring(targetPosition)][index]["Coordinates"] = target
                return
                else
                User:inform('Please enter coordinates of a passable tile.')
                end
            else
            User:inform('Please enter coordinates of a valid tile.')
            end


        end
    end
    User:requestInputDialog(InputDialog("Span Locater", "Usage: Enter X Y Z coordinates" ,false, 255, cbInputDialog))
end

-- Setter for the number of spawns
function setNumberOfPortals(User, SourceItem, targetPosition)
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            local a, b, numberOfPortals = string.find(input,"(%d+)")
            commandPosts[tostring(targetPosition)][1]["numberOfPortals"] = tonumber(numberOfPortals)
            for i=1, tonumber(numberOfPortals) do
                commandPosts[tostring(targetPosition)][i+1] = {"Coordinates", "Monsters", "NumberOfMonsters"}
            end
        end
    end
    User:requestInputDialog(InputDialog("Set number of related Spawnpoints.", "Usage: Set number of related Spawnpoints." ,false, 255, cbInputDialog))
end

-- Setter for the monster list
function selectMonsters(User, SourceItem, targetPosition, selection)
    local monsterLists ={}

    local names = {"Mas Lvl. 2", "Mas Lvl. 3","Mas Lvl. 4","Mas Lvl. 5","Mas Lvl. 6","Mas Lvl. 7", "Custom Entry"}
    monsterLists[1] = "104   103   101   105   107   114   151   172   762   881"
    monsterLists[2] = "102   111   112   115   152   171   536   753   752   763   871   882"
    monsterLists[3] = "113   141   173   535   539   754   761   764   872   883"
    monsterLists[4] = "108   109   142   532   531   540   537   741   751   782   784   783   851   861   873"
    monsterLists[5] = "121   122   143   201   202   533   538   541    61    65    62    63    64   742   744   852   862"
    monsterLists[6] = "110   123   124   131   203   204   534   542   543   633   634   635   636   637   638   743   853   863"

        local cbSetMode = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local index = dialog:getSelectedIndex() + 1
        if index <= #monsterLists then
            --User:inform(monsterLists[index])
            commandPosts[tostring(targetPosition)][selection]["Monsters"] = monsterLists[index]
        else
            setCustomMonsterList(User, SourceItem, targetPosition, selection)
        end
    end
    local sd = SelectionDialog("Set the Monsters for this Spawn Point", "Usage: Pick a Monsterlist or do Custom Entry", cbSetMode)
    for _,m in ipairs(names) do
        sd:addOption(0,m)
    end
    User:requestSelectionDialog(sd)

end

-- Entrypoint for custom monster list
function setCustomMonsterList(User, SourceItem, targetPosition, selection)
        local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            commandPosts[tostring(targetPosition)][selection]["Monsters"] = input

        end
    end
    User:requestInputDialog(InputDialog("Custom Monster List Entry", "Usage: Enter Monster IDs like 1 3 42" ,false, 255, cbInputDialog))
end

-- Setter for the number of Monsters
function setNumberOfMonsters(User, SourceItem, targetPosition, index)
    local cbInputDialog = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end
        local input = dialog:getInput()
        if (string.find(input,"(%d+)") ~= nil) then
            local a, b, monster = string.find(input,"(%d+)")
            commandPosts[tostring(targetPosition)][index]["NumberOfMonsters"] = tonumber(monster)

        end
    end
    User:requestInputDialog(InputDialog("Monster Number Entry", "Usage: Enter Number of Monsters" ,false, 255, cbInputDialog))
end

return M
