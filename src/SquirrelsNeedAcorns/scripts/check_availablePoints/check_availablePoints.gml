/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function check_availablePoints(_availablePoints){
	show_debug_message("Checking available points.");	
	
	if(_availablePoints != global.availablePoints) 
	{
		show_debug_message("Points need updated.");		
		return true; 

	}
	else 
	{
		show_debug_message("Available points are accurate");		
		return false; 

	}
		
}