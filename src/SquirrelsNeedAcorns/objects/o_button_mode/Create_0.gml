/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
max_positions = 2; //We have 2 modes, so we need 2 cycles
position = global.gameMode;

update_button = function() {
	switch(position) {
			case 0:
				sprite = s_logo_challenge;
			break;
	
			case 1:
				sprite = s_logo_practice;
			break;

		
	}
	global.gameMode = position;
	set_game_mode(global.gameMode);
}
update_button();
