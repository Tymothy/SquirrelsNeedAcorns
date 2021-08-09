/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
position = global.musicToggle;

switch(position)
{
	case 0:
		sprite = s_logo_musicoff;
	break;
	
	case 1:
		sprite = s_logo_music;
	break;
}
update_button = function() {
	switch(position) {
			case 0:
				oMusic.toggleMusic	= true;
				sprite = s_logo_musicoff;
			break;
	
			case 1:
				oMusic.toggleMusic	= true;
				sprite = s_logo_music;
			break;
		

		
	}
	//global.musicToggle = position;
	
	//TO DO: Music Toggle Script, like set_game_mode
}

