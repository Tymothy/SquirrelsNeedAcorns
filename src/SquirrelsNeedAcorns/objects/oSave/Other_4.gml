/// @description Insert description here
// You can write your code in this editor
if(room == rLevelSelect)
{
	ini_open(global.saveFile);
	show_debug_message("Loading saved level");
	load_level();
	ini_close();
}