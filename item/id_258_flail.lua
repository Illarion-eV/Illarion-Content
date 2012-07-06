-- Dreschflegel ( 258 )

-- Getreidebündel  --> Getreidekörner

-- UPDATE common SET com_script='item.id_258_flail' WHERE com_itemid IN (258);

require("item.general.wood")
require("base.common")
require("content.gathering")

module("item.id_258_flail", package.seeall, package.seeall(item.general.wood))

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
    content.gathering.InitGathering();
    local farming = content.gathering.farming;
	
	base.common.ResetInterruption( User, ltstate );
    if ( ltstate == Action.abort ) then -- Arbeit unterbrochen
        if (User:increaseAttrib("sex",0) == 0) then
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
      
    if not base.common.CheckItem( User, SourceItem ) then -- Sicherheitscheck
        return
    end
    
    if base.common.Encumbrence(User) then -- Durch Steife Rüstung behindert
        base.common.InformNLS( User,
        "Deine Rüstung behindert Dich beim Getreide dreschen.",
        "Your armour disturbes you when flailing grain" );
        return
    end
    
    if (SourceItem:getType() ~= 4) then -- Dreschflegel in der Hand
        base.common.InformNLS( User,
        "Du musst den Dreschflegel in der Hand haben!",
        "You need to hold the flail in your hand!" );
        return
    end
    
    if not base.common.FitForWork( User ) then -- Nicht erschöpft
        return
    end
    
	if not base.common.IsLookingAt( User, TargetItem.pos ) then -- Blickrichtung prüfen
        base.common.TurnTo( User, TargetItem.pos ); -- notfalls drehen
    end
    
    if ( ltstate == Action.none ) then -- Arbeit noch nicht begonnen -> Los gehts
        if (User:countItemAt("all",249)==0) then -- Getreidebündel im Gürtel
			base.common.InformNLS( User, 
				"Was willst du mit dem Dreschflegel bearbeiten? Dich selbst?", 
				"What do you want to flail? Yourself?" );
			return;
		end
        farming.SavedWorkTime[User.id] = farming:GenWorkTime(User,nil,true);
		User:startAction( farming.SavedWorkTime[User.id], 0, 0, 0, 0);
        User:talkLanguage( Character.say, Player.german, "#me beginnt Getreide zu dreschen");
        User:talkLanguage( Character.say, Player.english, "#me starts to flail grain"); 
        return
    end
	
	if not farming:FindRandomItem(User) then
		return
	end
    
    if base.common.IsInterrupted( User ) then
        local selectMessage = math.random(1,5);
        if ( selectMessage == 1 ) then
            base.common.InformNLS(User,
            "Du wischst dir den Schweiß von der Stirn.",
            "You wipe sweat off your forehead.");
        elseif ( selectMessage == 2 ) then
            base.common.InformNLS(User,
            "Die Dreschstange des Flegels löst sich und du musst sie erneut festbinden.",
            "The flail's chain appears to be stuck, it takes you some time to fix it.");
        elseif ( selectMessage == 3 ) then
            base.common.InformNLS(User,
            "Du schaffst das Stroh weg um wieder mehr Platz zu haben.",
            "You tie a few straw bundles together.");
        elseif ( selectMessage == 4 ) then
            base.common.InformNLS(User,
            "Du kehrst kurz die Spreu zusammen und bringst sie weg.",
            "You sweep the husk into a pile and carry it away.");
        else
            base.common.InformNLS(User,
            "Deine Hände brennen wie Feuer, deshalb machst du eine kurze Pause. Hoffentlich gibt das keine Blase...",
            "Your arms appear to be getting very tired, you decide on a short break.");
        end
        return
    end
    
    User:learn( farming.LeadSkill, farming.LeadSkillGroup, farming.SavedWorkTime[User.id], 100, User:increaseAttrib(farming.LeadAttribute,0) );
    User:eraseItem( 249, 1 ); -- Getreidebündel wegnehmen
    amount = GenAmount(User);                
    local notCreated = User:createItem( 259, amount, 333 ,0); -- Getreidekörner erstellen
    if ( amount==0) then
        base.common.InformNLS(User,
        "Du verschüttest etwas Getreide.",
        "You spill some grain.");
    else
        if ( notCreated > 0 ) then -- Zu viele Items erstellt --> Char überladen
            world:createItemFromId( 259, notCreated, User.pos, true, 333 ,0);
            base.common.InformNLS(User,
            "Du kannst nichts mehr halten.",
            "You can't carry any more.");
        elseif (User:countItemAt("all",249)==0) then -- Nicht überladen -> Neue aktion Starten
            farming.SavedWorkTime[User.id] = farming:GenWorkTime(User,nil,true);
            User:startAction( farming.SavedWorkTime[User.id], 0, 0, 0, 0);
        else
            base.common.InformNLS(User,
            "Du hast kein Getreidebündel mehr.",
            "You have no bundle of grain anymore.");
        end      
    end              
    base.common.GetHungry( User, 200 ); -- Hungrig werden
    if base.common.ToolBreaks( User, SourceItem, true ) then -- Dreschflegen beschädigen
        base.common.InformNLS(User,
        "Dein alter Dreschflegel zerbricht.",
        "Your old flail breaks.");
        return
    end
end

-- Menge der Items die erstellt werden festlegen
function GenAmount(User)
    local Skill  = User:getSkill( content.gathering.farming.LeadSkill );
    local Attrib = User:increaseAttrib( content.gathering.farming.LeadAttribute, 0 );
    
    local chance = math.random( 100 );
    
    if     ( chance < (Skill+Attrib) - 10 ) then return 4;
    elseif ( chance < (Skill+Attrib)      ) then return 3;
    elseif ( chance < (Skill+Attrib) + 25 ) then return 2;
    elseif ( chance < (Skill+Attrib) + 50 ) then return 1;
    end
    return 0;
end