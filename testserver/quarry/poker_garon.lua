require("game_poker")
module("npc.poker_garon", package.seeall)

function npcInit(npcDealer)
    if not isInit then
        pokerTable = newPokerTable( npcDealer, 3076, 3077, 61, 462, 1, 2,{
            position(-25,-126,-6),
            position(-25,-125,-6),
            position(-25,-124,-6),
            position(-31,-124,-6),
            position(-31,-125,-6),
            position(-31,-126,-6)
        }, {
            position(-26,-126,-6),
            position(-26,-125,-6),
            position(-26,-124,-6),
            position(-30,-124,-6),
            position(-30,-125,-6),
            position(-30,-126,-6)
        }, {
            position(-27,-126,-6),
            position(-27,-125,-6),
            position(-27,-124,-6),
            position(-29,-124,-6),
            position(-29,-125,-6),
            position(-29,-126,-6)
        }, position(-28,-124,-6), position(-28,-125,-6), position(-28,-126,-6), 5, "/home/vilarion/poker/poker_garon.txt");
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
