/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function save_availablePoints(_availablePoints){

	show_debug_message("Updating available points");
	ini_write_real("AvailablePoints", global.levelSelectArray[global.selectedLevel].saveNum, global.availablePoints);
	global.levelSelectArray[global.selectedLevel].availablePoints = global.availablePoints;


}