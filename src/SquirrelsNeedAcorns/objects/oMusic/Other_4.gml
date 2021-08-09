/// @description Insert description here
// You can write your code in this editor
if(global.musicToggle == 1)
{
//	if(instance_exists(oPlayer) && currentMusic == mainMenuMusic) //Check if we are in a game room
//	{

		endingMusic = currentMusic;
	
		if(room == rGameIce1)
		{
			currentMusic = rGameIce1Music;			
		}
		
		if(!instance_exists(oPlayer))
		{
			currentMusic = mainMenuMusic;	
		}
		
		//Check if game is trying to play the same track again.  If so, don't replay, just continue.
		if(endingMusic != currentMusic)
		{
			audio_sound_gain(endingMusic, 0, 2000);
			audio_play_sound(currentMusic, 90, true);	
			audio_sound_gain(currentMusic, 0,0);
			audio_sound_gain(currentMusic, 1,2000);
		}
		if(endingMusic == currentMusic)
		{
			endingMusic = 0;
		}
			
//	}
	//else if(currentMusic != mainMenuMusic)
	//{
	//	audio_sound_gain(currentMusic, 0, 2000);
	//	endingMusic = currentMusic;
	//	audio_play_sound(mainMenuMusic, 90, true);	
	//	audio_sound_gain(mainMenuMusic, 0,0);
	//	audio_sound_gain(mainMenuMusic, 1,2000);
	//	currentMusic = mainMenuMusic;
	//}
}