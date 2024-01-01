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

--[[
Existing fishing hotspots, their proper lore names and fish allocation.

Galmair - Rumil something? Near Rumil Estate, correct name needs to be filled in
Warp position: 407, 342, 0
7 trout shoals

Galmair - At the bridge by galmair farm fields, any specific name?, correct name needs to be filled in
Warp position: 479, 249, 0
3 trout shoals, 5 salmon shoals

Galmair - Narguns plains
Warp position: 539, 219, 0
5 salmon shoals, 3 horse mackerel shoals

Runewick - Runewick peninsula and yewdale
Warp position: 817, 821, 0
15 trout, 5 salmon

Runewick - betweeen yewdale and dewy swamps
Warp position: 840, 728, 0
5 trout, 10 salmon


Runewick - Dewy swamps
Warp position: 905, 646, 0
5 salmon, 6 horse mackerel


Wild - Raban's Grove
Warp position: 791, 133, 0
2 rosefish shoals

Wild - Skewer Drift / Spießstollen
Warp position: 932, 459, 0
1 trout shoal, 6 salmon shoals, 3 horse mackerel shoals

Wild - Elstree forest
Warp position: 814, 467, 0
3 trout, 4 salmon, 2 horse mackerel

Wild -- ?? ruins
Warp position: 533, 431, 0
4 trout, 6 salmon

Wild -- ??
Warp position: 113, 799, 0
7 trout, 3 salmon

Wild -- kantabi oasis
Warp position: 384, 671, 0
1 rosefish

Wild - ??
Warp position: 257, 444, 0
4 trout 4 salmon 1 horse

Wild - ??
Warp position: 594, 743, 0
3 horse mackerel, 7 salmon, 12 trout

Wild - Tanoras ruined temple
Warp position: 618, 593, 0
3 rosefish

]]

local common = require("base.common")
local shared = require("craft.base.shared")
local gathering = require("craft.base.gathering")

local M = {}

M.skill = "fishing"

M.fishList = {
    {id = Item.shoal, depletedId = Item.emptyTroutShoal, productId = Item.trout, maxAmount = 20, tool = Item.fishingRod},
    {id = Item.salmonShoal, depletedId = Item.emptySalmonShoal, productId = Item.salmon, maxAmount = 20, tool = Item.fishingRod},
    {id = Item.shrimpShoal, depletedId = Item.emptyShrimpShoal, productId = Item.shrimp, maxAmount = 20, tool = Item.fishingNet},
    {id = Item.flounderShoal, depletedId = Item.emptyFlounderShoal, productId = Item.flounder, maxAmount = 20, tool = Item.fishingRod},
    {id = Item.horsemackerelShoal, depletedId = Item.emptyHorsemackerelShoal, productId = Item.horseMackerel, maxAmount = 20, tool = Item.fishingRod},
    {id = Item.rosefishShoal, depletedId = Item.emptyRosefishShoal, productId = Item.roseFish, maxAmount = 20, tool = Item.fishingRod},
    {id = Item.crabShoal, depletedId = Item.emptyCrabShoal, productId = Item.crab, maxAmount = 10, tool = Item.fishingNet},
    {id = Item.eelShoal, depletedId = Item.emptyEelShoal, productId = Item.eel, maxAmount = 10, tool = Item.fishingRod},
    {id = Item.octopusShoal, depletedId = Item.emptyOctopusShoal, productId = Item.octopus, maxAmount = 5, tool = Item.fishingRod},
    {id = Item.swordfishShoal, depletedId = Item.emptySwordfishShoal, productId = Item.swordfish, maxAmount = 5, tool = Item.fishingRod},
    {id = Item.lobsterShoal, depletedId = Item.emptyLobsterShoal, productId = Item.lobster, maxAmount = 5, tool = Item.fishingNet}
}

local fishList = M.fishList

local function getToolId(sourceItem)

    for _, fish in pairs(fishList) do
        if sourceItem.id == fish.id then
            return fish.tool
        end
    end

end


function M.StartGathering(user, sourceItem, actionstate)

    local fishing = gathering.GatheringCraft:new{LeadSkill = Character.fishing, LearnLimit = 100}; -- id_72_fishingrod
    local toolID = getToolId(sourceItem)
    local maxAmount = gathering.getMaxAmountFromResourceList(fishList, sourceItem.id)
    local resourceID = gathering.getProductId(fishList, sourceItem.id)
    local depletedResourceID = gathering.getDepletedObject(fishList, sourceItem.id)
    local restockWear = 4 -- 15 minutes

    local success, toolItem, amount, gatheringBonus = gathering.InitGathering(user, sourceItem, toolID, maxAmount, fishing.LeadSkill)

    if not success then
        return
    end

    if not gathering.isDepletableResource(user, sourceItem, fishList) then
        return
    end

    fishing:AddRandomPureElement(user,gathering.prob_element*gatheringBonus); -- Any pure element

    local treasureMapText = {
        german = "Statt eines Fisches hast du eine Karte am Haken hängen. Gedankt sei Nargùn!",
        english = "Nargùn's favour has finally found you for there is a treasure map on your hook instead of a fish!"}
    local monsterText = {
        german = "Ein heftiger Ruck reißt dir fast die Angel aus der Hand. Noch während du dich wunderst, teilt sich das Wasser vor dir und eine glitschige Wasserleiche steigt aus den Wellen empor.",
        english = "A heavy force pulls on your fishing line momentarily before it releases. Then without warning the water before you erupts as a putrified mummy vaults toward you."}
    local bucketText = {
        german = "Ein Eimer verfängt sich in deiner Angelschnur. Den hat hier wohl jemand verloren.",
        english = "As you tighten your line you feel a heavy resistance. With a careful approach you are able to pull a bucket ashore."}
    local oilLampText = {
        german = "Du ziehst eine glitzernde Öllampe aus dem Wasser. Wo die wohl herkommt...?",
        english = "You pull a sparkling oil lamp out of the water. Where did that come from?"}
    local bootsText = {
        german = "Ein alter, durchlöcherter Lederstiefel hängt am Haken.",
        english = "As you angle back and forth for fish you feel a snag. Instead of a fish, however, a pair of old perforated boots tied together hangs from your hook!"}

    if toolID == Item.fishingNet then --Alternate texts for fishing nets
        treasureMapText.german = "Statt eines Fisches hast du eine Karte im Netz. Gedankt sei Nargùn!"
        treasureMapText.english = "Nargùn's favour has finally found you for there is a treasure map in your net instead of a fish!"
        monsterText.german = "Ein heftiger Ruck reißt dir fast das Netz aus der Hand. Noch während du dich wunderst, teilt sich das Wasser vor dir und eine glitschige Wasserleiche steigt aus den Wellen empor."
        monsterText.english = "A heavy force pulls on your fishing net momentarily before it releases. Then without warning the water before you erupts as a putrified mummy vaults toward you."
        bucketText.german = "Ein Eimer verfängt sich in deinem Netz. Den hat hier wohl jemand verloren."
        bucketText.english = "As you brung your net back in you feel a heavy resistance. With sufficient use of force you are able to pull a bucket ashore."
        bootsText.german = "Ein paar alter, durchlöcherter Lederstiefel hat sich in deinem Netz verfangen."
        bootsText.english = "As you move your net back and forth in the water, you feel a tug. Instead of a fish, however, a pair of old perforated boots tied together is stuck in your net!"
    end

    fishing:SetTreasureMap(user,gathering.prob_map*gatheringBonus,treasureMapText.german,treasureMapText.english);
    fishing:AddMonster(user,101,gathering.prob_monster/gatheringBonus,monsterText.german,monsterText.english,4,7);
    fishing:AddRandomItem(51,1,333,{},gathering.prob_rarely, bucketText.german, bucketText.english); --Bucket
    fishing:AddRandomItem(92,1,333,{},gathering.prob_occasionally,oilLampText.german, oilLampText.english); --Oil lamp
    fishing:AddRandomItem(53,1,333,{},gathering.prob_frequently,bootsText.german, bootsText.english); --Leather boots

    common.ResetInterruption( user, actionstate )

    if ( actionstate == Action.abort ) then -- work interrupted
        return
    end

    if not common.CheckItem( user, sourceItem ) then -- security check
        return
    end

    if not common.FitForWork( user ) then -- check minimal food points
        return
    end

    common.TurnTo( user, sourceItem.pos ) -- turn if necessary

    -- GFX + Sound for a splash, instead of the user animation

    world:gfx(11, sourceItem.pos)

    world:makeSound(9, sourceItem.pos)


    if ( actionstate == Action.none ) then -- currently not working -> let's go
        fishing.SavedWorkTime[user.id] = fishing:GenWorkTime(user)
        user:startAction( fishing.SavedWorkTime[user.id], 0, 0, 0, 0)
        return
    end

    user:learn( fishing.LeadSkill, fishing.SavedWorkTime[user.id], fishing.LearnLimit)

    if fishing:FindRandomItem(user) then
        return
    end

    local created

    local newAmount

    created, newAmount = gathering.FindResource(user, sourceItem, amount, resourceID)


    if created then
        user:changeSource(sourceItem)
        if newAmount > 0 and not shared.toolBreaks( user, toolItem, fishing:GenWorkTime(user)) then
            fishing.SavedWorkTime[user.id] = fishing:GenWorkTime(user)
            user:startAction( fishing.SavedWorkTime[user.id], 0, 0, 0, 0)
        end
    end

    if newAmount and newAmount <= 0 then
        gathering.SwapSource(sourceItem, depletedResourceID, restockWear)
        user:inform( "Du scheinst hier alles leergefischt zu haben.", "You seem to have caught all the fish here.", Character.lowPriority)
        return
    end
end

return M
