/// @desc Insert description here

if (bounceGoingDown == true)
{
	y = y - bounceSpeed;
}
else
{
	y = y + bounceSpeed;	
}
bounceDist--;
if(bounceDist < 0)
{
	bounceDist = bounceDistInit;
	bounceGoingDown *= -1;
}