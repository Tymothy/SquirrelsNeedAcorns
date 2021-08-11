// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
if(live_call()) return live_result;
function UIScaling(){
	var base_w = global.defaultWidth;
	var base_h = global.defaultHeight;

	var _width = browser_width;
	var _height = browser_height;
	var aspect = _width / _height;
	
	if (aspect > 1)
	    {
	    //landscape
	    display_set_gui_size(base_h * aspect, base_h);
		ww = base_h * aspect;
	    hh = base_h;
		global.orientation = ORIENTATION.LANDSCAPE;

	    }
	else
	    {
	    //portrait
	    display_set_gui_size(base_w, base_w / aspect);
		ww = base_w;
	    hh = base_w / aspect;
		global.orientation = ORIENTATION.PORTRAIT;
	    }
	global.GUIww = ww;
	global.GUIhh = hh;
	global.aspect = aspect;
}