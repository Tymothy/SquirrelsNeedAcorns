/// @desc Generate global variables
//Export variables
#macro live_enabled 1 //Turn to 0 to turn off for exporting, 1 to use
#macro database_send false //Use false to not send runs to server, export with true
global.musicToggle = 0; //Set to 1 to default to music on

//Variables changed often
global.versionText = "Squirrels Need Acorns - Alpha Version 0.6.1";
global.debug = false; //Controls all the debugging.  Set to false before exporting
testRoom = rGameTest; //Set to a room to go to room directly at launch.  Otherwise, use "".
countDown = 1;  //Count down for the inital splash screen in first room

#region Declare Global Variables that are not touched
global.playerName = ""; //Used for the highscores
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
global.resolutionChanged = false;
global.resolutionReset = false;
//Orientation
enum ORIENTATION{
	LANDSCAPE,
	PORTRAIT
}

global.orientation = ORIENTATION.LANDSCAPE;

global.lastGameRoom = 0;
//Save File
global.saveFile = "savedata.ini";
#endregion



#region Declare Player Cosmetics
	
	#region Define Cosmetic Structs
	
		#region Thrusters
			global.cosRocketThrustersGraySmall =
			{
				sprite : s_Rocket_Thrusters_Gray_Small,
				amount : 2,
				x1 : -8,
				y1 : 20,
				x2 : 8,
				y2 : 20
		
			}
		#endregion
		
	#endregion
	
	
	global.rocketFins = s_Rocket_Fins_Shallow_Red;
	global.rocketHull = s_Rocket_Hull_Capsule_Gray;
	global.rocketFuelTank = s_Rocket_Fuel_Tank_Dual_Green;
	global.rocketFuelLines = s_Rocket_Fuel_Lines_Dual_Green;
	global.rocketThrusters = global.cosRocketThrustersGraySmall;
	global.rocketWindow = s_Rocket_Window_Gray;
	global.playerCharacter = s_Character_Squirrel_Head;


#endregion



#region Game Modes
	global.gameOptions =
	{
		timed : false,
		fuelUse : false,
		damage : false,
		scoring : true,
	}
	global.gameMode = 0;
	global.gameModeString = "Challenge";
	/*
	0 = Challenge
	1 = Zen
	2 = Practice
	*/
#endregion

#region Level Struct Declarations
	enum LEVELTYPE {
		SPACE,
		WATER
	}
	global.level1 =
	{
		roomName : rGameIce1,
		levelName : "Ice - 1",
		levelType : LEVELTYPE.SPACE,
		unlocked : true,
		art : s_gameIce1,
		highScore : [0, 0],
		difficulty : 1,
	}
	global.level2 =
	{
		roomName : rGameIce2,
		levelName : "Ice - 2",
		levelType : LEVELTYPE.SPACE,
		unlocked : true,
		art : s_gameIce1,
		highScore : [0, 0],
		difficulty : 3,
	}
	global.level3 =
	{
		roomName : rGameIce3,
		levelName : "Ice - 3",
		levelType : LEVELTYPE.SPACE,
		unlocked : true,
		art : s_gameIce1,
		highScore : [0, 0],
		difficulty : 5,
	}

	global.level4 =
	{
		roomName : rGameWater1,
		levelName : "Water - 1",
		levelType : LEVELTYPE.WATER,
		unlocked : true,
		art : s_gameIce1,
		highScore : [0, 0],
		difficulty : 5,
	}

	global.level5 =
	{
		roomName : rGameWater2,
		levelName : "Water - 2",
		levelType : LEVELTYPE.WATER,
		unlocked : true,
		art : s_gameIce1,
		highScore : [0, 0],
		difficulty : 5,
	}

	global.level6 =
	{
		roomName : rGameTest,
		levelName : "Test",
		levelType : LEVELTYPE.WATER,
		unlocked : true,
		art : s_gameIce1,
		highScore : [0, 0],
		difficulty : 5,
	}
	//Level Selection - Contains all levels in game, in order
	global.levelSelectArray[0] = global.level1;
	global.levelSelectArray[1] = global.level2;
	global.levelSelectArray[2] = global.level3;
	global.levelSelectArray[3] = global.level4;
	global.levelSelectArray[4] = global.level5;
	global.levelSelectArray[5] = global.level6;

	global.selectedLevel = 0;
#endregion


