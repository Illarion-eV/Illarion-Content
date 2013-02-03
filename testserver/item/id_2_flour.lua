-- UPDATE common SET com_script='item.id_2_flour' WHERE com_itemid IN (2);
require("server.login")
module("item.id_2_flour", package.seeall)

if isTestserver() then

require("test.martin")

function UseItem(User, SourceItem, ltstate)
	if User.name=="Ciryon" then
		players=world:getPlayersOnline();
		
		for k, gemRecipient in ipairs(players) do
			local town = base.factions.getMembershipByName(gemRecipient)
			server.login.PayOutWage(gemRecipient,town)
		end
	end

	return;
end

end
