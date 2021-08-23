playerName = global.playerName;
//TO DO: Add a button that prompts user to select "Change username" if a username already exists

//if(playerName == "")
//{
		keyboard_string = "";
	    keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_none, false);
//}
var _ww = global.GUIww;
var _hh = global.GUIhh;

mainmenuX = _ww*.1;
mainmenuY = _hh*.9;

instance_create_layer(mainmenuX, mainmenuY, "Instances",o_button_back);

	//	if keyboard_virtual_status() == false
	//    {
	//    keyboard_string = "";
	//    keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_none, false);
	//    }
	//else
	//    {
	//    keyboard_virtual_hide();
	//    }