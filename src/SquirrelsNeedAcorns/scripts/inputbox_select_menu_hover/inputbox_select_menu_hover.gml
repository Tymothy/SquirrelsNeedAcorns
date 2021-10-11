/// @description inputbox_select_menu_hover()    
function inputbox_select_menu_hover() {
    
	    //get inputbox field ends
	    var x1, y1, x2;
	    x1 = x+OffsetX;
	    y1 = y+OffsetY;
	    x2 = (x+Width)-OffsetX;
    
	    //set font
	    draw_set_font(Font)
    
	    //cursor positions
	    var cx1, cx2, curx1, curx2;
	    cx1 = clamp(x1+string_width(string_hash_to_newline(string_copy(Text, 0, CursorPosition)))-Scroll, x1, x2);
	    cx2 = clamp(x1+string_width(string_hash_to_newline(string_copy(Text, 0, CursorSecondaryPosition)))-Scroll, x1, x2);
	    curx1 = min(cx1, cx2);
	    curx2 = max(cx1, cx2);
    
	    //menu
	    var y1, mnucntx, mnux, mnuy;
	    y1 = y+OffsetY;
	    mnucntx = round(curx1+((curx2-curx1)/2));
	    mnux = mnucntx+SelectMenuX;
	    mnuy = y1+SelectMenuY;

	    //test mouse hover
	    return in_bounds(mouse_x, mouse_y, mnux, mnuy, mnux+SelectMenuWidth, mnuy+SelectMenuHeight)



}
