/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;

ttl--;
if(ttl <= 0)
{
	instance_destroy();
}