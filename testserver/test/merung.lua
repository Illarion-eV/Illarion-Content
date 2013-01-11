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
--[[    AddPlant(137, {gt.sand},false)                          -- flamegoblet blossom
    AddPlant(135, {gt.grass},false)                         -- yellow weed
    AddPlant(148, {gt.forest},false)                        -- firnis blossom
    AddPlant(763, {gt.dirt},false)                          -- mash flower
    AddPlant(767, {gt.water},false)                          -- water blossom
	AddPlant(140, {gt.forest},false)                        -- donf blade
    AddPlant(156, {gt.sand},false)                          -- steppe fern
    AddPlant(153, {gt.grass},false)                         -- foot leaf
    AddPlant(752, {gt.rock},false)                         -- mandrake
	AddPlant(147, {gt.forest},false)                       -- blackberry
    AddPlant(142, {gt.sand},false)                         -- sandberry
    AddPlant(143, {gt.grass},false)                         -- red elder
    AddPlant(136, {gt.dirt},false)                          -- anger berry
    AddPlant(134, {gt.grass},false)                         -- fourleafed oneberry
    AddPlant(155, {gt.water},false)                         -- sibanac leaf
    AddPlant(151, {gt.forest},false)                        -- strawberry
    AddPlant(141, {gt.rocks},false)                         -- black thistle
    AddPlant(145, {gt.grass},false)                         -- heath flower
    AddPlant(151, {gt.forest},false)                        -- strawberry
    AddPlant(141, {gt.rocks},false)                         -- black thistle
    AddPlant(133, {gt.grass},false)                         -- sun herb
    AddPlant(753, {gt.grass,gt.forest},false)              -- blue bird's berry
    AddPlant(159, {gt.forest},false)						-- toadstool
    AddPlant(160, {gt.forest},false)						-- red head
    AddPlant(161, {gt.grass},false)						-- herder's mushroom
    AddPlant(162, {gt.grass},false)						-- birth mushroom
    AddPlant(163, {gt.forest},false)						-- champignon
	
	-- rar herbs; not collectable with sickle
    AddPlant(138, {gt.dirt},true)                        -- night angels blossom
	AddPlant(146, {gt.sand},true)                        -- deser sky capsule
	AddPlant(152, {gt.grass, gt.forest},true)            -- life root
	AddPlant(754, {gt.grass},true)                        -- oneleaved fourberry
	AddPlant(755, {gt.rocks},true)                        -- fire root
	AddPlant(756, {gt.grass,gt.forest},true)             -- pious berry
	AddPlant(757, {gt.forest},true)                        -- tybalt star
	AddPlant(758, {gt.rocks},true)                        -- heart blood
	AddPlant(760, {gt.snow},true)                        -- ice leaf
	AddPlant(761, {gt.grass},true)                        -- rain weed
	AddPlant(762, {gt.rocks},true)                        -- gold crack herb
	AddPlant(764, {gt.forest},true)                        -- dark moos
	AddPlant(765, {gt.forest},true)                        -- day tream
	AddPlant(766, {gt.forest},true)                        -- con blossom
	AddPlant(768, {gt.forest},true)                        -- wolverine fern
	AddPlant(769, {gt.sand},true)    ]]                    -- desert berry
end

function AddPlant(ItemID,Grounds,rare,User)
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
		User:inform(""..myList[Grounds][1])
	end	
end

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
	if theTile then
		local groundType = base.common.GetGroundType( theTile:tile() )
		if myList[groundType] == nil then
		    return false
		end
		User:inform(""..#myList)
		User:inform(""..#myList[2])
        User:inform(""..#myList[groundType])		
		myPlant = myList[groundType][math.random(1,#myList[groundType])]
		world:createItemFromId(myPlant,1,myPos,false,333,nil)
		return true
	end
	return false
end