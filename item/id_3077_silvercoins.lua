require("base.common")

module("item.id_3077_silvercoins", package.seeall)

-- UPDATE common SET com_script='item.id_3077_silvercoins' WHERE com_itemid IN (3077);

if not InitTime then
	InitTime=true;
	TimeList = {};
end

function UseItem(User,SourceItem,TargetItem,Counter,Param)
	if ( SourceItem.number == 1 ) then  --works only with 1 coin

    	if TimeList[User.id]~=nil then
			if  ( (math.abs(world:getTime("second") - TimeList[User.id]) ) <=3) then  --1 Rl. second delay
				return;
			end
		end

		
		if math.random(2) == 1 then	gValue = "Kopf"; eValue = "head";
		else gValue = "Zahl"; eValue = "tail"; end    
		
		User:talkLanguage(CCharacter.say, CPlayer.german, "#me wirft eine Mï¿½nze in die Luft und fï¿½ngt sie wieder auf. Sie zeigt "..gValue..".");
		User:talkLanguage(CCharacter.say, CPlayer.english, "#me throws a coin in the air and catches it again. It shows "..eValue..".");
      	TimeList[User.id] = world:getTime("second");
	end
end





function MoveItemBeforeMove(User, SourceItem, TargetItem)
	ZielItem=world:getItemOnField( TargetItem.pos );
	if ( (ZielItem.id==2207) and (ZielItem.data==666) ) then
		User:talkLanguage(CCharacter.say,CPlayer.german ,"#me wirft eine handvoll Silberstï¿½cke in den Brunnen.");
	        User:talkLanguage(CCharacter.say,CPlayer.english,"#me tosses a fistful silver coins into the well.");

		EffektTyp=math.random(10);
		User:inform("moep!");
		if (TargetItem.number<5) then
		    User:inform("moep->Morgenstund hat Gold im Mund");
		elseif ( (TargetItem.number>= 5) and (TargetItem.number<10) ) then
		    User:inform("moep->Wunschattribut +1 für 1 Stunde");
		elseif ( (TargetItem.number>=10) and (TargetItem.number<20) ) then
		    if ( EffektTyp<=5 ) then
  			User:inform("moep->Wunschattribut +2 für 1 Stunde");
		    else
			User:inform("moep->Wunschattribut +1 für 1 Stunden");
            		User:inform("moep->Randomattribut +1 für 1 Stunden");
            	    end
		elseif ( (TargetItem.number>=20) and (TargetItem.number<30) ) then
		    if ( EffektTyp<=5 ) then
			User:inform("moep->Wunschattribut +2 für 2 Stunden");
		    else
			User:inform("moep->Wunschattribut +2 für 1 Stunde");
			User:inform("moep->Randomattribut +2 für 1 Stunden");
		    end
		elseif ( (TargetItem.number>=30) and (TargetItem.number<40) ) then
		    if (EffektTyp<=3) then
			User:inform("moep->Wunschattribut +3 für 1 Stunde");
		    elseif ( (EffektTyp>3) and (EffektTyp<=6) ) then
			User:inform("moep->Wunschattribut +2 für 3 Stunden");
		    else
		        User:inform("moep->Wunschattribut +2 für 2 Stunden");
                	User:inform("moep->Randomattribut +2 für 1 Stunde");
		    end
		elseif ( (TargetItem.number>=40) and (TargetItem.number<50) ) then
		    if ( EffektTyp<=3 ) then
		        User:inform("moep->Wunschattribut +3 für 2 Stunden");
		    elseif ( (EffektTyp>3) and (EffektTyp<=6) ) then
			User:inform("moep->Wunschattribut +2 für 4 Stunden");
	 	    elseif ( (EffektTyp>6) and (EffektTyp<=8) ) then
			User:inform("moep->Wunschattribut +3 für 1 Stunde");
			User:inform("moep->Randomattribut +2 für 1 Stunden");
		    else
			User:inform("moep->Wunschattribut +2 für 2 Stunden");
		        User:inform("moep->Randomattribut +2 für 2 Stunden");
		    end
 		elseif ( (TargetItem.number>=50) and (TargetItem.number<60) ) then
		    if ( EffektTyp<=2 ) then
		        User:inform("moep->Wunschattribut +3 für 3 Stunden");
		    elseif ( (EffektTyp>2) and (EffektTyp<=4) ) then
                	User:inform("moep->Wunschattribut +2 für 5 Stunden");
		    elseif ( (EffektTyp>4) and (EffektTyp<=6) ) then
		        User:inform("moep->Wunschattribut +3 für 1 Stunde");
		        User:inform("moep->Randomattribut +2 für 2 Stunden");
		    else
		        User:inform("moep->Wunschattribut +3 für 2 Stunden");
		        User:inform("moep->Randomattribut +2 für 1 Stunden");
		    end
		elseif ( (TargetItem.number>=60) and (TargetItem.number<70) ) then
		    if ( EffektTyp<=2 ) then
		        User:inform("moep->Wunschattribut +4 für 1 Stunde");
		    elseif ( (EffektTyp>2) and (EffektTyp<=4) ) then
		        User:inform("moep->Wunschattribut +3 für 4 Stunden");
		    elseif ( (EffektTyp>4) and (EffektTyp<=6) ) then
		        User:inform("moep->Wunschattribut +2 für 6 Stunden");
		    elseif ( (EffektTyp>6) and (EffektTyp<=8) ) then
		        User:inform("moep->Wunschattribut +3 für 1 Stunde");
		        User:inform("moep->Randomattribut +3 für 1 Stunde");
		    else
		        User:inform("moep->Wunschattribut +3 für 2 Stunden");
		        User:inform("moep->Randomattribut +2 für 2 Stunden");
		    end
		elseif ( (TargetItem.number>=70) and (TargetItem.number<80) ) then
		    if ( EffektTyp<=2 ) then
		        User:inform("moep->Wunschattribut +4 für 2 Stunden");
		    elseif ( (EffektTyp>2) and (EffektTyp<=4) ) then
		        User:inform("moep->Wunschattribut +3 für 5 Stunden");
		    elseif ( (EffektTyp>4) and (EffektTyp<=6) ) then
		        User:inform("moep->Wunschattribut +2 für 7 Stunden");
		    elseif ( (EffektTyp>6) and (EffektTyp<=8) ) then
                	User:inform("moep->Wunschattribut +3 für 2 Stunden");
		        User:inform("moep->Randomattribut +3 für 1 Stunde");
		    else
		        User:inform("moep->Wunschattribut +3 für 3 Stunden");
		        User:inform("moep->Randomattribut +2 für 2 Stunden");
		    end
		elseif ( (TargetItem.number>=80) and (TargetItem.number<90) ) then
		    if ( EffektTyp<=2 ) then
		        User:inform("moep->Wunschattribut +4 für 3 Stunden");
		    elseif ( (EffektTyp>2) and (EffektTyp<=4) ) then
		        User:inform("moep->Wunschattribut +3 für 6 Stunden");
		    elseif ( (EffektTyp>4) and (EffektTyp<=6) ) then
		        User:inform("moep->Wunschattribut +2 für 8 Stunden");
		    elseif ( (EffektTyp>6) and (EffektTyp<=8) ) then
		        User:inform("moep->Wunschattribut +3 für 2 Stunde");
		        User:inform("moep->Randomattribut +3 für 2 Stunden");
		    else
		        User:inform("moep->Wunschattribut +4 für 1 Stunden");
		        User:inform("moep->Randomattribut +2 für 2 Stunden");
		    end
		elseif ( (TargetItem.number>=90) and (TargetItem.number<100) ) then
		    EffektTyp=math.random(12);
		    if ( EffektTyp<=2 ) then
		        User:inform("moep->Wunschattribut +5 für 1 Stunde");
			elseif ( (EffektTyp>2) and (EffektTyp<=4) ) then
			    User:inform("moep->Wunschattribut +4 für 4 Stunden");
			elseif ( (EffektTyp>4) and (EffektTyp<=6) ) then
			    User:inform("moep->Wunschattribut +3 für 7 Stunden");
			elseif ( (EffektTyp>6) and (EffektTyp<=8) ) then
			    User:inform("moep->Wunschattribut +2 für 9 Stunden");
			elseif ( (EffektTyp>8) and (EffektTyp<=10) ) then
			    User:inform("moep->Wunschattribut +3 für 3 Stunden");
			    User:inform("moep->Randomattribut +3 für 2 Stunden");
			else
			    User:inform("moep->Wunschattribut +4 für 2 Stunden");
			    User:inform("moep->Randomattribut +2 für 2 Stunden");
			end
		else
		    EffektTyp=math.random(12);
		    if ( EffektTyp<=2 ) then
		        User:inform("moep->Wunschattribut +5 für 2 Stunden");
			elseif ( (EffektTyp>2) and (EffektTyp<=4) ) then
			    User:inform("moep->Wunschattribut +4 für 5 Stunden");
			elseif ( (EffektTyp>4) and (EffektTyp<=6) ) then
			    User:inform("moep->Wunschattribut +3 für 8 Stunden");
			elseif ( (EffektTyp>6) and (EffektTyp<=8) ) then
			    User:inform("moep->Wunschattribut +2 für 10 Stunden");
			elseif ( (EffektTyp>8) and (EffektTyp<=10) ) then
			    User:inform("moep->Wunschattribut +4 für 1 Stunde");
			    User:inform("moep->Randomattribut +3 für 2 Stunden");
			else
			    User:inform("moep->Wunschattribut +4 für 3 Stunden");
			    User:inform("moep->Randomattribut +2 für 2 Stunden");
			end
		end
	end
	return true;
end


function findText ()
	i={};
	number=math.random(i);
    if (number==1) then
		deutsch="Morgenstund hat Gold im Mund";
		englisch="";
	elseif (number==2) then
	    deutsch="Ja.";
	    englisch="Yes.";
	elseif (number==3) then
	    deutsch="Nein.";
	    englisch="No.";
	elseif (number==4) then
	    deutsch="Vielleicht.";
	    englisch="Maybe.";
	elseif (number==5) then
	    deutsch="Lass es sein.";
	    englisch="Let it be.";
	elseif (number==6) then
	    deutsch="Denk noch einmal darï¿½ber nach";
	    englisch="Think about.";
	elseif (number==7) then
	    deutsch="Triff deine Entscheidung bald, sonst wird sie für dich getroffen.";
	    englisch="";
	else
	    deutsch="Wer wagt gewinnt!";
	    englisch="";
	end
	
	CharsInRange = world:getPlayersInRangeOf(TargetItem.Pos,10);
    for i, Chara in pairs(CharsInRange) do
    	if (Chara:getPlayerLanguage() == 0) then
        	Chara:inform("..deutsch..");
        else
            Chara:inform("..englisch..");
        end
    end
    

end
