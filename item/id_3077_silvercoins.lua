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
		
		User:talkLanguage(Character.say, Player.german, "#me wirft eine Münze in die Luft und fängt sie wieder auf. Sie zeigt "..gValue..".");
		User:talkLanguage(Character.say, Player.english, "#me throws a coin in the air and catches it again. It shows "..eValue..".");
      	TimeList[User.id] = world:getTime("second");
	end
end

function MoveItemAfterMove(User, SourceItem, TargetItem)

    if TargetItem.pos == position(891,390,0) then -- donation to cherga to reduce death counter
	    getProgress = User:getQuestProgress(666)
		if getProgress == 0 then
			getProgress = 10000
		end	
		
		deathCounter = getProgress-((math.floor(getProgress/10))*10) 
		copperCoins = (SourceItem.number)*100 -- money to donate
		moneyCounter = math.floor((getProgress/10))-1000 -- money already donated to cherga, what wa snot enough to reduce death
		
		if deathCounter == 0 then -- there is no death count to be lowered, we accept any donation happily
		    world:gfx(31,position(891,390,0))
		    base.common.InformNLS(User, "Ein angenehmes Gefühl erfüllt dich, als die Gottheit deine Spende zu akzeptieren scheint.",
				                            "You get a comfortable feeling, as the divinity seems to accept your offer.")
		else
		    
			newMoney = copperCoins + moneyCounter
			base.common.InformNLS(User, ""..newMoney,
				                            ""..newMoney)
			if newMoney < 500 then -- not enough to donate yet
			    base.common.InformNLS(User, "Die Münzen verschwinden, doch dich beschleicht das Gefühl noch nicht genug gespendet zu haben. Wirf einen Blick in den Spiegel.",
				                            "The coins vansih, but you get the feeling that you may haven't sacrificed enough. Look in the mirror.")
				setMoney = 	((getProgress - (moneyCounter*10)) + (newMoney*10))						
		        User:setQuestProgress(666, setMoney)
		    else 
		        deathReducer = math.floor((newMoney/500))
				if deathReducer > deathCounter then
				    deathRedcuer = deathCounter
				end
                
				User:setQuestProgress(666, (getProgress - deathReducer)-(copperCoins*10))
				newDeathCounter = getProgress-((math.floor(getProgress/10))*10)
				
				if newDeathCounter > 0 then
				    base.common.InformNLS(User, "Als die Gottheit das Opfer annzunehmen scheint, hast Du das Gefühl, dass du ganz von der Last des Todes befreift wirst.",
				                            "As the divinity seems to accept your offer, you get the feeling, that your burden of death is easied completely.")
		        else
		            base.common.InformNLS(User, "Als die Gottheit das Opfer annzunehmen scheint, hast Du das Gefühl, dass ein Teil der Last des Todes von dir genommen wird.",
				                            "As the divinity seems to accept your offer, you get the feeling, that some of your burden of death is easied.")
		        end
		        world:gfx(31,position(891,390,0))
		    end
	    end
	    world:erase(TargetItem,1)
	end	

	return true
end