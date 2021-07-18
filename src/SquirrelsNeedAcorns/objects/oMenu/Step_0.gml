

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

if (menu_index != last_selected) audio_play_sound(soundSelect, 1, false);

last_selected = menu_index;

if (keyboard_check_pressed(vk_enter) == true || keyboard_check_pressed(vk_space) == true || touchSelect == true)
{
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
				SlideTransition(TRANS_MODE.GOTO,rHighscore);
				break;
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
	if(room == rLevelSelect)
	{
		switch (menu_index)
		{
			case 0:
				SlideTransition(TRANS_MODE.GOTO,rGameIce1);
				break;
			//case 1:
			//	SlideTransition(TRANS_MODE.GOTO,rGame);
			//	break;
			case 1:
				SlideTransition(TRANS_MODE.GOTO,rMainMenu);
				break;
		}
	}
	if(room == rEndRun)
	{
		switch (menu_index)
		{
			case 0:
				SlideTransition(TRANS_MODE.GOTO,global.lastGameRoom);
				break;
			case 1:
				SlideTransition(TRANS_MODE.GOTO,rLevelSelect);
				break;
			case 2:
				SlideTransition(TRANS_MODE.GOTO,rMainMenu);
				break;
		}
	}
}

