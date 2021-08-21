// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
if(live_call()) return live_result;
function canvas_fullscreen(_base, _zoom){
	/// @function               canvas_fullscreen(base)
	/// @param {int}    base    The base value for scaling on both axis

	//use to fill screen
	var _bw = browser_width;
	var _bh = browser_height;

	view_wport[0] = _bw;
	view_hport[0] = _bh;
	window_set_size(_bw, _bh);
	
	if os_browser == browser_not_a_browser
	{
		//Avoiding resizing swap chain
	}
	else
	{
		//Center screen for browser play
		window_center();
	}
	//var _aspect = clamp((_bw / _bh), 1.5, 2);
	var _aspect = (_bw / _bh);
	if (_aspect < 1) //Landscape
	    {
	    var _vw = _base * _aspect;
	    var _vh = _base;
	    }
	else //Portrait mode
	    {
	    _vw = _base;
	    _vh = _base / _aspect;
	    }

	 _vw = _vw * _zoom;
	 _vh = _vh * _zoom;
	
	camera_set_view_size(view_camera[0], _vw, _vh);
	//camera_set_view_size(view_camera[0], 640, 360);
	surface_resize(application_surface, view_wport[0], view_hport[0]);
/*
Get jitter free pixel art
If {Viewport mod camera == 0}(no jitter)

It's pretty simple. You want to make sure the dimensions of your camera are an EVEN MULTIPLE of your view port.

Got a 1920x1080 viewport? Try setting your camera size to 480x270. 1360x768? Try 340x256.
*/
	//TODO: GET PIXEL PERFECT SCALING
	
	 //_temp = (_vw % _camWidth);
	 //_camWidth = _vw + _temp;
	 
	 //_temp = (_vh % _camHeight);
	 //_camHeight = _vh + _temp;
	 
	 //var scaleFactorW = max(.5,floor(_vw / global.defaultWidth));
	 //var scaleFactorH = max(.5,floor(_vh / global.defaultHeight));
	 
	 //_temp = _vw % scaleFactorW;
	 //_camWidth = _vw / scaleFactorW + _temp;
	 
	 //_temp = _vh % scaleFactorH;
	 //_camHeight = _vh / scaleFactorH + _temp;
	 

	//camera_set_view_size(view_camera[0], _camWidth, _camHeight);
}