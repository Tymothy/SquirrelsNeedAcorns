/// @description inputbox_copy()    
function inputbox_copy() {
    
	    ///find selected text and add it to clipboard
	    var seltxt, minpos, maxpos;
	    minpos = min(CursorPosition, CursorSecondaryPosition);
	    maxpos = max(CursorPosition, CursorSecondaryPosition);
	    seltxt = string_copy(Text, minpos+1, maxpos-minpos);
	    clipboard_set_text(seltxt);



}
