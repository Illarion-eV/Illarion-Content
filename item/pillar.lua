-- Tree Script
-- Envi
require("base.common")
require("content.pillar")
require("quest.enduranceCave")

module("item.pillar", package.seeall)

-- Edit by faladron 13. April 2012 added lines 170 - 190 for Endurance Cave Quest


-- UPDATE common SET com_script='item.pillar' WHERE com_itemid IN (272, 440, 441, 442, 443, 467, 692, 693, 694, 695, 2805);

PillarListGerman = 
{
"PLACEHOLDER.",
};

PillarListEnglish = 
{
"PLACEHOLDER.",
};


function Init()

    if InitDone then
        return
    end
   
    messageE={}; --the inscription arrays (english/german)
    messageG={};
   messageE[0]="This monument shows Sir Reginald Edwards, the departed king of Cadomyr and father of Queen Rosaline. The customs of Cadomyr are engraved upon a brass plate at the bottom of the pedestal."
   messageG[0]="Dieses Monument zeigt Sir Reginald Edwards, den verstorbenen König Cadomyrs und Vater von Königin Rosaline. Die Sitten Cadomyrs sind auf einer Messingtafel am Sockel den Monuments zu lesen.";
    messageE[1]="I. Faith: Worship the Gods, they alone are true and almighty."
   messageG[1]="I. Glaube: Ehre die Götter. Nur sie alleine sind wahrhaftig allmächtig.";
    messageE[2]="II. Obedience: Be loyal and obedient, your monarch represents the will of the gods."
   messageG[2]="II. Gehorsam: Sei loyal und folgsam. Dein Monarch verkörpert den Willen der Götter.";
   messageE[3]="III. Honor: In all things act with honor. Defending it is your right and duty."
   messageG[3]="III. Ehre: Handle stets ehrenhaft. Deine Ehre zu verteidigen ist dein Recht und deine Pflicht.";
   messageE[4]="IV. Lineage: Know your place, bring honor to your family in life as well as death."
   messageG[4]="IV. Abstammung: Kenne deinen Platz. Deine Geburt zählt mehr als dein Leben oder dein Tod.";
   messageE[5]="V. Truth: Keep your word and give no false testimony. The strength of your word measures your worth."
   messageG[5]="V. Ehrlichkeit: Halte dein Wort und gib kein falsches Zeugnis ab. Du wirst an deinen Worten gemessen.";
    messageE[6]="VI. Justice: In all things be fair and just; never steal, offer your friendship freely, but do not spare your enemy the sword."
   messageG[6]="VI. Gerechtigkeit: Sei gerecht zu jedem. Stehle nicht, gib deine Freundschaft dem Freund und dein Schwert dem Feind.";
   messageE[7]="VII. Courage: Fear is not permissible for we are blessed with honor and divine leadership. Never retreat, never surrender."
   messageG[7]="VII. Courage: Fürchte nicht. Stehe für deinen Monarchen und dein Ehre ein. Kein Rückzug, niemals aufgeben.";
   messageE[8]="VIII. Patriarchy: Obey your father, obey your husband, but never your lesser."
   messageG[8]="VIII. Patriarchat: Gehorche dem Vater. Gehorche dem Ehemann. Aber gehorche nicht dem Sohn.";
   messageE[9]="IX. Property: What is yours will remain yours, be it crop, dog, or man."
   messageG[9]="IX. Besitz: Was dein ist, soll auch dein bleiben, sei es Getreide, Hund oder Mann.";
   messageE[10]="X. Responsibility: In all things you are bound to your word and duty. The origin of success is effort and determination."
   messageG[10]="X. Verantwortung: Deine Taten hängen dir nach. Nur du bist ihr Ursprung.";
   
	messageE1={}; --the inscription arrays (english/german)
    messageG1={};
	messageE1[0]="This monument shows young Queen Rosaline. A register of the rulers of Cadomyr is engraved upon a brass plate at the bottom of the pedestal."
	messageG1[0]="Dieses Monument zeigt die junge Königin Rosaline. Eine Auflistung der Herrscher von Cadomyr ist auf einer Messingtafel am Sockel den Monuments zu lesen.";
	messageE1[1]="1. Sir Edward - 16 BS"
	messageG1[1]="1. König Edward - 16 BS";
	messageE1[2]="2. Sir Reginald - 0 AS"
	messageG1[2]="2. König Reginald - 0 AS";
    messageE1[3]="3. Queen Rosaline Edwards - 22 AS"
	messageG1[3]="3. Königin Rosaline Edwards - 22 AS";

   
   InitDone=true; --Script wants to read all that crap only once
end

function LookAtItem(User,Item)
    Init();
    queststatus=User:getQuestProgress(110); --This queststatus counts the read laws

   	if Item.pos == position (125,566,0) then --Sir Reginald's statue
   
       	if messageG[queststatus] ~= nil and messageE[queststatus] ~= nil then
           	base.common.InformNLS(User,messageG[queststatus],messageE[queststatus]); --sending the text
       	else
          	base.common.InformNLS(User,"[Fehler] Fehler im Queststatus 110, bitte einem Entwickler melden!","[Error] Error in queststatus 110, please report to a developer!"); --sending the message
    	end
   
        	if queststatus<10 then 
           		User:setQuestProgress(110,queststatus+1); --the player read a text
       		else
        		User:setQuestProgress(110,0); --start from the beginning
         		if User:getQuestProgress(111)==1 then --change when quest is ready!
              		User:setQuestProgress(111,2); --the player read all laws
              		base.common.InformNLS(User,"[Queststatus] Du hast nun alle Gesetze Cadomyrs gelesen.","[Quest progress] You read all the Cadomyrian customs."); --sending the message
         		end
      		end   
    else
    
	queststatus=User:getQuestProgress(610); --This queststatus counts the read rulers  
    if Item.pos == position (118,566,0) then --Queen Rosaline's statue
   
       	if messageG1[queststatus] ~= nil and messageE1[queststatus] ~= nil then
           	base.common.InformNLS(User,messageG1[queststatus],messageE1[queststatus]); --sending the text
       	else
          	base.common.InformNLS(User,"[Fehler] Fehler im Queststatus 110, bitte einem Entwickler melden!","[Error] Error in queststatus 110, please report to a developer!"); --sending the message
    	end
   
        	if queststatus<3 then 
           		User:setQuestProgress(610,queststatus+1); --the player read a text
       		else
        		User:setQuestProgress(610,0); --start from the beginning
				--envi wants to do a quest with the stuff below.
				--[[
         		if User:getQuestProgress(611)==0 then --change when quest is ready!
              		User:setQuestProgress(611,1); --the player read all laws
              		base.common.InformNLS(User,"[Queststatus] Du hast nun alle Herrscher Cadomyrs gelesen.","[Quest progress] You read all the Cadomyrian rulers."); --sending the message
         		end
				]]
      		end   
    else
	       --[[base.common.InformNLS(User,"Reiterstatue","statue of a rider"); --default ]]--
	local test = "no value";
	if (first==nil) then
        content.pillar.InitPillar()
        first=1;
    end

    -- fetching local references
    local signTextDe     = content.pillar.signTextDe;
    local signTextEn     = content.pillar.signTextEn;
    local signCoo        = content.pillar.signCoo;
    local signItemId     = content.pillar.signItemId;
    local signPerception = content.pillar.signPerception;

    found = false;
    UserPer = User:increaseAttrib("perception",0);
    tablePosition = Item.pos.x .. Item.pos.y .. Item.pos.z;
	if signCoo ~= nil then
		if (signCoo[tablePosition] ~= nil) then
			for i, signpos in pairs(signCoo[tablePosition]) do
				if equapos(Item.pos,signpos) then
					if (UserPer >= signPerception[tablePosition][i]) then
						found = true;
						world:itemInform(User,Item,base.common.GetNLS(User,string.gsub(signTextDe[tablePosition][i],"currentChar",User.name),string.gsub(signTextEn[tablePosition][i],"currentChar",User.name)));
						test = signTextDe[tablePosition][i];
					else
                        found = true;
						world:itemInform(User,Item,base.common.GetNLS(User,"~Du erkennst, dass hier etwas ist, kannst es aber nicht entziffern, da du zu blind bist.~","~You recognise something, but you cannot read it, because you are too blind.~"));
					end
				end
			end
		end
	end

	--[[local outText = checkNoobiaSigns(User,Item.pos);
	if outText and not found then
		world:itemInform(User,Item,outText);
		found = true;
	end ]]

	if not found then
        world:itemInform(User,Item,world:getItemName(Item.id,User:getPlayerLanguage()));
    end
    --[[if not found then
        val = ((Item.pos.x + Item.pos.y + Item.pos.z) % table.getn(PillarListGerman))+1;
        world:itemInform( User, Item, base.common.GetNLS(User, PillarListGerman[val], PillarListEnglish[val]) );
	end]]-- 

--		User:inform("in LookAtItem of base_wegweiser.lua");
		--User:inform(test);
	
	end
	end
	
	-------------------------------- ENDURANCE CAVE QUEST LOOKAT -----------------------------------------
	if Item.pos == position (7,11,-15) then
		local language = User:getPlayerLanguage();
		
	
		local stage = User:getQuestProgress(204);
		local lang = User:getPlayerLanguage(); --returns 0 for german, 1=english
	
		if stage >= 9 then 
			if language == 1 then
			User:inform("This time the woman leers at you with madness in her bloodshot eyes. Her hair has turned to crimson flames.");
			else
			User:inform("Die Frau sieht dich diesmal mit stechendem irren Blick an, ihre Augen blutunterlaufen. Ihr Haar zu roten Flammen gewandelt."); 
			return;
			end
		end
	
		User:inform(quest.enduranceCave.StatusInfo[stage][lang]); -- send an crypted inform about current
										    --stage to the player
	end
	-------------------------------- ENDURANCE CAVE QUEST LOOKAT DONE -----------------------------------------
end

function UseItem(User, SourceItem, TargetItem, Counter, Param, ltstate)

    LookAtItem(User,SourceItem);

end

--Dude, you cannot - must not have two UseItem functions in one script. This CANNOT work! ~Estralis

--[[
--copyed from id_272_statue.lua; locations are all in gobaith
function UseItem( User, Item, TargetItem, counter, param )
    lang=User:getPlayerLanguage();
    if equapos(Item.pos,position(-28, 192, -9)) then
        if ( not base.common.isItemIdInFieldStack( 35, position(-29, 195, -9) ) ) then
            if lang==0 then
                User:inform("Während du vorsichtig die Statue abtastest öffnet sich plötzlich eine Luke in der Decke und eine hölzerne Leiter führt herab.");
            else
                User:inform("While you carefully feel the statue, suddenly a hatch in the ceiling opens and a wooden ladder slides down.");
            end
            world:createItemFromId( 35, 1, position(-29, 195, -9), true, 999,0 );
        else
            if lang==0 then
                User:inform("Nachdem du den verborgenen Schalter erneut betätigst gleitet die Leiter zurück in die Decke und die Luke schließt sich wieder.");
            else
                User:inform("After touching the hidden switch again the ladder slides back into the ceiling and the batch closes again.");
            end
            base.common.removeItemIdFromFieldStack( 35, position(-29, 195, -9) );
        end
    elseif equapos(Item.pos,position(-389,-218,2)) then
        if ((User:increaseAttrib("essence",0)+User:increaseAttrib("willpower",0)+User:increaseAttrib("intelligence",0))>29) then
            User:warp(position(102,56,52));
            if lang==0 then
                User:inform("Als du die Statue berührst verschwimmt die Welt um dich und dir wird schwummrig. Als du wieder klar siehst, bist du an einem völlig anderen Ort");
            else
                User:inform("You touch the statue and the world around you become blurred and you feel a little strange. A moment after you can see clearly again and you are on a completly other place");
            end
        end
    elseif equapos(Item.pos,position(102,55,52)) then
        User:warp(position(-389,-217,2));
        if lang==0 then
            User:inform("Als du die Statue berührst verschwimmt die Welt um dich und dir wird schwummrig. Als du wieder klar siehst, bist du an einem völlig anderen Ort");
        else
            User:inform("You touch the statue and the world around you become blurred and you feel a little strange. A moment after you can see clearly again and you are on a completly other place");
        end
    elseif equapos(Item.pos,position(-60,-229,0)) then
        for i=-69,-61 do
            posi = position(i,-227,0);
            item = world:createItemFromId(3097,1,posi,true,333,0);
            item.wear = 2;
            world:changeItem(item);
            if world:isCharacterOnField(posi) then
                item = world:createItemFromId(3101,1,posi,true,333,0);
                item.wear = 3;
                world:changeItem(item);
                Char = world:getCharacterOnField(posi);
                Char:increaseAttrib("hitpoints",-3000);
                Char:warp(i,-226,0);
            end
        end
    end            
end]]
