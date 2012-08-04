require("base.common")
require("content.chardescription")

module("item.id_2874_mirror", package.seeall)
-- belongs also to item id 2873

-- UPDATE common SET com_script='item.id_2874_mirror' WHERE com_itemid = 2874;

function init()
   lpos = position(-32,193,-8);
   mpos = position(-28,193,-8);
end

function LookAtItem( User, Item )
    -- Mirror of Death --
	if (Item.pos == (891,390,0)) --[[and (User:getFaceTo() == 2) and (User.pos == (890,390,0)) or User.pos == (889,390,0))]] then
	    MirrorOfDeath(User)
	    return
	end	-- end of mirror of death
		
	if (first==nil) then
        init();
        first=1;
    end
    lang=User:getPlayerLanguage();
    if ( equapos(Item.pos, mpos) and (User:getFaceTo() == 2) and equapos(User.pos, position(-29,193,-8)) ) then
        if lang==0 then
            world:itemInform(User, Item, "Hinter deinem Rücken erkennst du deutlich eine Leiter im Spiegel");
        else
            world:itemInform(User, Item, "Behind your back you can clearly see a ladder in the mirror");
        end
        if ( not base.common.isItemIdInFieldStack( 35, lpos ) ) then
            world:createItemFromId( 35, 1, lpos, true, 999 ,0);
        end;
    else
        if lang==0 then
            world:itemInform(User, Item, "Spiegel");
        else
            world:itemInform(User, Item, "mirror");
        end
    end;
--	User:inform("in LookAtItem of spiegel");
	LookAtItemIdent(User,Item);
end

function UseItem(User,SourceItem,TargetItem,Counter,Param)
	local output = "";
	local lang = User:getPlayerLanguage();
	local qual,dura = getClothesFactor(User);
	local ft = getFigureText(User:increaseAttrib("body_height",0),User:increaseAttrib("weight",0),User:increaseAttrib("strength",0), lang);
	if(lang == 0) then
		output = "Du bist ";
		output = output..getAgeText(User:getRace(), User:increaseAttrib("age", 0), lang);
		if(ft ~= nil) then
			output = output..", "..ft;
		end
		output = output.." und "..getHPText(User:increaseAttrib("hitpoints",0), lang)..". ";
		output = output.."Deine Kleidung wirkt "..getClothesQualText(qual, lang).." und "..getClothesDuraText(dura, lang)..".";
	else
		output = "You are ";
		output = output..getAgeText(User:getRace(), User:increaseAttrib("age", 0), lang);
		if(ft ~= nil) then
			output = output..", "..getFigureText(User:increaseAttrib("body_height",0),User:increaseAttrib("weight",0),User:increaseAttrib("strength",0), lang);
		end
		output = output.." and "..getHPText(User:increaseAttrib("hitpoints",0), lang)..". ";
		output = output.."Your clothes look "..getClothesQualText(qual, lang).." and "..getClothesDuraText(dura, lang)..".";
	end
	User:sendCharDescription(User.id, output);
end

function MirrorOfDeath(User)
	deathCounter = User:getQuestProgress(666)
	charSex = User:increaseAttrib("sex",0)
	charRace = User:getRace()
	
	if deathCounter == 0 then
		base.common.InformNLS(User, "Im Spiegel siehst du ein Bild deiner selbst - jedoch in den besten deiner Jahre, bei voller Gesundheit.",
									"You see yourself in the mirror - but in your prime time and fit as a fiddle.")
	else
	
	    if deathCounter > 10 then
		    deathCounter = 10
		elseif (deathCounter/2) == math.floor((deathCounter/2)) then
			textId = deathCounter - 1
		else
			textId = deathCounter
		end
	
	    if charSex == 0 then
		    base.common.InformNLS(User, DeathTextMaleDE[charRace][deathCounter], DeathTextMaleEN[charRace][deathCounter])
	    else
	        base.common.InformNLS(User, DeathTextFemaleDE[charRace][deathCounter], DeathTextFemaleEN[charRace][deathCounter])
	    end
	end
end

DeathTextMaleDE = {}
DeathTextMaleEN = {}
-- human
DeathTextMaleDE[0] = {"de1","de2","de3","de4","de5"}
DeathTextMaleEN[0] = {"en1","en2","en3","en4","en5"}
-- dwarf
DeathTextMaleDE[1] = {"de1","de2","de3","de4","de5"}
DeathTextMaleEN[1] = {"en1","en2","en3","en4","en5"}
-- halfling
DeathTextMaleDE[2] = {"de1","de2","de3","de4","de5"}
DeathTextMaleEN[2] = {"en1","en2","en3","en4","en5"}
-- elf
DeathTextMaleDE[3] = {"de1","de2","de3","de4","de5"}
DeathTextMaleEN[3] = {"en1","en2","en3","en4","en5"}
-- orc
DeathTextMaleDE[4] = {"de1","de2","de3","de4","de5"}
DeathTextMaleEN[4] = {"en1","en2","en3","en4","en5"}
-- lizard
DeathTextMaleDE[5] = {"de1","de2","de3","de4","de5"}
DeathTextMaleEN[5] = {"en1","en2","en3","en4","en5"}

DeathTextFemaleDE = {}
DeathTextFemaleEN = {}
-- human
DeathTextFemaleDE[0] = {"de1","de2","de3","de4","de5"}
DeathTextFemaleEN[0] = {"en1","en2","en3","en4","en5"}
-- dwarf
DeathTextFemaleDE[1] = {"de1","de2","de3","de4","de5"}
DeathTextFemaleEN[1] = {"en1","en2","en3","en4","en5"}
-- halfling
DeathTextFemaleDE[2] = {"de1","de2","de3","de4","de5"}
DeathTextFemaleEN[2] = {"en1","en2","en3","en4","en5"}
-- elf
DeathTextFemaleDE[3] = {"de1","de2","de3","de4","de5"}
DeathTextFemaleEN[3] = {"en1","en2","en3","en4","en5"}
-- orc
DeathTextFemaleDE[4] = {"de1","de2","de3","de4","de5"}
DeathTextFemaleEN[4] = {"en1","en2","en3","en4","en5"}
-- lizard
DeathTextFemaleDE[5] = {"de1","de2","de3","de4","de5"}
DeathTextFemaleEN[5] = {"en1","en2","en3","en4","en5"}