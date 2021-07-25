/// @desc Insert description here

//Declare Global Variables
global.cam = view_camera[0];
global.view_w_half = camera_get_view_width(global.cam) * 0.5;
global.view_h_half = camera_get_view_height(global.cam) * 0.5;
global.points = 0;
global.final = 0;
global.highscore = 0;
global.money = 0;
global.musicToggle = true;
global.touchEnabled = true;

global.defaultWidth = 640;
global.defaultHeight = 360;
global.tileSize = 16;
global.goalAspect = global.defaultWidth / global.defaultHeight;
global.GUIZoom = 2; //Higher number, smaller UI
global.GUIww = 0;
global.GUIhh = 0;
countDown = 1;

global.lastGameRoom = 0;

//Declare Player Cosmetics
global.playerCharacter = sPlayer;
global.playerBelt = s_belt_orange;
global.playerRocket = s_rocket_blue;
global.playerPropelStart = s_propel_red_start;
global.playerPropelRunning = s_propel_red_running;

//Save File
global.saveFile = "savedata.ini";

//Get high score from last session, if it exists.  Otherwise use 0.
//ini_open("savedata.ini");
//show_debug_message("Opening ini file");
//global.highscore = ini_read_real("stats", "highscore", 0);
//global.money = ini_read_real("stats", "money", 0);
//global.highscore_rGameIce1 = ini_read_real("stats", "rGameIce1", 0);

//ini_close();