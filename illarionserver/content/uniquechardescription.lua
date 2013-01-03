-- This could be maybe used for scars or stigmas - would be a good punishment for thieves imo

module("content.uniquechardescription", package.seeall)

function AddPlayerDescription(id, textde, texten)
	table.insert(PlayerDescriptionsDE[id], textde);
	table.insert(PlayerDescriptionsEN[id], texten);
end

function InitPlayerDesc()

	if(Init == nil) then
		
		PlayerDescriptionsDE = {{}};
		PlayerDescriptionsEN = {{}};
		
		--AddPlayerDescription(PlayerID, TextDE, TextEN);
	
		Init = 1;
	end
end
