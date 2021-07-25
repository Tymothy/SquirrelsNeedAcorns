/// @description Insert description here
// You can write your code in this editor
//Get high score from last session, if it exists.  Otherwise use 0.
ini_open("savedata.ini");
show_debug_message("Opening ini file");
global.highscore = ini_read_real("stats", "highscore", 0);
global.money = ini_read_real("stats", "money", 0);
global.highscore_rGameIce1 = ini_read_real("stats", "rGameIce1", 0);

ini_close();