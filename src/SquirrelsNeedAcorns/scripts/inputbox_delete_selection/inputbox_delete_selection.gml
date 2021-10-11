/// @description inputbox_delete_selection(id)
/// @param id
function inputbox_delete_selection(argument0) {

	    with (argument0)
	    {
	        if (CursorPosition != CursorSecondaryPosition)
	        {
	            var minpos, maxpos;
	            minpos = min(CursorPosition, CursorSecondaryPosition);
	            maxpos = max(CursorPosition, CursorSecondaryPosition);
	            Text = string_delete(Text, minpos+1, maxpos-minpos);
	            CursorPosition = minpos;
	            CursorSecondaryPosition = minpos;
	        }
	    }



}
