// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Zoom(){
		if(instance_exists(oPlayer))
		{
			var _zoom = 1.5;
		}
		else
		{
			var _zoom = 1;
		}
		return _zoom;
}