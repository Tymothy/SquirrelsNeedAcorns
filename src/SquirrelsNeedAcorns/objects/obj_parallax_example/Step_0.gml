/// @description Insert description here
// You can write your code in this editor

x = mouse_x;
y = mouse_y;

var view_w = 160; //these are not doing anything here without a view
var view_h = 90;

background_parallax("parallax",spr_parallax_example,x-view_w/2,y-view_h/2,view_w,view_h,1.2);
background_parallax("parallax_1",spr_parallax_example1,x-view_w/2,y-view_h/2,view_w,view_h,1.4);


