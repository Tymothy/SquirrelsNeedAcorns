/// @desc Insert description here
switch (global.musicToggle)
{
	case 1:
		audio_pause_sound(soundMusic);
		global.musicToggle = false;
		break;
	case 0:
		audio_resume_sound(soundMusic);
		global.musicToggle = true;
		break;
}