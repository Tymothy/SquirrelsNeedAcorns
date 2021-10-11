/// @description inputbox_paste()    
function inputbox_paste() {
    
	    //add text from clipboard
	    var clptxt;
	    clptxt = clipboard_get_text()
	    Text = string_insert(clptxt, Text, CursorPosition+1);
	    CursorPosition += string_length(clptxt);
	    CursorSecondaryPosition = CursorPosition;
    



}
