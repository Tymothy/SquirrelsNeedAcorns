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
	ini_write_real("Info", "Username", global.playerName);
	ini_close();
}

function load_info(){
	ini_open(global.saveFile);
	global.playerName = ini_read_real("Info", "Username", "");
	ini_close();
}