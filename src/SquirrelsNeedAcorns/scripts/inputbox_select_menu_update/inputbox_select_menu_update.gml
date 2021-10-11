/// @description inputbox_select_menu_update()    
function inputbox_select_menu_update() {
    
	    //detect selection
	    var sel, minpos, maxpos;
	    minpos = min(CursorPosition, CursorSecondaryPosition);
	    maxpos = max(CursorPosition, CursorSecondaryPosition);
	    sel = (CursorPosition != CursorSecondaryPosition);
    
	    if (sel)
	    {
	        if ((minpos = 0) && (maxpos = string_length(Text)))
	        {
	            SelectMenuItems[0, 4] = 0;
	            SelectMenuItems[1, 4] = 0;
	            SelectMenuItems[2, 4] = 1;
	            SelectMenuItems[3, 4] = 1;
	            SelectMenuItems[4, 4] = 1;
	            SelectMenuItemFirst = 2;
	        }
	        else
	        {
	            SelectMenuItems[0, 4] = 0;
	            SelectMenuItems[1, 4] = 1;
	            SelectMenuItems[2, 4] = 1;
	            SelectMenuItems[3, 4] = 1;
	            SelectMenuItems[4, 4] = 1;
	            SelectMenuItemFirst = 1;
	        }
	    }
	    else
	    {
	        SelectMenuItems[0, 4] = 1;
	        SelectMenuItems[1, 4] = 1;
	        SelectMenuItems[2, 4] = 0;
	        SelectMenuItems[3, 4] = 1;
	        SelectMenuItems[4, 4] = 0;
	        SelectMenuItemFirst = 0;
	    }
    
    



}
