mainMenuMusic = sound_music_TheLongestYear;
rGameIce1Music = sound_music_FastLanes;

currentMusic = mainMenuMusic;
endingMusic = 0;

/// @desc Insert description here
if( !audio_is_playing(mainMenuMusic) && global.musicToggle == 1)
{
	audio_stop_all();
	audio_play_sound(mainMenuMusic, 50, true);
}

toggleMusic = false;

//Main Menu - The Longest Year