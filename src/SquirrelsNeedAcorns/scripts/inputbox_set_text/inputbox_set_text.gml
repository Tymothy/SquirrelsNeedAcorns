/// @description inputbox_set_text(id, str)
/// @param id
/// @param  str
function inputbox_set_text(argument0, argument1) {

	    argument0.Text = argument1;
    
	    //push to history stack
	    ds_stack_push(argument0.History0, argument0.Text);
	    ds_stack_clear(argument0.History1);



}
