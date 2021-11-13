/// @desc Generate global variables
#macro live_enabled 1 //Turn to 0 to turn off for exporting, 1 to use
#macro database_send false //Use false to not send runs to server, export with true

//Variables changed often
global.versionText = "Squirrels Need Acorns - Alpha Version 0.7.0";
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
	damage : true,
	scoring : true,
}
global.gameMode = 0;
global.gameModeString = "Challenge";

#region Level Struct Declarations
enum LEVELTYPE {
	MOUNTAINS,
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
	roomName : rGame101,
	world : 0,
	levelName : "01 - Beginning",
	levelType : LEVELTYPE.MOUNTAINS,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0], //Gamemode, points, time
	difficulty : 1,
	timed : 0, //0 is no time limit
	goalType : GOALTYPE.GOAL,
	availablePoints : 0, //How many points available in the level
	compLev1 : 15, //Points to get 1st level
	compLev2 : 10, //Points to get 2nd level
	compLev3 : 6.17, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0, //How many acorns to present on level select screen
}

global.level_Slope =
{
	saveNum : 102, 
	roomName : rGame102,
	world : 0,
	levelName : "02 - Slope",
	levelType : LEVELTYPE.MOUNTAINS,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 2,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	availablePoints : 0,
	compLev1 : 1, //Points to get 1st level
	compLev2 : 8, //Points to get 2nd level
	compLev3 : 11.22, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}

global.level_Bend =
{
	saveNum : 103, 
	roomName : rGame103,
	world : 0,
	levelName : "03 - Bend",
	levelType : LEVELTYPE.MOUNTAINS,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 3,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	availablePoints : 0,
	compLev1 : 1, //Points to get 1st level
	compLev2 : 10, //Points to get 2nd level
	compLev3 : 17.20, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}
global.level_Boom =
{
	saveNum : 104, 
	roomName : rGame104,
	world : 0,
	levelName : "04 - Boom",
	levelType : LEVELTYPE.MOUNTAINS,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	availablePoints : 0,
	compLev1 : 1, //Points to get 1st level
	compLev2 : 11, //Points to get 2nd level
	compLev3 : 16.23, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}

global.level_Open =
{
	saveNum : 105, 
	roomName : rGame105,
	world : 0,
	levelName : "05 - Open",
	levelType : LEVELTYPE.MOUNTAINS,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 60,
	goalType : GOALTYPE.COLLECT,
	availablePoints : 0,
	compLev1 : 20, //Points to get 1st level
	compLev2 : 45, //Points to get 2nd level
	compLev3 : 70, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}

global.level_Gaps =
{
	saveNum : 106, 
	roomName : rGame106,
	world : 0,
	levelName : "06 - Gaps",
	levelType : LEVELTYPE.MOUNTAINS,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	availablePoints : 0,
	compLev1 : 1, //Points to get 1st level
	compLev2 : 7, //Points to get 2nd level
	compLev3 : 21.67, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}

global.level_Rebound =
{
	saveNum : 107, 
	roomName : rGame107,
	world : 0,
	levelName : "07 - Rebound",
	levelType : LEVELTYPE.MOUNTAINS,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	availablePoints : 0,
	compLev1 : 1, //Points to get 1st level
	compLev2 : 9, //Points to get 2nd level
	compLev3 : 26.77, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}

global.level_Redirection =
{
	saveNum : 108, 
	roomName : rGame108,
	world : 0,
	levelName : "08 - Redirection",
	levelType : LEVELTYPE.MOUNTAINS,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	availablePoints : 0,
	compLev1 : 1, //Points to get 1st level
	compLev2 : 4, //Points to get 2nd level
	compLev3 : 13.10, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}

global.level_Precision =
{
	saveNum : 109, 
	roomName : rGame109,
	world : 0,
	levelName : "09 - Precision",
	levelType : LEVELTYPE.MOUNTAINS,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	availablePoints : 0,
	compLev1 : 1, //Points to get 1st level
	compLev2 : 11, //Points to get 2nd level
	compLev3 : 29.07, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}

global.level_Choices =
{
	saveNum : 110, 
	roomName : rGame110,
	world : 0,
	levelName : "10 - Choices",
	levelType : LEVELTYPE.MOUNTAINS,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 60,
	goalType : GOALTYPE.COLLECT,
	availablePoints : 0,
	compLev1 : 25, //Points to get 1st level
	compLev2 : 50, //Points to get 2nd level
	compLev3 : 75, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}

//Water Levels
global.level_Bounce =
{
	saveNum : 201, 
	roomName : rGame201,
	world : 1,
	levelName : "11 - Bounce",
	levelType : LEVELTYPE.WATER,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	availablePoints : 0,
	compLev1 : 1, //Points to get 1st level
	compLev2 : 6, //Points to get 2nd level
	compLev3 : 16.23, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}

global.level_Turning =
{
	saveNum : 202, 
	roomName : rGame202,
	world : 1,
	levelName : "12 - Turning",
	levelType : LEVELTYPE.WATER,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	availablePoints : 0,
	compLev1 : 1, //Points to get 1st level
	compLev2 : 9, //Points to get 2nd level
	compLev3 : 32.17, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}

global.level_Cracks =
{
	saveNum : 203, 
	roomName : rGame203,
	world : 1,
	levelName : "13 - Cracks",
	levelType : LEVELTYPE.WATER,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	availablePoints : 0,
	compLev1 : 1, //Points to get 1st level
	compLev2 : 9, //Points to get 2nd level
	compLev3 : 20.45, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}

global.level_Spiral =
{
	saveNum : 204, 
	roomName : rGame204,
	world : 1,
	levelName : "14 - Spiral",
	levelType : LEVELTYPE.WATER,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	availablePoints : 0,
	compLev1 : 1, //Points to get 1st level
	compLev2 : 9, //Points to get 2nd level
	compLev3 : 20.45, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}

global.level_Caverns =
{
	saveNum : 205, 
	roomName : rGame205,
	world : 1,
	levelName : "15 - Caverns",
	levelType : LEVELTYPE.WATER,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 60,
	goalType : GOALTYPE.COLLECT,
	availablePoints : 0,
	compLev1 : 25, //Points to get 1st level
	compLev2 : 50, //Points to get 2nd level
	compLev3 : 75, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}

global.level_Up_Down =
{
	saveNum : 206, 
	roomName : rGame206,
	world : 1,
	levelName : "16 - Up and Down",
	levelType : LEVELTYPE.WATER,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	availablePoints : 0,
	compLev1 : 1, //Points to get 1st level
	compLev2 : 9, //Points to get 2nd level
	compLev3 : 20.45, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}

global.level_Loop =
{
	saveNum : 207, 
	roomName : rGame207,
	world : 1,
	levelName : "17 - Loop",
	levelType : LEVELTYPE.WATER,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	availablePoints : 0,
	compLev1 : 1, //Points to get 1st level
	compLev2 : 9, //Points to get 2nd level
	compLev3 : 20.45, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}

global.level_Back_and_Forth =
{
	saveNum : 208, 
	roomName : rGame208,
	world : 1,
	levelName : "18 - Back and Forth",
	levelType : LEVELTYPE.WATER,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	availablePoints : 0,
	compLev1 : 1, //Points to get 1st level
	compLev2 : 9, //Points to get 2nd level
	compLev3 : 20.45, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}

global.level_Conserve =
{
	saveNum : 209, 
	roomName : rGame209,
	world : 1,
	levelName : "19 - Jellyfish Hopping",
	levelType : LEVELTYPE.WATER,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 0,
	goalType : GOALTYPE.GOAL,
	availablePoints : 0,
	compLev1 : 1, //Points to get 1st level
	compLev2 : 9, //Points to get 2nd level
	compLev3 : 20.45, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}

global.level_Fuel_Lines =
{
	saveNum : 210, 
	roomName : rGame210,
	world : 1,
	levelName : "20 - Fuel Lines",
	levelType : LEVELTYPE.WATER,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 60,
	goalType : GOALTYPE.COLLECT,
	availablePoints : 0,
	compLev1 : 25, //Points to get 1st level
	compLev2 : 50, //Points to get 2nd level
	compLev3 : 75, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0, 
}

global.level_Asteroid =
{
	saveNum : 305, 
	roomName : rGame201,
	world : 2,
	levelName : "25 - Asteroid",
	levelType : LEVELTYPE.SPACE,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 60,
	goalType : GOALTYPE.COLLECT,
	availablePoints : 0,
	compLev1 : 25, //Points to get 1st level
	compLev2 : 50, //Points to get 2nd level
	compLev3 : 75, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0, 
}

global.level_Test =
{
	saveNum : 001, 
	roomName : rGameTest,
	world : 1,
	levelName : "T1 - Test",
	levelType : LEVELTYPE.WATER,
	unlocked : true,
	art : s_gameIce1,
	highScore : [0, 0, 0],
	difficulty : 5,
	timed : 10,
	goalType : GOALTYPE.COLLECT,
	availablePoints : 4,
	compLev1 : 1, //Points to get 1st level
	compLev2 : 9, //Points to get 2nd level
	compLev3 : 6.1, //Time to beat for max, acorns for GOALTYPE.COLLECT
	completionLevel : 0,
}


//Level Selection - Contains all levels in game, in order
global.levelSelectArray = 
[
//Mountains Levels
global.level_Beginning,
global.level_Slope,
global.level_Bend,
global.level_Boom,
global.level_Open,
global.level_Gaps,
global.level_Rebound,
global.level_Redirection,
global.level_Precision,
global.level_Choices, 

//Water Levels
global.level_Bounce, 
global.level_Turning,
global.level_Cracks,
global.level_Spiral,
global.level_Caverns,
global.level_Up_Down,
global.level_Loop,
global.level_Back_and_Forth,
global.level_Conserve,
global.level_Fuel_Lines,
//global.level_Test,

//Space Levels
global.level_Asteroid,
]

global.worldName[0] = "Mountains";
global.worldName[1] = "Underwater";
global.worldName[2] = "Space";

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