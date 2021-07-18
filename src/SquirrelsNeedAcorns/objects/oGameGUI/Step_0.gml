/// @desc Insert description here
#region Create values for touch UI.(Old)
////TODO: Only run this code on screen resize.
////Flyup GUI coords
//var _hh = global.GUIhh
//var _ww = global.GUIww
//var _margin = 3;
//var _buffer = 20;
//var _sWidth = sprite_get_width(s_button_circle);
//var _sHeight = sprite_get_height(s_button_circle);
////draw_sprite(s_button_circle, 1, _sWidth/2 + _margin, _hh - _sHeight/2 - _margin);
////flyupDevice = -1;
//flyupLeftX = _margin;
//flyupTopY = _hh - _sHeight - _buffer - _margin;
//flyupRightX = _margin + _sWidth + _buffer;
//flyupBottomY = _hh-_margin;

////Left Arrow GUI coords
//var _sWidth = sprite_get_width(s_button_left);
//var _sHeight = sprite_get_height(s_button_left);
////leftArrDevice = -1;
//leftArrLeftX = _ww -_sWidth*2-_buffer*2-_margin;
//leftArrTopY = _hh - _sHeight - _buffer - _margin;
//leftArrRightX = _ww - _sWidth-_buffer*1-_margin;
//leftArrBottomY = _hh-_margin;
///*
//draw_sprite(s_button_left, image_index, _ww - _sWidth/2 - _margin - _sWidth, _hh- _sHeight/2 - _margin);
//draw_sprite(s_button_right,image_index, _ww - _sWidth/2 - _margin, _hh - _sHeight/2 - _margin);

//*/
////Right Arrow GUI coords
////rightArrDevice = -1;
//rightArrLeftX = _ww - _sWidth-_buffer*1-_margin+1;
//rightArrTopY = _hh - _sHeight - _buffer - _margin;
//rightArrRightX = _ww -_margin;
//rightArrBottomY = _hh-_margin;

////Pause Button GUI coords
//var _sWidth = sprite_get_width(s_button_circle);
//var _sHeight = sprite_get_height(s_button_circle);
////pauseDevice = -1;
//pauseLeftX = _ww - _sWidth-_buffer*1-_margin+1;
//pauseTopY = 3;
//pauseRightX = _ww -_margin;
//pauseBottomY = _sHeight+_buffer+_margin;
#endregion

#region
var _hh = global.GUIhh
var _ww = global.GUIww
var _buttonHeight = _hh*.1;
var _margin = 3;
var _buffer = 20;
var _sWidth = sprite_get_width(s_button_left);
var _sHeight = sprite_get_height(s_button_left);

leftArrLeftX = 1;
leftArrTopY = _hh - _hh/2;
leftArrRightX = _ww/2;
leftArrBottomY = _hh;


//Right Arrow GUI coords

rightArrLeftX = _hh/2+1;
rightArrTopY = _hh - _hh/2;
rightArrRightX = _ww -_margin;
rightArrBottomY = _hh-_margin;

//Pause Button GUI coords
var _sWidth = sprite_get_width(s_button_circle);
var _sHeight = sprite_get_height(s_button_circle);

pauseLeftX = _ww - _sWidth-_buffer*1-_margin+1;
pauseTopY = 3;
pauseRightX = _ww -_margin;
pauseBottomY = _sHeight+_buffer+_margin;
#endregion

if(oPause.paused == false)
	{
	if (countDown > 0)
	{
		countDown = max(0,countDown - delta_time/1000000);
		showCountDown = max(0,ceil(countDown));
	}

	if (countDown < .1)
	{
		gameTimer = max(0, gameTimer - delta_time/1000000);
		showTime = max(0,ceil(gameTimer));
		showCountDown = 0;
		countDown = 0;
	}



	if(gameTimer == 0 || oPlayer.fuel < 10 || oPlayer.playerHealth < 1)
	{
		gameOver = true;
		gameOverTimer = max(0,gameOverTimer - delta_time/1000000);
	}
	else
	{
		gameOverTimer = 3;
	}
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

			
			//FlyUp Button
			if(flyupDevice == -1)
			{
				if(_y > flyupTopY && _y < flyupBottomY)
				{
					if(_x > flyupLeftX && _x < flyupRightX)
					{
						//Assign device to flyup button
						show_debug_message("Fly up button pressed with device " + string(i));
						flyupDevice = i;
					}
				}
			}
		
			if(leftArrDevice == -1)
			{			
				//Left Arrow Button
				if(_y > leftArrTopY && _y < leftArrBottomY)
				{
					if(_x > leftArrLeftX && _x < leftArrRightX)
					{
						//Assign device to flyup button
						show_debug_message("Left arrow button pressed with device " + string(i));
						leftArrDevice = i;
					}
				}
			}
		
			if(rightArrDevice == -1)
			{
				//Right Arrow Button
				if(_y > rightArrTopY && _y < rightArrBottomY)
				{
					if(_x > rightArrLeftX && _x < rightArrRightX)
					{
						//Assign device to flyup button
						show_debug_message("Right arrow button pressed with device " + string(i));
						rightArrDevice = i;
					}
				}
			}
			
						//FlyUp Button
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
			//When true, button has been let go.
			if(i = flyupDevice)
			{
				flyupDevice = -1;
				show_debug_message("Fly up button released with device " + string(i));
			}
			if(i = leftArrDevice)
			{
				leftArrDevice = -1;
				show_debug_message("Left arrow button released with device " + string(i));
			}
			if(i = rightArrDevice)
			{
				rightArrDevice = -1;
				show_debug_message("Right arrow button released with device " + string(i));
			}
			if(i = pauseDevice)
			{
				pauseDevice = -1;
				show_debug_message("Pause button released with device " + string(i));
			}
		}//End Release check
		
		//Check if user moves outside the zone
		//if(flyupDevice > -1)
		//{
		//	var _DeviceY = device_mouse_y_to_gui(flyupDevice);
		//	var _DeviceX = device_mouse_x_to_gui(flyupDevice);
		//	if(_DeviceY < flyupTopY || _DeviceY > flyupBottomY || _DeviceX < flyupLeftX || _DeviceX > flyupRightX)
		//	{
		//			//Assign device to flyup button
		//			show_debug_message("Flyup button out of zone, disabling device " + string(flyupDevice));
		//			flyupDevice = -1;
		//	}
		//}

		
		
	}//End For Loop
	if(flyupDevice > -1)
	{
		flyUp = 1;
	} else {
		flyUp = 0;	
	}
	if(leftArrDevice > -1)
	{
		moveLeft = 1;
	} else {
		moveLeft = 0;	
	}
	
	if(rightArrDevice > -1)
	{
		moveRight = 1;
	} else {
		moveRight = 0;	
	}
	
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
////				audio_play_sound(sound_button_select, 1, false);
//				show_debug_message("Click at GUI "+string();
//			}
		//}
	
	
	 
//	else {

//		if (device_mouse_check_button_released(my_touch, mb_any)) {
//			my_touch = -1;
//			//what to do to object when released
//			image_index = 0;
//	//		audio_play_sound(sound_button_select, 1, false);
//			show_debug_message("opar_button released");
//		}
//	}
	
