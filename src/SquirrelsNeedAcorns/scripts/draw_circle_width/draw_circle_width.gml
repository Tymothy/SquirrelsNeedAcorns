/// @description draw_circle_width(x, y, radius, outline width, level of detail, outline align)
/// @param x
/// @param  y
/// @param  radius
/// @param  outline width
/// @param  level of detail
/// @param  outline align
function draw_circle_width(argument0, argument1, argument2, argument3, argument4, argument5) {

	    //init & assign variables
	    var xx, yy, r, lod;
	    xx = argument0;
	    yy = argument1;
	    r = argument2; 
	    lod = argument4;
	    aln = sign(argument5);
	    outr = (argument3/2);
	    of1 = outr+(outr*aln);
	    of2 = outr-(outr*aln);
        
	    //use foor loop to draw the circle
	    draw_primitive_begin(pr_trianglestrip)
	    draw_vertex(xx+lengthdir_x(r-of2, 0), yy+lengthdir_y(r-of2, 0));
	    for (i = 0; i < 360; i += 360/lod)
	    {
	        draw_vertex(xx+lengthdir_x(r+of1, i), yy+lengthdir_y(r+of1, i));
	        draw_vertex(xx+lengthdir_x(r-of2, i+360/lod), yy+lengthdir_y(r-of2, i+360/lod));
	    }
	    draw_vertex(xx+lengthdir_x(r+of1, 0), yy+lengthdir_y(r+of1, 0));
	    draw_primitive_end();



}
