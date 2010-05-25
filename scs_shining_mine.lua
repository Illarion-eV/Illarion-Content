require("base.common")


function makelight()


	a=math.random(1,8);
	b=math.random(1,8);
	c=math.random(1,8);
	d=math.random(1,8);


if (( a == 1) or (b == 1) or ( c == 1) or (d == 1)) then
	world:gfx(37,position(395,129,-13));
	world:gfx(53,position(395,129,-13));
end
if  ((a == 2) or (b == 2) or ( c == 2) or (d == 2)) then
	world:gfx(37,position(405,129,-13));
        world:gfx(53,position(405,129,-13));
end
if  ((a == 3) or (b == 3) or ( c == 3) or (d == 3)) then
	world:gfx(37,position(407,136,-13));
        world:gfx(53,position(407,136,-13));
end
if  ((a == 4) or (b == 4) or ( c == 4) or (d == 4)) then
	world:gfx(37,position(401,135,-13));
        world:gfx(53,position(401,135,-13));
end
if  ((a == 5) or (b == 5) or ( c == 5) or (d == 5)) then
	world:gfx(37,position(398,141,-13));
        world:gfx(53,position(398,141,-13));
end
if  ((a == 6) or (b == 6) or ( c == 6) or (d == 6)) then
	world:gfx(37,position(394,135,-13));
        world:gfx(53,position(394,135,-13));
end
if  ((a == 7) or (b == 7) or ( c == 7) or (d == 7)) then
	world:gfx(37,position(398,132,-13));
        world:gfx(53,position(398,132,-13));
end
if ((a == 8) or (b == 8) or ( c == 8) or (d == 8)) then
	world:gfx(37,position(405,140,-13));
        world:gfx(53,position(405,140,-13));
end



end
