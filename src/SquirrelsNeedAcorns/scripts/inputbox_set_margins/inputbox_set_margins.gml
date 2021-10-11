/// @description inputbox_set_margins(id, xmargin, ymargin)
/// @param id
/// @param  xmargin
/// @param  ymargin
function inputbox_set_margins(argument0, argument1, argument2) {

	    argument0.OffsetX = argument1;
	    argument0.OffsetY = argument2;
    
	    //update surface
	    surface_free(argument0.Surface);
	    argument0.Surface = surface_create(argument0.Width-(argument0.OffsetX*2), argument0.Height-(argument0.OffsetY*2));



}
