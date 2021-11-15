/// @description Load info from save files
ini_open(global.saveFile);
load_info();
load_highscore();
load_level();
ini_close();