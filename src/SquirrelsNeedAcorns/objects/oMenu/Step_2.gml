/// @description Insert description here
// You can write your code in this editor
if(room == rOptions)
{
			if (global.musicToggle == false)
			{	
				musicString = "Off";
			}
			else {
				musicString = "On";	
			}
			button[1] = "Music: " + string(musicString);
			button[2] = "Mode: " + string(gameModeString);
}