/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function save_level(){
	ini_write_real("Info", "Selected Level", global.selectedLevel);
	ini_write_real("Info", "Selected World", global.selectedWorld);
}

function load_level(){
	global.selectedLevel = ini_read_real("Info", "Selected Level", 0);
	global.selectedWorld = ini_read_real("Info", "Selected World", 0);
}