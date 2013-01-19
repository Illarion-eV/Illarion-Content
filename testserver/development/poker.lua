require("development.game_poker")

module("development.poker", package.seeall)

newPokerTable = development.game_poker.newPokerTable

function npcInit(npcDealer)
    if not isInit then
        pokerTable = newPokerTable( npcDealer, 3076, 3077, 61, 462, 1, 2,{
            position(251, 291, -5),
            position(251, 292, -5),
            position(251, 293, -5),
            position(251, 294, -5),
            position(247, 294, -5),
            position(247, 293, -5),
            position(247, 292, -5),
            position(247, 291, -5)
        }, {
            position(250, 291, -5),
            position(250, 292, -5),
            position(250, 293, -5),
            position(250, 294, -5),
            position(248, 294, -5),
            position(248, 293, -5),
            position(248, 292, -5),
            position(248, 291, -5)
        }, position(249, 291, -5), 5, "/home/vilarion/poker/pokertest.txt");
        isInit = true;
    end; 
end

function nextCycle(npc)
    npcInit(npc);
    pokerTable.nextCycle();
end

function receiveText(npc, texttype, message, originator)
    pokerTable.receiveText(texttype, message, originator);
end

function beforeReload()
    pokerTable.beforeReload();
end
