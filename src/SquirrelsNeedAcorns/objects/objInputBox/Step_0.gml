/// @description step setup

    draw_set_font(Font);
    
    //update surface
    if (!surface_exists(Surface))
    {
        Surface = surface_create(Width-(OffsetX*2), Height-(OffsetY*2));
    }

///mouse interaction

    inputbox_mouse_interaction();

///cursor flash counter

    //update cursor flashing
    inputbox_cursor_flash();

///keyboard interaction

    inputbox_keyboard_input();

///inputbox scrolling

    //text scroll
    var txtwdt, boxwdt;
    txtwdt = string_width(string_hash_to_newline(Text));
    boxwdt = (Width-(OffsetX*2));
    if (txtwdt > boxwdt)
    {
        ScrollMaximum = txtwdt-boxwdt;
    }
    else
    {
        ScrollMaximum = 0;
        Scroll = 0;
    }
    
    //scroll along with selection
    if (ScrollMaximum != 0)
    {
        //get x positions of secondary cursors
        var curx
        curx = (x+OffsetX)+string_width(string_hash_to_newline(string_copy(Text, 0, CursorSecondaryPosition)))-Scroll;
        
        //get inputbox field ends
        var x1, x2;
        x1 = x+OffsetX;
        x2 = (x+Width)-OffsetX;
        
        //scroll left using secondary position
        if (curx < x1) Scroll -= x1-curx;

        //scroll right using secondary position
        if (curx > x2) Scroll += curx-x2;
       
        //limit scrolling
        Scroll = clamp(Scroll, 0, ScrollMaximum)
    }

///menu interaction
    
    //detect selection
    var sel;
    sel = (CursorPosition != CursorSecondaryPosition);
    
    if (SelectMenu)
    {
        if (string_length(Text) = 0) SelectMenu = 0;
        
        //update
        inputbox_select_menu_update();
        inputbox_select_menu_update_dimensions();
        
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
        if (in_bounds(mouse_x, mouse_y, mnux, mnuy, mnux+SelectMenuWidth, mnuy+SelectMenuHeight))
        {
            SelectMenuSelected = -1;
            for (i = 0; i < SelectMenuLength; i += 1)
            {
                if (SelectMenuItems[i, 4])
                {
                    if ((mouse_x > (mnux+SelectMenuItems[i, 1]-SelectMenuPadding)) && (mouse_x < (mnux+SelectMenuItems[i, 2]+SelectMenuPadding)))
                    {
                        SelectMenuSelected = i;
                    }
                }
            }
        }
        else SelectMenuSelected = -1;
    }
    else SelectMenuSelected = -1;
    
    //function
    if (SelectMenuSelected != -1)
    {
        if (mouse_check_button_pressed(mb_left))
        {
            switch (SelectMenuSelected)
            {
                case 0:
                    //select word
                    var pos;
                    pos = string_find_word_endpoints(Text, CursorPosition)
                    CursorPosition = pos[0];
                    CursorSecondaryPosition = pos[1];
                        
                    //no drag
                    CursorDrag = 0;
                    break;
                    
                case 1:
                    //select all
                    CursorPosition = 0;
                    CursorSecondaryPosition = string_length(Text);
                    break;
                    
                case 2:
                    //copy
                    if (sel)
                    {
                        //copy
                        inputbox_copy();
                                    
                        //reset flashing
                        CursorAlarm = CursorFlashSpeed;
                        CursorFlash = 1;
                    }
                    break;
                    
                case 3:
                    //paste
                    if (clipboard_has_text())
                    {
                        if (sel)
                        {
                            //find selected text and delete it
                            inputbox_delete_selection(id);
                        }
                        
                        //paste
                        inputbox_paste();
                        
                        //push to history stack
                        ds_stack_push(History0, Text);
                        ds_stack_clear(History1);
                                    
                        //reset flashing
                        CursorAlarm = CursorFlashSpeed;
                        CursorFlash = 1;
                    }
                    break;
                    
                case 4:
                    if (sel)
                    {
                        //copy
                        inputbox_copy();
                        
                        //find selected text and delete it
                        inputbox_delete_selection(id);
                        
                        //push to history stack
                        ds_stack_push(History0, Text);
                        ds_stack_clear(History1);
                                    
                        //reset flashing
                        CursorAlarm = CursorFlashSpeed;
                        CursorFlash = 1;
                        break;
                    }
            }
        }
    }

///error checks

    //remove any new lines
    Text = string_replace_all(Text, @"
", "");
    Text = string_replace_all(Text, "#", "");
    Text = string_replace_all(Text, chr(13)+chr(10), "");
    Text = string_replace_all(Text, chr(13), "");
    Text = string_replace_all(Text, chr(15), "");
    Text = string_replace_all(Text, chr(10), "");

    //correct cursor
    CursorPosition = clamp(CursorPosition, 0, string_length(Text)); 
    CursorSecondaryPosition = clamp(CursorSecondaryPosition, 0, string_length(Text));
    
    
    //clear history if too much (cheap solution, stacks are very limited, if this system changes a better size regulation method can be added)
    if ((ds_stack_size(History0) > 30) || (ds_stack_size(History1) > 30))
    {
        ds_stack_clear(History0);
        ds_stack_clear(History1);
        ds_stack_push(History0, Text);
    }

