/// @desc Insert description here
menu_x = global.view_w_half;
menu_y = global.view_h_half;

//button_h = 80;

////Buttons
//button[0] = "Run Again";
//button[1] = "Main Menu";
////button[2] = "Exit";
//buttons = array_length(button);

//menu_index = 0;
//last_selected = 0;


//Save data from run
//if (global.points > global.highscore)
//{
//	global.highscore = global.points;	
//}

ini_open("savedata.ini");
var runMoney = ini_read_real("stats", "money", 0);
global.money = global.money + runMoney;

var _checkHighscore = 0;
switch(global.lastGameRoom)
{
	case rGameIce1:
		_checkHighscore = ini_read_real("stats", rGameIce1, 0);
		show_debug_message("Checking for previous highscore");
		if(_checkHighscore < global.points) //If high score is reached, set it
			{
			ini_write_real("stats", "rGameIce1", global.points);
			show_debug_message("Writing points to save file");
			}
		break;
}
//ini_write_real("stats", "money", global.money);
ini_close();