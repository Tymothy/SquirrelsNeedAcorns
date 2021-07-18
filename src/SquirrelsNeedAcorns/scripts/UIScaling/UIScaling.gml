// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UIScaling(){
	/*
	var base_w = global.defaultWidth;//*global.GUIZoom; 
	var base_h = global.defaultHeight;//*global.GUIZoom; 
	var aspect = display_get_width() / display_get_height();
	if (aspect > 1)
	    {
	    //landscape
	    ww = base_h * aspect;
	    hh = base_h;
	    display_set_gui_maximise((display_get_width() / ww), (display_get_height() / hh), 0, 0);
	    }
	else
	    {
	    //portrait
	    ww = base_w;
	    hh = base_w / aspect;
	    display_set_gui_maximise((display_get_width() / ww), (display_get_height() / hh), 0, 0);
	    }
		//if os_browser == browser_not_a_browser
	   //{
		//   //Not a browser
		//	ww = ww/2;
		//	hh = hh/2;	
	   //}
	global.GUIww = ww;
	global.GUIhh = hh;
	// An example of how you would then draw this to the GUI layer... 
	//draw_sprite(sprite17, 0, 64, 64);
	//draw_sprite(sprite17, 0, ww - 64, 64);
	//draw_sprite(sprite17, 0, ww - 64, hh - 64);
	//draw_sprite(sprite17, 0, 64, hh - 64);
	*/
	
	var base_w = global.defaultWidth;
	var base_h = global.defaultHeight;
	var aspect = display_get_width() / display_get_height();
	if (aspect > 1)
	    {
	    //landscape
	    display_set_gui_size(base_h * aspect, base_h);
		ww = base_h * aspect;
	    hh = base_h;
	    }
	else
	    {
	    //portrait
	    display_set_gui_size(base_w, base_w / aspect);
		ww = base_w;
	    hh = base_w / aspect;
	    }
	global.GUIww = ww;
	global.GUIhh = hh;
}