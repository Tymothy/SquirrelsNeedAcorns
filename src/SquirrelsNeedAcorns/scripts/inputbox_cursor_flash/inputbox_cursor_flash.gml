/// @description inputbox_cursor_flash() 
function inputbox_cursor_flash() {
    
	    //update cursor flashing
	    CursorAlarm -= 1;
	    if (CursorAlarm = 0)
	    {
	        CursorFlash = !CursorFlash;
	        CursorAlarm = CursorFlashSpeed;
	    }



}
