///background_parallax(layer,sprite,view_x,view_y,view_w,view_h,speed);
///@param layer
///@param sprite
///@param view_x
///@param view_y
///@param view_w
///@param view_h
///@param speed
function background_parallax() {
	var layer_ = argument[0];
	var spr_ = argument[1];
	var vw_x = argument[2];
	var vw_y = argument[3];
	var vw_w = argument[4];
	var vw_h = argument[5];
	var spd_ = argument[6];


	var rw_ = room_width;
	var rh_ = room_height;

	layer_x(layer_,round(rw_*(((vw_x+vw_w/2-sprite_get_width(spr_)/2)-rw_/2))/(rw_*spd_)));
	layer_y(layer_,round(rh_-rh_*(abs((vw_y+vw_h/2-sprite_get_height(spr_)/2)-rh_))/(rh_*spd_)));


}
