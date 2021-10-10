//if keyboard_virtual_status()
//    {

//    }
	if(keyboard_check_pressed(vk_enter) || keyboard_lastchar == "\n" || keyboard_lastchar == "\r")
	{
			keyboard_virtual_hide();	

	}
	playerName = keyboard_string;
	//If an escape character was entered, remove it.
