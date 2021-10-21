/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function save_time(_time){
		show_debug_message("Writing time to save file");
		ini_write_real("Time", global.levelSelectArray[global.selectedLevel].saveNum, _time);
		global.levelSelectArray[global.selectedLevel].highScore[2] = _time;		
}