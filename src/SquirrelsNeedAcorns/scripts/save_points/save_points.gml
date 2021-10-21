/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function save_points(_points){
	show_debug_message("Writing points to save file");
	ini_write_real(string(global.gameModeString), global.levelSelectArray[global.selectedLevel].saveNum, _points);
	global.levelSelectArray[global.selectedLevel].highScore[global.gameMode] = _points;
}