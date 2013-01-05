require("base.common")


-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function Init()
    
	plnt = {};
    grnd = {};
	local gt = base.common.GroundType
	
	-- normal herbs; collectable with sickle
	AddPlant(144, {gt.rocks})                         -- virgins weed
    AddPlant(137, {gt.sand})                          -- flamegoblet blossom
    AddPlant(135, {gt.grass})                         -- yellow weed
    AddPlant(148, {gt.forest})                        -- firnis blossom
    AddPlant(763, {gt.dirt})                          -- mash flower
    AddPlant(767, {gt.water})                          -- water blossom
	AddPlant(140, {gt.forest})                        -- donf blade
    AddPlant(156, {gt.sand})                          -- steppe fern
    AddPlant(153, {gt.grass})                         -- foot leaf
    AddPlant(752, {gt.rock})                         -- mandrake
	AddPlant(147, {gt.forest})                       -- blackberry
    AddPlant(142, {gt.sand})                         -- sandberry
    AddPlant(143, {gt.grass})                         -- red elder
    AddPlant(136, {gt.dirt})                          -- anger berry
    AddPlant(134, {gt.grass})                         -- fourleafed oneberry
    AddPlant(155, {gt.water})                         -- sibanac leaf
    AddPlant(151, {gt.forest})                        -- strawberry
    AddPlant(141, {gt.rocks})                         -- black thistle
    AddPlant(145, {gt.grass})                         -- heath flower
    AddPlant(151, {gt.forest})                        -- strawberry
    AddPlant(141, {gt.rocks})                         -- black thistle
    AddPlant(133, {gt.grass})                         -- sun herb
    AddPlant(753, {gt.grass,gt.forest})              -- blue bird's berry
    AddPlant(159, {gt.forest})						-- toadstool
    AddPlant(160, {gt.forest})						-- red head
    AddPlant(161, {gt.grass})						-- herder's mushroom
    AddPlant(162, {gt.grass})						-- birth mushroom
    AddPlant(163, {gt.forest})						-- champignon
	
	-- rar herbs; not collectable with sickle
    AddPlant(138, {gt.dirt})                        -- night angels blossom
	AddPlant(146, {gt.sand})                        -- deser sky capsule
	AddPlant(152, {gt.grass, gt.forest})            -- life root
	AddPlant(754, {gt.grass})                        -- oneleaved fourberry
	AddPlant(755, {gt.rocks})                        -- fire root
	AddPlant(756, {gt.grass,gt.forest})             -- pious berry
	AddPlant(757, {gt.forest})                        -- tybalt star
	AddPlant(758, {gt.rocks})                        -- heart blood
	AddPlant(760, {gt.snow})                        -- ice leaf
	AddPlant(761, {gt.grass})                        -- rain weed
	AddPlant(762, {gt.rocks})                        -- gold crack herb
	AddPlant(764, {gt.forest})                        -- dark moos
	AddPlant(765, {gt.forest})                        -- day tream
	AddPlant(766, {gt.forest})                        -- con blossom
	AddPlant(768, {gt.forest})                        -- wolverine fern
	AddPlant(769, {gt.sand})                         -- desert berry
end

function AddPlant(ItemID,Ground)
    table.insert(plnt,ItemID);
    table.insert(grnd,Ground);
end

function UseItem(User,SourceItem,TargetItem,counter,param)
    if (User.lastSpokenText == "glas") then
        User:increaseSkill(Character.glassBlowing,100)
    end
	
	if (User.lastSpokenText == "drop") then
	   for i = 1,50 do
		   local drop = function(posi)
				world:createItemFromId(15,1,posi,false,333,nil)
			end
			for j=1,5 do
				base.common.CreateCircle(User.pos, j, drop)
			end	

			local delete = function(posi)
				local theItem = world:getItemOnField(posi)
				if theItem.id == 15 then 
					world:erase(theItem,1)
				end	
			end
			for k=1,5 do
				base.common.CreateCircle(User.pos, k, delete)
			end	
	    end 
		User:inform("drop end")
	end

    if (User.lastSpokenText == "gaia") then
        if ( plnt==nil ) then
			Init();
        end 
		for i=1,50 do
	    
			local rndValue = math.random(1,#plnt)
			local myPlant = plnt[rndValue]
			local myGrndsList = grnd[rndValue]
			local myPos = position( math.random(0,1024), math.random(0,1024), 0 )
			local theTile=world:getField(myPos);
			if theTile then
				local groundType = base.common.GetGroundType( theTile:tile() )
				
				local success = false
				for i=1,#myGrndsList do
					if groundType == myGrndsList[i] then
						success = true
					end
				end			
				
				if success then
					User:inform(""..myPos.x.." "..myPos.y.." "..myPos.z)
					world:createItemFromId(myPlant,1,myPos,false,333,nil)
					herbCounter = herbCounter + 1
				end
			end	
		end	
    end	
end