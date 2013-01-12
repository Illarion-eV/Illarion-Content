require("base.common")


-- UPDATE common SET com_script = 'test.merung' WHERE com_itemid = 1266;

module("test.merung", package.seeall)

function UseItem(User,SourceItem,TargetItem,counter,param)
    if (User.lastSpokenText == "glas") then
        User:increaseSkill(Character.glassBlowing,100)
    end
	if (User.lastSpokenText == "farming") then
        User:increaseSkill(Character.farming,100)
    end
	if (User.lastSpokenText == "carpentry") then
        User:increaseSkill(Character.carpentry,100)
    end
	local a,b,lockId = string.find(User.lastSpokenText,"lockId (%d+)")
    if a ~= nil then
	    local myItem=base.common.GetFrontItem(User)
		myItem:setData("lockId",lockId)
		world:changeItem(myItem)
	end
    if (User.lastSpokenText == "gaia") then
        plantdrop(User)
    end	
end

function Init(User)
    
	RarePlantByGround = {}
	NormalPlantByGround = {}
    
	local gt = base.common.GroundType
	
	-- normal herbs; collectable with sickle
	AddPlant(144, {gt.rocks},false,User)                         -- virgins weed
    AddPlant(137, {gt.sand},false,User)                          -- flamegoblet blossom
    AddPlant(135, {gt.grass},false,User)                         -- yellow weed
    AddPlant(148, {gt.forest},false,User)                        -- firnis blossom
    AddPlant(763, {gt.dirt},false,User)                          -- mash flower
    AddPlant(767, {gt.water},false,User)                          -- water blossom
	AddPlant(140, {gt.forest},false,User)                        -- donf blade
    AddPlant(156, {gt.sand},false,User)                          -- steppe fern
    AddPlant(153, {gt.grass},false,User)                         -- foot leaf
    AddPlant(752, {gt.rock},false,User)                         -- mandrake
	AddPlant(147, {gt.forest},false,User)                       -- blackberry
    AddPlant(142, {gt.sand},false,User)                         -- sandberry
    AddPlant(143, {gt.grass},false,User)                         -- red elder
    AddPlant(136, {gt.dirt},false,User)                          -- anger berry
    AddPlant(134, {gt.grass},false,User)                         -- fourleafed oneberry
    AddPlant(155, {gt.water},false,User)                         -- sibanac leaf
    AddPlant(151, {gt.forest},false,User)                        -- strawberry
    AddPlant(141, {gt.rocks},false,User)                         -- black thistle
    AddPlant(145, {gt.grass},false,User)                         -- heath flower
    AddPlant(151, {gt.forest},false,User)                        -- strawberry
    AddPlant(141, {gt.rocks},false,User)                         -- black thistle
    AddPlant(133, {gt.grass},false,User)                         -- sun herb
    AddPlant(753, {gt.grass,gt.forest},false,User)              -- blue bird's berry
    AddPlant(159, {gt.forest},false,User)						-- toadstool
    AddPlant(160, {gt.forest},false,User)						-- red head
    AddPlant(161, {gt.grass},false,User)						-- herder's mushroom
    AddPlant(162, {gt.grass},false,User)						-- birth mushroom
    AddPlant(163, {gt.forest},false,User)						-- champignon
	
	-- rar herbs; not collectable with sickle
    AddPlant(138, {gt.dirt},true,User)                        -- night angels blossom
	AddPlant(146, {gt.sand},true,User)                        -- deser sky capsule
	AddPlant(152, {gt.grass, gt.forest},true,User)            -- life root
	AddPlant(754, {gt.grass},true,User)                        -- oneleaved fourberry
	AddPlant(755, {gt.rocks},true,User)                        -- fire root
	AddPlant(756, {gt.grass,gt.forest},true,User)             -- pious berry
	AddPlant(757, {gt.forest},true,User)                        -- tybalt star
	AddPlant(758, {gt.rocks},true,User)                        -- heart blood
	AddPlant(760, {gt.snow},true,User)                        -- ice leaf
	AddPlant(761, {gt.grass},true,User)                        -- rain weed
	AddPlant(762, {gt.rocks},true,User)                        -- gold crack herb
	AddPlant(764, {gt.forest},true,User)                        -- dark moos
	AddPlant(765, {gt.forest},true,User)                        -- day tream
	AddPlant(766, {gt.forest},true,User)                        -- con blossom
	AddPlant(768, {gt.forest},true,User)                        -- wolverine fern
	AddPlant(769, {gt.sand},true,User)                         -- desert berry
end

function AddPlant(ItemID, Grounds, rare, User)
    if rare then
        for i=1, #Grounds do
			if RarePlantByGround[Grounds[i]] == nil then
				debug("RarePlantByGround nil for GroundType: "..Grounds[i]);
				RarePlantByGround[Grounds[i]] = {}
			end
            table.insert(RarePlantByGround[Grounds[i]], ItemID);
			debug("New rare plant added. Ground: "..Grounds[i].." Size of table: "..table.getn(RarePlantByGround[Grounds[i]]));
        end
    else
        for i=1, #Grounds do
			if NormalPlantByGround[Grounds[i]] == nil then
				debug("NormalPlantByGround nil for GroundType: "..Grounds[i]);
				NormalPlantByGround[Grounds[i]] = {}
			end
            table.insert(NormalPlantByGround[Grounds[i]], ItemID);
			debug("New normal plant added. Ground: "..Grounds[i].." Size of table: "..table.getn(NormalPlantByGround[Grounds[i]]));
        end
    end
end

--[[function AddPlant(ItemID,Grounds,rare,User)
    local myList
	if rare then -- rare herb
	    myList = RarePlantByGround
	else -- normal herb
        myList = NormalPlantByGround
    end		
	for i=1,#Grounds do
	    if myList[Grounds] == nil then
		    myList[Grounds] = {}
		end
		table.insert(myList[Grounds],ItemID)
	end
	-- exchange old list with new list
	if rare then -- rare herb
	    RarePlantByGround = myList
	else -- normal herb
        NormalPlantByGround = myList
    end	
end]]

function plantdrop(User)
   --if ( RarePlantByGround==nil ) then
        Init(User);
    --end

	local herbCounter = 0 -- for testing
	local normal = 0; local cool = 0
	for i=1,60 do -- normal plants
	   local this = PutPlantOnField(false,User)
	   if this then normal = normal + 1 end
	end
    
	for i=1,20 do -- rare plants
	   local that = PutPlantOnField(true,User)
	   if that then cool = cool + 1 end
	end
User:inform("normal herbs: "..normal)
User:inform("rare herbs: "..cool)	
end

function PutPlantOnField(rare,User)
    local myPos = position( math.random(0,1024), math.random(0,1024), 0 )
	local theTile=world:getField(myPos);
	local myList
	if rare then -- rare herb
	    myList = RarePlantByGround
	else -- normal herb
        myList = NormalPlantByGround
    end	
	User:inform(""..#myList)
	if theTile then
		local groundType = base.common.GetGroundType( theTile:tile() )
		if myList[groundType] == nil then
		    User:inform("putplant 1")
			return false
		end
		myPlant = myList[groundType][math.random(1,#myList[groundType])]
		world:createItemFromId(myPlant,1,myPos,false,333,nil)
		return true
	end
	User:inform("putplant 2")
	return false
end