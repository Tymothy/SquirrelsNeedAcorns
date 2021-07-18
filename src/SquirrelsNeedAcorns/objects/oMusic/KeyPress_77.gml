/// @desc Insert description here
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