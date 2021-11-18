/// @desc Player Create
if(live_call()) return live_result;

//Level Variables
//Old values, before resolution change
flyUpPowerEVar = 3.4; 
pushPowerEVar = 2.5;
planetGravityEVar = 2; 
playerDeathFrictionEVar = 5;
planetFrictionEVar = .9; //Higher is more friction
airResist = .00; //No resistance at 0


//Editable Variables
bounceStrengthEVar = 2;
worldSpeedEVar = .1; //0 to 1, lower is slower  Was .1
ySpeedKillEVar = 7000;
xSpeedKillEVar = 7000;
engineFuelUsage = 2;
playerHealth = 3;
invulnTimer = 50;
alive = true;

//Cargo
pointsOnPlayer = 0;
fuelMax = 1500; //Default 1500
fuel = fuelMax; //Set fuel to full on start

   
//Static Movement Variables
moveLeft = 0;
moveRight = 0;
flyUp = 0;
hasControl = false;
ySpeed = 0;
xSpeed = 0;
prevYSpeed = 0;
prevXSpeed = 0;
pushPower = pushPowerEVar * worldSpeedEVar;
flyUpPower = flyUpPowerEVar * worldSpeedEVar;
planetGravity = planetGravityEVar * worldSpeedEVar;
planetFriction = planetFrictionEVar * worldSpeedEVar;
planetFrictionInit = planetFriction;
playerDeathFriction = playerDeathFrictionEVar * worldSpeedEVar;
bounceStrength = bounceStrengthEVar * worldSpeedEVar;
bounceStrengthInit = bounceStrength;
ySpeedKill = ySpeedKillEVar * worldSpeedEVar;
xSpeedKill = xSpeedKillEVar * worldSpeedEVar;
yCollision = false;
xCollision = false;
invuln = false;
applyXBounce = false;
applyYBounce = false;
invulnCount = invulnTimer;
playerMoved = false;
bonusSpeedPower = 0;
bonusSpeedTime = 0;
bonusMul = 0;
rocketPickedUp = false;
//Bonus Speed
pTimer = 0;
pLength = room_speed * 2;
pStart = 50;
pEnd = 150;
pStartX = x;
pStartY = y;
bonusSpeedX = 0;
bonusSpeedY = 0;


//Tilemap Collision
tilemapCollision = true; //True for tilemap collision, false for object collision
tilemapId = layer_tilemap_get_id(layer_get_id("tsWalls"));
tilemapGridWidth = 32;
tilemapGridHeight = 32;
ySpeedTemp = 0;
ySpeedFloat = 0;
xSpeedTemp = 0;
xSpeedFloat = 0;

//Background Visibility

//Other Variables
fireStarted = 0; //Used to start the fire sound when flying


flashAlpha = 0;
flashColor = c_red;
flashDecrement = 0;

//Animation Variables
propelStart = 0;
propelRunning = 0;
propelStartCounter = 3;
propelRunningCounter = 3;

//Intializing variables
global.lastGameRoom = room;
playerMiddle = 0;
playerCenter = 0;
collisionSide = "";
enemyCollideAttribute = -1;

//Applying level effects to player
switch (global.levelSelectArray[global.selectedLevel].levelType)
{
	case LEVELTYPE.MOUNTAINS : 
		planetGravityEVar = planetGravityEVar * 1;
		airResist = .005;
	break;
	
	case LEVELTYPE.WATER : 
		planetGravityEVar = planetGravityEVar * .75;
		airResist = .008;
	break;
	
	case LEVELTYPE.SPACE : 
		planetGravityEVar = planetGravityEVar * .4;
		airResist = .003;
		flyUpPowerEVar *= .6; 
		pushPowerEVar *= .6;
	break;
}

if(instance_exists(oFuelGauge) == false)
{
	instance_create_depth(x, y, 102, oFuelGauge);	
}

if(instance_exists(oHealthPoints) == false)
{
	instance_create_depth(x, y, 101, oHealthPoints);	
}

if(instance_exists(oWatcher) == false)
{
	show_debug_message("Creating oWatcher");
	instance_create_layer(x, y, layer, oWatcher);
}