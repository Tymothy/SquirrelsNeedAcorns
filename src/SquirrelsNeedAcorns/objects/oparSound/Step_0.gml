/// @description Insert description here
// You can write your code in this editor
switch (objState)
{
	case soundState.READY:
		if(playFlag == true || playOnCreate == true)
		{
			playFlag = true; //Just in case audio started with playOnCreate
			play_effect();
			objState = soundState.PLAYING;					
		}
		
		
	break;
	
	case soundState.PLAYING:
	
		//If game is paused, pause effects
		if(global.pause == true)
		{
			pause_effect();	
			objState = soundState.PAUSED;			
		}
		
		//Done playing audio, ready to play again
		if(audio_is_playing(soundEffect) == false)
		{
			playFlag = false;
			objState = soundState.READY;
			destroy_on_complete();
		}

		
	break;
	
	case soundState.PAUSED:
		//Resume playing when game is unpaused
		if(global.pause == false)
		{
			resume_effect();	
			objState = soundState.PLAYING;			
		}

	break;
	
}