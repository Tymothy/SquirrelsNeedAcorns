mainMenuMusic = sound_music_TheLongestYear;
mountainsMusic = sound_music_FastLanes;
waterMusic = sound_music_YouWereAlways;
spaceMusic = sound_music_StarsAbove;

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