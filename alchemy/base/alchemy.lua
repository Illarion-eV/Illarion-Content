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
local common = require("base.common")
local licence = require("base.licence")
local gems = require("base.gems")
local pyr = require("magic.arcane.enchanting.effects.pyr")
local ilyn = require("magic.arcane.enchanting.effects.ilyn")
local magic = require("base.magic")

local M = {}

local alchemyTool = Item.mortar

M.playerPotionStartQuest = 870 -- 870-900 reserved for bitwise storage of potion knowledge
M.maxEntriesPerRecipe = 5

local herbs = {
    {id = Item.rottenTreeBark},
    {id = Item.nightAngelsBlossom, negative = "Dracolin"},
    {id = Item.desertSkyCapsule, negative = "Echolon"},
    {id = Item.fireRoot, negative = "Illidrium"},
    {id = Item.oneleavedFourberry, negative = "Caprazin"},
    {id = Item.iceLeaf, negative = "Fenolin"},
    {id = Item.goldCrackHerb, negative = "Orcanol"},
    {id = Item.darkMoss, negative = "Adrazin"},
    {id = Item.conBlossom, negative = "Hyperborelium"},
    {id = Item.lifeRoot, positive = "Echolon"},
    {id = Item.piousBerry, positive = "Caprazin"},
    {id = Item.tybaltStar, positive = "Dracolin"},
    {id = Item.heartBlood, positive = "Adrazin"},
    {id = Item.rainWeed, positive = "Illidrium"},
    {id = Item.daydream, positive = "Hyperborelium"},
    {id = Item.wolverineFern, positive = "Orcanol"},
    {id = Item.desertBerry, positive = "Fenolin"},
    {id = Item.berries, positive = "Illidrium", negative = "Orcanol"},
    {id = Item.sunHerb, positive = "Adrazin", negative = "Orcanol"},
    {id = Item.fourleafedOneberry, positive = "Fenolin", negative = "Illidrium"},
    {id = Item.yellowWeed, positive = "Fenolin", negative = "Adrazin"},
    {id = Item.angerBerry, positive = "Adrazin", negative = "Fenolin"},
    {id = Item.flamegobletBlossom, positive = "Echolon", negative = "Illidrium"},
    {id = Item.donfBlade, positive = "Fenolin", negative = "Hyperborelium"},
    {id = Item.blackThistle, positive = "Caprazin", negative = "Echolon"},
    {id = Item.sandberry, positive = "Hyperborelium", negative = "Dracolin"},
    {id = Item.redElder, positive = "Illidrium", negative = "Dracolin"},
    {id = Item.virginsWeed, positive = "Adrazin", negative = "Dracolin"},
    {id = Item.heathFlower, positive = "Hyperborelium", negative = "Orcanol"},
    {id = Item.blackberry, positive = "Echolon", negative = "Adrazin"},
    {id = Item.firnisBlossom, positive = "Echolon", negative = "Caprazin"},
    {id = Item.firTreeSprout, positive = "Hyperborelium", negative = "Echolon"},
    {id = Item.strawberry, positive = "Caprazin", negative = "Dracolin"},
    {id = Item.footLeaf, positive = "Fenolin", negative = "Caprazin"},
    {id = Item.sibanacLeaf, positive = "Illidrium", negative = "Echolon"},
    {id = Item.steppeFern, positive = "Orcanol", negative = "Adrazin"},
    {id = Item.bulbspongeMushroom, positive = "Illidrium", negative = "Fenolin"},
    {id = Item.toadstool, positive = "Dracolin", negative = "Hyperborelium"},
    {id = Item.redHead, positive = "Adrazin", negative = "Echolon"},
    {id = Item.herdersMushroom, positive = "Orcanol", negative = "Hyperborelium"},
    {id = Item.birthMushroom, positive = "Hyperborelium", negative = "Fenolin"},
    {id = Item.champignon, positive = "Orcanol", negative = "Illidrium"},
    {id = Item.fairyRingMushroom, positive = "Caprazin", negative = "Orcanol"},
    {id = Item.stinkhorn, positive = "Caprazin", negative = "Fenolin"},
    {id = Item.mandrake, positive = "Orcanol", negative = "Caprazin"},
    {id = Item.blueBirdsberry, positive = "Dracolin", negative = "Adrazin"},
    {id = Item.elfCaps, positive = "Dracolin", negative = "Illidrium"},
    {id = Item.marshFlower, positive = "Dracolin", negative = "Caprazin"},
    {id = Item.waterBlossom, positive = "Echolon", negative = "Hyperborelium"}
}

local potions = {
    {effect = 10, name = {english = "Dragon Breath", german = "Drachenatem"}, powder = Item.amethystPowder, stock = 58325631, essence = {Item.fireRoot, Item.fireRoot, Item.blackThistle, Item.blackThistle, Item.blackThistle, Item.desertSkyCapsule}},

    {effect = 301, name = {english = "Small Explosion", german = "Kleine Explosion"}, powder = Item.sapphirePowder, stock = 34374416, essence = {Item.fireRoot, Item.fireRoot, Item.fireRoot, Item.desertSkyCapsule, Item.blackThistle, Item.blackThistle, Item.blackThistle, Item.sunHerb}, bomb = true},
    {effect = 302, name = {english = "Medium Explosion", german = "Mittlere Explosion"}, powder = Item.sapphirePowder, stock = 44156426, essence = {Item.fireRoot, Item.fireRoot, Item.desertSkyCapsule, Item.desertSkyCapsule, Item.blackThistle, Item.blackThistle, Item.blackThistle, Item.sunHerb}, bomb = true},
    {effect = 304, name = {english = "Big Explosion", german = "Große Explosion"}, powder = Item.sapphirePowder, stock = 22446419, essence = {Item.fireRoot, Item.desertSkyCapsule, Item.desertSkyCapsule, Item.desertSkyCapsule, Item.blackThistle, Item.blackThistle, Item.blackThistle, Item.sunHerb}, bomb = true},
    {effect = 306, name = {english = "Small Mana Annihilator", german = "Kleiner Manaannihilator"}, powder = Item.sapphirePowder, stock = 22856451, essence = {Item.nightAngelsBlossom, Item.nightAngelsBlossom, Item.nightAngelsBlossom, Item.desertSkyCapsule, Item.fourleafedOneberry, Item.fourleafedOneberry, Item.fourleafedOneberry, Item.sunHerb}, bomb = true},
    {effect = 307, name = {english = "Medium Mana Annihilator", german = "Mittlerer Manaannihilator"}, powder = Item.sapphirePowder, stock = 21957432, essence = {Item.nightAngelsBlossom, Item.nightAngelsBlossom, Item.desertSkyCapsule, Item.desertSkyCapsule, Item.fourleafedOneberry, Item.fourleafedOneberry, Item.fourleafedOneberry, Item.sunHerb}, bomb = true},
    {effect = 309, name = {english = "Big Mana Annihilator", german = "Großer Manaannihilator"}, powder = Item.sapphirePowder, stock = 22955451, essence = {Item.nightAngelsBlossom, Item.desertSkyCapsule, Item.desertSkyCapsule, Item.desertSkyCapsule, Item.fourleafedOneberry, Item.fourleafedOneberry, Item.fourleafedOneberry, Item.sunHerb}, bomb = true},
    {effect = 311, name = {english = "Small Nutrition Annihilator", german = "Kleiner Nahrungsannihilator"}, powder = Item.sapphirePowder, stock = 26843821, essence = {Item.oneleavedFourberry, Item.oneleavedFourberry, Item.oneleavedFourberry, Item.desertSkyCapsule, Item.yellowWeed, Item.yellowWeed, Item.yellowWeed, Item.sunHerb}, bomb = true},
    {effect = 312, name = {english = "Medium Nutrition Annihilator", german = "Mittlerer Nahrungsannihilator"}, powder = Item.sapphirePowder, stock = 15873523, essence = {Item.oneleavedFourberry, Item.oneleavedFourberry, Item.desertSkyCapsule, Item.desertSkyCapsule, Item.yellowWeed, Item.yellowWeed, Item.yellowWeed, Item.sunHerb}, bomb = true},
    {effect = 314, name = {english = "Big Nutrition Annihilator", german = "Großer Nahrungsannihilator"}, powder = Item.sapphirePowder, stock = 15783424, essence = {Item.oneleavedFourberry, Item.desertSkyCapsule, Item.desertSkyCapsule, Item.desertSkyCapsule, Item.yellowWeed, Item.yellowWeed, Item.yellowWeed, Item.sunHerb}, bomb = true},
    {effect = 316, name = {english = "Small Slime Barrier", german = "Kleine Schleimbarriere"}, powder = Item.sapphirePowder, stock = 86386546, essence = {Item.donfBlade, Item.donfBlade, Item.donfBlade, Item.lifeRoot, Item.desertSkyCapsule}, bomb = true},
    {effect = 317, name = {english = "Big Slime Barrier", german = "Große Schleimbarriere"}, powder = Item.sapphirePowder, stock = 76576456, essence = {Item.donfBlade, Item.donfBlade, Item.donfBlade, Item.donfBlade, Item.lifeRoot, Item.lifeRoot, Item.desertSkyCapsule, Item.desertSkyCapsule}, bomb = true},
    {effect = 318, name = {english = "Lennier's Dream", german = "Lenniers Traum"}, powder = Item.sapphirePowder, stock = 57932798, essence = {Item.daydream, Item.desertSkyCapsule, Item.desertSkyCapsule, Item.desertSkyCapsule, Item.firnisBlossom, Item.strawberry, Item.strawberry, Item.darkMoss}, bomb = true},
    {effect = 319, name = {english = "Proto brew: Brightrim's demon skeleton weakener", german = "Protogebräu: Brightrims Dämonenskelettschwächer"}, powder = Item.sapphirePowder, stock = 48923699, essence = {Item.iceLeaf, Item.desertSkyCapsule, Item.desertSkyCapsule, Item.desertSkyCapsule, Item.fourleafedOneberry, Item.fourleafedOneberry, Item.iceLeaf, Item.mandrake}, creator = "Amanda Brightrim", invention = 2, bomb = true},
    {effect = 320, name = {english = "Brightrim's demon skeleton weakener", german = "Brightrims Dämonenskelettschwächer"}, creator = "Amanda Brightrim", invention = 2, bomb = true},

    {effect = 400, name = {english = "Quality Raiser for Potions based on Emerald Powder", german = "Qualitätsheber für Tränke auf Smaragdstaubbasis"}, powder = Item.emeraldPowder, stock = 69487354, essence = {Item.marshFlower, Item.wolverineFern, Item.sunHerb, Item.sunHerb, Item.sunHerb}},
    {effect = 401, name = {english = "Quality Raiser for Potions based on Ruby Powder", german = "Qualitätsheber für Tränke auf Rubinstaubbasis"}, powder = Item.emeraldPowder, stock = 64966357, essence = {Item.marshFlower, Item.heartBlood, Item.sunHerb, Item.sunHerb, Item.sunHerb}},
    {effect = 402, name = {english = "Quality Raiser for Potions based on Sapphire Powder", german = "Qualitätsheber für Tränke auf Saphirstaubbasis"}, powder = Item.emeraldPowder, stock = 62497378, essence = {Item.marshFlower, Item.desertSkyCapsule, Item.sunHerb, Item.sunHerb, Item.sunHerb}},
    {effect = 403, name = {english = "Quality Raiser for Potions based on Obsidian Powder", german = "Qualitätsheber für Tränke auf Obsidianstaubbasis"}, powder = Item.emeraldPowder, stock = 64489753, essence = {Item.marshFlower, Item.conBlossom, Item.sunHerb, Item.sunHerb, Item.sunHerb}},
    {effect = 404, name = {english = "Quality Raiser for Potions based on Amethyst Powder", german = "Qualitätsheber für Tränke auf Amethyststaubbasis"}, powder = Item.emeraldPowder, stock = 67645954, essence = {Item.marshFlower, Item.lifeRoot, Item.sunHerb, Item.sunHerb, Item.sunHerb}},
    {effect = 405, name = {english = "Quality Raiser for Potions based on Topaz Powder", german = "Qualitätsheber für Tränke auf Topasstaubbasis"}, powder = Item.emeraldPowder, stock = 64873297, essence = {Item.marshFlower, Item.rainWeed, Item.sunHerb, Item.sunHerb, Item.sunHerb}},
    {effect = 406, name = {english = "Quality Raiser for Potions based on Diamond Powder", german = "Qualitätsheber für Tränke auf Diamantstaubbasis"}, powder = Item.emeraldPowder, stock = 64763659, essence = {Item.marshFlower, Item.piousBerry, Item.sunHerb, Item.sunHerb, Item.sunHerb}},

    {effect = 600, name = {english = "Language Potion Common Language", german = "Sprachtrank Handelssprache"}, powder = Item.diamondPowder, stock = 26727482, essence = {Item.piousBerry, Item.daydream, Item.yellowWeed}},
    {effect = 601, name = {english = "Language Potion Human Language", german = "Sprachtrank Menschensprache"}, powder = Item.diamondPowder, stock = 28751379, essence = {Item.piousBerry, Item.daydream, Item.desertBerry}},
    {effect = 602, name = {english = "Language Potion Dwarf Language", german = "Sprachtrank Zwergensprache"}, powder = Item.diamondPowder, stock = 23369487, essence = {Item.piousBerry, Item.daydream, Item.goldCrackHerb}},
    {effect = 603, name = {english = "Language Potion Elf Language", german = "Sprachtrank Elfensprache"}, powder = Item.diamondPowder, stock = 51397674, essence = {Item.piousBerry, Item.daydream, Item.nightAngelsBlossom}},
    {effect = 604, name = {english = "Language Potion Lizard Language", german = "Sprachtrank Echsensprache"}, powder = Item.diamondPowder, stock = 85612648, essence = {Item.piousBerry, Item.daydream, Item.rainWeed}},
    {effect = 605, name = {english = "Language Potion Orc Language", german = "Sprachtrank Orksprache"}, powder = Item.diamondPowder, stock = 58641767, essence = {Item.piousBerry, Item.daydream, Item.darkMoss}},
    {effect = 606, name = {english = "Language Potion Halfling Language", german = "Sprachtrank Halblingssprache"}, powder = Item.diamondPowder, stock = 56612824, essence = {Item.piousBerry, Item.daydream, Item.wolverineFern}},
    {effect = 607, name = {english = "Language Potion Ancient Language", german = "Sprachtrank Antike Sprache"}, powder = Item.diamondPowder, stock = 25796346, essence = {Item.piousBerry, Item.piousBerry, Item.daydream, Item.lifeRoot}},

    {effect = 500, name = {english = "Shape Shifter Male Human", german = "Verwandler Männlicher Mensch"}, powder = Item.obsidianPowder, stock = 64135842, essence = {Item.conBlossom, Item.herdersMushroom, Item.oneleavedFourberry, Item.mandrake}},
    {effect = 501, name = {english = "Shape Shifter Female Human", german = "Verwandler Weiblicher Mensch"}, powder = Item.obsidianPowder, stock = 64135842, essence = {Item.conBlossom, Item.birthMushroom, Item.oneleavedFourberry, Item.mandrake}},
    {effect = 510, name = {english = "Shape Shifter Male Dwarf", german = "Verwandler Männlicher Zwerg"}, powder = Item.obsidianPowder, stock = 74385866, essence = {Item.conBlossom, Item.herdersMushroom, Item.goldCrackHerb, Item.elfCaps}},
    {effect = 511, name = {english = "Shape Shifter Female Dwarf", german = "Verwandler Weiblicher Zwerg"}, powder = Item.obsidianPowder, stock = 74385866, essence = {Item.conBlossom, Item.birthMushroom, Item.goldCrackHerb, Item.elfCaps}},
    {effect = 520, name = {english = "Shape Shifter Male Halfling", german = "Verwandler Männlicher Halbling"}, powder = Item.obsidianPowder, stock = 84452136, essence = {Item.conBlossom, Item.herdersMushroom, Item.daydream, Item.strawberry}},
    {effect = 521, name = {english = "Shape Shifter Female Halfling", german = "Verwandler Weiblicher Halbling"}, powder = Item.obsidianPowder, stock = 84452136, essence = {Item.conBlossom, Item.birthMushroom, Item.daydream, Item.strawberry}},
    {effect = 530, name = {english = "Shape Shifter Male Elf", german = "Verwandler Männlicher Elf"}, powder = Item.obsidianPowder, stock = 87372749, essence = {Item.conBlossom, Item.herdersMushroom, Item.piousBerry, Item.blueBirdsberry}},
    {effect = 531, name = {english = "Shape Shifter Female Elf", german = "Verwandler Weiblicher Elf"}, powder = Item.obsidianPowder, stock = 87372749, essence = {Item.conBlossom, Item.birthMushroom, Item.piousBerry, Item.blueBirdsberry}},
    {effect = 540, name = {english = "Shape Shifter Male Orc", german = "Verwandler Männlicher Ork"}, powder = Item.obsidianPowder, stock = 63584498, essence = {Item.conBlossom, Item.herdersMushroom, Item.darkMoss, Item.marshFlower}},
    {effect = 541, name = {english = "Shape Shifter Female Orc", german = "Verwandler Weiblicher Ork"}, powder = Item.obsidianPowder, stock = 63584498, essence = {Item.conBlossom, Item.birthMushroom, Item.darkMoss, Item.marshFlower}},
    {effect = 550, name = {english = "Shape Shifter Male Lizardman", german = "Verwandler Männlicher Echsenmensch"}, powder = Item.obsidianPowder, stock = 23417592, essence = {Item.conBlossom, Item.herdersMushroom, Item.iceLeaf, Item.waterBlossom}},
    {effect = 551, name = {english = "Shape Shifter Female Lizardman", german = "Verwandler Weiblicher Echsenmensch"}, powder = Item.obsidianPowder, stock = 23417592, essence = {Item.conBlossom, Item.birthMushroom, Item.iceLeaf, Item.waterBlossom}},
    {effect = 560, name = {english = "Shape Shifter Dog", german = "Verwandler Hund"}, powder = Item.obsidianPowder, stock = 31397191, essence = {Item.conBlossom, Item.lifeRoot, Item.berries, Item.berries, Item.goldCrackHerb}},
    {effect = 561, name = {english = "Shape Shifter Spider", german = "Verwandler Spinne"}, powder = Item.obsidianPowder, stock = 71526316, essence = {Item.conBlossom, Item.sibanacLeaf, Item.blackberry, Item.blackberry, Item.tybaltStar}, creator = "Amanda Brightrim", invention = 1},
    {effect = 562, name = {english = "Proto brew: Druid's Escape", german = "Protogebräu: Druidenflucht"}, powder = Item.obsidianPowder, stock = 96962638, essence = {Item.conBlossom, Item.darkMoss, Item.herdersMushroom, Item.herdersMushroom, Item.footLeaf}, creator = "Yridia Anar", invention = 4},
    {effect = 563, name = {english = "Druid's Escape", german = "Druidenflucht"}, creator = "Yridia Anar", invention = 4},

    {effect = 700, name = {english = "Yridia's Rash and Skin Irritation ointment", german = "Yridias Salbe gegen Hautausschlag und Hautreizungen"}, powder = Item.topazPowder, stock = 34885446, essence = {Item.footLeaf, Item.footLeaf, Item.footLeaf, Item.firnisBlossom, Item.heathFlower}, creator = "Yridia Anar", invention = 3, salve = true},

}

function M.getPotionName(effectId)
    for _, potion in pairs(potions) do
        if effectId == potion.effect then
            return potion.name.english, potion.name.german
        end
    end
end

local cauldronsAndBottles = {

    {cauldron = 1012, bottle = 331, empty = {cauldron = Item.cauldronEmpty, bottle = Item.emptyPotion}},
    {powder = Item.sapphirePowder, gem = Item.sapphire, cauldron = 1011, bottle = Item.unlitAlchemyBomb, empty = {cauldron = Item.cauldronEmpty, bottle = Item.emptyAlchemyBomb}, essence = { full = 327 , empty = Item.emptyPotion}},
    {powder = Item.rubyPowder, gem = Item.ruby, cauldron = 1016, bottle = 59, empty = {cauldron = Item.cauldronEmpty, bottle = Item.emptyPotion}},
    {powder = Item.emeraldPowder, gem = Item.emerald, cauldron = 1013, bottle = 165, empty = {cauldron = Item.cauldronEmpty, bottle = Item.emptyPotion}},
    {powder = Item.obsidianPowder, gem = Item.obsidian, cauldron = 1009, bottle = 329, empty = {cauldron = Item.cauldronEmpty, bottle = Item.emptyPotion}},
    {powder = Item.amethystPowder, gem = Item.amethyst, cauldron = 1015, bottle = 166, empty = {cauldron = Item.cauldronEmpty, bottle = Item.emptyPotion}},
    {powder = Item.topazPowder, gem = Item.topaz, cauldron = 1018, bottle = Item.salveJar, empty = {cauldron = Item.cauldronEmpty, bottle = Item.emptySalveJar, essence = {full = 167, empty = Item.emptyPotion}}},
    {powder = Item.diamondPowder, gem = Item.diamond, cauldron = 1017, bottle = 330, empty = {cauldron = Item.cauldronEmpty, bottle = Item.emptyPotion}},
}

function M.getRequiredBottle(effectId)

    for _, potion in pairs(potions) do
        if potion.effect == effectId then
            if potion.bomb then
                return Item.emptyAlchemyBomb
            elseif potion.salve then
                return Item.emptySalveJar
            else
                return Item.emptyPotion
            end
        end
    end

    return Item.emptyPotion
end

local qualities = {
    [Player.german] = {"fürchterliche","schlechte","schwache","leicht schwache","durchschnittliche","gute","sehr gute","großartige","hervorragende"},
    [Player.english] = {"awful","bad","weak","slightly weak","average","good","very good","great","outstanding"}
}

local concentrations = {
    [Player.german] = {"gesättigte Anreicherung", "eine sehr ausgeprägte Menge", "merklich", "schwache Konzentration", "kein", "geringe Mengen", "etwas", "konzentriertes", "hoch toxisches"},
    [Player.english] = {"saturated solution" ,"dominant marked" ,"distinctive" ,"slightly marked" ,"no" ,"slightly pronounced" ,"enriched" ,"dominant pronounced" ,"highly toxic"}
}

local substances = {"Adrazin", "Illidrium", "Caprazin", "Hyperborelium", "Echolon", "Dracolin", "Orcanol", "Fenolin"}

local taste = {
    [Player.german] = {"fruchtig", "herb", "bitter", "faulig", "sauer", "salzig", "scharf", "süß"},
    [Player.english] = {"fruity", "tartly", "bitter", "putrefactive", "sour", "salty", "hot", "sweet"}
}

M.substances = substances

M.concentrations = concentrations

M.potions = potions

function M.getEssenceBrewGraphics(essenceBrew)

    local list = M.StockEssenceSplit(essenceBrew)

    for _, bottle in pairs(cauldronsAndBottles) do
        for _, ingredient in pairs(list) do
            if ingredient == bottle.bottle or bottle.essence and bottle.essence.full == ingredient then
                if bottle.essence and bottle.essence.full and bottle.essence.empty then
                    return bottle.essence.empty, bottle.essence.full
                else
                    return bottle.empty.bottle, bottle.bottle
                end
            end
        end
    end

    return 0
end


function M.StockEssenceSplit(stockEssence)

    local theList = common.split(stockEssence, ";")

    local returnList = {}

    for i=1,#theList do
        if tonumber(theList[i]) ~= nil then
            table.insert(returnList,tonumber(theList[i]))
        end
    end

    return returnList
end

function M.getPotionBottleIds(ingredientList)

    for _, bottle in pairs(cauldronsAndBottles) do
        for _, ingredient in pairs(ingredientList) do
            local gemPowderFound = ingredient.key == "ingredient" and ingredient.value == bottle.powder

            if ingredient.key == "essence" then
                local _, full = M.getEssenceBrewGraphics(ingredient.value)
                gemPowderFound = bottle.bottle == full or (bottle.essence and bottle.essence.full == full)
            end

            if gemPowderFound then
                return bottle.empty.bottle, bottle.bottle, bottle.essence
            end
        end
    end

    return 0
end

function M.getListOfBottles()

    local retVal = {}

    table.insert(retVal, Item.emptyPotion)
    table.insert(retVal, Item.emptySalveJar)

    for _, cauldronsAndBottle in pairs(cauldronsAndBottles) do
        table.insert(retVal, cauldronsAndBottle.bottle)
    end

    return retVal
end

function M.getQualityText(user, quality)
    return common.GetNLS(user, qualities[Player.german][quality], qualities[Player.english][quality])
end

local function getPotionInfo(potion)

    local creator = potion:getData("creator")
    local effect = potion:getData("potionEffectId")
    local typeOf = world:getItemStatsFromId(potion.id).English

    return creator, effect, typeOf

end

function M.logConsumption(user, potion)
    local creator, effect, typeOf = getPotionInfo(potion)
    log("Player "..user.name.."("..user.id..") used a potion("..typeOf..", "..effect..") created by "..creator)
end

function M.getAlchemyTool(user)
    local tools = {user:getItemAt(Character.left_tool), user:getItemAt(Character.right_tool)}

    for _, tool in pairs(tools) do
        if tool.id == alchemyTool and not common.isBroken(tool) then
            return tool
        end
    end
end

local function getGemBonus(user)

    local handItem = M.getAlchemyTool(user)

    if handItem then
        return gems.getGemBonus(handItem)
    end

    return 0
end

function M.StockEssenceList(theString)

    local liquid
    if string.find(theString,"stock ") then
        liquid = "stock"
    elseif string.find(theString,"essence ") then
        liquid = "essence brew"
    end
    local fromHere = string.find(theString,"(%d+)")
    local theList = common.split(string.sub(theString,fromHere), ";")
    local returnList = {}
    for i=1,#theList do
        if tonumber(theList[i]) ~= nil then
            table.insert(returnList,tonumber(theList[i]))
        end
    end
    return liquid, returnList
end

function M.convertOldRecipeToNew(user, parchment)

    local _

    local recipeTable = {}

    for i = 1, 60 do -- 60 is the old cap of ingredients
        local ingredient = parchment:getData("ingredient"..i)

        if common.IsNilOrEmpty(ingredient) then
            break --we found the last ingredient
        end

        local toReplace = {
            {old = Item.tangerine, new = Item.fairyRingMushroom},
            {old = Item.grapes, new = Item.stinkhorn},
            {old = Item.nuts, new = Item.elfCaps},
            {old = Item.apple, new = Item.strawberry},
        }

        local category = "ingredient"
        local value = ingredient

        if string.find(ingredient, "stock") then
            category = "stock"
            _, value = M.StockEssenceList(ingredient)
        elseif string.find(ingredient, "essence") then
            category = "essence"
            _, value = M.StockEssenceList(ingredient)
        elseif string.find(ingredient, "bottle") then
            category = "bottling"
            value = Item.emptyPotion
        elseif string.find(ingredient, "jar") then
            category = "bottling"
            value = Item.emptySalveJar
        end

        if category == "stock" or category == "essence" then

            local newValue = ""

            for index, val in ipairs(value) do
                if index > 1 then
                    newValue = newValue..";"
                end

                if category == "essence" then
                    for _, replace in pairs(toReplace) do
                        if tostring(replace.old) == tostring(val) then
                            val = replace.new
                        end
                    end
                end
                newValue = newValue..val
            end

            value = newValue
        end

        for _, replace in pairs(toReplace) do
            if category == "ingredient" and tostring(replace.old) == ingredient then
                value = replace.new
            end
        end

        table.insert(recipeTable, {key = category, value = value})

        parchment:setData("ingredient"..i, "")
    end

     common.convertTableToItemData(user, parchment, recipeTable, "alchemyIngredients", M.maxEntriesPerRecipe)
end

function M.canUseHerb(user, id)

    local alchemyLevel = user:getSkill(Character.alchemy)

    for _, herb in pairs(herbs) do
        if herb.id == id then
            local commonHerb = world:getItemStatsFromId(herb.id)
            local level = commonHerb.Level

            local breakPoints = {75, 50, 25, 0} -- to ensure fairness for all substances, other level impact is speed of adding the herbs

            for _, breakPoint in ipairs(breakPoints) do
                if level > breakPoint then
                    level = breakPoint
                    break
                end
            end

            if alchemyLevel < level then
                user:inform("Dein Alchemie-Level ist nicht hoch genug, um "..commonHerb.German.." zu verarbeiten.", "Your level of alchemy is not high enough to process the "..commonHerb.English..".")
                return false
            else
                return true
            end
        end
    end

    return nil
end

local function getBrewingDuration(user, id)

    local alchemyLevel = user:getSkill(Character.alchemy)

    if type(id) == "number" then
        for _, herb in pairs(herbs) do
            if herb.id == id then
                local commonHerb = world:getItemStatsFromId(herb.id)
                local diff = alchemyLevel - commonHerb.Level
                local max = 100 - commonHerb.Level
                local maxReduction = 15
                local reductionPerLevel = maxReduction / max
                local reduction = reductionPerLevel*diff

                return 30 - reduction
            end
        end

        return 30 -- 3 seconds

    else --bottle, stock or essence brew
        return 50 --5 seconds
    end

    --based on the ingredient level and your alchemy level, scale how long the step takes to brew
end

function M.getPlantSubstance(id)

    for _, herb in pairs(herbs) do
        if herb.id == id then
            return herb.positive, herb.negative
        end
    end

    return false
end

function M.splitStock(stock)

    local myData
    local dataZList = {}
    for i=1,8 do
        myData = math.floor(stock/(10^(8-i)))
        myData = myData - (math.floor(myData/10))*10
        dataZList[i] = myData
    end
    return dataZList
end

function M.DataListToNumber(dataList)
    local theData = 0
    for i=1,8 do
        theData = theData + dataList[i]*10^(8-i)
    end
    return theData
end

function M.SubstanceDatasToList(theItem)
    local substanceList = {}
    for i=1,8 do
        local concentration = tonumber(theItem:getData(substances[i].."Concentration"))
        if concentration ~= nil then
            table.insert(substanceList,concentration)
        end
    end

    return substanceList
end

-- probably, works only with lists containing no other lists
-- todo: make it also possibel to check lists containing list(s)
function M.CheckListsIfEqual(ListOne,ListTwo)
    local check = true
    if #ListOne == #ListTwo then
        for i=1,#ListOne do
            if ListOne[i] ~= ListTwo[i] then
                check = false
                break
            end
        end
    else
        check = false
    end
    return check
end


function M.generateTasteMessage(Character,dataZList)
    local textDe = "Der Trank schmeckt "
    local textEn = "The potion tastes "
    local anyTaste = false

    local usedTastes = {}

    for i=1,8 do
        if dataZList[i] > 5 then
            if usedTastes[i]==nil or usedTastes[i]<dataZList[i] then
                usedTastes[i] = dataZList[i]
            end
            anyTaste = true
        elseif dataZList[i] < 5 then
            if usedTastes[9-i]==nil or usedTastes[9-i]<dataZList[i] then
                usedTastes[9-i] = dataZList[i]
            end
            anyTaste = true
        end
    end
    if not anyTaste then
        textDe = textDe .. "nach nichts."
        textEn = textEn .. "like nothing."
    else
        for i=1,8 do
            if usedTastes[i]~=nil then
                if usedTastes[i] > 8 or usedTastes[i] < 2 then
                    textDe = textDe .. "sehr "
                    textEn = textEn .. "very "
                elseif (usedTastes[i] < 7 and usedTastes[i] > 5) or (usedTastes[i] > 3 and usedTastes[i] < 5) then
                    textDe = textDe .. "etwas "
                    textEn = textEn .. "slightly "
                end
                textDe = textDe..taste[0][i]..", "
                textEn = textEn..taste[1][i]..", "
            end
        end
        textDe = string.sub(textDe, 0, -3)
        textDe = textDe.."."
        textEn = string.sub(textEn, 0, -3)
        textEn = textEn.."."
    end
    common.InformNLS(Character,textDe,textEn)
end

function M.CheckIfGemDust(id)
    for _, selected in pairs(cauldronsAndBottles) do
        if selected.powder and selected.powder == id then
            return id
        end
    end
end

local FOOD_NEEDED = 250

function M.checkFood(User)
    if not common.FitForHardWork(User, FOOD_NEEDED) then
        return false
    end
    return true
end

function M.lowerFood(User)
    common.GetHungry(User, FOOD_NEEDED)
end

function M.CheckIfPotionBottle(sourceItem)
    for _, bottle in pairs(cauldronsAndBottles) do
        if (bottle.bottle and sourceItem.id == bottle.bottle) or (bottle.essence and sourceItem.id == bottle.essence.full) then
            return sourceItem
        end
    end
end

function M.GetCauldronInfront(User, Item)
    local retVal
    local item = common.GetFrontItem(User)
    if (item ~= nil) and (item.id >= 1008) and (item.id <= 1018) then
        retVal = item
    end
    return retVal
end

function M.CheckIfAlchemist(user, german, english)
    if (user:getMagicType() ~= 3) then
        if german and english then
            user:inform(german, english)
        end
        return false
    else
        return true
    end
end

function M.getBottleFromEffect(effectId)
    -- won't work with NORMAL primar and secundar attribute potins, since the both have 11111111 - 99999999 as a range for effect ids
    if (effectId >= 1) and (effectId <= 99) then
        return 166
    elseif (effectId >= 100) and (effectId <= 199) then
        return 59
    elseif (effectId >= 200) and (effectId <= 299) then
        return 167
    elseif (effectId >= 300) and (effectId <= 399) then
        return 327
    elseif (effectId >= 400) and (effectId <= 499) then
        return 165
    elseif (effectId >= 500) and (effectId <= 599) then
        return 329
    elseif (effectId >= 600) and (effectId <= 699) then
        return 330
    end
    return
end

function M.RemoveEssenceBrew(Item)
    for i=1,8 do
        Item:setData("essenceHerb"..i,"")
    end
end

function M.RemoveStock(Item)
    for i=1,8 do
        Item:setData(substances[i].."Concentration","")
    end
end

function M.RemoveAll(Item)
    M.RemoveEssenceBrew(Item)
    M.RemoveStock(Item)
    Item:setData("creator","")
    Item:setData("potionEffectId","")
    Item:setData("potionQuality","")
    Item:setData("filledWith","")
    Item:setData("legitimateKnowledgeOfPotionRecipe", "")
    Item:setData("herbsUsed","")
    Item:setData("totalRareCount","")
    if (Item.id >= 1008) or (Item.id <= 1018) then
        Item.id = 1008
    else
        Item.id = 164
    end
end

local function checkBrewingPermissions(fromItem)

    local permitted = fromItem:getData("legitimateKnowledgeOfPotionRecipe")

    if permitted == "false" then
        return false
    end

    return true

end

function M.EmptyBottle(user, bottle)

    local emptyBottle = 164

    local texts = {german = "Die Flasche zerbricht.", english = "The bottle breaks."}

    if bottle.id == 3643 then   --salve jar instead of potion
        emptyBottle = 3642
        texts.german = "Der Salbentiegel zerbricht."
        texts.english = "The salve jar breaks."
    end

    if math.random(1,20) == 1 then

        world:erase(bottle,1) -- bottle breaks
        common.InformNLS(user, texts.german, texts.english, Player.lowPriority)

    elseif bottle.number > 1 then -- if we empty a bottle (stock, potion or essence brew) it should normally never be a stack! but to be one the safe side, we check anyway

        common.CreateItem(user, emptyBottle, 1, 333, nil)
        world:erase(bottle, 1)

    else

        M.RemoveAll(bottle)
        bottle.id = emptyBottle
        bottle.quality = 333
        world:changeItem(bottle)
    end
end

local function potionRequiresPermission(potionId)

    for _, potion in pairs(potions) do
        if potion.effect == potionId and potion.creator then
            return true
        end
    end

    return false
end

function M.FillFromTo(fromItem,toItem)
    -- copies all datas (and quality and id) from fromItem to toItem
    for i=1,8 do
        toItem:setData(substances[i].."Concentration",fromItem:getData(substances[i].."Concentration"))
        toItem:setData("essenceHerb"..i,fromItem:getData("essenceHerb"..i))
    end
    toItem:setData("creator",fromItem:getData("creator"))
    toItem:setData("filledWith",fromItem:getData("filledWith"))
    toItem:setData("potionEffectId",fromItem:getData("potionEffectId"))
    toItem:setData("herbsUsed",fromItem:getData("herbsUsed"))
    toItem:setData("totalRareCount",fromItem:getData("totalRareCount"))
    toItem:setData("legitimateKnowledgeOfPotionRecipe", fromItem:getData("legitimateKnowledgeOfPotionRecipe"))
    local quality = tonumber(fromItem:getData("potionQuality"))
    if quality == nil then
        quality = fromItem.quality
    end
    if toItem.id >= 1008 and toItem.id <= 1018 then
        toItem:setData("potionQuality",quality)
    else
        toItem.quality = quality
    end
    local _, _, reCauldron, reBottle = M.GemDustBottleCauldron(fromItem.id)

    if toItem.id >= 1008 and toItem.id <= 1018 then
        toItem.id = reCauldron
    else

        if potionRequiresPermission(tonumber(fromItem:getData("potionEffectId"))) then
            local hasPermission = checkBrewingPermissions(fromItem)

            if not hasPermission then
                toItem:setData("potionEffectId", 0)
            end
        end

        if toItem.id == 3643 or toItem.id == 3642 then --account for salve jars
            reBottle = 3643
        end

        toItem.id = reBottle
    end
    world:changeItem(toItem)
end

local USER_EXPLOSION_LIST = {}

function M.CheckExplosionAndCleanList(User)
    local check = false
    if USER_EXPLOSION_LIST[User.id] == true then
        check = true
        USER_EXPLOSION_LIST[User.id] = nil
    end

    return check
end

function M.CauldronDestruction(User,cauldron,effectId)

    if (effectId < 1) or (effectId > 3) or (effectId == nil) then
        effectId = 1
    end

    if effectId == 1 then
        world:gfx(1,cauldron.pos)
        world:makeSound(5,cauldron.pos)
        User:inform("Der Inhalt des Kessels verpufft.",
            "The substance in the cauldron blows out."
        )
    elseif effectId == 2 then
        world:makeSound(5,cauldron.pos)
        world:gfx(36,cauldron.pos)
        User:inform("Deine letzte Handlung scheint den Inhalt des Kessels zerstört und zu einer Explosion geführt zu haben.",
            "Your last doing seems to have destroyed the substance in the cauldron and caused an explosion."
        )
        local myVictims = world:getPlayersInRangeOf(cauldron.pos,1) -- we hurt everyone around the cauldron!
        for i=1,#myVictims do
            myVictims[i]:increaseAttrib("hitpoints",-3000)
            common.HighInformNLS(myVictims[i], "Du wirst von einer Explosion getroffen.", "You are hit by an explosion.")
        end
    end
    USER_EXPLOSION_LIST[User.id] = true
    M.RemoveAll(cauldron)
    cauldron.id = 1008
    world:changeItem(cauldron)
end

function M.informAlchemyToolNeeded(user)
    user:inform(common.GetNLS(user, "Du brauchst einen Mörser, um Zutaten fürs Brauen vorzubereiten.", "You must wield a mortar in order to process the ingredients for your brewing."))
end

function M.SetQuality(user, cauldron)

    local gemBonus = tonumber(getGemBonus(user))
    local leadAttribNames = common.GetLeadAttributeName(Character.alchemy)
    local leadAttribValue1 = user:increaseAttrib(leadAttribNames.first, 0) * 0.6
    local leadAttribValue2 = user:increaseAttrib(leadAttribNames.second, 0) * 0.4
    local leadAttribValue = leadAttribValue1 + leadAttribValue2
    local toolItem = M.getAlchemyTool(user)
    local meanQuality = 5
    meanQuality = meanQuality*(1+common.GetAttributeBonusHigh(leadAttribValue)+common.GetQualityBonusStandard(toolItem))+gemBonus/100 --Apply boni of lead attrib, tool quality and gems.
    meanQuality = common.Limit(meanQuality, 1, 8.5) --Limit to a reasonable maximum to avoid overflow ("everything quality 9"). The value here needs unnatural attributes.
    local herbsUsed = cauldron:getData("herbsUsed")
    local totalRareCount = cauldron:getData("totalRareCount")
    local rareIngredientBonus = totalRareCount/herbsUsed
    local rarityBonus = (rareIngredientBonus - 1) * (0.5 / 3)
    meanQuality = meanQuality + rarityBonus

    local quality = 1 --Minimum quality value.
    local rolls = 8 --There are eight chances to increase the quality by one. This results in a quality distribution 1-9.
    local probability = (meanQuality-1)/rolls --This will result in a binominal distribution of quality with meanQuality as average value.

    for i=1,rolls do
        if math.random()<probability then
            quality=quality+1
        end
    end

    quality = common.Limit(quality, 1, common.ITEM_MAX_QUALITY)

    if quality < common.ITEM_MAX_QUALITY then
        if pyr.upQuality(user) then
            quality = quality + 1
        end
    end

    local ilynProcced = ilyn.duplicateItem(user, 20)

    local durability = common.ITEM_MAX_DURABILITY
    local qualityDurability = common.calculateItemQualityDurability(quality, durability)
    cauldron:setData("potionQuality", qualityDurability)
    cauldron:setData("ilyn", tostring(ilynProcced))
    world:changeItem(cauldron)
end

function M.GemDustBottleCauldron(id, essenceBrew)

    for _, selected in pairs(cauldronsAndBottles) do
        if not essenceBrew and (selected.powder == id or selected.gem == id or selected.cauldron == id or selected.bottle == id) then
            return selected.gem, selected.powder, selected.cauldron, selected.bottle
        elseif selected.essence and (selected.essence.full == id or essenceBrew and (selected.powder == id or selected.gem == id or selected.cauldron == id or selected.bottle == id)) then
            return selected.gem, selected.powder, selected.cauldron, selected.essence.full
        end
    end
end

local function checkIfPlayerKnowsPotion(user, effect)

    local creator
    local index

    for _, potion in pairs(potions) do
        if potion.effect == effect then
            creator = potion.creator
            index = potion.invention
        end
    end

    if creator == user.name or common.readBitwise(user, index, M.playerPotionStartQuest) then
        return true
    end

    return false

end

local function identicalContents(herbs1, herbs2)

    for i = 1, 8 do
        if herbs1[i] ~= herbs2[i] then
            return false
        end
    end

    return true
end

local function getEffectFromIngredients(powder, stock, essence)

    if #essence == 0 and (powder == Item.rubyPowder or powder == Item.amethystPowder) then
        return stock
    end

    local sightPotion = {Item.angerBerry, Item.angerBerry, Item.rainWeed, Item.daydream, Item.toadstool}

    if identicalContents(essence, sightPotion) and powder == Item.rubyPowder then
        return 5900000000 + stock
    end

    for _, potion in pairs(potions) do
        if potion.powder == powder and potion.stock == stock and identicalContents(potion.essence, essence) then
            return potion.effect
        end
    end

    return 0
end

function M.useMana(user)

    local skill = user:getSkill(Character.alchemy)

    local manaCost = 3000

    local decrease = 1500/100*skill

    manaCost = manaCost -decrease

    if not magic.hasSufficientMana(user, manaCost) then
        user:inform("Du hast nicht genug Mana.", "You do not have enough mana.")
        return false
    end

    user:increaseAttrib("mana", -manaCost)

    return true

end

----------------------------------------------------
-- combine of stock and essence brew to create a potion
-- function is only called when item 331 is a stock or when a potion-bottle is an essence brew
function M.CombineStockEssence( user, stock, essenceBrew)

    local cauldron = M.GetCauldronInfront(user)
    if cauldron then

        if not M.useMana(user) then
            return
        end

        -- we get the gem dust used as an ingredient; and the new cauldron id we need later
        local _, ingredientGemdust, newCauldron = M.GemDustBottleCauldron(essenceBrew.id)
        -- firstly, the gem dust which has been used (indirectly, that is the potion kind)
        -- secondly, the stock
        local stockConc = ""
        for i=1,8 do
            local currentSubs = stock:getData(substances[i].."Concentration")
            if currentSubs == "" then
                currentSubs = 5
            end
            stockConc = stockConc..currentSubs
        end

        stockConc = tonumber(stockConc)

        local essenceHerbs = {}

        -- thirdly, the (at maximum) eight herbs of the essenceBrew

        for i= 1, 8 do
            if essenceBrew:getData("essenceHerb"..i) ~= "" then
                table.insert(essenceHerbs, tonumber(essenceBrew:getData("essenceHerb"..i)))
            end
        end

        -- get the potion effect id
        local effectID = getEffectFromIngredients(ingredientGemdust, stockConc, essenceHerbs)

        -- check if char is able to combine
        if effectID >= 1000 and effectID <= 1999 then
            if user:getQuestProgress(effectID+1000) == 0 then
                user:inform("Du versuchst die Gebräue zu verbinden, doch sie scheinen sich nicht vermischen zu wollen. Scheinbar beherrscht du diesen Trank noch nicht richtig.",
                    "You try to combine the brews but they just don't mix. It seem that you haven't learned how to create this potion properly.")
                return false
            end
        end
        -- delte old cauldron datas and add new ones
        M.RemoveAll(cauldron)
        M.SetQuality(user,cauldron)
        cauldron.id = newCauldron
        cauldron:setData("potionEffectId", ""..effectID)
        if potionRequiresPermission(effectID) then
            cauldron:setData("legitimateKnowledgeOfPotionRecipe", tostring(checkIfPlayerKnowsPotion(user, effectID)))
        end

         for _, selectedPotion in pairs(potions) do
            if selectedPotion.effect == effectID then
                cauldron:setData("filledWith", "potion")
            end
        end

        world:changeItem(cauldron)
        world:makeSound(13,cauldron.pos)
        world:gfx(52,cauldron.pos)
        -- and learn!
        user:learn(Character.alchemy, 80/2, 100)
        return true
    end
end

-- COPIED from alchemy.id_165_blue_bottle
-- Some circular requiring messed up the code. Therefore, I put the functions here as well.
-- Bad coding. Will be removed once I bother to do it properly.
local function SupportEssenceBrew(User,support,essenceBrew)

    -- no effects yet, support has no effect, essenceBrew is unchanged

    local cauldron = common.GetFrontItem( User )
    -- remove the support
    M.RemoveAll(cauldron)
    -- fill in the brew
    M.FillFromTo(essenceBrew,cauldron)
    world:changeItem(cauldron)
    world:gfx(1,cauldron.pos)
end

-- COPIED from alchemy.id_165_blue_bottle
-- Some circular requiring messed up the code. Therefore, I put the functions here as well.
-- Bad coding. Will be removed once I bother to do it properly.
local function SupportPotion(User,support,potion)
    local cauldron = common.GetFrontItem( User )
    local supportEffectId = tonumber(support:getData("potionEffectId"))

    local supportQuality, potionQuality
    if support.id >= 1008 and support.id <= 1018 then
        supportQuality = tonumber(support:getData("potionQuality"))
        potionQuality = potion.quality
    else
        supportQuality = support.quality
        potionQuality = tonumber(potion:getData("potionQuality"))
    end
    if (supportEffectId >= 400) and (supportEffectId <= 406) then -- quality raiser
    -- list with potions in cauldron and bottle
    local cauldronPotion = {1011,1016,1013,1009,1015,1018,1017}
    local bottlePotion   = {327 ,59  ,165 ,329 ,166 ,167 ,330}

    if (potion.id == cauldronPotion[supportEffectId-399]) or (potion.id == bottlePotion[supportEffectId-399]) then -- support and potion belong together

    supportQuality = common.Limit(math.floor(supportQuality/100), 1, 9)
    local chance = supportQuality*9  -- support quality * 9 = chance that potion's quality is increased
    if common.Chance(chance, 100)==true then
        potionQuality = common.Limit(potionQuality+100, 100, 999) -- new quality
        world:gfx(53,cauldron.pos)
    else -- no success, quality stays the same
    world:gfx(1,cauldron.pos)
    end

    else
        world:gfx(1,cauldron.pos)
    end

    else
        world:gfx(1,cauldron.pos)
    end
    M.RemoveAll(cauldron)
    M.FillFromTo(potion,cauldron)
    cauldron:setData("potionQuality",potionQuality) -- here we set the new quality, in case the quality raiser was successfull
    world:changeItem(cauldron)
end

-- function to fill stock, essencebrew or potion into a cauldron
function M.FillIntoCauldron(user, sourceItem, cauldron, ltstate)

    local tool = M.getAlchemyTool(user)
    local bottleContents = sourceItem:getData("filledWith")
    local cauldronContents = cauldron:getData("filledWith")

    if not tool then
        M.informAlchemyToolNeeded(user)
        return
    end

    -- is the char an alchemist?
    local anAlchemist = M.CheckIfAlchemist(user,
                        "Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.",
                        "Only those who have been introduced to the art of alchemy are able to work here.")

    if not anAlchemist then
        return
    end

    if licence.licence(user) then --checks if user is citizen or has a licence
        return -- avoids crafting if user is neither citizen nor has a licence
    end

    if not M.checkFood(user) then
        return
    end

    if ltstate == Action.abort then
        common.InformNLS(user, "Du brichst deine Arbeit ab.", "You abort your work.")
        return
    end

    if ltstate == Action.none then
        local actionDuration
        if bottleContents =="essenceBrew" and cauldronContents == "stock" then
            actionDuration = 80 -- when we combine a stock and an essence brew, it takes longer
        else
            actionDuration = 20
        end
        user:startAction( actionDuration, 21, 5, 10, 45)
        return
    end

    if bottleContents == "essenceBrew" or bottleContents == "potion" or bottleContents == "salve" then -- essence brew should be filled into the cauldron
        -- water, essence brew or potion is in the cauldron; leads to a failure

        if cauldronContents == "water" then
            M.CauldronDestruction(user,cauldron,1)

        elseif cauldronContents == "essenceBrew" then
            M.CauldronDestruction(user, cauldron, 2)

        elseif cauldronContents == "potion" then
            if cauldron.id == 1013 then -- support potion
                if bottleContents == "potion" then
                    SupportPotion(user, cauldron, sourceItem)
                elseif bottleContents == "essenceBrew" then
                    SupportEssenceBrew(user, cauldron, sourceItem)
                else
                    M.CauldronDestruction(user, cauldron, 2)
                end
            else
                M.CauldronDestruction(user, cauldron, 2)
            end
        elseif cauldronContents == "salve" then
            M.CauldronDestruction(user, cauldron, 2)

        elseif cauldronContents == "stock" then -- stock is in the cauldron; we call the combin function
            if bottleContents == "essenceBrew" then
                M.CombineStockEssence(user, cauldron, sourceItem)
            else
                M.CauldronDestruction(user, cauldron, 2)
            end

        else -- nothing in the cauldron, we just fill in the essence brew
            M.FillFromTo(sourceItem, cauldron)
        end
    end
    M.EmptyBottle(user, sourceItem)
end

-- a bug led to a situation that some potions missed the "filledWith"-data
-- this function will be called whenever seomething is done to a potion and set the proper data
function M.repairPotion(potion)

    if tonumber(potion:getData("potionEffectId")) and common.IsNilOrEmpty(potion:getData("filledWith")) then

        local effectId = tonumber(potion:getData("potionEffectId"))

        for _, selectedPotion in pairs(potions) do
            if selectedPotion.effect == effectId or (effectId >= 11111111 and effectId <= 99999999) then

                potion:setData("filledWith", "potion")
                world:changeItem(potion)
                 break
            end
        end
    end
end

-- return a list containing values for actionStart
--@param theIngredient can be: "water","bottling","plant","gemPowder","stock","essenceBrew","potion"; everything else gets a default value
function M.GetStartAction(User, ingredient, cauldron)

    local duration = getBrewingDuration(User, ingredient.value)
    local gfxId = 21
    local gfxIntervall = 10
    local sfxId = 0
    local sfxIntervall = 0

    if ingredient.key == "bottling" or ingredient.key == "ingredient" then

        sfxId = 15
        sfxIntervall = 25

    elseif (ingredient.key == "stock" and cauldron:getData("filledWith")=="essenceBrew") or (ingredient.key =="essence" and cauldron:getData("filledWith")=="stock") or (ingredient.key == "stock" or ingredient.key == "essence" or ingredient.key == "potion") then
        sfxId = 10
        sfxIntervall = 45
    end

    return duration,gfxId,gfxIntervall,sfxId,sfxIntervall
end

return M
