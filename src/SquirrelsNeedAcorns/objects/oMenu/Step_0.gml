if(live_call()) return live_result;
//menu_move = keyboard_check_pressed(vk_down) -  keyboard_check(vk_up);

if (keyboard_check_pressed(vk_down) == true || keyboard_check_pressed(ord("S")) == true)
{
	menu_index++;
}

if (keyboard_check_pressed(vk_up) == true || keyboard_check_pressed(ord("W")) == true)
{
	menu_index--;
}


if (menu_index < 0) menu_index = buttons -	1;
if (menu_index > buttons - 1) menu_index = 0;

if (menu_index != last_selected) 

last_selected = menu_index;

if (keyboard_check_pressed(vk_enter) == true 
|| keyboard_check_pressed(vk_space) == true 
|| touchSelect == true 
&& ableToSelect == true)
{
	audio_play_sound(sound_button_success, 90, false);
	if(room == rMainMenu)
	{
		switch (menu_index)
		{
			case 0:
				SlideTransition(TRANS_MODE.GOTO,rLevelSelect);
				break;
			case 1:
				SlideTransition(TRANS_MODE.GOTO,rHowTo);
				break;
			case 2:
				SlideTransition(TRANS_MODE.GOTO,rUsername);
				break;
			//case 3:
			//	SlideTransition(TRANS_MODE.GOTO,rOptions);
			//	break;
		}
	}
	if(room == rHowTo || room == rHighscore)
	{
		switch (menu_index)
		{
			case 0:
				SlideTransition(TRANS_MODE.GOTO,rMainMenu);
				break;
		}
	}
	//if(room == rLevelSelect)
	//{
	//	switch (menu_index)
	//	{
	//		//TODO: If select_level returns 0, do a fail sound
	//		case 0:
	//			select_level(-1);
	//			break;
	//		case 1:
	//			SlideTransition(TRANS_MODE.GOTO,global.levelSelectArray[global.selectedLevel].roomName);
	//			break;
	//		case 2:
	//			select_level(1);
	//			break;
	//	}
	//}
	if(room == rEndRun)
	{
		switch (menu_index)
		{
			case 0:
				SlideTransition(TRANS_MODE.GOTO,global.lastGameRoom);
				break;
			case 1:
				if(select_level(1) == 1)
				{
					SlideTransition(TRANS_MODE.GOTO, global.levelSelectArray[global.selectedLevel].roomName);	
				}
				else {
					//At the last level, return to level select
					SlideTransition(TRANS_MODE.GOTO, rLevelSelect);
				}
				break;
			case 2:
				SlideTransition(TRANS_MODE.GOTO, rLevelSelect);
				break;
		}
	}	
	if(room == rOptions)
	{
			
		switch (menu_index)
		{

			case 0:
				//SlideTransition(TRANS_MODE.GOTO,rLevelSelect);
				oMusic.toggleMusic = true;
				break;
			case 1:
				global.gameMode += 1;
				if(global.gameMode == 3)//Go back to lowest value
				{
					global.gameMode = 0;	
				}
					switch(global.gameMode)
					{
						case 0:	
							global.gameModeString = "Challenge";
							set_game_mode(global.gameMode);
							break;
	
						case 1:
							global.gameModeString = "Zen";
							set_game_mode(global.gameMode);
							break;
	
						case 2:
							global.gameModeString = "Practice";
							set_game_mode(global.gameMode);
							break;
					}
				break;
			case 2:
				SlideTransition(TRANS_MODE.GOTO,rMainMenu);
				break;
		}
	}

	touchSelect = false; //Reset touch select so buttons aren't constantly pushed.
}

	if (device_mouse_check_button_pressed(0, mb_any)) {
		ableToSelect = false;
	}
	
	if (device_mouse_check_button_released(0, mb_any)) {
		ableToSelect = true;
	}

