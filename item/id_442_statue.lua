--Script for reading the laws of Cadomyr
--Queststatus keeps track how many laws the user read
-- UPDATE common SET com_script='item.id_442_statue' WHERE com_itemid = 442;

--Queststatus 110: Keeps track which laws were read
--Queststatus 111: Set to 1 if all laws were read

require("base.common")

module("item.id_442_statue", package.seeall)

function Init()

    if InitDone then
        return
    end
	
    messageE={}; --the inscription arrays (english/german)
    messageG={};
	messageE[0]="This monument shows Sir Reginald Edwards, the departed king of Cadomyr and father of Queen Rosaline. The customs of Cadomyr are written on a brass plate on the pedestal."
	messageG[0]="Dieses Monument zeigt Sir Reginald Edwards, den verstorbenen König Cadomyrs und Vater von Königin Rosaline. Die Sitten Cadomyrs sind auf einer Messingtafel am Sockel den Monuments zu lesen.";
    messageE[1]="I. Faith: Worship the gods. They alone are true and almighty."
	messageG[1]="I. Glaube: Ehre die Götter. Nur sie alleine sind wahrhaftig allmächtig.";
    messageE[2]="II. Obedience: Be loyal and obedient. Your monarch represents the will of Gods."
	messageG[2]="II. Gehorsam: Sei loyal und folgsam. Dein Monarch verkörpert den Willen der Götter.";
	messageE[3]="III. Honour: Act with honour. Defending your honour is your right and duty."
	messageG[3]="III. Ehre: Handle stets ehrenhaft. Deine Ehre zu verteidigen ist dein Recht und deine Pflicht.";
	messageE[4]="IV. Lineage: Know your place. Your birth matters more than your life or death."
	messageG[4]="IV. Abstammung: Kenne deinen Platz. Deine Geburt zählt mehr als dein Leben oder dein Tod.";
	messageE[5]="V. Truth: Keep your word and give no false testimony. The strength of your words is your measure."
	messageG[5]="V. Ehrlichkeit: Halte dein Wort und gib kein falsches Zeugnis ab. Du wirst an deinen Worten gemessen.";
    messageE[6]="VI. Justice: Be fair and just. Do not thieve, offer your friendship to friend, and your sword to your enemies"
	messageG[6]="VI. Gerechtigkeit: Sei gerecht zu jedem. Stehle nicht, gib deine Freundschaft dem Freund und dein Schwert dem Feind.";
	messageE[7]="VII. Courage: Do not fear. Stand up for your monarch and honour. Never retreat, never surrender."
	messageG[7]="VII. Courage: Fürchte nicht. Stehe für deinen Monarchen und dein Ehre ein. Kein Rückzug, niemals aufgeben.";
	messageE[8]="VIII. Patriarchy: Obey your father. Obey your husband. But do not obey your son."
	messageG[8]="VIII. Patriarchat: Gehorche dem Vater. Gehorche dem Ehemann. Aber gehorche nicht dem Sohn.";
	messageE[9]="IX. Property: What is yours, remains yours. Be it crop, dog or man."
	messageG[9]="IX. Besitz: Was dein ist, soll auch dein bleiben, sei es Getreide, Hund oder Mann.";
	messageE[10]="X. Responsibility: You are bond to your deeds. Only you are their origin."
	messageG[10]="X. Verantwortung: Deine Taten hängen dir nach. Nur du bist ihr Ursprung.";
	
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
		    User:setQuestProgress(111,1); --the player read all laws
		    base.common.InformNLS(User,"Du hast nun alle Gesetze Cadomyrs gelesen.","You read all cadomyrian laws."); --sending the message
        end	
    else
		    base.common.InformNLS(User,"Du siehst eine Reiterstatue.","You see a ridder statue."); --default
    end
end

function UseItem(User, SourceItem, TargetItem, Counter, Param, ltstate)

    lookAtItem(User,SourceItem);
	
    --[[Init();
	queststatus=User:getQuestProgress(110); --This queststatus counts the read laws

	if SourceItem.pos == position (125,566,0) then --Sir Reginald's statue
	
	    if messageG[queststatus] ~= nil and messageE[queststatus] ~= nil then
	        base.common.InformNLS(User,messageG[queststatus],messageE[queststatus]); --sending the text
	    else
		    base.common.InformNLS(User,"[Fehler] Fehler im Queststatus 110, bitte einem Entwickler melden!","[Error] Error in queststatus 110, please report to a developer!"); --sending the message
        end
	
        if queststatus<10 then 
	        User:setQuestProgress(110,queststatus+1); --the player read a text
	    else
		    User:setQuestProgress(110,0); --start from the beginning
		    User:setQuestProgress(111,1); --the player read all laws
		    base.common.InformNLS(User,"Du hast nun alle Gesetze Cadomyrs gelesen.","You read all cadomyrian laws."); --sending the message
        end	
    else
		    base.common.InformNLS(User,"Du siehst eine Reiterstatue.","You see a ridder statue."); --default
    end]]
end