/// @description string_find_character_x(string, x, px)
/// @param string
/// @param  x
/// @param  px
function string_find_character_x(argument0, argument1, argument2) {

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
    
	    if (a = b) return string_copy(argument0, a, 1);
	    a1 = argument1+string_width(string_hash_to_newline(string_copy(argument0, 0, a)));
	    b1 = argument1+string_width(string_hash_to_newline(string_copy(argument0, 0, b)));
    
	    if (abs(argument2-a1) < abs(b1-argument2)) return string_copy(argument0, a, 1); else return string_copy(argument0, b, 1);;



}
