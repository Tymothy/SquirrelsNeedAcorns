/// @description Insert description here
// You can write your code in this editor
if(active == false)
{
	//Acorn has been touched, start exploding animation and sound
	sprite_index = sExplodingAcornExplode;
	if(oneTimeRun == true)
	{
		oneTimeRunFunc(); //Run explosion sound
	}
}



//Run explosion animation then delete the instance

if (image_speed > 0 && sprite_index == sExplodingAcornExplode)
{
    if image_index > image_number - 1 instance_destroy();
}