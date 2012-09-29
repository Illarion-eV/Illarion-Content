-----------------------------------
----------- HOLZ FÄLLEN -----------
-----------------------------------

-- UPDATE common SET com_script='item.id_74_axe' WHERE com_itemid IN (74,2946);

require("base.common")
require("item.general.metal")
require("content.gathering")

module("item.id_74_axe", package.seeall)

function initLists(  )
    -- Initialisierung der Listen
    if (trees ~= nil) then
        return
    end
    trees = { };
    logs = { };
    AddTree(  11,125,560,561,562,563,2560,10,  56); -- Apfelbaum
    AddTree(  14,125,560,561,562,563,2560,10,  56); -- Apfelbaum
    AddTree( 299,541,564,565,566,567, 543,15,2786); -- Kirschbaum
    AddTree( 300,541,564,565,566,567, 543,15,2786); -- Kirschbaum
    AddTree( 308,309,572,573,574,575,   3,12,   0); -- Tanne
    AddTree( 586,587,592,593,594,595, 544,10,  56); -- Cachdern-Baum
    AddTree(1804,542,568,569,570,571, 544,15,  56); -- Naldorbaum
    AddTree(1809,584,576,577,578,579, 544,24,  56); -- Alter Naldorbaum
    AddTree(1817,585,580,581,582,583,   3,19,   0); -- Nadelbaum
end -- function initLists

function AddTree(TreeID,StumpID,NLog,OLog,SLog,WLog,Logs,maxLogs,bough)
    trees[ TreeID ] = { StumpID, NLog, OLog, SLog, WLog, maxLogs };
    logs[ NLog ] = {Logs,bough};
    logs[ OLog ] = {Logs,bough};
    logs[ SLog ] = {Logs,bough};
    logs[ WLog ] = {Logs,bough};
end

function createdeathtree(Tree,User,Qual)
    local DiffX=false;
    local DiffY=false;
    local createpos=nil;
    if (Tree.pos.x~=User.pos.x) then DiffX=true end
    if (Tree.pos.y~=User.pos.y) then DiffY=true end
    if DiffX and DiffY then
        local LookAt=User:getFaceTo();
        if (LookAt==0 or LookAt==4) then
            if (User.pos.x<Tree.pos.x) then
                local createpos=position(Tree.pos.x-1,Tree.pos.y,Tree.pos.z)
                CheckAndHit(position(Tree.pos.x-1,Tree.pos.y,Tree.pos.z));
                CheckAndHit(createpos);
                world:createItemFromId(trees[ Tree.id ][5],1,createpos,true,Qual,0);
		    User:inform("11111");
            elseif (User.pos.x>Tree.pos.x) then
                local createpos=position(Tree.pos.x+1,Tree.pos.y,Tree.pos.z);
                CheckAndHit(createpos);
                CheckAndHit(position(Tree.pos.x+2,Tree.pos.y,Tree.pos.z));
                world:createItemFromId(trees[ Tree.id ][3],1,createpos,true,Qual,0);
		    User:inform("22222");
            end
        else
            if (User.pos.y<Tree.pos.y) then
                local createpos=position(Tree.pos.x,Tree.pos.y-1,Tree.pos.z)
                CheckAndHit(createpos);
                CheckAndHit(position(Tree.pos.x,Tree.pos.y-2,Tree.pos.z));
                world:createItemFromId(trees[ Tree.id ][2],1,createpos,true,Qual,0);
		    User:inform("33333");
            elseif (User.pos.y>Tree.pos.y) then
                local createpos=position(Tree.pos.x,Tree.pos.y+1,Tree.pos.z)
                CheckAndHit(position(Tree.pos.x,Tree.pos.y+1,Tree.pos.z));
                CheckAndHit(createpos);
                world:createItemFromId(trees[ Tree.id ][4],1,createpos,true,Qual,0);
		    User:inform("444444");
            end
        end
    elseif DiffX then
        local Choose=math.random(0,1);
        local createpos=position(Tree.pos.x,Tree.pos.y+(3*Choose-1),Tree.pos.z);
        CheckAndHit(createpos);
        CheckAndHit(position(createpos.x,createpos.y-1,createpos.z));
        if (Choose==0) then
            world:createItemFromId(trees[ Tree.id ][2],1,createpos,true,Qual,0);
        else
            world:createItemFromId(trees[ Tree.id ][4],1,createpos,true,Qual,0);
        end
    else
        local Choose=math.random(0,1);
        local createpos=position(Tree.pos.x+(3*Choose-2),Tree.pos.y,Tree.pos.z);
        CheckAndHit(createpos);
        CheckAndHit(position(createpos.x+1,createpos.y,createpos.z));
        if (Choose==1) then
            world:createItemFromId(trees[ Tree.id ][3],1,createpos,true,Qual,0);
        else
            world:createItemFromId(trees[ Tree.id ][5],1,createpos,true,Qual,0);
        end
    end
end

function CheckAndHit(TargetPos)
    if world:isCharacterOnField(TargetPos) then
        local Char=world:getCharacterOnField(TargetPos);
        base.common.InformNLS( Char,
        "Der Baum fällt und trifft dich hart",
        "The tree falls and hits you hard");
        Char:increaseAttrib("hitpoints",-7000);
    end
end

-- ************************************************************************************

--Hauptfunktion / Einsprung
function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();

    if User:isAdmin() then
        User:inform("mental: "..User:getMentalCapacity());
    end
    initLists(  );
    if (SourceItem:getType() ~= 4) then
        base.common.InformNLS( User,
        "Zum Bäume fällen musst du die Axt in die Hand nehmen.",
        "To chop a tree you need to take the axe in your hands." );
        return
    end

    if not base.common.CheckItem( User, SourceItem ) then
        return
    end

    if base.common.Encumbrence(User) then
        if (User.pos.z == 100) then
            base.common.InformNLS( User,
            "Deine Rüstung behindert Dich beim Holz schlagen. Wenn du arbeiten willst kannst du keine schwere Rüstungen tragen. Lege deine Rüstung und deinen Helm in deine Tasche. Dann kannst du arbeiten.",
            "Your armour disturbs you when chopping trees. If you want to work you must not carry heavy armors. Put your armor and your helmet into your bag. Then you can work." );
        else
            base.common.InformNLS( User,
            "Deine Rüstung behindert Dich beim Holz schlagen.",
            "Your armour disturbs you when chopping trees" );
        end
        return
    end

	local TargetItem = base.common.GetFrontItem( User );

    if ((TargetItem == nil) or (TargetItem.id == 0) or -- no target item
	  ((trees[ TargetItem.id ] == nil) and (logs[ TargetItem.id ] == nil))) then -- or no tree or log
		local foundItem = false;
		-- try fields beside
		if world:isItemOnField( position( TargetPos.x, TargetPos.y+1, TargetPos.z ) ) then
			local testitem = world:getItemOnField( position( TargetPos.x, TargetPos.y+1, TargetPos.z ) );
			for a,tree in pairs(trees) do
				if ( tree[4] == testitem.id ) or ( tree[2] == testitem.id ) then
					TargetItem = testitem;
					foundItem = true;
					break;
				end
			end
		end
		if (not foundItem) and world:isItemOnField( position( TargetPos.x+1, TargetPos.y, TargetPos.z ) ) then
			local testitem = world:getItemOnField( position( TargetPos.x+1, TargetPos.y, TargetPos.z ) );
			for a,tree in pairs(trees) do
				if ( tree[5] == testitem.id ) or ( tree[3] == testitem.id ) then
					TargetItem = testitem;
					foundItem = true;
					break;
				end
			end
		end
		if (not foundItem) then
			base.common.InformNLS( User,
			"Hier ist nichts was du mit der Axt bearbeiten könntest.",
			"Here is nothing you could work at with your axe." );
			return;
		end
    end

    if ((logs[ TargetItem.id ] ~= nil) and (TargetItem.wear == 255)) then
        base.common.InformNLS( User,
        "Dieser Baum ist zu alt um noch verwertbar zu sein.",
        "This tree is too old." );
        return
    end

    if not base.common.IsLookingAt( User, TargetItem.pos ) then
        base.common.TurnTo( User, TargetItem.pos );
    end

    if ( ltstate == Action.none ) then
        User:startAction( 12, 0, 0, 6, 15);
        if (logs[ TargetItem.id ] == nil) then
            User:talkLanguage( Character.say, Player.german, "#me beginnt den Baum zu fällen.");
            User:talkLanguage( Character.say, Player.english, "#me starts to cut down a tree.");
        else
            User:talkLanguage( Character.say, Player.german, "#me beginnt Holz aus dem Baumstamm zu schlagen.");
            User:talkLanguage( Character.say, Player.english, "#me starts to cut wood from the log.");
        end
    elseif ( ltstate == nil or ltstate == Action.success ) then
        if Lumberjack( User, SourceItem, TargetItem, Counter, Param, ltstate ) then
            if base.common.ToolBreaks( User, SourceItem ) then
                base.common.InformNLS(User,
                "Die alte und abgenutzt Axt in deinen Händen zerbricht.",
                "The old and used axe in your hands breaks.");
            else
                User:startAction( 12, 0, 0, 6, 15);
            end
            if (User:getSkill("lumberjacking") < 100) then
                --User:learn( 2, "lumberjacking", 2, 100 );
				--Replace with new learn function, see learn.lua 
            end
        else
            if base.common.ToolBreaks( User, SourceItem ) then
                base.common.InformNLS(User,
                "Die alte und abgenutzte Axt in deinen Händen zerbricht.",
                "The old and used axe in your hands breaks.");
            end
            --if (User:getSkill("lumberjacking") < 100) then
                --User:learn( 2, "lumberjacking", 2, 100 );
				--Replace with new learn function, see learn.lua 
           -- end
        end
    elseif ( ltstate == Action.abort ) then
        if (User:increaseAttrib("sex",0) == 0) then
            gText = "seine";
            eText = "his";
        else
            gText = "ihre";
            eText = "her";
        end
        User:talkLanguage(Character.say, Player.german, "#me unterbricht "..gText.." Arbeit.");
        User:talkLanguage(Character.say, Player.english,"#me interrupts "..eText.." work.");
    end
end

function Lumberjack( User, SourceItem, TargetItem, Counter, Param, ltstate )
    local Skill = User:getSkill("lumberjacking");
	-- Random Events
	if (not content.gathering.woodchopping:FindRandomItem(User)) then
		return;
	end
    if (logs[ TargetItem.id ] == nil) then
	    --if TargetItem.quality < 999 then
	    --    TargetItem.quality = 999
		--    world:changeItem(TargetItem);
        --end
        local Strength=User:increaseAttrib("strength",0);
        local DecreaseQual=math.floor((0.6*(Skill+Strength)+37)*math.random(8,12)/10);
        local NewBaumQual=TargetItem.quality-DecreaseQual;
		if User:isAdmin() then
			User:inform("qual: "..TargetItem.quality.." decrease: "..DecreaseQual.." newqual: "..NewBaumQual);
		end
        if (NewBaumQual<=100) then
            local GenericQual=math.max(1,math.ceil((Skill/100)*trees[ TargetItem.id ][6]))+300;
            createdeathtree(TargetItem,User,GenericQual);
            world:erase(TargetItem,1);
            if (math.random(100)>5) or User.pos.z == 100 or User.pos.z == 101 then -- no dying trees on Noobia!
                world:createItemFromId(trees[ TargetItem.id ][1],1,TargetItem.pos,true,333,0)
            else
                base.common.InformNLS( User,
                "Der Baum ist zu schwach um erneut zu wachsen. Er stirbt.",
                "The tree is too weak to grow again. It dies." );
            end
            return false;
        else
            if ((NewBaumQual/100) == math.floor(NewBaumQual/100)) then
                NewBaumQual = NewBaumQual - 1;
            end
            TargetItem.quality=NewBaumQual;
            world:changeItem(TargetItem);
            return true;
        end
    else
        if (TargetItem.quality>300) then
            if (math.random(1,math.ceil(-0.01*Skill+2))==1) then
                missItem=User:createItem(logs[ TargetItem.id ][1],1,333,0);
                local retVal = true;
                if (missItem>0) then
                    world:createItemFromId(logs[ TargetItem.id ][1],missItem,User.pos,true,333,0);
                    retVal = false;
                end
                if (logs[ TargetItem.id ][2] ~= 0) then
                    if (math.random(0,2) == 1) then
                        missItem=User:createItem(logs[ TargetItem.id ][2],1,333,0);
                        if (missItem>0) then
                            world:createItemFromId(logs[ TargetItem.id ][2],missItem,User.pos,true,333,0);
                            retVal = false;
                        end
                    end
                end
                if (TargetItem.quality-1<=300) then
                    world:erase(TargetItem,1);
                    retVal = false;
                else
                    TargetItem.quality = TargetItem.quality - 1;
                    world:changeItem(TargetItem);
                end
                return retVal;
            end
            return true;
        else
            world:erase(TargetItem,1);
            return false;
        end
    end
end

function LookAtItem(User,Item)
    item.general.metal.LookAtItem(User,Item)
end