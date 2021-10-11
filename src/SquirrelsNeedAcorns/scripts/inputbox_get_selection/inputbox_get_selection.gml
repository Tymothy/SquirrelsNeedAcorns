/// @description inputbox_get_selection(id)
/// @param id
function inputbox_get_selection(argument0) {

	    if (argument0.CursorPosition != argument0.CursorSecondaryPosition)
	    {
	        var minpos, maxpos;
	        minpos = min(CursorPosition, CursorSecondaryPosition);
	        maxpos = max(CursorPosition, CursorSecondaryPosition);
	        return string_copy(Text, minpos+1, maxpos-minpos);
	    }
	    else return "";



}
