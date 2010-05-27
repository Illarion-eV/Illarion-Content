-- Testskript 1 f�r Weiterentwicklung Druidenmagie
-- 2007 by Falk
-- 2009 by Nitram
-- Trinken aus gr�ner Flasche (331)
-- ------------------------------------------------

-- include base.common for additional functions
require("base.common")

module("druids.items.331_green_bottle", package.seeall)

-- UPDATE common SET com_script='druids.items.331_green_bottle' WHERE com_itemid = 331;

-- table for security question before becoming a druid
Security = {};

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
    if (SourceItem.data == 0) then
        -- ALTE FASSUNG ALS HEILTRANK
        if (ltstate == Action.abort) then

            User:talkLanguage(CCharacter.say, CPlayer.german, "#me versch�ttet den Trank.");
            User:talkLanguage(CCharacter.say, CPlayer.english, "#me spills the potion.");

            world:erase( SourceItem, 1 );

            if (math.random( 20 ) == 1) then
                base.common.TempInformNLS( User,
                "Die Flasche zerbricht.",
                "The bottle breaks.");
            else
                User:createItem( 164, 1, 333, 0 );
            end

            return
        end

        if User.attackmode then
            base.common.InformNLS( User,
            "Du kannst nichts trinken w�hrend du k�mpfst.",
            "You can't drink something while fighting." );
            return
        end

        if (ltstate == Action.none) then

            User:startAction( 20, 0, 0, 12, 25 );

            User:talkLanguage(CCharacter.say, CPlayer.german, "#me beginnt einen Trank zu trinken.");
            User:talkLanguage(CCharacter.say, CPlayer.english, "#me starts to drink a potion.");

            return
        end

        world:erase(SourceItem,1);

        if( math.random( 20 ) == 1 ) then
            base.common.InformNLS( User,
            "Die Flasche zerbricht.",
            "The bottle breaks.");
        else
            User:createItem( 164, 1, 333,0);
        end

        User:LTIncreaseHP(500,14,2);
        User:increaseAttrib("foodlevel",2000);
        User.movepoints = User.movepoints - 20;

        if (User:increaseAttrib("foodlevel",0) > 60000) then
            base.common.InformNLS( User,
            "Du bekommst kaum noch was runter und dir wird schlecht.",
            "You hardly manage to eat something more and get sick!");

            User:increaseAttrib("hitpoints",-1000);
        elseif  (User:increaseAttrib("foodlevel",0) > 40000) then
            base.common.InformNLS( User,
            "Du bist satt.",
            "You are stuffed.");
        else
            base.common.InformNLS( User,
            "Du trinkst die Flasche aus und f�hlst wie neue St�rke dich durchstr�mt.",
            "You drink up the bottle, and you feel the new strength that flows through your body.");
        end

        return
        -- Old style potion done
    end

    local msg = base.common.GetNLS( User,
	"Du hast nicht das Gef�hl, als ob irgend etwas passiert sei.",
	"You don't feel anything happend at all." );

    if (SourceItem.data == 55555555) then
        if (User:getMagicType( ) ~= 3) then -- user is not a druid
            if not Security[ User.id ] then
                if ( ( User:getSkill( "commotio" ) + User:getSkill( "desicio" ) + User:getSkill( "pervestigatio" )+User:getSkill( "transformo" )+User:getSkill( "transfreto" ) ) > 40 ) then
                    base.common.InformNLS( User,
                    "#b|0|1008|Mit Deiner Magie-Erfahrung bleibt Dir die Pforte der Druiden verschlossen.",
                    "#b|0|1008|Your magic skills keep the gate of druids closed for you." );
                    return;
                else
                    base.common.InformNLS( User,
                    "#b|0|1008|Vorsicht! Von diesem Schritt ins Druidentum f�hrt kein Weg zur�ck.",
                    "#b|0|1008|Attention! There is no way back from this path to druidism." );
                end
                Security[ User.id ] = true;
                return;
            else
                local old_value = User:getSkill("alchemy");
                local new_value = math.min( 24, old_value / 2 );
                if (new_value ~= old_value) then
                    User:increaseSkill( 6, "alchemy", new_value - old_value );
                end

                User:setMagicType( 3 );

                killSkill( User, 3, "commotio" );
                killSkill( User, 3, "desicio" );
                killSkill( User, 3, "pervestigatio" );
                killSkill( User, 3, "transformo" );
                killSkill( User, 3, "transfreto" );

                msg = base.common.GetNLS( User,
            	"Du hast das Gef�hl etwas ist passiert. Du bist nun ein Druide.",
            	"You have the feeling something happend. You are now a druid." );

            	Security[ User.id ] = nil;
            end
        end
    end

    User:talkLanguage(CCharacter.say, CPlayer.german, "#me trinkt den gr�nen dickfl�ssigen Sud.");
    User:talkLanguage(CCharacter.say, CPlayer.english, "#me drinks the green viscous broth.");

	world:makeSound(12,User.pos);
	world:gfx(1,User.pos);

	if (SourceItem.number == 1) then
    	SourceItem.id = 164;
    	SourceItem.quality = 111;
    	SourceItem.data = 0;
    	world:changeItem( SourceItem );
    else
        world:erase( SourceItem, 1 );
        local notcreated = User:createItem( 164, 1, 111, 0 );
        if (notcreated > 0) then
            world:createItemFromId( 164, 1, User.pos, true, 111, 0 );
        end
    end

    User:inform( msg );
end

function killSkill( User, Skillgroup, Skillname )
    local value = User:getSkill( Skillname );
    if (value == 0) then
        return;
    end
    User:increaseSkill( Skillgroup, Skillname, -value );
end

function LookAtItem(User,Item)
    if (Item.data == 55555555) then
        world:itemInform( User, Item, base.common.GetNLS( User,
        "Du siehst ein Flaschenetikett mit der Aufschrift: \"Druidentrunk\"",
        "You look at a sticker telling: \"Druids drink \"" ) );
    elseif (Item.data == 0) then
        world:itemInform( User, Item, base.common.GetNLS( User,
        "Du siehst ein Flaschenetikett mit der Aufschrift: \"Heiltrank\"",
        "You look at a sticker telling: \"Healing Potion \"" ) );
    else
        world:itemInform( User, Item, base.common.GetNLS( User,
        "Du siehst ein Flaschenetikett mit der Aufschrift: \"Kr�utersud\"",
        "You look at a sticker telling: \"Herbage Broth\"" ) );
    end
end