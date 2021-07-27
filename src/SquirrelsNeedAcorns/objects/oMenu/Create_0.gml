menuFont = fEthno18;
button_h = font_get_size(menuFont)*2.3;
ableToSelect = true;
touchSelect = false;

//High score variables
rGameIce1Score = 0;

switch(global.gameMode)
	{
		case 0:	
			gameModeString = "Challenge";
			set_game_mode(global.gameMode);
			break;
	
		case 1:
			gameModeString = "Zen";
			set_game_mode(global.gameMode);
			break;
	
		case 2:
			gameModeString = "Practice";
			set_game_mode(global.gameMode);
			break;
	}

//Buttons
//Change this to a switch statement
if(room == rMainMenu)
{
//button_h = 80;
button[0] = "Play";
button[1] = "How to Play";
button[2] = "High Scores";
button[3] = "Options";
}

if(room == rHowTo || room == rHighscore)
{
//button_h = 80;
button[0] = "Return to\nMain Menu";
//button[1] = "Main Menu";
//button[2] = "Options";
//button[3] = "Exit";
}

if(room == rLevelSelect)
{
//button_h = 80;
button[0] = "Ice Asteroid";
//button[1] = "Classic";
button[1] = "Main Menu";
//button[3] = "Exit";
}

if(room == rEndRun)
{
//button_h = 80;
button[0] = "Run Again";
button[1] = "Level Select";
button[2] = "Main Menu";
//button[3] = "Exit";
}

if(room == rOptions)
{
	
	musicString = "On";

	if (global.musicToggle == false)
	{
		musicString = "Off";
	}
//button_h = 80;
button[0] = "Back to Main Menu";
//button[1] = "Classic";
button[1] = "Music: " + string(musicString);
button[2] = "Mode: " + string(gameModeString);
}

buttons = array_length(button);

menu_index = 0;
last_selected = 0;
/*
//Move below to "How to Play"
pButtonX = oScaling.width - oScaling.width/5
pButtonY = oScaling.height - oScaling.height/3
pButtonHeight = 25;
pButton[0] = "The goal is to collect as many";
pButton[1] = "acorns as you can in 60 seconds.";
pButton[2] = "";
pButton[3] = "Be mindful of your fuel and";
pButton[4] = "hitting the walls too hard.";
pButton[5] = "";
pButton[6] = "M to toggle music.";
pButtons = array_length(pButton);
*/

	//draw_text(global.view_w_half,global.view_h_half+150,string("The goal is to collect as many"));
	//draw_text(global.view_w_half,global.view_h_half+180,string("acorns as you can in 60 seconds."));
	//draw_text(global.view_w_half,global.view_h_half+230,string("Be mindful of your fuel and"));
	//draw_text(global.view_w_half,global.view_h_half+260,string("hitting the walls too hard."));
	//draw_text(global.view_w_half,global.view_h_half+310,string("M to toggle music."));