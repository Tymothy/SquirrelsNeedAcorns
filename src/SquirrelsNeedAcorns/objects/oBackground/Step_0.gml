/// @description Insert description here
if(live_call()) return live_result;
layer_x(layer_id1, lerp(0, oCamera.x, .1));
layer_x(layer_id2, lerp(0, oCamera.x, .25));
layer_x(layer_id3, lerp(0, oCamera.x, .35));

layer_y(layer_id1, lerp(0, oCamera.y, .9) + 100);
layer_y(layer_id2, lerp(0, oCamera.y, .8) + 240);
layer_y(layer_id3, lerp(0, oCamera.y, .7) + 510);