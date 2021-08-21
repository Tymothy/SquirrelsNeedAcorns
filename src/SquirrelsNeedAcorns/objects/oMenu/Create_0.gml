if(live_call()) return live_result;
menuFont = fMenu18;
button_h = font_get_size(menuFont)*2.3;
button_w = 20;

margin = 1.15; //How far around text button should be drawn, as a multiplyer
buttonSprite = s_button_pressable;
enum LAYOUT{
	HORIZONTAL,
	VERTICAL
}
layout = LAYOUT.VERTICAL; //Vertical is standard layout
ableToSelect = true;
touchSelect = false;

debug = true;

//High score variables
rGameIce1Score = 0;

switch(global.gameMode)
	{
		case 0:	
			
			set_game_mode(global.gameMode);
			break;
	
		case 1:

			set_game_mode(global.gameMode);
			break;
	
		case 2:

			set_game_mode(global.gameMode);
			break;
	}

//Buttons
//Change this to a switch statement
#region Set buttons array with text
if(room == rMainMenu)
{
//button_h = 80;
button[0] = "Play";
button[1] = "How to Play";
//button[2] = "High Scores";
//button[2] = "Options";

	//Create button size
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
layout = LAYOUT.HORIZONTAL;
button[0] = "Previous\n Level";
button[1] = "Play";
button[2] = "Next\n Level";
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

	if (global.musicToggle == 0)
	{
		musicString = "Off";
	}
//button_h = 80;

//button[1] = "Classic";
button[0] = "Music: " + string(musicString);
button[1] = "Mode: " + string(global.gameModeString);
button[2] = "Back to Main Menu";
}

#endregion

buttons = array_length(button);

menu_index = 0;
last_selected = 0;

//Create buttons
draw_set_font(menuFont); //Required so string height and width can be accurately found
maxWidth = 0;
maxHeight = 0;

maxHeight = string_height_array(button);
maxWidth = string_width_array(button);
maxWidth = maxWidth * margin;
maxHeight = maxHeight * margin;

//Get xscale and yscale values to use in Draw GUI event
buttonXScale = maxWidth/sprite_get_width(buttonSprite);
buttonYScale = maxHeight/sprite_get_height(buttonSprite);

