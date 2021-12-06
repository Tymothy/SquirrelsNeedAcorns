// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function UIScaling(){
	show_debug_message("Running UIScaling");
	var base_w = global.defaultWidth;
	var base_h = global.defaultHeight;

	var _width = browser_width;
	var _height = browser_height;
	var aspect = _width / _height;
	
	if (aspect > 1)
	    {
	    //landscape
	    //display_set_gui_size(base_h * aspect, base_h);
		ww = base_h * aspect;
	    hh = base_h;	
		
		//_ww = floor(browser_width / ww);
		//_hh = _ww;
		
		//xOff =  (_width - max(0, base_w * _ww)) / 2;
		//yOff = (_height - max(0,base_h * _hh)) / 2;
		//xOff = 0;
		//yOff = 0;
		display_set_gui_maximize((browser_width / ww), browser_height / hh, 0, 0);
		
		//Need to get correct offsets
		
		//display_set_gui_maximize(_ww, _hh, xOff, yOff);
		
		global.orientation = ORIENTATION.LANDSCAPE;

	    }
	else
	    {
	    //portrait
	    //display_set_gui_size(base_w, base_w / aspect);
		ww = base_w;
	    hh = base_w / aspect;
		//_hh = floor(browser_width / hh);
		//_ww = _hh;

		display_set_gui_maximize((browser_width / ww), browser_height / hh, 0, 0);
		
		//display_set_gui_maximize(_ww, _hh, 0, 0);
		global.orientation = ORIENTATION.PORTRAIT;
	    }
	global.GUIww = ww;
	global.GUIhh = hh;
	global.aspect = aspect;
}