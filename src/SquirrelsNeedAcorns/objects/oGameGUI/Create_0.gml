
/// @desc Insert description here
debug = false;

enum TIMERMODE {
	UNTIMED,
	TIMED
}
countDown = 4; //To match the sound, will not be 4 seconds
countUp = 0;
showCountDown = countDown;
gameTimerInit = global.levelSelectArray[global.selectedLevel].timed;
gameTimer = gameTimerInit;

if(gameTimerInit == 0)
{
	//Untimed Mode
	timerMode = TIMERMODE.UNTIMED;
	gameTimerInit = 600;
	showTime = 0;
	gameTimer = gameTimerInit;
}
else
{
	//Timed mode	
	timerMode = TIMERMODE.TIMED;
	showTime = gameTimer;
}

global.goalReached = false;

gameOver = false;
gameOverTimer = 3;
timerDisplayOffset = 30;

alertFont = fTextLarge;
UIFont = fTextLarge;
hintFont = fTextLarge;

global.availablePoints = 0;
if(instance_exists(oPointPickup))
{
	var _pointPickup = instance_number(oPointPickup);
	global.availablePoints += _pointPickup;
}

if(instance_exists(oSuperAcorn))
{
	var _pointSuperAcorn = instance_number(oSuperAcorn);
	_pointSuperAcorn = _pointSuperAcorn * 5; //If reading directly from object, game crashes as it reads before variable is set
	global.availablePoints += _pointSuperAcorn;
}

touchUI = true;
var _hh = global.GUIhh
var _ww = global.GUIww
var _buttonHeight = _hh*.1;
var _margin = 3;
var _buffer = 20;

alertY = _hh*.3;
alertX = _ww*.5;

//Left Arrow GUI coords
var _sWidth = sprite_get_width(s_button_left);
var _sHeight = sprite_get_height(s_button_left);
leftArrDevice = -1;
leftArrLeftX = 1;
leftArrTopY = _hh - _hh/2;
leftArrRightX = _ww/2;
leftArrBottomY = _hh;


//Right Arrow GUI coords
rightArrDevice = -1;
rightArrLeftX = _hh/2+1;
rightArrTopY = _hh - _hh/2;
rightArrRightX = _ww -_margin;
rightArrBottomY = _hh-_margin;

//Pause Button GUI coords
var _sWidth = sprite_get_width(s_button_circle);
var _sHeight = sprite_get_height(s_button_circle);
pauseDevice = -1;
pauseLeftX = _ww - _sWidth-_buffer*1-_margin+1;
pauseTopY = 3;
pauseRightX = _ww -_margin;
pauseBottomY = _sHeight+_buffer+_margin;

instance_create_layer(_ww*.9,_hh*.1,"TouchUI",o_button_pause);

//Oplayer Values
flyUp = 0;
moveLeft = 0;
moveRight = 0;
pause = false;

