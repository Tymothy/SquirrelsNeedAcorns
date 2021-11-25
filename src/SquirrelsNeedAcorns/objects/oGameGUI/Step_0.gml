if(live_call()) return live_result;
/// @desc Insert description here
#region
var _hh = global.GUIhh
var _ww = global.GUIww
var _margin = 3;
var _buffer = 20;
var _sWidth = sprite_get_width(s_button_left);
var _sHeight = sprite_get_height(s_button_left);

leftArrLeftX = 1;
leftArrTopY = _hh*.3;
leftArrRightX = _ww/2;
leftArrBottomY = _hh-_margin;


//Right Arrow GUI coords

rightArrLeftX = _ww/2+1;
rightArrTopY = _hh*.3;
rightArrRightX = _ww -_margin;
rightArrBottomY = _hh-_margin;

//Pause Button GUI coords
var _sWidth = sprite_get_width(s_button_circle);
var _sHeight = sprite_get_height(s_button_circle);

pauseLeftX = _ww - _sWidth - _margin + 1;
pauseTopY = 3;
pauseRightX = _ww -_margin;
pauseBottomY = _sHeight + _margin;
#endregion

if(oPause.paused == false) //UI Elements
	{
	if (countDown > 0)
	{
		if(instance_exists(oSoundCountdown) == false)
		{
			instance_create(x, y, oSoundCountdown);	
		}
		var _countdownModifer = 2.1; //Speed at which count down goes, higher is faster
		countDown = max(0,countDown - delta_time/1000000 * _countdownModifer);
		showCountDown = max(0,ceil(countDown));
	}
	if(global.gameOptions.timed == true)
	{
		if (countDown < .01)
		{
			switch(timerMode)
			{
				case TIMERMODE.UNTIMED :
					if(global.goalReached == false)
					{
						countUp = countUp + delta_time/1000000;
						showTime = countUp;	
					}
					gameTimer = 60;

				break;
				
				case TIMERMODE.TIMED :
					gameTimer = max(0, gameTimer - delta_time/1000000);
					countUp = countUp + delta_time/1000000;
					showTime = gameTimer;
					//showTime = max(0,ceil(gameTimer));
					showCountDown = 0;
					countDown = 0;
				break;
			}
		}
	}


	//Check for round ending scenarios
	if(gameTimer == 0 || oPlayer.fuel < 1 || oPlayer.playerHealth < 1 || global.goalReached == true)
	{
		gameOver = true;
		gameOverTimer = max(0,gameOverTimer - delta_time/1000000);
	}
	else //Check in case player gets fuel after time is up.  Give player back time and don't end round.
	{
		gameOverTimer = 3;
	}
	//Go to end run room after end game timer is up
	if (gameOverTimer == 0)
	{
		SlideTransition(TRANS_MODE.GOTO,rEndRun);
	}
}

if(touchUI)
{
	
	for (var i = 0; i < 10; i += 1) {
			var _x = device_mouse_x_to_gui(i);
			var _y = device_mouse_y_to_gui(i);
		//Check the inital click
		if (device_mouse_check_button_pressed(i, mb_any)) {			
			//Pause button
			if(pauseDevice == -1)
			{
				if(_y > pauseTopY && _y < pauseBottomY)
				{
					if(_x > pauseLeftX && _x < pauseRightX)
					{
						//Assign device to flyup button
						show_debug_message("Pause button pressed with device " + string(i));
						pauseDevice = i;
					}
				}
			}
		}//End of button press check
		
		//Check if user releases
		if (device_mouse_check_button_released(i, mb_any)) {
			if(i = pauseDevice)
			{
				pauseDevice = -1;
				show_debug_message("Pause button released with device " + string(i));
			}
		}//End Release check
		

		
		
	}//End For Loop
	
	if(pauseDevice > -1)
	{
		pause = true;
	} else {
		pause = false;
	}
}//End TouchUI Logic
			
			
//			if (position_meeting(device_mouse_x_to_gui(i), device_mouse_y_to_gui(i), id)) {
//				my_touch = i;
//				//What to do to object if it is hit
//				image_index = 1;
////				audio_play_sound(sound_button_success, 1, false);
//				show_debug_message("Click at GUI "+string();
//			}
		//}
	
	
	 
//	else {

//		if (device_mouse_check_button_released(my_touch, mb_any)) {
//			my_touch = -1;
//			//what to do to object when released
//			image_index = 0;
//	//		audio_play_sound(sound_button_success, 1, false);
//			show_debug_message("opar_button released");
//		}
//	}
	
