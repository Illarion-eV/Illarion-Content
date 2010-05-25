-- Herblore mit Sichel und Ausbreitung der Pflanzen

-- UPDATE common SET com_script='items.126_sickle' WHERE com_itemid=126;

require("items.general.metal")
require("base.common")

module("items.126_sickle", package.seeall(), package.seeall(items.general.metal))

dofile( "newgaia.lua" );

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	
	-- Krauterliste initialisieren
	initHerbs();
	
	-- wird die Arbeit durch andere aktion unterbrochen?
    base.common.ResetInterruption( User, ltstate );
    if ( ltstate == Action.abort ) then
        if (User:increaseAttrib("sex",0) == 0) then
            gText = "seine";
            eText = "his";
        else
            gText = "ihre";
            eText = "her";
        end
        User:talkLanguage(CCharacter.say, CPlayer.german, "#me unterbricht "..gText.." Arbeit.");
        User:talkLanguage(CCharacter.say, CPlayer.english,"#me interrupts "..eText.." work.");
        return
    end
    
    -- Unterbrechungsmeldungen
	if ( ltstate == Action.success ) then
        if base.common.IsInterrupted( User ) then
            base.common.InformNLS( User,
            "Während du nach Kräutern suchst, verhakt sich deine Sichel und rutscht dir fast aus der Hand.",
            "While searching for herbs your sickle gets stuck and it nearly slides out of your hand.");
            return
        end
    end
    
     -- Sehr streife Rüstung?
    if base.common.Encumbrence(User) then
        base.common.InformNLS( User,
        "Deine Rüstung behindert dabei Kräuter zu sammeln.",
        "Your armor disturbes you collecting herbs." );
        return
    end
    
    -- Sicherheitscheck
    if not base.common.CheckItem( User, SourceItem ) then
        return
    end
    
    -- Ist ueberhaupt ein Item da, in dem gesucht wird?
    if ((TargetItem == nil) or (TargetItem.id == 0)) then
        TargetItem = base.common.GetFrontItem( User );
    end
    if not TargetItem then
        base.common.InformNLS( User,
        "Hier kannst du nicht finden.",
        "You can't find anything here.");
        return;
    end
    
    -- Zum Item drehen, falls dies nicht der Fall ist
    if not base.common.IsLookingAt( User, TargetItem.pos ) then
        base.common.TurnTo( User, TargetItem.pos );
    end

	-- ist die Sichel in der Hand?
    if ( SourceItem:getType() ~= 4 ) then
        base.common.InformNLS( User,
        "Du musst die Sichel in der Hand haben um damit zu arbeiten",
        "You have to hold the sickle in your hand to work with it.");
        return
    end
    
    -- Kraeuterkundeskill des Users laden
    local skill = User:getSkill( "herb lore" );

	-- Boni durch magische Edelsteine in der Sichel? Rubine modifizieren den skill!
    gem1, str1, gem2, str2=base.common.GetBonusFromTool(SourceItem);
    step=0;
    if gem1==3 then   
        step=str1;
    end
    if gem2==3 then
        step=step+str2;
    end
    skill=skill+step;
    
    -- Pruefen, ob man hier ueberhaupt was finden kann
	if not checkRegion(TargetItem) then
		User:inform("Hier kann man keine brauchbaren Kräuter finden");
		return;		
	end    
	
	User:inform("Hier kann man "..currentHerb.." finden");
	

end


function checkRegion(TargetItem)
	for HerbID, herb in pairs(herbs) do  
		-- untergrund checken um Regionen zu bestimmen
		TileID = world:getField(TargetItem.pos):tile();
		if (TileID==herb.ground) then
			-- checken, ob die Itemid des Targets fuer das Kraut stimmt
			for ItemID, item in pairs(herb.item) do
				if (TargetItem.id == item) then
					-- wenn bisher alles zutrifft, dann region durchsuchen
					for RegionIndex, region in pairs(herb.region) do
						for zPos = herb.region[RegionIndex][3][1], herb.region[RegionIndex][3][2], 1 do
							for yPos = herb.region[RegionIndex][2][1], herb.region[RegionIndex][2][2], 1 do
								for xPos = herb.region[RegionIndex][1][1], herb.region[RegionIndex][1][2], 1 do
									TilePos = position(xPos,yPos,zPos);
									if (TilePos==TargetItem.pos) then
										-- wenn alles stimmt, dann die HerbID definieren
										currentHerb=herb.id;
										return true;
									end
								end
							end
						end		
					end
				end
			end
		end
	end
	return false;
end