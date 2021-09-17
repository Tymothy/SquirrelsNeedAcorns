/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;
//draw_self();

//Draw sprites for player's rocket

//-xSpeed * 2.5;

draw_sprite_ext(global.rocketFins, image_index, x, y, image_xscale, image_yscale, playerAngle, image_blend, image_alpha);
draw_sprite_ext(global.rocketHull, image_index, x, y, image_xscale, image_yscale, playerAngle, image_blend, image_alpha);

//Draw fuel equal to fuel level
var _fuelIndex = ceil(fuel / fuelMax * 100 / (100/sprite_get_number(global.rocketFuelTank)));
_fuelIndex = sprite_get_number(global.rocketFuelTank) - _fuelIndex;
if(fuel < 5)
{
	_fuelIndex = 20;
}
//TODO: Provide more feedback when running out of fuel.  Bouncing fuel cells?
draw_sprite_ext(global.rocketFuelTank, _fuelIndex, x, y, image_xscale, image_yscale, playerAngle,image_blend, image_alpha);
draw_sprite_ext(global.rocketFuelLines, image_index, x, y, image_xscale, image_yscale, playerAngle,image_blend, image_alpha);
draw_sprite_ext(global.rocketThrusters.sprite, image_index, x, y, image_xscale, image_yscale, playerAngle,image_blend, image_alpha);
//Find the way the character should look
var _dir = point_direction(x, y, x+xSpeed, y+ySpeed);

//Handle direction character is looking
if(_dir > 1 && _dir <= 90) var _charIndex = 1;
else if(_dir > 90 && _dir <= 180 ) var _charIndex = 4;
else if(_dir > 180 && _dir <= 270 ) var _charIndex = 3;
else if(_dir > 270 && _dir < 360 ) var _charIndex = 2;
else var _charIndex = 0;// Not moving, look straight ahead

//Handle "bounciness" of character in cockpit.  Only bounce if player has noticeable speed.  Reduces stutter.
if(abs(xSpeed > 1)) var _xCharOff = -sign(xSpeed);
else var _xCharOff = 0;

if(abs(ySpeed > 1)) var _yCharOff = -sign(ySpeed);
else var _yCharOff = 0;

draw_sprite_ext(global.playerCharacter, _charIndex, x + _xCharOff, y + _yCharOff, image_xscale, image_yscale, playerAngle,image_blend, image_alpha);
draw_sprite_ext(global.rocketWindow, image_index, x, y, image_xscale, image_yscale, playerAngle,image_blend, image_alpha);


//draw_sprite_ext(global.playerTopper, image_index, x, y, image_xscale, image_yscale, image_angle,image_blend, image_alpha);
//draw_sprite_ext(global.playerShirt, image_index, x, y, image_xscale, image_yscale, image_angle,image_blend, image_alpha);
//draw_sprite_ext(global.playerRocket,image_index, x, y, image_xscale, image_yscale, image_angle,image_blend, image_alpha);
//draw_sprite_ext(global.playerBelt, image_index, x, y, image_xscale, image_yscale, image_angle,image_blend, image_alpha);

//Damage Flash
if (flashAlpha > 0)
{
	shader_set(shFlash);

	draw_sprite_ext(global.rocketFins, image_index, x, y, image_xscale, image_yscale, image_angle, flashColor, flashAlpha);
	draw_sprite_ext(global.rocketHull, image_index, x, y, image_xscale, image_yscale, image_angle, flashColor, flashAlpha);
	draw_sprite_ext(global.rocketFuelTank, image_index, x, y, image_xscale, image_yscale, image_angle, flashColor, flashAlpha);
	draw_sprite_ext(global.playerCharacter, image_index, x, y, image_xscale, image_yscale, image_angle, flashColor, flashAlpha);
	draw_sprite_ext(global.rocketWindow, image_index, x, y, image_xscale, image_yscale, image_angle, flashColor, flashAlpha);

	//draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashColor, flashAlpha);
	//draw_sprite_ext(global.playerTopper, image_index, x, y, image_xscale, image_yscale, image_angle,flashColor, flashAlpha);
	//draw_sprite_ext(global.playerRocket,image_index, x, y, image_xscale, image_yscale, image_angle,flashColor, flashAlpha);
	//draw_sprite_ext(global.playerBelt, image_index, x, y, image_xscale, image_yscale, image_angle,flashColor, flashAlpha);
	shader_reset();
	
}
	
	
//Draw other parts of the sprite
	if(hasControl == true) //Animate only when player has control
	{
		#region Old propel animation code
		/*
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
		*/
		#endregion
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