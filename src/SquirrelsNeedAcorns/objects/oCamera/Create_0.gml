/// @desc Insert description here
if(live_call()) return live_result;
xTo = xstart;
yTo = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;

if (instance_exists(oPlayer))
{
		x = oPlayer.x;
		y = oPlayer.y;
//		zoom = 1.5; // Higher is "zoomed out"
}

//Get Background layer ids for parallax
if(layer_exists("BG_1"))
{
	bg_1layer = layer_get_id("BG_1");
}
if(layer_exists("BG_2"))
{
	bg_2layer = layer_get_id("BG_2");
}
if(layer_exists("BG_3"))
{
	bg_3layer = layer_get_id("BG_3");
}
if(layer_exists("BG_4"))
{
	bg_4layer = layer_get_id("BG_4");
}
if(layer_exists("BG_5"))
{
	bg_5layer = layer_get_id("BG_5");
	bg_5layerSpr = layer_sprite_get_sprite(bg_5layer);
	bg_5layerW = sprite_get_width(bg_5layerSpr);
	bg_5layerH = sprite_get_height(bg_5layerSpr);
}