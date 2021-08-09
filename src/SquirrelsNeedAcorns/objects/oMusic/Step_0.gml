/// @description Insert description here
// You can write your code in this editor
if(toggleMusic == true)
{
	switch (global.musicToggle)
	{
		case 1:
			audio_pause_sound(currentMusic);
			global.musicToggle = false;
			break;
		case 0:
			audio_resume_sound(currentMusic);
			global.musicToggle = true;
			break;
	}
	toggleMusic = false
}
if(audio_sound_get_gain(endingMusic) <= 0)
{
	audio_stop_sound(endingMusic);
	endingMusic = 0;
}