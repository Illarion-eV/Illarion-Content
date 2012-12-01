-- Schaf melken
-- Nop
-- Merung 2011: fill stock or potion into bottle
-- UPDATE common SET com_script='item.id_164_emptybottle' WHERE com_itemid IN (164);

require("base.common")
require("alchemy.base.alchemy")

module("item.id_164_emptybottle", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )

	-- alchemy
	-- infront of a cauldron?
	local cauldron = alchemy.base.alchemy.GetCauldronInfront(User)
   if cauldron then
   
        if ( ltstate == Action.abort ) then
	        base.common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
	       return
		end
			
		if (cauldron:getData("filledWith") == "water") then -- water belongs into a bucket, not a potion bottle!
	        base.common.InformNLS( User,
					"Es ist zu viel Wasser im Kessel, als dass es in die Flaschen passen würde. Ein Eimer wäre hilfreicher.",
					"There is too much water in the cauldron to bottle it. Better use a bucket.")
			return;
	    
		-- no stock, no potion, not essence brew -> nothing we could fil into the bottle
	    elseif cauldron:getData("filledWith") == "" then
	        base.common.InformNLS( User,
					"Es befindet sich nichts zum Abfüllen im Kessel.",
					"There is nothing to be bottled in the cauldron.")
			return;
	    end
		
		if (ltstate == Action.none) then
		   User:startAction(20,21,5,15,25);
		   return
		end
		
		-- stock, essence brew or potion; fill it up
	   if (cauldron:getData("filledWith") == "stock") or (cauldron:getData("filledWith") == "essenceBrew") or (cauldron:getData("filledWith") == "potion") then  
	        local reGem, reGemdust, reCauldron, reBottle = alchemy.base.alchemy.GemDustBottleCauldron(nil, nil, cauldron, nil, User)
		    if SourceItem.number > 1 then -- stack! 
			    if cauldron:getData("filledWith") == "stock" then
				    local data = {}
					data.AdrazinConcentration=cauldron:getData("AdrazinConcentration")
					data.IllidriumConcentration=cauldron:getData("IllidriumConcentration")
				    data.CaprazinConcentration=cauldron:getData("CaprazinConcentration")
					data.HyperborliumConcentration=cauldron:getData("HyperborliumConcentration")
					data.EcholonConcentration=cauldron:getData("EcholonConcentration")
					data.DracolinConcentration=cauldron:getData("DracolinConcentration")
					data.OrcanolConcentration=cauldron:getData("OrcanolConcentration")
					data.FenolinConcentration=cauldron:getData("FenolinConcentration")
					data.filledWith="stock"
					User:createItem(reBottle, 1, 0, data)
                                    													
                elseif cauldron:getData("filledWith") == "essenceBrew" then
					data = {}
					data.essenceHerb1=cauldron:getData("essenceHerb1")
					data.essenceHerb2=cauldron:getData("essenceHerb2")
					data.essenceHerb3=cauldron:getData("essenceHerb3")
					data.essenceHerb4=cauldron:getData("essenceHerb4")
					data.essenceHerb5=cauldron:getData("essenceHerb5")
					data.essenceHerb6=cauldron:getData("essenceHerb6")
					data.essenceHerb7=cauldron:getData("essenceHerb7")
					data.essenceHerb8=cauldron:getData("essenceHerb8")
					data.filledWith="essenceBrew"
					User:createItem(reBottle, 1, 0, data)
                                        
                elseif cauldron:getData("filledWith") == "potion" then
				        User:createItem(reBottle, 1, cauldron:getData("potionQuality"), { potionEffectId=cauldron:getData("potionEffectId")})
				end		              
                world:erase(SourceItem,1)
			else
			    SourceItem.id = reBottle
				alchemy.base.alchemy.CopyAllDatas(cauldron,SourceItem)
				if cauldron:getData("filledWith") == "potion" then
					SourceItem:setData("potionQuality","") -- in case it is a potion, we don't save the quality via data
					SourceItem.quality = tonumber(cauldron:getData("potionQuality"))
			    end
			    world:changeItem(SourceItem)
			end   
            alchemy.base.alchemy.RemoveAll(cauldron)    			
		end
	    world:changeItem(cauldron)
		world:makeSound(10,cauldron.pos)
	end
end