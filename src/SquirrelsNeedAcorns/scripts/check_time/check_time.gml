/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function check_time(_savedTime){
	show_debug_message("Checking to see if best time was beaten.")
	if(_savedTime >= global.time && global.points >= global.availablePoints)
	{
		show_debug_message("Time was beaten!");
		return true;

	}
	else
	{
		show_debug_message("Time was not beaten or not all points scored.");		
		return false;	
	}
}