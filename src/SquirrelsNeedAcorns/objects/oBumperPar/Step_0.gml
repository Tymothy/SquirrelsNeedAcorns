/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;
if(active == false && image_speed == 0)
{
	//Acorn has been touched, start exploding animation
	image_speed = 1;
}


//Run explosion animation then delete the instance


if (image_speed > 0)
{
    if (image_index > image_number - 1)
	{
		active = true;
		image_index = 0;
		image_speed = 0;
	}
}

if(oneTimeRun == true)
{
	oneTimeRunFunc();
}