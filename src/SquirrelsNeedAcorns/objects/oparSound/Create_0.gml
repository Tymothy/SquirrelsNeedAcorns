soundEffect = soundNone;
priority = 60;
loop = false;
destroyOnComplete = false; //If true, destroy object when done
playOnCreate = false; //If true, play as soon as object is created.

enum soundState {
	READY,
	PLAYING,
	PAUSED
}
objState = soundState.READY;
playFlag = false; //When true, play effect


play_effect = function () {
	audio_play_sound(soundEffect, priority, loop);	
}

pause_effect = function () {
	audio_pause_sound(soundEffect);	
	
}

resume_effect = function () {
	audio_resume_sound(soundEffect);	
}

destroy_on_complete = function () {
	if(destroyOnComplete == true)
	{
		instance_destroy();	
	}
}