/// @description Insert description here
// You can write your code in this editor

//From the amount of drops, find how many degrees each so the acorns spread evenly
var _spread = 360/dropCount;


var _pointArray;
for(i = 0; i < dropCount; i++)
{
		var _angle = _spread * i;
		_angle = _angle * pi/180; //Convert degrees to radians to use in functions
		//irandom_range(dropDistance-dropDistance*.2,dropDistance+dropDistance*.2))
		var _targetX = dropDistance * cos(_angle);
		var _targetY = dropDistance * sin(_angle);
	
	_pointArray[i] = instance_create_layer(x+_targetX,y+_targetY,"Pickups", oPointPickup);
	with(_pointArray[i])
	{
	moveTowardsPlayer = true;
	}
}
audio_play_sound(sound_pickup_special, 90, false);