/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function save_info(){
	ini_open(global.saveFile);
	ini_write_string("Info", "Username", global.playerName);
	ini_close();
}

function load_info(){
	ini_open(global.saveFile);
	global.playerName = ini_read_string("Info", "Username", "");
	ini_close();
}