require("base.common")

module("server.depot", package.seeall)

function onOpenDepot( User, Depot )
    if ( ( Depot.quality == 1111 ) and not ( Depot.data == User.id ) ) then
        base.common.InformNLS(User,
        "Ihr schafft es nicht diese Kiste zu �ffnen.",
        "You fail to open this depot.");
        return false;
    end
    return true;
end 
