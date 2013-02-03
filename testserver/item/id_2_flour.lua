-- UPDATE common SET com_script='item.id_2_flour' WHERE com_itemid IN (2);
require("server.login")
require("base.factions")
module("item.id_2_flour", package.seeall)

if isTestserver() then

require("test.martin")

function UseItem(User, SourceItem, ltstate)
	if User.name=="Ciryon" then
	User:inform("drin")
		players=world:getPlayersOnline();
		
		for k, gemRecipient in ipairs(players) do
		User:inform("drin: "..gemRecipient.name)
			local town = base.factions.getMembershipByName(gemRecipient)
			User:inform("drin: "..town)
			server.login.PayOutWage(gemRecipient,town)
			User:inform("draussen")
		end
	end

	return;
end

end
