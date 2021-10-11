/// @description inputbox_create(x, y, width, height, marginx, marginy, text, font)
/// @param x
/// @param  y
/// @param  width
/// @param  height
/// @param  marginx
/// @param  marginy
/// @param  text
/// @param  font
function inputbox_create(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	    i = instance_create(argument0, argument1, objInputBox);
	    i.Width = argument2;
	    i.Height = argument3;
	    i.OffsetX = argument4;
	    i.OffsetY = argument5;
	    i.Text = argument6;
	    i.Font = argument7;
    
	    //update surface
	    surface_free(i.Surface);
	    i.Surface = surface_create(i.Width-(i.OffsetX*2), i.Height-(i.OffsetY*2));
    
	    //push to history stack
	    ds_stack_push(i.History0, i.Text);
	    ds_stack_clear(i.History1);
    
	    return i;



}
