/// @description draw_rectangle_sprite(x1, y1, width, height, spr, colour, alpha);
/// @param x1
/// @param  y1
/// @param  width
/// @param  height
/// @param  spr
/// @param  colour
/// @param  alpha
function draw_rectangle_sprite(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	    //corners
	    var partw, parth;
	    partw = sprite_get_width(argument4);
	    parth = sprite_get_height(argument4);
	    draw_sprite_ext(argument4, 0, argument0, argument1, 1, 1, 0, argument5, argument6);
	    draw_sprite_ext(argument4, 1, argument0+(argument2-partw), argument1, 1, 1, 0, argument5, argument6);
	    draw_sprite_ext(argument4, 2, argument0, argument1+(argument3-parth), 1, 1, 0, argument5, argument6);
	    draw_sprite_ext(argument4, 3, argument0+(argument2-partw), argument1+(argument3-parth), 1, 1, 0, argument5, argument6);
    
	    //body
	    var part1xsc, part1ysc, part2xsc, part2ysc;
	    part1xsc = argument2/partw;
	    part1ysc = (argument3-(parth*2))/parth;
	    part2xsc = (argument2-(partw*2))/partw;
	    part2ysc = argument3/parth;
	    draw_sprite_ext(argument4, 4, argument0, argument1+parth, part1xsc, part1ysc, 0, argument5, argument6);
	    draw_sprite_ext(argument4, 4, argument0+partw, argument1, part2xsc, part2ysc, 0, argument5, argument6);



}
