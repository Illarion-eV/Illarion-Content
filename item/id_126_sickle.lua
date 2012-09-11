-- Herblore mit Sichel und Ausbreitung der Pflanzen

-- UPDATE common SET com_script='item.id_126_sickle' WHERE com_itemid=126;

require("item.general.metal")
require("base.common")
module("item.id_126_sickle", package.seeall, package.seeall(item.general.metal))

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	
	--------- TESTING STUFF !!! ------------ Merung
	if (string.find(User.lastSpokenText,"input")~=nil) then
	    local boxOne = ""
		local boxTwo = ""
		
		local callback1 = function(dialog1,boxOne)
			if not dialog1:getSuccess() then 
				User:inform("abbruch")
			else
				if dialog1:getInput() ~= "one" then
				    User:inform("failure, input was not: one")
				else
				    User:inform("debug 12")
					boxOne = "one"
					local callback2 = function(dialog2,boxTwo)
			            if not dialog2:getSuccess() then 
				            User:inform("abbruch")
			            else
				            if dialog2:getInput() ~= "two" then
				                User:inform("failure, input was not: two")
				            else
				                boxTwo = "two"
					            User:inform(""..boxOne.." and "..boxTwo)
				            end
			            end			
	                end
		            local dialog2 = InputDialog("text schreiben!", false, 255, callback2)
		            User:requestInputDialog(dialog2)
				end
			end			
	    end
		local dialog1 = InputDialog("write: one", false, 255, callback1)
		User:requestInputDialog(dialog1)
	    return
	 end	
	
	if string.sub(User.lastSpokenText,1,9) == "inform me" then
	    informNumber = tonumber(string.sub(User.lastSpokenText,10))
		if informNumber == 1 then
		    User:inform("inform worked",Player.lowPriority)
	    elseif informNumber == 2 then
		    User:inform("inform worked",Player.mediumPriority)
		elseif informNumber == 3 then
		    User:inform("inform worked",Player.highPriority)
		end
        return		
	end
	
	if (string.find(User.lastSpokenText,"imprison")~=nil) then
	    local a,b,workLoad,byFaction=string.find(User.lastSpokenText,"(%d+) (%d+)") 
		local lockThem = base.common.GetFrontCharacter(User)
		workLoad = tonumber(workLoad)
		byFaction = tonumber(byFaction)
		lockThem:setQuestProgress(25,workLoad)
		lockThem:setQuestProgress(26,byFaction)
		lockThem:inform("workload: "..lockThem:getQuestProgress(25).." and factionID: "..lockThem:getQuestProgress(26))
	    if lockThem.pos.z ~= -40 then
		    lockThem:forceWarp(position(-489,-484,-40))
		end	
	end	
	if (string.find(User.lastSpokenText,"labour")~=nil) then 
	    local a,b,workLoad,byFaction=string.find(User.lastSpokenText,"(%d+) (%d+)") 
		workLoad = tonumber(workLoad)
		byFaction = tonumber(byFaction)
		User:setQuestProgress(25,workLoad)
		User:setQuestProgress(26,byFaction)
		User:inform("workload: "..User:getQuestProgress(25).." and factionID: "..User:getQuestProgress(26))
	    if User.pos.z ~= -40 then
		    User:forceWarp(position(-489,-484,-40))
		end	
	end	
		
	if (string.find(User.lastSpokenText,"poison")~=nil) then 
	    local a,b,myPS=string.find(User.lastSpokenText,"(%d+)") 
		poisonChange = tonumber(myPS)
		User:increaseAttrib("poisonvalue",poisonChange)
		myPoisonMsg = "poison value is "..User:increaseAttrib("poisonvalue",0)
		base.common.InformNLS(User,""..myPoisonMsg,""..myPoisonMsg)
	end 
	
	if (string.find(User.lastSpokenText,"portal")~=nil) then 
	   local a,b,destCord1,destCord2,destCord3=string.find(User.lastSpokenText,"(%d+) (%d+) (%d+)")
		destString = destCord1.." "..destCord2.." "..destCord3
		myBookPos = base.common.GetFrontPosition(User, 1)
	    myPortal = world:createItemFromId( 1061, 1, myBookPos, true, 933 ,0);
		myPortal:setData("destinationCords",destString)
		world:changeItem(myPortal)
	end	
	if (string.find(User.lastSpokenText,"create potion")~=nil) then 
	    local a,b,myId,myEffect,myQuali=string.find(User.lastSpokenText,"(%d+) (%d+) (%d+)") 
		nId = tonumber(myId)
		nEffect = tonumber(myEffect)
		nQuali = tonumber(myQuali)
		local myPosition = base.common.GetFrontPosition(User, 1)
		world:createItemFromId(nId,1,myPosition,true,nQuali,0)
		myPotion = base.common.GetFrontItem(User)
	    myPotion:setData("potionEffectId",nEffect)
		world:changeItem(myPotion)
	end	
	
	if (string.sub(User.lastSpokenText,1,6) == "delete") then
	    myItemId = tonumber(string.sub(User.lastSpokenText,7))
	    deleteAmount = User:countItem(myItemId)
		User:eraseItem(myItemId,deleteAmount)
	end	
	
	if User.lastSpokenText == "cherga" then
	    world:createItemFromId(2874,1,position(892,390,0),true,999,0)
		world:createItemFromId(2952,1,position(891,390,0),true,999,0)
	end	
	
	if User.lastSpokenText == "death" then
	    find, myEffect = User.effects:find(36)
		if find then
		   effectRemoved = User.effects:removeEffect(329)
		end
		base.character.DeathAfterTime(User,400,2,4)
		find, myEffect = User.effects:find(36)
		if find then
		   base.common.InformNLS(User,"death death death","death death death")
		end
		return
	end	
	
	if base.common.GetFrontItemID(User) == 15 then
		User:setAttrib("racetyp",tonumber(User.lastSpokenText))
		newHeight = math.random(80,120)
		User:setAttrib("body_height",newHeight)
		User:increaseAttrib("hitpoints",-10)
	    User:increaseAttrib("hitpoints",10)
	    User:talkLanguage(Character.say, Player.german, ""..User:getRace())
	end	
	
	--testing stuff
	if (string.sub(User.lastSpokenText,1,10) == "setfaction") then
	    newFaction = tonumber(string.sub(User.lastSpokenText,11))
        if (newFaction > 3) or (newFaction == nil) then
            User:inform("invalid value: faction can only be set to 1,2 or 3")		
		    return
        else
		    User:setQuestProgress(200,10111+(newFaction*1000))
		end
	end	
        		
	
	if (User.lastSpokenText == "faction") then
	    FactionCheck = base.factions.get_Faction(User)
		User:inform("factioncheck")
		User:inform("faction: "..FactionCheck.tid)
	    return
	end	
	
	-- function changes potion Data; only for testing
	local potionA = base.common.GetFrontItemID(User);
	if potionA == 331 or potionA == 166 or potionA == 329 or potionA == 165 or potionA == 330 or potionA == 59 or potionA == 327 or potionA == 328 or potionA == 167 then
	   myCheck = true
	 end
	-- function end
	
	-- again, only for testing
	if ((base.common.GetFrontItemID(User) == 1008) or myCheck) and (User.lastSpokenText == "inform datas") then -- infront of a cauldron?
	   local cauldron = base.common.GetFrontItem( User );
	   User:talkLanguage(Character.say, Player.german, "stockdata: "..cauldron:getData("stockData"))
	   User:talkLanguage(Character.say, Player.german, "potionEffectId: "..cauldron:getData("potionEffectId"))
	   User:talkLanguage(Character.say, Player.german, "cauldronFilledWith: "..cauldron:getData("cauldronFilledWith"))
	   User:talkLanguage(Character.say, Player.german, "potionId: "..cauldron:getData("potionId"))
	   User:talkLanguage(Character.say, Player.german, "potionQuality: "..cauldron:getData("potionQuality"))
	   User:talkLanguage(Character.say, Player.german, "essenceBrew :"..cauldron:getData("essenceBrew"))
	end
	-- function end
	
	-- again, only for testing
	if ((base.common.GetFrontItemID(User) == 1008) or myCheck) and (User.lastSpokenText == "inform herbs") then -- infront of a cauldron?
	   local cauldron = base.common.GetFrontItem( User );
	   User:talkLanguage(Character.say, Player.german, "essenceHerbs: "..cauldron:getData("essenceHerbs"))
	end
	-- function end
	
	if ((base.common.GetFrontItemID(User) == 1008) or myCheck) and (User.lastSpokenText == "remove all datas") then -- infront of a cauldron?
	   local cauldron = base.common.GetFrontItem( User );
	   cauldron:setData("stockData","")
	   cauldron:setData("potionEffectId","")
	   cauldron:setData("cauldronFilledWith","")
	   cauldron:setData("potionId","")
	   cauldron:setData("essenceHerbs","")
	   cauldron:setData("potionQuality","")
	   world:changeItem(cauldron)
	end   
	
	-- yet another testing thing
	local CheckBottle = base.common.GetFrontItemID(User)
	if CheckBottle == 164 then
	   
	   User:setSkinColor(128,255,255)
	   User:setHairColor(0,64,0)
	end
	-- testing end
	 ------------ TESTTING END !!! ------------
	
	content.gathering.InitGathering();
	InitHerblore();
	
	base.common.ResetInterruption(User, ltstate);
	if (ltstate == Action.abort) then -- Arbeit unterbrochen
        if (User:increaseAttrib("sex", 0) == 0) then
            gText = "seine";
            eText = "his";
        else
            gText = "ihre";
            eText = "her";
        end
        User:talkLanguage(Character.say, Player.german, "#me unterbricht "..gText.." Arbeit.");
        User:talkLanguage(Character.say, Player.english,"#me interrupts "..eText.." work.");
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
    
    if base.common.Encumbrence(User) then    -- Sehr streife Rï¿½stung?
        base.common.InformNLS( User,
        "Deine Rüstung behindert dabei Kräuter zu sammeln.",
        "Your armour disturbes you collecting herbs." );
        return
    end

    local TargetItem = base.common.GetFrontItem( User );

    if not TargetItem then
        base.common.InformNLS( User,
        "Hier kannst du nichts finden.",
        "You can't find anything here.");
        return;
    end

    if not base.common.IsLookingAt( User, TargetItem.pos ) then
        base.common.TurnTo( User, TargetItem.pos );
    end

    local harvestList = harvestItem[ TargetItem.id ];
    if harvestList == nil then
        return
    end

    if ( SourceItem:getType() ~= 4 ) then
        base.common.InformNLS( User,
        "Du musst die Sichel in der Hand haben um damit zu arbeiten",
        "You have to hold the sickle in your hand to work with it.");
        return
    end

    local GroundTile = world:getField( TargetItem.pos );

    local TileID = GroundTile:tile();
    local boden = base.common.GetGroundType(TileID);

    local skill = User:getSkill( "herb lore" );

    gem1, str1, gem2, str2=base.common.GetBonusFromTool(SourceItem);
    step=0;
    if gem1==3 then     -- ruby modifies skill!
        step=str1;
    end
    if gem2==3 then
        step=step+str2;
    end
    skill=skill+step;

    month=world:getTime("month");
    if (month == 0) then
        month = 16;
    end
    season=math.ceil(month/4);

    for i, harvest in pairs(harvestList) do
        groundok=false;
        if( harvest[ 1 ] == 0 or harvest[ 1 ] == boden ) then
            groundok = true;
        elseif ( harvest[ 1 ] < 0 ) then
            if SearchTileInRange( harvest[ 1 ] * ( -1 ), 3, TargetItem.pos ) then
                groundok = true;
            end
        end
        if groundok then

            if base.common.ToolBreaks( User, SourceItem ) then -- Werkzeug beschädigen
                base.common.InformNLS( User,
                "Die Sichel zerbricht.",
                "The sickle breaks." );
                return
            end

            if not base.common.FitForWork( User ) then
                return false;
            end

            success = false;
            if ( harvest[ 2 ] == 0 ) and ( harvest[ 4 ] ~= 0 ) then
                success = true;
            elseif ( harvest[ 2 ] > skill ) then
                success = false;
			skilluse=1;
	        base.common.InformNLS( User,
                      "Deine Kenntnisse in der Kräuterkunde sind nicht ausreichend, um hier etwas Brauchbares zu sammeln.",
                      "Your knowlege in herblore is not sufficient to collect herbs here.");
            elseif ( harvest[ 4 ] ~= 0 ) then
                if( math.random( 100 ) < 80 ) then
                    success = true;
                end
            elseif ( harvest[ 4 ] == 0 ) then
                if ( ltstate == Action.none ) then -- Arbeit nicht gestartet -> Starten
                    User:startAction(content.gathering.herbgathering:GenWorkTime(User,SourceItem), 0, 0, 0, 0 );
                    User:talkLanguage( Character.say, Player.german, "#me beginnt nach Kräutern zu suchen.");
                    User:talkLanguage( Character.say, Player.english, "#me starts to search for herbs.");
                    return
                end

                if base.common.IsInterrupted( User ) then
                    local selectMessage = math.random(1,4);
                    if ( selectMessage == 1 ) then
                        base.common.InformNLS(User,
                        "Du wischst dir den Schweiß von der Stirn.",
                        "You wipe sweat off your forehead.");
                    elseif ( selectMessage == 2 ) then
                        base.common.InformNLS(User,
                        "Ein kleines pelziges Tier springt aus dem Gebüsch und rennt davon. Für einen Moment bist du fürchterlich erschrocken.",
                        "A small, furry critter jumps out of a bush and darts off. That really surprised you.");
                    elseif ( selectMessage == 3 ) then
                        base.common.InformNLS(User,
                        "Du greifst mit der Hand in eine Blattlauskolonie. Verärgert wischt du dir die Hand an der Hose ab.",
                        "The plant is crowded with lice. Annoyed, you wipe your hand clean on your trousers.");
                    else
                        base.common.base.common.InformNLS(User,
                        "Ein aufdringliches Insekt schwirrt um deinen Kopf herum. Du schlägst mit der Hand danach und versuchst es zu vertreiben.",
                        "An annoying bug buzzes around your head. You strike at it in order to drive it away.");
                    end
                    return
                end

                User:startAction(content.gathering.herbgathering:GenWorkTime(User,SourceItem), 0, 0, 0, 0 );
                AreaHerb=GetAreaHerbs(TargetItem.pos);
                chance=100*(1.00037765/(1+(35.1237078*math.exp(-0.71059788*AreaHerb))));
                if chance < 1 then
                    chance = 1;
                end
                -- User:inform( "chance is "..chance );
                if( math.random( 100 ) < chance ) then
                    --User:inform( "success!" );
                    success = true;
                end
            end

            if ( harvest[ 4 ] == 0 ) then
                if( success ) then
                    if( harvest[ 5 ][ season ] >= math.random(20) ) then
                        success = true;
                    else
                        success = false;
                    end
                end
            end

            -- harvest fruit
            if( success ) then
                step=0;
                if gem1==7 then     -- topas modifies skill!
                    step=str1;
                end
                if gem2==7 then
                    step=step+str2;
                end
                --User:inform( "creating harvest" );

                -- replace item with follow up item
                if( harvest[ 4 ] ~= 0 ) then
                    --User:inform( "changing item" );
                    world:erase( TargetItem, 1 );
                else
                    DecreaseAreaHerbs(TargetItem.pos,1);
                end

				-- Hier wird das neue Item erschaffen

	                QualWert = 333
	                User:createItem( harvest[ 3 ], 1, QualWert, harvest[ 6 ] );
					

                User.movepoints=User.movepoints-4;
                if( harvest[ 2 ] > 0 ) then
                    --User:learn( 2, "herb lore", 2, 100 );
					--Replace with new learn function, see learn.lua 
                    base.common.GetHungry( User, 200 );
                else
                    --User:learn( 2, "herb lore", 2, 5 );
					--Replace with new learn function, see learn.lua 
                end

                if base.common.ToolBreaks( User, SourceItem ) then
                    base.common.InformNLS(User,
                    "Die alte und abgenutzte Sichel in deinen Hï¿½nden zerbricht.",
                    "The old and used sickle in your hands breaks.");
                end
            end

            if( (not success ) and (skilluse~=1) ) and math.random(1,30) == 10 then --spam protection: 1/30 chance for message
                if( boden == 1 ) then
                    base.common.InformNLS( User,
                    "Deine Hände graben durch die Erde, aber Du findest nichts.",
                    "Your hands muckrake through the dirt, but you do not find anything." );
                elseif( boden == 2 ) then
                    base.common.InformNLS( User,
                    "Altes Laub und Nadeln sind alles was Du findest.",
                    "Dry leaves are all you find." );
                elseif( boden == 3 ) then
                    base.common.InformNLS( User,
                    "Du findest nichts außer trockenem Sand.",
                    "You find nothing but dry sand" );
                elseif( boden == 4 ) then
                    base.common.InformNLS( User,
                    "Du findest nichts außer Unkraut und Gras.",
                    "You find nothing but weed and grass." );
                elseif( boden == 5 ) then
                    base.common.InformNLS( User,
                    "Du findest nichts außer Geröll.",
                    "You find nothing but boulders." );
                elseif( boden == 6 ) then
                    base.common.InformNLS( User,
                    "Du findest nichts außer ein paar unnützen dürren Stängeln im Wasser.",
                    "You find nothing except of some useless meagre stipes in the water." );
                elseif( boden == 7 ) then
                    base.common.InformNLS( User,
                    "Du findest nichts außer ein paar modrigen Pflanzenresten.",
                    "You find nothing but some musty plant remains." );
                elseif( boden == 8 ) then
                    base.common.InformNLS( User,
                    "Du findest nichts außer Eis und Schnee.",
                    "You find nothing but ice and snow." );
				else
                    base.common.InformNLS( User,
                    "Du findest nichts.",
                    "You  do not find anything." );
                end
            end -- right tile
            return
        end
    end -- for harvestList
end

function InitHerblore()
    if (harvestItem == nil) then

        harvestItem = { };
        AreaHerbs = { };
        AreaTime = { };
        -- Format of entry: boden, difficulty, product, followup item, aviable in seasons[0..10]{spring,summer,fall,winter}
        -- Ground(field=1,forest=2,sand=3,grass=4,rocks=5,water=6,dirt=7,snow=8)
        
        
        -- Druidenkrï¿½uter
        
        harvestItem[ 273 ] = {                       -- Blume
        { 2, 5, 144, 0, {10, 1,10,16}, 37 },             -- Wald: 	Jungfernkraut
        { 3, 5, 137, 0, {10, 1,10,16}, 25 },             -- Sand: 	Flammkelchblüte
        { 4, 7, 135, 0, {16,10, 1,10}, 17 },             -- Wiese:	Gelbkraut
        { 5, 0, 148, 0, {10,16,10, 1}, 47 },             -- Fels: 	Firnisblüte
        { 6, 0, 763, 0, {10,16,10, 1}, 47 },             -- Wasser:	Sumpfblume
        { 7,50, 138, 0, { 1,10,16,10}, 26 },             -- Dreck:	Nachengelsblüte
        { 8,50, 757, 0, {10,16,10, 1}, 26 } };           -- Schnee:  Gottesblume
        
        harvestItem[ 274 ] = {                       -- Farn
        { 2,30, 140, 0, {10,16,10, 1}, 27 },               	-- Wald: 	Donfblatt
        { 3, 0, 156, 0, {10, 1,10,16}, 61 },               	-- Sand: 	Steppenfarn
        { 4,10, 153, 0, {16,10, 1,10}, 52 },               	-- Wiese:	Fußblatt
        { 5,20, 768, 0, {10,16,10, 1}, 52 },               	-- Fels: 	Wolfsfarn
		{ 6, 0, 754, 0, {10,16,10, 1}, 52 },            	-- Wasser:  Wasserfarn
		{ 7,50, 752, 0, { 1,10,16,10}, 26 },             	-- Dreck:	Alraune
		{ 8,50, 760, 0, { 1,10,16,10}, 26 } };             	-- Schnee:  Eisblatt
        
        harvestItem[ 301 ] = {                       -- Hecke
        { 2, 0, 147, 0, { 1,10,16,10}, 46 },              -- Wald: 	Brombeere
        { 3, 5, 142, 0, {10, 1,10,16}, 35 },              -- Sand: 	Sandbeere
        { 4, 0, 143, 0, { 1,10,16,10}, 36 },              -- Wiese: Roter Holunder
        { 5,20, 756, 0, {10,16,10, 1}, 52 },              -- Fels:  Frommbeere
        { 7,50, 136, 0, { 1,10,16,10}, 18 } };            -- Dreck: Wutbeere
        
        harvestItem[ 338 ] = {                       -- Schilf
        { 4, 5, 134, 0, {10, 1,10,16}, 16 },              -- Wiese:	 Vierblättrige Einbeere
        { 6,30, 155, 0, {10,16,10, 1}, 54 } };            -- Wasser: Sibanac Blatt
        
        harvestItem[ 1782 ] = {                      -- Gras
        { 2, 0, 151, 0, {10,16,10, 1}, 48 },             -- Wald: 	Erdbeere
        { 3, 5, 146, 0, { 1,10,16,10}, 28 },             -- Sand: 	Wüstenhimmelskapsel
        { 4,20, 141, 0, { 1,10,16,10}, 38 },             -- Wiese:	Schwarze Distel
        { 5,20, 145, 0, {16,10, 1,10}, 38 },             -- Stein:	Heideblüte
        { 6, 0, 761, 0, { 1,10,16,10}, 52 },             -- Wasser:  Regenkraut
        { 7,50, 762, 0, {10, 1,10,16}, 18 } };           -- Dreck:   Schwefelgras

        harvestItem[ 1783 ] = {                      -- Gras
        { 2, 0, 151, 0, {10,16,10, 1}, 48 },             -- Wald: 	Erdbeere
        { 3, 5, 146, 0, { 1,10,16,10}, 28 },             -- Sand: 	Wüstenhimmelskapsel
        { 4,20, 141, 0, { 1,10,16,10}, 38 },             -- Wiese:	Schwarze Distel
        { 5,20, 145, 0, {16,10, 1,10}, 38 },             -- Stein:	Heideblüte
        { 6, 0, 761, 0, { 1,10,16,10}, 52 },             -- Wasser:  Regenkraut
        { 7,50, 762, 0, {10, 1,10,16}, 18 } };           -- Dreck:   Schwefelgras
        
        harvestItem[ 1791 ] = {                      -- Sonnenblumen
        { 4,30, 133, 0, {10,16,10, 1}, 15 } };            -- Wiese: Sonnenkraut
        
        harvestItem[ 767 ] = {                      -- Wasserlilie
        { 6,30, 767, 0, {10,16,10,1}, 15 } };            -- Wasser: Wasserlilie
        
        harvestItem[ 1807 ] = {                      -- Ceridern
        { 0,30, 753, 0, {16,10, 1,10}, 15 } };            -- alle: Ceridern-Beere
        
        harvestItem[ 1808 ] = {                      -- Drachenbaum
        { 0,30, 755, 0, {16,10, 1,10}, 15 } };            -- alle: Feuerschote
        
        -- Pilze

        harvestItem[ 159 ] = {                       -- Fliegenpilz
        { 0, 0, 159, 0, { 1,10,16,10}, 11 }};             -- Alle: Fliegenpilz

         harvestItem[ 161 ] = {                       -- Hirtenpilz
        { 0, 0, 161, 0, { 1,10,16,10}, 11 }};             -- Alle: Hirtenpilz

        harvestItem[ 426 ] = {                       -- Pilz
        { 0, 0, 162, 0, {16,10, 1,10}, 11 }};             -- Alle: Geburtspilz

        harvestItem[ 158 ] = {                       -- Knollenschwamm
        { 0, 0, 158, 0, {10, 1,10,16}, 11 }};             -- Alle: Knollenschwamm

        
        harvestItem[ 1790 ] = {                      -- Pilzkreis
        { 0, 0, 163, 0, { 1,10,16,10}, 73 } };             -- Alle: Champignon
        
        -- Hilfskraut

        harvestItem[ 203 ] = {                       -- Palme
        { 0, 0, 157, 0, {10,10,10,10}, 11 }};             -- Alle: Faulbaumrinde
        
        harvestItem[ 2169 ] = {                      -- Alter Baumstamm
        { 2,30, 157, 0, {10,16,10,1}, 11 },                -- Wald: Faulbaumrinde
        { 7,10, 157, 0, {10,16,10,1}, 11 } };              -- Dreck: Faulbaumrinde

        harvestItem[ 2170 ] = {                      -- Alter Baumstamm
        { 2,30, 157, 0, {10,16,10,1}, 11 },                -- Wald: Faulbaumrinde
        { 7,10, 157, 0, {10,16,10,1}, 11 } };              -- Dreck: Faulbaumrinde



		-- Ackerbau

    	harvestItem[ 290 ] = {                       -- Kohl
        { 0, 0, 290, -1, {14,20,16,0}, 11 } };             -- Alle: Kohl
        
        harvestItem[ 537 ] = {                       -- reife Zwiebeln
        { 0, 0, 201, -1, {14,20,16,0}, 74 } };            -- Alle: Zwiebeln

        harvestItem[ 540 ] = {                       -- reife Tomaten
        { 0, 0, 200, -1, {14,20,16,0}, 82 } };            -- Alle: Tomaten

        harvestItem[ 731 ] = {                       -- Hopfen
        { 0, 0, 154, -1, {14,20,16,0}, 53 } };            -- Alle: Hopfen

        harvestItem[ 732 ] = {                       -- alter Hopfen
        { 0, 0, 728, -1, {14,20,16,0}, 11 } };            -- Alle: Hopfenwurzel
        
        harvestItem[ 2492 ] = {                      -- reife Karotten
        { 0, 0, 2493, -1, {14,20,16,0}, 11 } };            -- Alle: Karotten

		harvestItem[ 782 ] = {                      -- reifes Zuckerrohr
        { 0, 0, 778, -1, {14,20,16,0}, 73 } };            -- Alle: Zuckerrohr

        harvestItem[ 777 ] = {                      -- reifer Tabak
        { 0, 0, 772, -1, {14,20,16,0}, 82 } };            -- Alle: Tabak

		-- Sonstiges

        harvestItem[ 308 ] = {                       -- Tannenbaum
        { 0,0, 149, 0, {16,10,5,10}, 11 } };             -- Alle: Tannensetzling

        harvestItem[ 1812 ] = {                      -- kleine Palme
        { 3,20, 80, 0, {14,20,16,1}, 11 } };               -- Sand: Banane

        harvestItem[ 1813 ] = {                      -- kleine Palme
        { 3,20, 80, 0, {14,20,16,1}, 11 } };               -- Sand: Banane
        
        
        harvestItem[ 125 ] = {                       -- Baumstumpf Apfel
        { 0,0, 152, 0, {10, 1,10,16}, 11 } };             -- Alle: Lebenswurz
        
        harvestItem[ 309 ] = {                       -- Baumstumpf Tanne
        { 0,0, 152, 0, {10, 1,10,16}, 11 } };             -- Alle: Lebenswurz
        
        harvestItem[ 541 ] = {                       -- Baumstumpf Kirsche
        { 0,0, 152, 0, {10, 1,10,16}, 11 } };             -- Alle: Lebenswurz
        
        harvestItem[ 542 ] = {                       -- Baumstumpf Cachdern
        { 0,0, 152, 0, {10, 1,10,16}, 11 } };             -- Alle: Lebenswurz
        
        harvestItem[ 584 ] = {                       -- Baumstumpf Eldan-Eiche
        { 0,0, 152, 0, {10, 1,10,16}, 11 } };             -- Alle: Lebenswurz
        
        harvestItem[ 585 ] = {                       -- Baumstumpf Kiefer
        { 0,0, 152, 0, {10, 1,10,16}, 11 } };             -- Alle: Lebenswurz
        
        harvestItem[ 587 ] = {                       -- Baumstumpf Naldor
        { 0,0, 152, 0, {10, 1,10,16}, 11 } };             -- Alle: Lebenswurz


    end
end

function GetAreaHerbs(TargetPosi) -- 2024 to compensate the lowest coordinate of New Illarion: -2024 -2024 0
    local AreaFieldX=math.floor((TargetPosi.x+2024))+1;
    local AreaFieldY=math.floor((TargetPosi.y+2024))+1;
    if (AreaHerbs[AreaFieldX]==nil) then
        AreaHerbs[AreaFieldX] = { };
    end
    if (AreaTime[AreaFieldX]==nil) then
        AreaTime[AreaFieldX] = { };
    end
    if (AreaHerbs[AreaFieldX][AreaFieldY]==nil) then
        AreaHerbs[AreaFieldX][AreaFieldY] = 10;
    end
    if (AreaTime[AreaFieldX][AreaFieldY]==nil) then
        AreaTime[AreaFieldX][AreaFieldY] = GetServerSeconds();
    end
    IncreaseAreaHerbs(TargetPosi)
    return AreaHerbs[AreaFieldX][AreaFieldY]
end

function DecreaseAreaHerbs(TargetPosi,Amount)
    local AreaFieldX=math.floor((TargetPosi.x+2024))+1;
    local AreaFieldY=math.floor((TargetPosi.y+2024))+1;
    AreaHerbs[AreaFieldX][AreaFieldY]=AreaHerbs[AreaFieldX][AreaFieldY]-Amount;
    AreaTime[AreaFieldX][AreaFieldY]=GetServerSeconds();
    return
end

function IncreaseAreaHerbs(TargetPosi)
    local AreaFieldX=math.floor((TargetPosi.x+2024))+1;
    local AreaFieldY=math.floor((TargetPosi.y+2024))+1;
    if (AreaHerbs[AreaFieldX][AreaFieldY]<20) then
        local TimeDiff=GetServerSeconds()-AreaTime[AreaFieldX][AreaFieldY];
        if (TimeDiff>600) then
            AreaHerbs[AreaFieldX][AreaFieldY]=AreaHerbs[AreaFieldX][AreaFieldY]+math.min(10,math.floor(TimeDiff/600));
            AreaTime[AreaFieldX][AreaFieldY]=GetServerSeconds();
        end
    end
    return
end

function GetServerSeconds()
    local retVal=0;
    retVal=retVal+world:getTime("second");
    retVal=retVal+world:getTime("minute")*60;
    retVal=retVal+world:getTime("hour")*60*60;
    retVal=retVal+world:getTime("day")*24*60*60;
    local month=world:getTime("month");
    if (month==0) then
        retVal=retVal+16*6*24*60*60;
    else
        retVal=retVal+month*24*24*60*60;
    end
    retVal=retVal+world:getTime("year")*366*24*60*60;
    return math.floor(retVal/4)
end

function SearchTileInRange(GroundType,Radius,Posi)
    local i=-Radius;
    local k=-Radius
    local found=false;
    repeat
    k=-Radius;
    repeat
    SearchPos=position(Posi.x+i,Posi.y+k,Posi.z)
    field = world:getField( SearchPos )
    TileID = field:tile();
    bodenart = base.common.GetGroundType( TileID )
    for itn=1,table.getn(GroundType) do
        if (bodenart==GroundType[itn]) then
            found=true
        end
    end
    k=k+1;
    until (found or k==Radius+1)
    i=i+1;
    until (found or i==Radius+1)
    return found
end

function SearchItemInRange(ItemIDs,Radius,Posi)
    local i=-Radius;
    local k=-Radius
    local found=false;
    repeat
    k=-Radius;
    repeat
    SearchPos=position(Posi.x+i,Posi.y+k,Posi.z)
    if world:isItemOnField(SearchPos) then
        for itn=1,table.getn(ItemIDs) do
            if (Item.id==ItemIDs[itn]) then
                found=true
            end
        end
    end
    k=k+1;
    until (found or k==Radius+1)
    i=i+1;
    until (found or i==Radius+1)
    return found
end

function CheckValidHerb(HerbID,TargetPos)
    return true;
end
