require("content.craft.brewing")

module("item.id_339_barrel", package.seeall)

function UseItem(User, SourceItem, ltstate)
    content.craft.brewing.brewing:showDialog(User, SourceItem)
end
