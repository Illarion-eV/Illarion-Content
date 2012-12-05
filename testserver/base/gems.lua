module("base.gems", package.seeall)

-- calculates the gem bonus and returns it in %
function getGemBonus(item)
    gemStrength={};
    gemStrength[1]=extractNum(item:getData("magicalEmerald"));
    gemStrength[2]=extractNum(item:getData("magicalRuby"));
    gemStrength[3]=extractNum(item:getData("magicalTopaz"));
    gemStrength[4]=extractNum(item:getData("magicalAmethyst"));
    gemStrength[5]=extractNum(item:getData("magicalSapphire"));
    gemStrength[6]=extractNum(item:getData("magicalObsidian"));

    gemSum=0;
    gemMin=1000;   -- arbitrarily high number

    for _, gStrength in pairs(gemStrength) do
        gemSum=gemSum+gStrength;
        if gStrength<gemMin then gemMin=gStrength end;
    end

    return gemSum+gemMin*6*2;

end

function extractNum(text)
    if text=="" then
        return 0
    end
    return tonumber(text)
end

