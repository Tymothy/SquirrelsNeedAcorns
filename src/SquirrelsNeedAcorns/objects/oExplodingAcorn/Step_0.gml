/// @description Insert description here
// You can write your code in this editor
if(active == false)
{
	//Acorn has been touched, start exploding animation
	sprite_index = sExplodingAcornExplode
}


//Run explosion animation then delete the instance


if (image_speed > 0 && sprite_index == sExplodingAcornExplode)
{
    if image_index > image_number - 1 instance_destroy();
}