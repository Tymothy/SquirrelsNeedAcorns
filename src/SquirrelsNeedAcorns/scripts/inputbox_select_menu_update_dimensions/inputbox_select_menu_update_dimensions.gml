/// @description inputbox_select_menu_update_dimensions()
function inputbox_select_menu_update_dimensions() {

	    //physical
	    draw_set_font(SelectMenuFont);
	    SelectMenuTextHeight = string_height(string_hash_to_newline("Wp"));
    
	    SelectMenuWidth = 0;
	    for (i = 0; i < SelectMenuLength; i += 1)
	    {
	        if (SelectMenuItems[i, 4])
	        {
	            SelectMenuWidth += string_width(string_hash_to_newline(SelectMenuItems[i, 0]))+SelectMenuPadding*2;
	        }
	    }
	    SelectMenuHeight = SelectMenuTextHeight+(SelectMenuPadding*2);
    
	    SelectMenuX = round(-SelectMenuWidth/2);
	    SelectMenuY = (-SelectMenuOffsetY)-SelectMenuHeight;
    
	    var xx, lx;
	    xx = 0;
	    for (i = 0; i < SelectMenuLength; i += 1)
	    {
	        if (SelectMenuItems[i, 4])
	        {
	            //item left/right bounds
	            SelectMenuItems[i, 1] = round(SelectMenuPadding+xx);
	            SelectMenuItems[i, 2] = round(SelectMenuItems[i, 1]+string_width(string_hash_to_newline(SelectMenuItems[i, 0])));
            
	            //seperator positions
	            if (i > SelectMenuItemFirst)
	            {
	                SelectMenuItems[i, 3] = xx;
	            }
            
	            //move on
	            xx += string_width(string_hash_to_newline(SelectMenuItems[i, 0]))+(SelectMenuPadding*2);
	        }
	    }



}
