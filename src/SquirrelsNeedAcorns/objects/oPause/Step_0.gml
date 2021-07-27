if(live_call()) return live_result;
/// @description Insert description here
// You can write your code in this editor
var _wait = false;
if (keyboard_check_pressed(vk_space) == true || oGameGUI.pause == true)
{
	if(paused == false)
	{
		paused = true;
		_wait = true;
	}
}


if(paused == true && _wait == false)
{
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
			switch (menu_index)
			{
				case 0:
					paused = false;
					break;
				case 1:
					//room_restart();
					SlideTransition(TRANS_MODE.GOTO,room);
					break;
				case 2:
					SlideTransition(TRANS_MODE.GOTO,rEndRun);
					break;
				//TODO: This should only be displayed when game is in desktop mode.  Maybe fully remove?
				case 3:
					//game_end();
					break;
			}
	
	}
}
_wait = false;