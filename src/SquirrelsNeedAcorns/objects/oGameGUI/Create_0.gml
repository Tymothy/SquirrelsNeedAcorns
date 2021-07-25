/// @desc Insert description here
debug = false;

countDown = 3;
showCountDown = countDown;
gameTimerInit = 60;
gameTimer = gameTimerInit;
showTime = gameTimer;

gameOver = false;
gameOverTimer = 3;

alertFont = fEthno24;
UIFont = fConthrax26;
hintFont = fConthrax11;

touchUI = true;
var _hh = global.GUIhh
var _ww = global.GUIww
var _buttonHeight = _hh*.1;
var _margin = 3;
var _buffer = 20;


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

/*

//Left Arrow GUI coords
leftArrDevice = -1;
leftArrLeftX = 442;
leftArrTopY = 280;
leftArrRightX = 544;
leftArrBottomY = 356;

//Right Arrow GUI coords
rightArrDevice = -1;
rightArrLeftX = 545;
rightArrTopY = 280;
rightArrRightX = 637;
rightArrBottomY = 356;

//Pause Button GUI coords
pauseDevice = -1;
pauseLeftX = 545;
pauseTopY = 3;
pauseRightX = 637;
pauseBottomY = 79;
*/


//Oplayer Values
flyUp = 0;
moveLeft = 0;
moveRight = 0;
pause = false;