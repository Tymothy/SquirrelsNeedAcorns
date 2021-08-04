// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
if(live_call()) return live_result;
function UIScaling(){
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