local Craft = require("base.crafting.Craft")
local ProductGroup = require("base.crafting.ProductGroup")
local Product = require("base.crafting.Product")
local Ingredient = require("base.crafting.Ingredient")

local glassblowingandpottery = Craft {
    name = {english = "Glass blowing and pottery", german = "GERMAN"}
    handTool = "HTOOL",
    -- for single static tool:
    staticTool = "STOOL",
    -- or for static tool with active and inactive state:
    staticTool = {inactive = "STOOL1", active = "STOOL2"}
    skill = "SKILL",
    defaultFoodConsumption = NO_DEFAULT,
    [sfx = ID,
    sfxDuration = TIME,]

ProductGroup {name = {english = "Bottles", german = "Flaschen"},
Product {item = "emptyInkBottle", Ingredient {item = "glassIngot", amount = 1}},
Product {item = "largeEmptyBottle", Ingredient {item = "glassIngot", amount = 1}},
Product {item = "emptyJuiceBottle", Ingredient {item = "glassIngot", amount = 1}},
Product {item = "emptyRumBottle", Ingredient {item = "glassIngot", amount = 1}},
Product {item = "oilBottle", Ingredient {item = "glassIngot", amount = 1}},
Product {item = "emptyPotion", Ingredient {item = "glassIngot", amount = 2}},
Product {item = "emptyLiquorBottle", Ingredient {item = "glassIngot", amount = 2}}
}

ProductGroup {name = {english = "Glasses", german = "Gläser"},
Product {item = "glassMug", Ingredient {item = "glassIngot", amount = 2}},
Product {item = "glass", Ingredient {item = "glassIngot", amount = 2}},
Product {item = "wineGlass", Ingredient {item = "glassIngot", amount = 4}}
}

ProductGroup {name = {english = "Other", german = "Sonstiges"},
Product {item = "emptySalveJar", Ingredient {item = "glassIngot", amount = 5}}
}

ProductGroup {name = {english = "Pottery", german = "Töpfern"},
Product {item = "bricks", Ingredient {item = "clay", amount = 2}},
Product {item = "mortar", Ingredient {item = "clay", amount = 2}, Ingredient {item = "amethystPowder", amount = 1}},
Product {item = "clayMug", Ingredient {item = "clay", amount = 2}},
Product {item = "clayCup", Ingredient {item = "clay", amount = 3}},
Product {item = "mugWithLid", Ingredient {item = "clay", amount = 6}},
Product {item = "vase", Ingredient {item = "clay", amount = 10}, Ingredient {item = "obsidianPowder", amount = 1}}
}
}
return glassblowingandpottery