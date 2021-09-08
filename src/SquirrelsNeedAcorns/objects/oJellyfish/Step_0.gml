/// @description Jellyfish step
// You can write your code in this editor
if(live_call()) return live_result;
//Move towards target
if(global.pause == false)
{
	switch(state)
	{
		case state.idle:
				moveSomewhere();
				state = state.moving;
//				pStartX = x;
				pStartY = y;
				pTimer = 0;
				break;
			
		case state.moving:
			//var _direction = point_direction(x,y,targX,targY);
			//x = x + lengthdir_x(moveSpeed, _direction);
			//y = y + lengthdir_y(moveSpeed, _direction);	
			
			pTimer++;
//			x = twerp(TwerpType.inout_cubic, pStartX, targX, pTimer / pLength);
			var _beforeY = y;
			y = twerp(TwerpType.inout_quad, pStartY, targY, pTimer / pLength);
			var _afterY = y;
			if (pTimer == pLength)
			{
				state = state.idle;	
			}

			break;
	
	}
}
//if(x == targX && y == targY)
//{
//	moveSomewhere();	
//}
//else
//{
//	var _direction = point_direction(x,y,targX,targY);
//	x = x + lengthdir_x(moveSpeed, _direction);
//	y = y + lengthdir_y(moveSpeed, _direction);

//}