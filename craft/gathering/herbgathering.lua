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

-- plants and various trees

-- additional tool: sickle ( 126 )

local common = require("base.common")
local shared = require("craft.base.shared")
local gathering = require("craft.base.gathering")

local M = {}

M.skill = "herblore"

M.herbList = {

    -- Berries and mushrooms

    {id = Item.blueberryBush, depletedId = Item.blueberryBushEmpty, productId = Item.blueberry, maxAmount = 20},
    {id = Item.strawberryPlant, depletedId = Item.strawberryPlantEmpty, productId = Item.strawberry, maxAmount = 20},
    {id = Item.blackberryBush, depletedId = Item.blackberryBushEmpty, productId = Item.blackberry, maxAmount = 20},
    {id = Item.elderberryBush, depletedId = Item.elderberryBushEmpty, productId = Item.redElder, maxAmount = 20},
    {id = Item.champignonCircle, depletedId = Item.champignonCircleEmpty, productId = Item.champignon, maxAmount = 20},
    {id = Item.raspberryBush, depletedId = Item.raspberryBushEmpty, productId = Item.raspberry, maxAmount = 10},
    {id = Item.birthMushroomCluster, depletedId = Item.birthMushroomClusterEmpty, productId = Item.birthMushroom, maxAmount = 10},
    {id = Item.cloudberryPlant, depletedId = Item.cloudberryPlantEmpty, productId = Item.cloudberry, maxAmount = 10},
    {id = Item.redheadCluster, depletedId = Item.redheadClusterEmpty, productId = Item.redHead, maxAmount = 5},
    {id = Item.deerberryBush, depletedId = Item.deerberryBushEmpty, productId = Item.berries, maxAmount = 5},
    {id = Item.chanterelleCluster, depletedId = Item.chanterelleClusterEmpty, productId = Item.chanterelle, maxAmount = 5},

    --Herbs

    {id = Item.oldLogSouth, depletedId = Item.oldLogSouthEmpty, productId = Item.rottenTreeBark, maxAmount = 20},
    {id = Item.oldLogWest, depletedId = Item.oldLogWestEmpty, productId = Item.rottenTreeBark, maxAmount = 20},
    {id = Item.firTree, depletedId = Item.prunedFirTree, productId = Item.firTreeSprout, maxAmount = 20},
    {id = Item.fourleafedOneberryPlant, depletedId = Item.fourleafedOneberryEmpty, productId = Item.fourleafedOneberry, maxAmount = 20},
    {id = Item.marshFlowerPlant, depletedId = Item.marshFlowerPlantEmpty, productId = Item.marshFlower, maxAmount = 20},
    {id = Item.sunflowers, depletedId = Item.sunflowersEmpty, productId = Item.sunHerb, maxAmount = 20},
    {id = Item.herdersMushroomCluster, depletedId = Item.herdersMushroomClusterEmpty, productId = Item.herdersMushroom, maxAmount = 20},
    {id = Item.bulbspongeMushroomCluster, depletedId = Item.bulbspongeMushroomClusterEmpty, productId = Item.bulbspongeMushroom, maxAmount = 20},
    {id = Item.yellowWeedPlant, depletedId = Item.yellowWeedPlantEmpty, productId = Item.yellowWeed, maxAmount = 20},
    {id = Item.blackThistlePlant, depletedId = Item.blackThistlePlantEmpty, productId = Item.blackThistle, maxAmount = 20},
    {id = Item.heathFlowerPlant, depletedId = Item.heathFlowerPlantEmpty, productId = Item.heathFlower, maxAmount = 20},
    {id = Item.angerBerryPlant, depletedId = Item.angerBerryPlantEmpty, productId = Item.angerBerry, maxAmount = 20},
    {id = Item.firnisBlossomPlant, depletedId = Item.firnisBlossomPlantEmpty, productId = Item.firnisBlossom, maxAmount = 20},
    {id = Item.toadstoolCluster, depletedId = Item.toadstoolClusterEmpty, productId = Item.toadstool, maxAmount = 20},
    {id = Item.virginsWeedPlant, depletedId = Item.virginsWeedPlantEmpty, productId = Item.virginsWeed, maxAmount = 10},
    {id = Item.flamegobletBlossomPlant, depletedId = Item.flamegobletBlossomPlantEmpty, productId = Item.flamegobletBlossom, maxAmount = 10},
    {id = Item.fanleafWest, depletedId = Item.fanleafWestEmpty, productId = Item.sibanacLeaf, maxAmount = 10},
    {id = Item.fanleafEast, depletedId = Item.fanleafEastEmpty, productId = Item.sibanacLeaf, maxAmount = 10},
    {id = Item.bloomingCeridern, depletedId = Item.ceridernTree, productId = Item.blueBirdsberry, maxAmount = 10},
    {id = Item.donfBladePlant, depletedId = Item.donfBladePlantEmpty, productId = Item.donfBlade, maxAmount = 10},
    {id = Item.mandrakePlant, depletedId = Item.mandrakePlantEmpty, productId = Item.mandrake, maxAmount = 10},
    {id = Item.fairyRingMushroomCluster, depletedId = Item.fairyRingMushroomClusterEmpty, productId = Item.fairyRingMushroom, maxAmount = 10},
    {id = Item.footLeafPlant, depletedId = Item.footLeafPlantEmpty, productId = Item.footLeaf, maxAmount = 5},
    {id = Item.steppeFernPlant, depletedId = Item.steppeFernPlantEmpty, productId = Item.steppeFern, maxAmount = 5},
    {id = Item.sandberryPlant, depletedId = Item.sandberryPlantEmpty, productId = Item.sandberry, maxAmount = 5},
    {id = Item.stinkhornClusterWest, depletedId = Item.stinkhornClusterWestEmpty, productId = Item.stinkhorn, maxAmount = 5},
    {id = Item.stinkhornClusterSouth, depletedId = Item.stinkhornClusterSouthEmpty, productId = Item.stinkhorn, maxAmount = 5},
    {id = Item.waterBlossomPlant, depletedId = Item.waterBlossomPlantEmpty, productId = Item.waterBlossom, maxAmount = 5},
    {id = Item.elfCapClusterSouth, depletedId = Item.elfCapClusterSouthEmpty, productId = Item.elfCaps, maxAmount = 5},
    {id = Item.elfCapClusterWest, depletedId = Item.elfCapClusterWestEmpty, productId = Item.elfCaps, maxAmount = 5},
}

local herbList = M.herbList

local function isHerbItem(Plant)

    for _, herb in pairs(herbList) do
        if Plant ~= nil and (herb.id == Plant.id or Plant.id == herb.depletedId) then
            return true
        end
    end

    return false
end

local function isDepletedHerb(plant)

    for _, herb in pairs(herbList) do
        if herb.depletedId == plant.id then
            return true
        end
    end
end

local function getHerbItem(user, onlyValidProducts)

    local targetItem = common.GetFrontItem(user)

    if isHerbItem(targetItem) then
        if not onlyValidProducts or not isDepletedHerb(targetItem) then
            return targetItem
        end
    end

    local radius = 1

    for x= -radius, radius do
        for y= -radius, radius do
            local targetPos = position(user.pos.x + x, user.pos.y + y, user.pos.z)
            if world:isItemOnField(targetPos) then
                targetItem = world:getItemOnField(targetPos)
                if isHerbItem(targetItem) then
                    if not onlyValidProducts or not isDepletedHerb(targetItem) then
                        return targetItem
                    end
                end
            end
        end
    end
end


function M.StartGathering(user, sourceItem, actionState)

    local herblore = gathering.GatheringCraft:new{LeadSkill = Character.herblore, LearnLimit = 100}
    local toolID = Item.sickle
    local maxAmount = gathering.getMaxAmountFromResourceList(herbList, sourceItem.id)
    local GFX = 21
    local resourceID = gathering.getProductId(herbList, sourceItem.id)
    local depletedResourceID = gathering.getDepletedObject(herbList, sourceItem.id)
    local restockWear = 4 -- 15 minutes

    local success, toolItem, amount, gatheringBonus = gathering.InitGathering(user, sourceItem, toolID, maxAmount, herblore.LeadSkill, depletedResourceID)

    if not success then
        return
    end

    if not gathering.isDepletableResource(user, sourceItem, herbList) then
        return
    end

    herblore:AddRandomPureElement(user,gathering.prob_element*gatheringBonus); -- Any pure element
    herblore:SetTreasureMap(user,gathering.prob_map*gatheringBonus,"Unter einer Lage Blätter stößt du auf eine Schatzkarte. Hoffentlich ist der Besitzer nicht in der Nähe.","Under a layer of leaves you find a treasure map. Hopefully, the owner is not nearby!");
    herblore:AddMonster(user,271,gathering.prob_monster/gatheringBonus,"Eine Wespe steigt aus dem Gestrüpp auf, offensichtlich unerfreut über die Störung.","A pesky wasp rises from the bushes apparently displeased with your disturbance.",4,7);
    herblore:AddRandomItem(2183,1,333,{},gathering.prob_rarely,"Ein alter Krug liegt verlassen und einsam im Gebüsch.","An old mug lies abandoned and lonesome in the bushes."); --Mug
    herblore:AddRandomItem(799,1,333,{},gathering.prob_occasionally,"Ein Weidenkorb liegt am Boden. Er scheint noch brauchbar zu sein.","A wicker basket lies on the ground. It still seems to be usable."); --Basket
    herblore:AddRandomItem(2570,1,333,{},gathering.prob_frequently,"Ein Griff einer alten Sichel liegt achtlos weggeworfen zwischen Ästen und Blättern herum.","A handle of an old sickle lies between the leaves and branches, but the blade is no where in sight."); --Sickle hilt


    --Case 1: Interrupted
    if ( actionState == Action.abort ) then -- work interrupted
        return
    end

    if not common.CheckItem( user, sourceItem ) then -- security check
        return
    end

    if not common.FitForWork( user ) then -- check minimal food points
        return
    end

    common.TurnTo( user, sourceItem.pos ) -- turn if necessary

    --Case 2: Initialise action
    if ( actionState == Action.none ) then -- currently not working -> let's go
        herblore.SavedWorkTime[user.id] = herblore:GenWorkTime(user)
        user:startAction( herblore.SavedWorkTime[user.id], GFX, herblore.SavedWorkTime[user.id], 0, 0)
        return
    end

    --Case 3: Action executed

    user:learn( herblore.LeadSkill, herblore.SavedWorkTime[user.id], herblore.LearnLimit)

    herblore:FindRandomItem(user, toolItem)

    local created, newAmount = gathering.FindResource(user, sourceItem, amount, resourceID, herblore.LeadSkill, toolItem) -- create the new produced items


    if created then

        local nextItem = getHerbItem(user, true)
        if (newAmount > 0 or nextItem) and not shared.toolBreaks( user, toolItem, herblore:GenWorkTime(user)) then  -- there are still items we can work on

            if amount < 1 then
                common.TurnTo( user, nextItem.pos )
                sourceItem = nextItem
            end

            herblore.SavedWorkTime[user.id] = herblore:GenWorkTime(user)
            user:changeSource(sourceItem)

            user:startAction( herblore.SavedWorkTime[user.id], GFX, herblore.SavedWorkTime[user.id], 0, 0)
        else
            common.TempInformNLS( user,
            "Diese Pflanze ist schon komplett abgeerntet. Gib ihr Zeit um nachzuwachsen.",
            "This plant is already completely harvested. Give it time to grow again." );
        end
    end

    if newAmount and newAmount <= 0 then
        gathering.SwapSource(sourceItem, depletedResourceID, restockWear)
        return
    end
end

--used by item.tree
M.isHerbItem = isHerbItem

--used by item.id_126_sickle
M.getHerbItem = getHerbItem

return M
