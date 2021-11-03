/// @desc Player Step

if(live_call()) return live_result;
var _paused = oPause.paused;
damageObstacle = false; //If set to true, apply damage


if(oGameGUI.gameTimer > 0.0 && oPause.paused == false) //Remove all player control if timer runs out
	{
	#region //Player movement
	
		#region Premovement checks
		if (fuel > 1) //Player found fuel
		{
			hasControl = true;
			alive = true;
		}
		#endregion
	
	moveLeft = keyboard_check(vk_left) || keyboard_check(ord("A")) + oGameGUI.moveLeft;
	moveRight = keyboard_check(vk_right) || keyboard_check(ord("D")) + oGameGUI.moveRight;
	//flyUp = keyboard_check(ord("W")) || keyboard_check(vk_up) + oGameGUI.flyUp;
	flyUp = min(1,moveLeft + moveRight);

	//Remove control if player is dead
	if(playerHealth < 1 || oGameGUI.showCountDown != 0 || global.goalReached == true || fuel < 1)
	{
		hasControl = false;	
	}
	if (_paused == false)
	{	
		//Rocket boosting
		//TODO: Bug, multiple rockets seem to keep adding to speed in crease
	if(bonusSpeedPower > 0)
			{
				if(rocketPickedUp == true)
				{
					show_debug_message("Rocket power applied");
					if(pTimer != 0)
					{
						show_debug_message("Rocket picked up while under rocket power");
						bonusSpeedTime += pTimer; //Add additional time to end of rocket to account for the bonus rocket time
					}
					rocketPickedUp = false;
				}
				//if(pTimer == 0)
				//{
					//First frame of the rocket
					//Find which way the rocket will propel
					var _dir = point_direction(x, y, x + xSpeed, y + ySpeed);
					bonusSpeedX = lengthdir_x(bonusSpeedPower, _dir);
					bonusSpeedY = lengthdir_y(bonusSpeedPower, _dir);
				//}
				bonusMul = twerp(TwerpType.out_quad, 0, 1, pTimer / bonusSpeedTime);
				pTimer++;
		
				if(pTimer >= bonusSpeedTime)
				{
					//Last frame of the rocket
					bonusSpeedPower = 0;
					bonusSpeedTime = 0;
					pTimer = 0;
					bonusSpeedX = 0;
					bonusSpeedY = 0;
					bonusMul = 0;
					show_debug_message("Rocket power done");
				}
	
			xSpeedTemp += bonusMul * bonusSpeedX;
			ySpeedTemp += bonusMul * bonusSpeedY;

			}	
	}
		if(hasControl == true)
		{
			ySpeedTemp = (ySpeedTemp - (flyUp * flyUpPower));
			xSpeedTemp = (xSpeedTemp + (moveRight-moveLeft)* pushPower);
			if(global.gameOptions.fuelUse == true)
			{
				fuel = fuel - (flyUp*(engineFuelUsage)) - moveRight - moveLeft;
			}
		}
		//Environmental effects
		ySpeedTemp = ySpeedTemp + planetGravity;
		xSpeedTemp = lerp(xSpeedTemp, 0, airResist);
		ySpeedTemp = lerp(ySpeedTemp, 0, airResist);
		
	
	//Rocket boosting
	//TODO: Bug if another rocket is picked up while boosting, make sure player just has added time
	//At full rocket speed
	if(bonusSpeedPower > 0)
			{
				if(rocketPickedUp == true)
				{
					show_debug_message("Rocket power applied");
					rocketPickedUp = false;
				}
				//if(pTimer == 0)
				//{
					//First frame of the rocket
					//Find which way the rocket will propel
					var _dir = point_direction(x, y, x + xSpeed, y + ySpeed);
					bonusSpeedX = lengthdir_x(bonusSpeedPower, _dir);
					bonusSpeedY = lengthdir_y(bonusSpeedPower, _dir);
				//}
				bonusMul = twerp(TwerpType.out_quad, 0, 1, pTimer / bonusSpeedTime);
				pTimer++;
		
				if(pTimer >= bonusSpeedTime)
				{
					//Last frame of the rocket
					bonusSpeedPower = 0;
					bonusSpeedTime = 0;
					pTimer = 0;
					bonusSpeedX = 0;
					bonusSpeedY = 0;
					bonusMul = 0;
					show_debug_message("Rocket power done");
				}
	
			xSpeedTemp += bonusMul * bonusSpeedX;
			ySpeedTemp += bonusMul * bonusSpeedY;
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
	//Enemy Collision
	var _collideEnemy = oparEnemy;
	if (place_meeting(x+xSpeed,y, _collideEnemy) || (place_meeting(x,y+ySpeed, _collideEnemy)))
	{
		if(collisionSide == "")
		{
				
			if(collision_line(x, y, x+(100*sign(xSpeed)), y, _collideEnemy,false, true))
			{
				//show_debug_message("Enemy collided with horizontal line");
				if(xSpeed>0) collisionSide = "Left"; //Interacting with left side of enemy
				else collisionSide = "Right";
			}
			else
			{
				//show_debug_message("No enemy collided with horizontal line");
				if(ySpeed>0) collisionSide = "Top";
				else collisionSide = "Bottom";
			}
		
			if(collision_line(x, y, x, y+(100*sign(ySpeed)), _collideEnemy,false, true))
			{
				//show_debug_message("Enemy collided with horizontal line");
			}
			else
			{
				//show_debug_message("No enemy collided with horizontal line");			
			}
			show_debug_message("Enemy collision side: " + string(collisionSide));
		
			//Apply effects of collision
			with(instance_nearest(x,y, _collideEnemy))
			{
				active = false; //Collision has happened
				oneTimeRun = true; //Run the one time run method
				switch (other.collisionSide)
				{
					case "Top":
						other.enemyCollideAttribute = attributes.topCollide;
						break;
						
					case "Right":
						other.enemyCollideAttribute = attributes.rightCollide;
						break;
						
					case "Bottom":
						other.enemyCollideAttribute = attributes.botCollide;
						break;
						
					case "Left":
						other.enemyCollideAttribute = attributes.leftCollide;
						break;
						
					default:
						show_debug_message("THIS SHOULD NOT APPEAR, CHECK ENEMY COLLISION IN OPLAYER.STEP");
						break;
				}
				
				//If player should bounce
				if(other.enemyCollideAttribute == collideProperty.bounce)
				{
					switch (other.collisionSide)
					{
						case "Top":
							if(other.ySpeed > 0)
							{
								other.ySpeed = other.ySpeed * -.5;
							}
							else
							{
								other.ySpeed = 0;
							}
							
							other.ySpeed -= attributes.bounceStrength;
							other.ySpeedTemp = other.ySpeed;
							active = false;
							break;
							
						case "Right":
							if(other.xSpeed < 0)
							{
								other.xSpeed = other.xSpeed * -.5;
							}
							else
							{
								other.xSpeed = 0;
							}
							other.xSpeed -= attributes.bounceStrength;
							other.xSpeedTemp = other.xSpeed;
							active = false;					
							break;
						
						case "Bottom":
							if(other.ySpeed < 0)
							{
								other.ySpeed = other.ySpeed * .5;
							}
							else
							{
								other.ySpeed = 0;
							}
							
							other.ySpeed += attributes.bounceStrength;
							other.ySpeedTemp = other.ySpeed;
							active = false;
							break;
							break;
						
						case "Left":
							if(other.xSpeed > 0)
							{
								other.xSpeed = other.xSpeed * -.5
							}
							else
							{
								other.ySpeed = 0;
							}
							
							other.xSpeed -= attributes.bounceStrength;
							other.xSpeedTemp = other.xSpeed;
							active = false;					
							break;
					}
					
				}
				if(other.enemyCollideAttribute == collideProperty.push)
				{
					//Push away from the object
					var _dir = point_direction(x,y,other.x,other.y); //Gets the vector from collided object to player (we want to puch that way)
					other.xSpeed += lengthdir_x(attributes.pushStrength, _dir);
					other.ySpeed += lengthdir_y(attributes.pushStrength, _dir);
					other.xSpeedTemp = other.xSpeed;
					other.ySpeedTemp = other.ySpeed;
					if(attributes.damage == 1)
					{
						playerDamage();	
					}
					active = false;
				}
				if(other.enemyCollideAttribute == collideProperty.damage)
				{
					playerDamage();
					active = false;
				}
				
				if(other.enemyCollideAttribute == collideProperty.speedUp && active == true)
				{
					other.xSpeed = other.xSpeed * 1.5;
					other.ySpeed = other.ySpeed * 1.5;
					other.xSpeedTemp = other.xSpeed;
					other.ySpeedTemp = other.ySpeed;
					
					active = false;
					show_debug_message("Speed Up!");
				}
				
			}
		}
	
	}
	else
	{
		collisionSide = "";	
	}
	
					
	//Obstacle Collision
	var _collideObject = oparObstacle;
	if (place_meeting(x+xSpeed,y, _collideObject))
	{
		while(!place_meeting(x+sign(xSpeed), y, _collideObject))
		{
			x = x + sign(xSpeed);
		}
		xSpeed = 0;
		xSpeedTemp = 0;
		xCollision = true;
		damageObstacle = true;		
	}
	
	if (place_meeting(x,y+ySpeed, _collideObject))
	{
		while(!place_meeting(x, y+sign(ySpeed), _collideObject))
		{
			y = y + sign(ySpeed);
		}
		ySpeed = 0;
		ySpeedTemp = 0;
		yCollision = true;
		damageObstacle = true;
	}

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
		if((abs(yCollideSpeed) > ySpeedKill) || damageObstacle == true)
		{

			if(global.gameOptions.damage == true)
			{
				playerDamage();
			}
			
		}
	}
	
	if ((xCollision == true) && (invuln = false))
	{
		if((abs(xCollideSpeed) > xSpeedKill) || damageObstacle == true)
		{

			if(global.gameOptions.damage == true)
			{
				playerDamage();
			}
		}
	}
	

	//TODO: Remove this stuff to remove the flash since health has been removed
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



	#endregion

	#region //Objective Pickup Collision

	//Horizontal Collision
	if (place_meeting(x+xSpeed,y,oparPickup))
	{
		with(instance_nearest(x,y,oparPickup))
		{
			other.pointsOnPlayer += pointValue;
			other.fuel += fuelValue;
			other.playerHealth += lifeValue;
			other.bonusSpeedPower = speedPower;
			other.bonusSpeedTime = speedTime;
			if(speedPower > 0)
			{
				other.rocketPickedUp = true;	
			}
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
			other.playerHealth += lifeValue;
			other.bonusSpeedPower = speedPower;
			other.bonusSpeedTime = speedTime;
			if(speedPower > 0)
			{
				other.rocketPickedUp = true;	
			}
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
		if (moveLeft == 1)
		{
			image_xscale = -1;
		}
		
		if (moveRight == 1)
		{
			image_xscale = 1;
		}
		if (fireStarted == 0 && flyUp > 0)
		{
			audio_play_sound(soundFire, 10, true);
			fireStarted = 1;
		}
		
		if (flyUp > 0) 
		{
			audio_resume_sound(soundFire);
		}
	}
	
	if (flyUp == 0)
	{
		audio_pause_sound(soundFire);
	}

	if (oGameGUI.gameOver == 1)
	{
		audio_pause_sound(soundFire);
	}
	#endregion

}//End of game timer check

//Check to see when player moved.  Used to detect if player knows how to play
if(playerMoved == false && flyUp > 0)
{
	playerMoved = true;
}

	
//Add bonus speed





//Fix the subpixel movement stuttering
x = round(x);
y = round(y);
