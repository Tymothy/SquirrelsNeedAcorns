if(live_call()) return live_result;

sprite = s_pickup_point_acorn;
//Center of the sprite
dispX = global.GUIww * .5;
dispY = global.GUIhh * .95;
margin = global.GUIhh *.01; //Margin between sprite and words
text = string(global.acornsCollected);

width = 0;

//Used if downscaling
xScale = .5;
yScale = .5;
stringW = string_width(text);
spriteW = sprite_get_width(sprite) * xScale;
//Width is total width of sprite and text
