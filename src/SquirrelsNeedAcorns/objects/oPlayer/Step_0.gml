/// @desc Insert description here
var _paused = oPause.paused;
var _damageObstacle = false; //If set to true, apply damage

if(oGameGUI.gameTimer > 0.0 && oPause.paused == false) //Remove all player control if timer runs out
	{
	#region //Player movement
	moveLeft = keyboard_check(vk_left) || keyboard_check(ord("A")) + oGameGUI.moveLeft;
	moveRight = keyboard_check(vk_right) || keyboard_check(ord("D")) + oGameGUI.moveRight;
	//flyUp = keyboard_check(ord("W")) || keyboard_check(vk_up) + oGameGUI.flyUp;
	flyUp = min(1,moveLeft + moveRight);

	//Remove control if player is dead
	if(playerHealth < 1 || oGameGUI.showCountDown != 0)
	{
		hasControl = false;	
	}
	if (_paused == false)
	{	
		if(hasControl == true)
		{

			ySpeedTemp = (ySpeedTemp - (flyUp * flyUpPower));
			xSpeedTemp = (xSpeedTemp + (moveRight-moveLeft)* pushPower);
			if(global.gameOptions.fuelUse == true)
			{
				fuel = fuel - (flyUp*(engineFuelUsage)) - moveRight - moveLeft;
			}
		}
		ySpeedTemp = ySpeedTemp + planetGravity;
	}
	//Environment movement effects	
	#endregion

	#region Movement Restricting Collision Code
	if(tilemapCollision == true)
		{
		xSpeed = xSpeedTemp + xSpeedFloat;
		xSpeedFloat = xSpeed - floor(abs(xSpeed))*sign(xSpeed);
		xSpeed -= xSpeedFloat;

		ySpeed = ySpeedTemp + ySpeedFloat;
		ySpeedFloat = ySpeed - floor(abs(ySpeed))*sign(ySpeed);
		ySpeed -= ySpeedFloat;


		if(ySpeedTemp+ySpeedFloat <.05)
		{
			ySpeedFloat = 0;
		}
		if(xSpeedTemp+xSpeedFloat <.05)
		{
			xSpeedFloat = 0;
		}
		//if(yCollision = true)
		//{
		//	if (xSpeedTemp != 0){
		//		xSpeedTemp -= planetFriction*sign(xSpeed);
		//	}
		//	}
		//}
/*
	Arrays store clockwise, starting from top middle.
	Order collisionArray[
	0 = Top Right Y
	1 = Top Right X
	2 = Bottom Right X
	3 = Bottom Right Y
	4 = Bottom Left Y
	5 = Bottom Left X
	6 = Top Left X
	7 = Top Left Y
	]
		*/
		#region Create collisionArray
		if (tilemap_get_at_pixel(tilemapId, bbox_right, round(bbox_top + ySpeed)) == 0)
		{
			//Top Right Y
			collisionArray[0] = 0;
		} else {
		collisionArray[0] = 1;	 
		}
		 
		if (tilemap_get_at_pixel(tilemapId, round(bbox_right + xSpeed), bbox_top) == 0)
		{
		//Top Right X	 
			collisionArray[1] = 0;
		} else {
		collisionArray[1] = 1;	 
		}
		 
		if (tilemap_get_at_pixel(tilemapId, round(bbox_right + xSpeed), bbox_bottom) == 0)
		{
			//Bottom Right X
			collisionArray[2] = 0;
		} else {
		collisionArray[2] = 1;	 
		} 
		 
		if (tilemap_get_at_pixel(tilemapId, bbox_right, round(bbox_bottom + ySpeed)) == 0)
		{
			//Bottom Right Y
			collisionArray[3] = 0;
		} else {
		collisionArray[3] = 1;	 
		} 	 
		 
		if (tilemap_get_at_pixel(tilemapId, bbox_left, round(bbox_bottom+ ySpeed)) == 0)
		{
			//Bottom Left Y
			collisionArray[4] = 0;
		} else {
		collisionArray[4] = 1;	 
		}  
		 
		if (tilemap_get_at_pixel(tilemapId, round(bbox_left + xSpeed), bbox_bottom) == 0)
		{
		//Bottom Left X
			collisionArray[5] = 0;
		} else {
		collisionArray[5] = 1;	 
		} 
		if (tilemap_get_at_pixel(tilemapId, round(bbox_left + xSpeed), bbox_top) == 0)
		{
		//Top Left X	 
			collisionArray[6] = 0;
		} else {
		collisionArray[6] = 1;	 
		} 
		if (tilemap_get_at_pixel(tilemapId, bbox_left, round(bbox_top + ySpeed)) == 0)
		{
			//Top Left Y
			collisionArray[7] = 0;
		} else {
		collisionArray[7] = 1;	 
		} 
		#endregion
		//Grab current x/y speed values in case of collision
		var yCollideSpeed = ySpeed;
		var xCollideSpeed = xSpeed;
		//Prevent going up
		if(collisionArray[0] == 1 || collisionArray[7] == 1)
		{
			yCollision = true;
			if (ySpeed < 0)
			{
				ySpeed = 0;
				ySpeedTemp = 0;
			}
		}
		//Prevent going right
		if(collisionArray[1] == 1 || collisionArray[2] == 1)
		{
			xCollision = true;
			if (xSpeed > 0)
			{
				xSpeed = 0;
				xSpeedTemp = 0;
			}
		}
		//Prevent going down
		if(collisionArray[3] == 1 || collisionArray[4] == 1)
		{
			yCollision = true;
			if (ySpeed > 0)
			{
				ySpeed = 0;
				ySpeedTemp = 0;
			}
		}
		//Prevent going left
		if(collisionArray[5] == 1 || collisionArray[6] == 1)
		{
			xCollision = true;
			if (xSpeed < 0)
			{
				xSpeed = 0;
				xSpeedTemp = 0;
			}
		}	 
		if(yCollision == true)
		{
			if (xSpeed != 0){
				xSpeedTemp = xSpeedTemp - planetFriction*sign(xSpeed);				
				xSpeed = xSpeed - planetFriction*sign(xSpeed);
			}
			}
		}
	//Obstacle Collision
	if (place_meeting(x+xSpeed,y, oparCollision))
	{
		while(!place_meeting(x+sign(xSpeed), y, oparCollision))
		{
			x = x + sign(xSpeed);
		}
		xSpeed = 0;
		xSpeedTemp = 0;
		xCollision = true;
		_damageObstacle = true;		
	}
	
	if (place_meeting(x,y+ySpeed, oparCollision))
	{
		while(!place_meeting(x, y+sign(ySpeed), oparCollision))
		{
			y = y + sign(ySpeed);
		}
		ySpeed = 0;
		ySpeedTemp = 0;
		yCollision = true;
		_damageObstacle = true;
	}
	
	/*
	if (place_meeting(x+hsp,y,oWall))
		{
		while (!place_meeting(x+sign(hsp),y,oWall))
		{
		x = x +sign(hsp);
		}
		hsp = 0;
		}
		x = x + hsp;
	*/
	
		x += xSpeed;
		y += ySpeed;	
	#endregion

	#region //Controls and checks involving player vitals

	#region Bounce TODO Maybe use prevYspeed?
	if(yCollision == true) 
		{
			ySpeed = ySpeed * -1 / bounceStrength;
		}

	if(xCollision == true) 
		{
			xSpeed = xSpeed * -1 / bounceStrength;
		
		}
	#endregion

	#region Damage
	if ((yCollision == true) && (invuln = false))
	{
		if((abs(yCollideSpeed) > ySpeedKill) || _damageObstacle == true)
		{

			if(global.gameOptions.damage == true)
			{
				playerDamage();
			}
			ScreenShake(oCamera, 10, 30);
			flash_player(.8, c_red, invulnTimer);
			invuln = true;
		}
	}
	
	if ((xCollision == true) && (invuln = false))
	{
		if((abs(xCollideSpeed) > xSpeedKill) || _damageObstacle == true)
		{

			if(global.gameOptions.damage == true)
			{
				playerDamage();
			}
			ScreenShake(oCamera, 10, 30);
			flash_player(.8, c_red, invulnTimer);
			invuln = true;
		}
	}
	


	if(invuln == true)
	{
		invulnCount--;
		flashAlpha = flashAlpha - flashDecrement;
	}
	if(invulnCount == 0)
	{
		invuln = false;
		invulnCount = invulnTimer;
		flashAlpha = 0;
		flashDecrement = 0;
	}
	#endregion
	
	if (playerHealth < 1)
	{
		planetFriction = playerDeathFriction;	
		invuln = true; //Set to invuln so player can't go into negative hp.
	}

	if(playerHealth > 1)
	{
		planetFriction = planetFrictionInit;
	}
	//Remove control if out of fuel
	if (fuel < 1)
	{
		hasControl = false;
		alive = false;
	}

	if (fuel > 1)
	{
		hasControl = true;
		alive = true;
	}
	#endregion

	#region //Objective Pickup Collision

	//Horizontal Collision
	if (place_meeting(x+xSpeed,y,oparPickup))
	{
		with(instance_nearest(x,y,oparPickup))
		{
			other.pointsOnPlayer += pointValue;
			other.fuel += fuelValue;
			instance_destroy();
			//audio_play_sound(soundPickup,3,false);
		}	

	}

	//Vertical Collision
	if (place_meeting(x,y+ySpeed,oparPickup))
	{
		with(instance_nearest(x,y,oparPickup))
		{
			other.pointsOnPlayer += pointValue;
			other.fuel += fuelValue;
			instance_destroy();
			//audio_play_sound(soundPickup,3,false);
		}	

	}
	
	global.points = pointsOnPlayer;
	
	if (fuel > fuelMax)
	{
		fuel = fuelMax;
	}
	#endregion

	#region //Animation


	
if(hasControl == true)
{
	if (moveLeft == 1) image_xscale = -1;
	if (moveRight == 1) image_xscale = 1;
	if (fireStarted == 0 && flyUp > 0)
	{
		audio_play_sound(soundFire, 10, true);
		fireStarted = 1;
	}
	if (flyUp > 0) audio_resume_sound(soundFire);
	
}
if (flyUp == 0) audio_pause_sound(soundFire);
if (oGameGUI.gameOver == 1) audio_pause_sound(soundFire);
	#endregion

	#region

	#endregion
}//End of game timer check

//Check to see when player moved.  Used to detect if player knows how to play
if(playerMoved == false && flyUp > 0)
{
	playerMoved = true;
}

//Fix the subpixel movement stuttering
x = round(x);
y = round(y);