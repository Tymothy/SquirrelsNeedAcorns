/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function save_info(){

	ini_write_string("Info", "Username", global.playerName);

}

function load_info(){

	global.playerName = ini_read_string("Info", "Username", "");

}