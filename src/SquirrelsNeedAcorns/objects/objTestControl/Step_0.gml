/// @description set cursor

    var chk1, chk2;
    chk1 = 0;
    chk2 = 0;
    
    //check all textboxes
    with (objInputBox)
    {
        if (in_bounds(mouse_x, mouse_y, x, y, x+Width, y+Height))
        {
           chk1 += 1;
        }
        if (CursorHandleHover[0] || CursorHandleHover[1] || CursorHandleDrag[0] || CursorHandleDrag[1])
        {
           chk2 += 1;
        }
    }
    
    //change cursor
    var cur;
    cur = cr_default
    if (chk1) cur = cr_beam; 
    if (chk2) cur = cr_handpoint; 
    
    if (cur != window_get_cursor()) window_set_cursor(cur); 


