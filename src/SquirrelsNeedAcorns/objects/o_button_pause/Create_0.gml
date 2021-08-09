/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
sprite = s_logo_pause;
position = global.pause;


update_button = function() {
	switch(position) {
			case 0:
				global.pause = false;
			break;
	
			case 1:
				global.pause = true;
			break;
		

		
	}
	//global.musicToggle = position;
	
	//TO DO: Music Toggle Script, like set_game_mode
}