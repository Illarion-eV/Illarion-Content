-- Herblore mit Sichel und Ausbreitung der Pflanzen

-- UPDATE common SET com_script='item.id_126_sickle' WHERE com_itemid=126;

require("item.general.metal")
require("base.common")
require("scheduled.newgaia")

module("item.id_126_sickle", package.seeall, package.seeall(item.general.metal))

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	scheduled.newgaia.initHerbs();
	
	base.common.ResetInterruption(User, ltstate);
	if (ltstate == Action.abort) then -- Arbeit unterbrochen
        if (User:increaseAttrib("sex", 0) == 0) then
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

    if not base.common.CheckItem(User, SourceItem) then -- Sicherheitscheck
        return
    end
    
	if ( ltstate == Action.success ) then         -- Unterbrechungsmeldungen
        if base.common.IsInterrupted( User ) then
            local selectMessage = math.random(1,5);
            if ( selectMessage == 1 ) then
                        base.common.InformNLS( User,
                        "Du wischst dir den Schweiß von der Stirn.",
                        "You wipe sweat off your forehead.");
                    elseif ( selectMessage == 2 ) then
                        base.common.InformNLS( User,
                        "Ein kleines pelziges Tier springt aus dem Gebüsch und rennt davon. Für einen Moment bist du fürchterlich erschrocken.",
                        "A small, furry critter jumps out of a bush and darts off. That really surprised you.");
                    elseif ( selectMessage == 3 ) then
                        base.common.InformNLS( User,
                        "Du greifst mit der Hand in eine Blattlauskolonie. Verärgert wischt du dir die Hand an der Hose ab.",
                        "The plant is crowded with lice. Annoyed, you wipe your hand clean on your trousers.");
                    elseif ( selectMessage == 4 ) then
                        base.common.InformNLS( User,
                        "Während du nach Kräutern suchst, verhakt sich deine Sichel und rutscht dir fast aus der Hand.",
            			"While searching for herbs your sickle gets stuck and it nearly slides out of your hand.");
					else
                        base.common.InformNLS( User,
                        "Ein aufdringliches Insekt schwirrt um deinen Kopf herum. Du schlägst mit der Hand danach und versuchst es zu vertreiben.",
                        "An annoying bug buzzes around your head. You strike at it in order to drive it away.");
            end
            return
        end
    end
    
    if base.common.Encumbrence(User) then    -- Sehr streife Rüstung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert dabei Kräuter zu sammeln.",
        "Your armor disturbes you collecting herbs." );
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
		return		
	end
	
	if (ltstate == Action.none) then -- Untï¿½tig: Starte Angeln!
        User:startAction(content.gathering.herbgathering:GenWorkTime(User, SourceItem), 0, 0, 0, 0);
        User:talkLanguage(CCharacter.say, CPlayer.german, "#me beginnt Kräuter zu sammeln.");
        User:talkLanguage(CCharacter.say, CPlayer.english, "#me starts collecting herbs.");
        return
    end
	
	if not content.gathering.herbgathering:FindRandomItem(User) then
		return
	end  
	
	local notcreated=User:createItem(currentHerb,1,333,0);

    if (notcreated~=0) then
        world:createItemFromId(currentHerb,1,User.pos,true,333,0);
        base.common.InformNLS(User,
        "Du kannst nicht noch mehr halten.","You can't carry any more.");
    	return false
	end
		User:learn(2, "herb lore", 2, 100);
		base.common.InformNLS(User,
        "Du hast etwas neues gelernt.","you learned something new.");
	
	if base.common.ToolBreaks( User, SourceItem, true ) then
        base.common.InformNLS(User,  
        "Die alte und abgenutzte Sichel in deinen Händen zerbricht.",
        "The old and used sickle in your hands breaks.");
        return
    end
	
    User:startAction(content.gathering.herbgathering:GenWorkTime(User, SourceItem), 0, 0, 0, 0);

end

function checkRegion(TargetItem)
	for HerbID, herb in pairs(scheduled.newgaia.herbs) do  
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