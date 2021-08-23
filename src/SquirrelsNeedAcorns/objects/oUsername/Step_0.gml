//if keyboard_virtual_status()
//    {
    playerName = keyboard_string;
//    }
	if(keyboard_check_pressed(vk_enter) || keyboard_lastchar == "\n" || keyboard_lastchar == "\r")
	{
			keyboard_virtual_hide();	

	}
	//If an escape character was entered, remove it.
