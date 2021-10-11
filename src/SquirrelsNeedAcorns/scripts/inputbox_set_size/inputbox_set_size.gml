/// @description inputbox_set_size(id, width, height)
/// @param id
/// @param  width
/// @param  height
function inputbox_set_size(argument0, argument1, argument2) {

	    argument0.Width = argument1;
	    argument0.Height = argument2;
    
	    //update surface
	    surface_free(argument0.Surface);
	    argument0.Surface = surface_create(argument0.Width-(argument0.OffsetX*2), argument0.Height-(argument0.OffsetY*2));



}
