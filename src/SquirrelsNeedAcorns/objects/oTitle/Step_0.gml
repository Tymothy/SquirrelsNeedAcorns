/// @desc Insert description here
/// @desc Insert description here

if (bounceGoingDown == true)
{
	image_xscale = image_xscale + .002*bounceDist;
	image_yscale = image_yscale + .002*bounceDist;
}
else
{
	image_xscale = image_xscale - .002*bounceDist;
	image_yscale = image_yscale - .002*bounceDist;
}
bounceDist = bounceDist - .1;
if(bounceDist < 0)
{
	bounceDist = bounceDistInit;
	bounceGoingDown *= -1;
}