--   *****************************************************
--   *  Teleporter for newbies who want to become mages  *
--   *****************************************************

module("triggerfields.newbie_mage", package.seeall)

function MoveToField(Newbie)
    Newbie:createItem(3076,250,333,0); --copper
    Newbie:createItem(34,1,333,0); -- hose
    Newbie:createItem(194,1,333,0); -- hemd
    Newbie:createItem(97,1,333,0); -- rucksack
    Newbie:increaseSkill(4,"library research",18);
    world:gfx(41,Newbie.pos);
    Newbie:warp(position(-100,-100,0));
end