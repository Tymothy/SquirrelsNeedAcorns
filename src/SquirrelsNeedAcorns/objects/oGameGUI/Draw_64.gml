if(live_call()) return live_result;
/// @desc Insert description here
//draw_set_color(c_red)
//draw_rectangle(50,50,50+(200-50)*(oPlayer.fuel),100,0);

	// An example of how you would then draw this to the GUI layer... 
	//draw_sprite(sprite17, 0, 64, 64);
	//draw_sprite(sprite17, 0, ww - 64, 64);
	//draw_sprite(sprite17, 0, ww - 64, hh - 64);
	//draw_sprite(sprite17, 0, 64, hh - 64);

var _ww = global.GUIww;
var _hh = global.GUIhh;
var _buttonHeight = _hh*.1;
var _margin = 3;
var _buffer = 20;

alertY = _hh*.3;
alertX = _ww*.5;

//If true, game is in portrait mode
if(_ww/_hh < 1)
{
	timerDisplayOffset = 70;
} else { //Game is in landscape
	timerDispalyOffset = 10;
}

var _hhalert = _hh/2;//-(font_get_size(alertFont)*2);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(UIFont);


var xSpacing = 25;
var ySpacing = 45;
var valueSpacing = 45;

//Draw Fuel
//TODO: Fix the fuel bar to be pixel perfect
if(global.gameOptions.fuelUse == true)
{
	draw_sprite(sFuelPickup,image_index, xSpacing, ySpacing);
	draw_set_color(c_dkgray);
	draw_rectangle(xSpacing+valueSpacing-11,ySpacing-12,xSpacing+valueSpacing+sprite_get_width(sFuelUIBar)-12,ySpacing+sprite_get_height(sFuelUIBar)-13,false);
	draw_sprite_part(sFuelUIBar, image_index, 0, 0, (sprite_get_width(sFuelUIBar)*(oPlayer.fuel/oPlayer.fuelMax)), sprite_get_height(sFuelUIBar), xSpacing+valueSpacing-11, ySpacing-12);
}

//Draw Points
if(global.gameOptions.scoring == true)
{
	draw_set_color(c_yellow);
	draw_sprite(sAcorn,image_index, xSpacing, ySpacing*2);
	draw_text_transformed_color(xSpacing/2+valueSpacing, ySpacing*2+2,string(oPlayer.pointsOnPlayer) + " / " + string(global.availablePoints), 1, 1, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
}

//Draw Health
if(global.gameOptions.damage == true)
{
	draw_sprite(sPlayer,0, xSpacing, ySpacing*3);
	draw_text_transformed_color(xSpacing/2+valueSpacing, ySpacing*3,oPlayer.playerHealth, 1, 1, 0, c_red, c_red, c_red, c_red, 1);
}

//Draw Time
if(global.displayCountUp == true)
{
	draw_set_font(UIFont);
	draw_set_color(c_ltgray);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text_outline(_ww * .5, timerDisplayOffset,string(showTime),c_black,c_ltgray);
	if(showTime < 11)
	{
		//draw_set_color(c_yellow);
		//draw_text_outline(_ww * .5, timerDisplayOffset, string(showTime),c_black,c_yellow);
	}
	if(showTime < 4)
	{
		//draw_set_color(c_red);	
		//draw_text_outline(_ww * .5, timerDisplayOffset, string(showTime),c_black,c_red);
	}
}

//Draw the count down to start the run
if(showCountDown > 0)
	{
		draw_set_font(alertFont);
		draw_set_color(c_ltgray);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(alertX,alertY,"Get Ready!");
		draw_text_outline(alertX,alertY, "Get Ready!", c_black,c_ltgray);

		draw_set_font(alertFont);
		draw_set_color(c_yellow);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text_outline(alertX,alertY+font_get_size(alertFont)*1.5,string(showCountDown),c_black, c_ltgray);
	}

#region //Alerts
var alertActive = false;
if((global.goalReached == true) && alertActive ==false)
{
	draw_set_font(alertFont);
	draw_set_color(c_ltgray);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_outline(alertX,alertY,"Goal Reached!",c_black, c_red);
	alertActive = true;
}

if((gameTimer == 0) && alertActive ==false && timerMode == TIMERMODE.TIMED)
{
	draw_set_font(alertFont);
	draw_set_color(c_ltgray);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_outline(alertX,alertY,"Time's Up!",c_black, c_red);
	alertActive = true;
}


if((oPlayer.playerHealth < 1) && alertActive ==false)
{
	draw_set_font(alertFont);
	draw_set_color(c_ltgray);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_outline(alertX,alertY,"Squirrel Down!",c_black, c_red);
	alertActive = true;
}

if((oPlayer.fuel < 10) && alertActive ==false)
{
	draw_set_font(alertFont);
	draw_set_color(c_ltgray);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_outline(alertX,alertY,"Out of Fuel!",c_black, c_red);
	alertActive = true;
}

if((oPlayer.fuel > 10 && oPlayer.fuel < .2*oPlayer.fuelMax && alertActive ==false))
{
	draw_set_font(alertFont);
	draw_set_color(c_ltgray);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_outline(alertX,alertY,"Low Fuel!",c_black, c_yellow);
	alertActive = true;
}

#endregion

#region Touch UI
if(touchUI)
{
	var _margin = 5;//Pixels of space around edges

	//Arrow keys
	var _sWidth = sprite_get_width(s_button_right);
	var _sHeight = sprite_get_height(s_button_right);
	//draw_sprite(s_button_right,image_index, _ww - _sWidth/2 - _margin, _hh - _sHeight/2 - _margin);
	
	//draw_sprite(s_button_left, image_index, _sWidth/2 + _margin, _hh- _sHeight/2 - _margin);

	////This draws left arrow on right side to left of right arrow
	////draw_sprite(s_button_left, image_index, _ww - _sWidth/2 - _margin - _sWidth, _hh- _sHeight/2 - _margin);

	////Draw Pause
	//draw_sprite(s_button_pause, 0, _ww - _sWidth/2 - _margin, _sHeight/2 + _margin);
	
	if(debug)
	{
		draw_set_color(c_yellow);
		draw_rectangle(leftArrLeftX, leftArrTopY, leftArrRightX, leftArrBottomY ,true);
		draw_rectangle(rightArrLeftX, rightArrTopY, rightArrRightX, rightArrBottomY ,true);
		draw_rectangle(pauseLeftX, pauseTopY, pauseRightX, pauseBottomY ,true);
	}
}
#endregion

#region Hints
//After 2 seconds of play time, if player has not moved, provide hints to move
if(oPlayer.playerMoved == false && gameTimer < (gameTimerInit - 2))
{
	draw_set_font(hintFont);
	draw_set_halign(fa_center);
	draw_text_outline(_ww*.25,_hh*.7, "Touch this side\n to go left!", c_black, c_ltgray);
	draw_text_outline(_ww*.75,_hh*.7, "Touch this side\n to go right!", c_black, c_ltgray);
}
#endregion