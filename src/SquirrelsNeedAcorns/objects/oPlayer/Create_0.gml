/// @desc Insert description here
if(live_call()) return live_result;

//Level Variables
//Old values, before resolution change
flyUpPowerEVar = 2.6;
pushPowerEVar = 1.5;
planetGravityEVar = 1.2;
playerDeathFrictionEVar = 5;
planetFrictionEVar = .9; //Higher is more friction



//Editable Variables
bounceStrengthEVar = 2;
worldSpeedEVar = .1; //0 to 1, lower is slower  Was .1
ySpeedKillEVar = 70;
xSpeedKillEVar = 70;
engineFuelUsage = 2;
playerHealth = 3;
invulnTimer = 50;
alive = true;

//Cargo
pointsOnPlayer = 0;
fuelMax = 1500; //Default 1500
fuel = 1500; //Default 1500;

   
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

global.lastGameRoom = room;
