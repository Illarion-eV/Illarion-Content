--   *********************************************************
--   *  Teleporter for newbies who want to become craftsmen  *
--   *********************************************************

module("triggerfield.newbie_craft", package.seeall)

function MoveToField(Newbie)
    Newbie:createItem(3076,170,333,0); --copper
    Newbie:createItem(34,1,333,0); -- hose
    Newbie:createItem(74,1,333,0); -- axt
    Newbie:createItem(180,1,333,0); -- hemd
    Newbie:createItem(97,1,333,0); -- rucksack
    Newbie:increaseSkill(2,"smithing",5);
    Newbie:increaseSkill(2,"blacksmithing",5);
    Newbie:increaseSkill(2,"smithing",5);
    Newbie:increaseSkill(2,"carpentry",5);
    world:gfx(41,Newbie.pos);
    Newbie:warp(position(-100,-100,0));
end
