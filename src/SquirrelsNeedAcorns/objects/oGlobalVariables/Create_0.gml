/// @desc Generate global variables
#macro live_enabled 1 //Turn to 0 to turn off for exporting, 1 to use
#macro database_send false //Use false to not send runs to server, export with true

//Variables changed often
global.versionText = "Squirrels Need Acorns - Alpha Version 0.6.3";
global.debug = false; //Controls all the debugging.  Set to false before exporting
global.playerName = ""; //Used for the highscores
global.musicToggle = 0; //Set to 1 to export with sound on by default.  Set to 0 for no sound on game on.
global.testRoom = ""; //Put a room to immediately go to that room for testing.  Export with ""
global.displayCountUp = true;

//Declare Global Variables
global.cam = view_camera[0];
global.view_w_half = camera_get_view_width(global.cam) * 0.5;
global.view_h_half = camera_get_view_height(global.cam) * 0.5;
global.points = 0;
global.availablePoints = 0;
global.time = 0;
global.goalReached = false;

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
enum LEVELTYPE {
	FOREST,
	SPACE,
	WATER
}

enum GOALTYPE { //Each goal type can also be timed/untimed
	COLLECT, // Collect X points to proceed
	GOAL, // Reach the goal with limited fuel
	RESCUE, // Rescue an animal
	
}

global.level_Beginning =
{
	saveNum : 101, //Save num, first number used for world, last two used for levels
	roomName : rGameForest01,
	world : 0,
	levelName : "F01 - Beginning",
	levelType : LEVELTYPE.FOREST,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0], //Gamemode, points, time
	difficulty : 1,
	timed : 0, //0 is no time limit
	goalType : GOALTYPE.GOAL,
	pointReq : 0, //How many points required to pass
	completionLevel : 0, //How many acorns to present on level select screen
}

global.level_Slope =
{
	saveNum : 102, 
	roomName : rGameForest02,
	world : 0,
	levelName : "F02 - Slope",
	levelType : LEVELTYPE.FOREST,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 2,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	pointReq : 0,
	completionLevel : 0,
}

global.level_Bend =
{
	saveNum : 103, 
	roomName : rGameForest03,
	world : 0,
	levelName : "F03 - Bend",
	levelType : LEVELTYPE.FOREST,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 3,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	pointReq : 0,
	completionLevel : 0,
}
global.level_Boom =
{
	saveNum : 104, 
	roomName : rGameForest04,
	world : 0,
	levelName : "F04 - Boom",
	levelType : LEVELTYPE.FOREST,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	pointReq : 0,
	completionLevel : 0,
}

global.level_Open =
{
	saveNum : 105, 
	roomName : rGameForest05,
	world : 0,
	levelName : "F05 - Open",
	levelType : LEVELTYPE.FOREST,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 60,
	goalType : GOALTYPE.COLLECT,
	pointReq : 0,
	completionLevel : 0,
}

global.level_Gaps =
{
	saveNum : 106, 
	roomName : rGameForest06,
	world : 0,
	levelName : "F05 - Gaps",
	levelType : LEVELTYPE.FOREST,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	pointReq : 0,
	completionLevel : 0,
}



//Water Levels
global.level_Bounce =
{
	saveNum : 201, 
	roomName : rGameWater1,
	world : 1,
	levelName : "W01 - Bounce",
	levelType : LEVELTYPE.WATER,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	pointReq : 0,
	completionLevel : 0,
}

global.level_Turning =
{
	saveNum : 202, 
	roomName : rGameWater2,
	world : 1,
	levelName : "W02 - Turning",
	levelType : LEVELTYPE.WATER,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	pointReq : 0,
	completionLevel : 0,
}

global.level_Conserve =
{
	saveNum : 203, 
	roomName : rGameWater3,
	world : 1,
	levelName : "W03 - Conserve",
	levelType : LEVELTYPE.WATER,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	pointReq : 0,
	completionLevel : 0,
}

global.level_Test =
{
	saveNum : 204, 
	roomName : rGameTest,
	world : 1,
	levelName : "T01 - Test",
	levelType : LEVELTYPE.WATER,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 10,
	goalType : GOALTYPE.COLLECT,
	pointReq : 4,
	completionLevel : 0,
}


//Level Selection - Contains all levels in game, in order
//global.levelSelectArray[0] = global.level_Beginning;
//global.levelSelectArray[1] = global.level_Slope;
//global.levelSelectArray[2] = global.level_Bend;
//global.levelSelectArray[3] = global.level_Boom;
//global.levelSelectArray[3] = global.level_Open;
//global.levelSelectArray[4] = global.level_Gaps;
//global.levelSelectArray[5] = global.level_Bounce;
//global.levelSelectArray[6] = global.level_Turning;
//global.levelSelectArray[7] = global.level_Conserve;
//global.levelSelectArray[8] = global.level_Test;

global.levelSelectArray = 
[
global.level_Beginning,
global.level_Slope,
global.level_Bend,
global.level_Boom,
global.level_Open,
global.level_Gaps,
global.level_Bounce,
global.level_Turning,
global.level_Conserve,
global.level_Test,
]

global.worldName[0] = "Forest";
global.worldName[1] = "Underwater";
//global.worldName[2

global.selectedLevel = 0;
global.selectedWorld = 0;
global.topWorld = array_length(global.worldName) - 1;


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