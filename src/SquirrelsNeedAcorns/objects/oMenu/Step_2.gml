if(live_call()) return live_result;
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
			button[0] = "Music: " + string(musicString);
			button[1] = "Mode: " + string(global.gameModeString);
}