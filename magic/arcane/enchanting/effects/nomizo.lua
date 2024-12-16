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

local shared = require("magic.arcane.enchanting.core.shared")
local sharedCraft = require("craft.base.shared")
local globalvar = require("base.globalvar")

local M = {}

function M.increaseTreasureChance(user, toolItem)

    local gatheringBonus = sharedCraft.getGatheringBonus(user, toolItem) * 4.5

    local chance = {min = 0.00025*(1 + gatheringBonus), bonus = 0.00075*(1 + gatheringBonus)}

    --[[
    A strong miner with tier 5 magic gems has approx a 0.2% chance to get anything via the regular gathering script.
    With a perfect topaz ring and perfect nomizo glyph, the base odds here are 0.1%, half of that chance.
    It is then scaled up by the gatheringBonus*5, which means it can reach up to 1%.
    This is for multiple reasons:
    1.
        The odds of 0.1% would result in needing 1000 resources to deplete each glyph charge,
        in total 12000 to deplete a perfectly glyphed perfect golden topaz ring.
        And up to a staggering 48000 if it is the worst quality.
        This would cause there to be little to no market for the item.
    2.
        On the other hand, having higher odds as default devalues the importance of constitution, perception,
        pickaxe quality and gems for a gatherer.
        As such it makes more sense to scale the value by the gatheringBonus so that gatherers, the actual target for this glyph,
        gain the benefits while the non-gatherers can not bypass the usual requirements, only receiving a small bonus to their
        treasure findings and needing longer to deplete the glyph.
        With a 1% chance (divided on treasure maps, elements and random items you can find) you will on average as a high statted
        gatherer with a perfect tool and tier 5~ gems have a 1.2% chance to find treasure.
        This would result in depleting the glyph in 1200 resources aka 30 minutes at max level not counting the time
        going between nodes and starting the gathering action, a much more reasonable depletion rate
        that ensures that high-end gatherers will be return customers for this glyph, with an average of 14.4 treasures
        found in that time.

        The distribution if we follow the gathering frequencies:

        Any elements (divided by 5 for specific element): 39.53% aka an average of 5.69 elements per glyph
        Maps: 23.72% aka an average of 3.42 maps per glyph
        Frequent item: 23.72% aka an average of 3.42 frequent items per glyph
        Occasional item: 11.86% aka an average of 1.71 occasional items per glyph
        Rare item: 1.19% aka an average of 0.17 rare items per glyph

        For reference, the gathering frequencies used:
        Frequent item: 1/2000 aka 12000/50600
        Occasional item:  1/4000 aka 6000/50600
        Rare item = 1/40000 aka 600/50600
        Any element = 1/1200 aka 20000/50600
        Map = 1/2000 aka 12000/50600

        Now this is clearly problematic based on current player market economy, which of course fluctuates so this may change.
        I've generally seen elements sold for 1-2 gold a pop. Their base value for crafting calculations is 2 gold.
        Meanwhile the perfect glyphs I have seen are sold at 1 gold, requiring 7 shards.
        Shards I've seen being sold at 2 silver each. That's 14 silver in production costs.
        So for a production cost of 14 silver a gatherer can obtain 5.69-11.38 gold worth of elements, which is not even including the value of maps.
        Clearly the frequencies of the trash items must be higher in comparison.

        As such the frequencies I will go with:

        5% pure element (aka 0.72 elements per glyph) (valued at 2 gold for this calculation)
        5% treasure map (aka 0.72 treasure maps per glyph (2.5% for each map, for an approx average value of 2 gold per map based on player economy)
        10% rare item (aka 1.44 rare items per glyph) (approx 30-40 silver flat vendor value), not all gathering skills even have one added
        20% occasional item (aka 2.88 occasional items per glyph) (approx 2 silver flat vendor value)
        60% frequent item (aka 8.64 frequent items per glyph) (approx 80 copper flat vendor value)

        This resulting in an average value of 1.44+1.44+0.504+0.0576+0.0691 aka 3 gold 51 silver and 7 copper per glyph on average

        This means that, assuming the player interacts with others to sell the maps and elements, and vendors the items, they will
        based on present market values earn a profit of 2 gold 51 silver and 7 copper per rune.

        At the minTime at max skill of 1.5 seconds per resource, that is 2 gold 51 silver and 7 copper extra profit for 30 minutes work
        ontop of the 1200 resources which even if it something as low level as coal is 120 silver on its own.

        Since the profit also requires a lot of extra steps to realize (hunting the maps, crafting things with pure elements) or
        player trade, I think this is a reasonable rate of profit.

    ]]

    local success = shared.activateGlyph(user, "nomizo", chance, 1)

    if success then
        world:gfx( globalvar.gfxSPLASH, user.pos)
        return true
    end

    return false

end

return M
