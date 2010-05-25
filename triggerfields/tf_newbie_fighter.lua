--   *******************************************************
--   *  Teleporter for newbies who want to become fighter  *
--   *******************************************************

module("triggerfields.newbie_fighter", package.seeall())

function MoveToField(Newbie)
    Newbie:createItem(3076,150,333,0); --copper
    Newbie:createItem(34,1,333,0); -- trousers
    Newbie:createItem(194,1,333,0); -- shirt
    Newbie:createItem(324,1,333,0); -- chain helmet
    Newbie:createItem(230,1,333,0); -- mace
    Newbie:createItem(17,1,333,0); -- wooden shield
    Newbie:createItem(97,1,333,0); -- bag
    world:gfx(41,Newbie.pos);
    Newbie:warp(position(-100,-100,0));
end