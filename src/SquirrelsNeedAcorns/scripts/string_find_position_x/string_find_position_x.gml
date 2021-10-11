/// @description string_find_position_x(string, x, px, round)
/// @param string
/// @param  x
/// @param  px
/// @param  round
function string_find_position_x(argument0, argument1, argument2, argument3) {
    
	    //find new text position cursor
	    var a, b, a1, b1;
	    for (i = 0; i <= string_length(argument0); i += 1)
	    {
	        if ((string_width(string_hash_to_newline(string_copy(argument0, 0, i))) > (argument2-argument1)) || (i = string_length(argument0)))
	        {
	            a = i;
	            b = max(i-1, 0);
	            break;
	        }
	    }
    
	    if (a = b) return a;
	    a1 = argument1+string_width(string_hash_to_newline(string_copy(argument0, 0, a)));
	    b1 = argument1+string_width(string_hash_to_newline(string_copy(argument0, 0, b)));
    
	    //return value rounded nearest or up/down
	    argument3 = sign(argument3);
	    switch (argument3)
	    {
	        case 0:
	            if (abs(argument2-a1) < abs(b1-argument2)) return a; else return b;
	            break;
	        case 1:
	            return a;
	            break;
	        case -1:
	            return b;
	            break;
	    }



}
