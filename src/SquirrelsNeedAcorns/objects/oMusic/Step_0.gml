/// @description Insert description here
// You can write your code in this editor
if(toggleMusic == true)
{
	switch (global.musicToggle)
	{
		case true:
			audio_pause_sound(soundMusic);
			global.musicToggle = false;
			break;
		case false:
			audio_resume_sound(soundMusic);
			global.musicToggle = true;
			break;
	}
	toggleMusic = false
}