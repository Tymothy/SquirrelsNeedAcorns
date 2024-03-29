/// @description Insert description here
// You can write your code in this editor

draw_self();

//Draw attire
draw_sprite_ext(global.playerTopper, image_index, x, y, image_xscale, image_yscale, image_angle,image_blend, image_alpha);
draw_sprite_ext(global.playerShirt, image_index, x, y, image_xscale, image_yscale, image_angle,image_blend, image_alpha);
draw_sprite_ext(global.playerRocket,image_index, x, y, image_xscale, image_yscale, image_angle,image_blend, image_alpha);
draw_sprite_ext(global.playerBelt, image_index, x, y, image_xscale, image_yscale, image_angle,image_blend, image_alpha);

//Damage Flash
if (flashAlpha > 0)
{
	shader_set(shFlash);
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashColor, flashAlpha);
	draw_sprite_ext(global.playerTopper, image_index, x, y, image_xscale, image_yscale, image_angle,flashColor, flashAlpha);
	draw_sprite_ext(global.playerRocket,image_index, x, y, image_xscale, image_yscale, image_angle,flashColor, flashAlpha);
	draw_sprite_ext(global.playerBelt, image_index, x, y, image_xscale, image_yscale, image_angle,flashColor, flashAlpha);
	shader_reset();
	
}
	
	
//Draw other parts of the sprite
	if(hasControl == true) //Animate only when player has control
	{
		if (flyUp == 1)  //Player is accerlating up
		{
		var _startFrames = sprite_get_number(global.playerPropelStart);
		var _runningFrames = sprite_get_number(global.playerPropelRunning);
		

			if(propelStart < _startFrames) //&& propelRunning == 0)
			{
				draw_sprite(global.playerPropelStart,propelStart, x-(9*sign(image_xscale)), y+32);
				propelStartCounter--;
				if(propelStartCounter < 0)
				{
					propelStart++;
					propelStartCounter = 3;
				}
				propelStart = min(propelStart,_startFrames);
			}
			else
			{
				if(propelRunning > _runningFrames)
				{
					propelRunning = 0	
				}
				draw_sprite(global.playerPropelRunning,propelRunning,x-(9*sign(image_xscale)), y+32);
				//if(propelRunning > _runningFrames)
				//{
				//	propelRunning = 0	
				//}
				propelRunningCounter--;
				if(propelRunningCounter < 0)
				{
					propelRunning++;
					propelRunningCounter = 3;
				}
			}
		}
	}
	
	if (flyUp != 1) // Player is no longer accelerating up
	{
		propelStart = 0;
		propelRunning = 0;
	}
	
//Debug drawing
if(global.debug == true)
{
	//Draw the collision line for enemy checks
	draw_set_color(c_yellow);
	draw_line(x,y, x+(100*sign(xSpeed)), y );
	draw_line(x, y, x, y+(100*sign(ySpeed)));
}