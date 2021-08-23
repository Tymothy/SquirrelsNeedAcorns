/// @desc Insert description here
//Variables changed often
global.versionText = "Squirrels Need Acorns - Alpha Version 0.6.0";
global.debug = false; //Controls all the debugging.  Set to false before exporting
global.playerName = ""; //Used for the highscores

//Declare Global Variables
global.cam = view_camera[0];
global.view_w_half = camera_get_view_width(global.cam) * 0.5;
global.view_h_half = camera_get_view_height(global.cam) * 0.5;
global.points = 0;
global.final = 0;
global.highscore = 0;
global.money = 0;
global.pause = 0;

global.touchEnabled = true;
global.virtualKeyboardOn = false;

global.defaultWidth = 640; //Default 640
global.defaultHeight = 360; //Default 360
global.tileSize = 16;
global.goalAspect = global.defaultWidth / global.defaultHeight;
global.GUIZoom = 2; //Higher number, smaller UI
global.aspect = browser_width / browser_height;
global.GUIww = 0;
global.GUIhh = 0;
countDown = 1;  //Count down for the inital splash screen in first room

//Orientation
enum ORIENTATION{
	LANDSCAPE,
	PORTRAIT
}
global.resolutionChanged = false;
global.resolutionReset = false;
global.orientation = ORIENTATION.LANDSCAPE;

global.lastGameRoom = 0;

//Declare Player Cosmetics
global.playerCharacter = sPlayer;
global.playerTopper = s_topper_spacehelmet;
global.playerShirt = s_shirt_red;
global.playerBelt = s_belt_red;
global.playerRocket = s_rocket_blue;
global.playerPropelStart = s_propel_red_start;
global.playerPropelRunning = s_propel_red_running;

//Save File
global.saveFile = "savedata.ini";

//Options
global.musicToggle = 1;

//Game Modes
global.gameOptions =
{
	timed : false,
	fuelUse : false,
	damage : false,
	scoring : true,
}
global.gameMode = 0;
global.gameModeString = "Challenge";

#region Level Struct Declarations
global.level1 =
{
	roomName : rGameIce1,
	levelName : "Ice - Easy",
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0],
	difficulty : 1,
}
global.level2 =
{
	roomName : rGameIce2,
	levelName : "Ice - Medium",
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0],
	difficulty : 3,
}
global.level3 =
{
	roomName : rGameIce3,
	levelName : "Ice - Hard",
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0],
	difficulty : 5,
}
//Level Selection - Contains all levels in game, in order
global.levelSelectArray[0] = global.level1;
global.levelSelectArray[1] = global.level2;
global.levelSelectArray[2] = global.level3;

global.selectedLevel = 0;
#endregion

/*
0 = Challenge
1 = Zen
2 = Practice
*/

		

//Get high score from last session, if it exists.  Otherwise use 0.
//ini_open("savedata.ini");
//show_debug_message("Opening ini file");
//global.highscore = ini_read_real("stats", "highscore", 0);
//global.money = ini_read_real("stats", "money", 0);
//global.highscore_rGameIce1 = ini_read_real("stats", "rGameIce1", 0);

//ini_close();