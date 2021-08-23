	if(keyboard_lastchar == "\n" || keyboard_lastchar == "\r")
	{
		keyboard_string = string_delete(keyboard_string, string_length(keyboard_string), 1)
	}
	playerName = keyboard_string;
global.playerName = playerName;
keyboard_string = "";