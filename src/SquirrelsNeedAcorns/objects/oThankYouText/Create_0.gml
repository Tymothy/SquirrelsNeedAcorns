/// @description Insert description here
// You can write your code in this editor
	var _ww = global.GUIww;
	var _hh = global.GUIhh;
	backX = _ww*.1;
	backY = _hh*.9;
	//discordX = _ww * .7;
	//discordY = _hh * .9;
	

	instance_create_layer(backX, backY, "Instances",o_button_back);
	//instance_create_layer(discordX, discordY, "Instances", o_button_discord);