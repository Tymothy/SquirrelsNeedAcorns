/// @desc Insert description here
if( !audio_is_playing(soundMusic) && global.musicToggle == true)
{
	audio_play_sound(soundMusic, 50, true);
}

toggleMusic = false;