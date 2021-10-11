/// @description string_find_word_endpoints(string, pos)
/// @param string
/// @param  pos
function string_find_word_endpoints(argument0, argument1) {

	    //check if we are selecting a space
	    if (string_copy(argument0, argument1, 1) = " ")
	    {
	        //for spaces
	        var apos, bpos;
	        apos = clamp(argument1, 0, string_length(argument0));
	        bpos = apos;
        
	        //find endpoints of selection
	        while (string_copy(argument0, apos, 1) = " ") 
	        {
	            apos -= 1;
	            if (apos <= 0) break;
	        }
	        while (string_copy(argument0, bpos+1, 1) = " ") 
	        {
	            bpos += 1;
	            if (bpos >= string_length(argument0)) break;
	        }
        
	        //return endpoints
	        var ary;
	        ary[0] = apos;
	        ary[1] = bpos;
	        return ary;
	    }
	    else
	    {
	        //symbols 
	        if (string_copy(argument0, argument1, 1) != string_lettersdigits(string_copy(argument0, argument1, 1)))
	        {
	            //for symbols
	            var apos, bpos;
	            apos = clamp(argument1, 0, string_length(argument0));
	            bpos = apos;
            
	            //find endpoints of selection
	            while (string_copy(argument0, apos, 1) != string_lettersdigits(string_copy(argument0, apos, 1))) 
	            {
	                apos -= 1;
	                if (apos <= 0) break;
	            }
	            while (string_copy(argument0, bpos+1, 1) != string_lettersdigits(string_copy(argument0, bpos+1, 1))) 
	            {
	                bpos += 1;
	                if (bpos >= string_length(argument0)) break;
	            }
            
	            //return endpoints
	            var ary;
	            ary[0] = apos;
	            ary[1] = bpos;
	            return ary;
	        }
	        else
	        {
	            //for words/numbers
	            var apos, bpos;
	            apos = clamp(argument1, 0, string_length(argument0));
	            bpos = apos;
            
	            //find endpoints of selection
	            while (string_copy(argument0, apos, 1) = string_lettersdigits(string_copy(argument0, apos, 1))) 
	            {
	                apos -= 1;
	                if (apos <= 0) break;
	            }
	            while (string_copy(argument0, bpos+1, 1) = string_lettersdigits(string_copy(argument0, bpos+1, 1))) 
	            {
	                bpos += 1;
	                if (bpos >= string_length(argument0)) break;
	            }
            
	            //return endpoints
	            var ary;
	            ary[0] = apos;
	            ary[1] = bpos;
	            return ary;
	        }
	    }
    



}
