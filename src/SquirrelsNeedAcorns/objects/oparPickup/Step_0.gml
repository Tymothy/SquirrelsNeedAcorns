/// @description Insert description here
// You can write your code in this editor
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

//Move towards player if true
if (moveTowardsPlayer == true)
{
	x = lerp(x,oPlayer.x,moveSpeed);
	y = lerp(y,oPlayer.y,moveSpeed);
	moveSpeed += .001;
}