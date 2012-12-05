require("game_poker")
module("npc.poker", package.seeall, package.seeall(game_poker))

function npcInit(npcDealer)
    if not isInit then
        pokerTable = newPokerTable( npcDealer, 3076, 3077, 61, 462, 1, 2,{
            position(13, 8,30),
            position(13, 9,30),
            position(13,10,30),
            position(11,12,30),
            position(10,12,30),
            position( 9,12,30),
            position( 7,10,30),
            position( 7, 9,30),
            position( 7, 8,30),
            position( 9, 6,30)
        }, {
            position(12, 8,30),
            position(12, 9,30),
            position(12,10,30),
            position(11,11,30),
            position(10,11,30),
            position( 9,11,30),
            position( 8,10,30),
            position( 8, 9,30),
            position( 8, 8,30),
            position( 9, 7,30)
        }, {
            position(11, 8,30),
            position(11, 9,30),
            position(11,10,30),
            position(12,11,30),
            position(10,10,30),
            position( 8,11,30),
            position( 9,10,30),
            position( 9, 9,30),
            position( 9, 8,30),
            position( 8, 7,30)
        }, position(10,9,30), position(10,8,30), position(10,7,30), 5, "/home/vilarion/poker/pokertest.txt");
        isInit = true;
    end; 
end

function nextCycle()
    npcInit(thisNPC);
    pokerTable.nextCycle();
end

function receiveText(texttype, message, originator)
    pokerTable.receiveText(texttype, message, originator);
end

function beforeReload()
    pokerTable.beforeReload();
end
