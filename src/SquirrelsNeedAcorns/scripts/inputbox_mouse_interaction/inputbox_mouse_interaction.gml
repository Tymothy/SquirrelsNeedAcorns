/// @description inputbox_mouse_interaction()
function inputbox_mouse_interaction() {

	    var inbox, inmnu, inh1, inh2;
    
	    inbox = in_bounds(mouse_x, mouse_y, x, y, x+Width, y+Height);
	    inmnu = (inputbox_select_menu_hover() && SelectMenu);
    
	    CursorHandleHover[0] = 0;
	    CursorHandleHover[1] = 0;
    
	    //if selection
	    if (CursorSecondaryPosition != CursorPosition)
	    {
	        if (CursorHandles)
	        {       
	            //positions
	            var x1, y1, x2;
	            x1 = x+OffsetX;
	            y1 = y+OffsetY;
	            x2 = (x+Width)-OffsetX;
            
	            var cx1, cx2, curx1, curx2;
	            cx1 = clamp(x1+string_width(string_hash_to_newline(string_copy(Text, 0, CursorPosition)))-Scroll, x1, x2);
	            cx2 = clamp(x1+string_width(string_hash_to_newline(string_copy(Text, 0, CursorSecondaryPosition)))-Scroll, x1, x2);
	            curx1 = min(cx1, cx2);
	            curx2 = max(cx1, cx2);
            
	            var txthgt, txty;
	            txthgt = string_height(string_hash_to_newline("Wp"));
	            txty = ((Height-(OffsetY*2))/2)-(txthgt/2);
    
	            cy1 = round((y1+txty)-(CursorHandleOffset*CursorHandles));
	            cy2 = round((y1+txty+txthgt)+(CursorHandleOffset*CursorHandles));
            
	            var rad;
	            rad = CursorHandleRadius;
            
	            CursorHandleHover[0] = point_distance(mouse_x, mouse_y, curx1, cy1) < CursorHandleRadius;
	            CursorHandleHover[1] = point_distance(mouse_x, mouse_y, curx2, cy2) < CursorHandleRadius; 
	        }
	    }
    
	    //clicking
	    if (inbox || inmnu)
	    {
	        if (inbox)
	        {
	            //click
	            if (mouse_check_button_pressed(mb_left))
	            {
	                //activate inputbox
	                if (!Active)
	                {
	                    Active = 1;
	                    keyboard_lastkey = -1;
	                    keyboard_lastchar = "";
	                }
                
	                //reset hold down
	                HoldDownTimer = HoldDownDelay;
	                HoldDownX = mouse_x;
                
	                if (CursorHandleHover[0] || CursorHandleHover[1])
	                {
	                    if (CursorHandleHover[0])
	                    {
	                         CursorHandleDrag[0] = 1;
	                    }
	                    if (CursorHandleHover[1])
	                    {
	                         CursorHandleDrag[1] = 1;
	                    }
	                }
	                else
	                {
	                    //reposition text cursor
	                    CursorDrag = 1;
	                    CursorPosition = string_find_position_x(Text, x+OffsetX, mouse_x+Scroll, 0);
	                    CursorSecondaryPosition = CursorPosition;
                    
	                    //hide menu
	                    SelectMenu = 0;
                                    
	                    //reset flashing
	                    CursorAlarm = CursorFlashSpeed;
	                    CursorFlash = 1;
                        
	                    //single or double click?
	                    if (DoubleClickTimer = -1)
	                    {                
	                        //single click, setup double click check
	                        DoubleClickTimer = DoubleClickDelay;
	                        DoubleClickX = mouse_x;
	                    }
	                    else
	                    {
	                        //perform double click, find word endpoints
	                        var pos;
	                        pos = string_find_word_endpoints(Text, CursorPosition)
	                        CursorPosition = pos[0];
	                        CursorSecondaryPosition = pos[1];
                            
	                        //no drag
	                        CursorDrag = 0;
                       
	                        //show menu
	                        if (SelectMenuEnabled) SelectMenu = 1;
                        
	                        //reset double click
	                        DoubleClickTimer = -1;
	                    }
	                }
	            }
	        }
	    }
	    else
	    {
	        //click
	        if (mouse_check_button_pressed(mb_left))
	        {
	            //deactivate inputbox
	            Active = 0;
            
	            //close menu
	            SelectMenu = 0;
	        }
	    }
    
	    //end holdown
	    if (mouse_check_button(mb_left))
	    {
	        if (mouse_x = HoldDownX)
	        {
	            if (HoldDownTimer = 0)
	            {
	                //show menu
	                if (SelectMenuEnabled) SelectMenu = 1;
               
	                //reset holddown
	                HoldDownTimer = -1;
	            }
	        }
	        else HoldDownTimer = -1;
	    }
	    else HoldDownTimer = -1;
    
	    //selecting
	    if (CursorDrag && mouse_check_button(mb_left))
	    {
	        CursorSecondaryPosition = string_find_position_x(Text, x+OffsetX, mouse_x+Scroll, 0);
	        if (!CursorDragSelect) CursorPosition = CursorSecondaryPosition;
	    }
	    else CursorDrag = 0;
    
	    //cursor handle dragging
	    if (CursorHandleDrag[0] || CursorHandleDrag[1])
	    {
	        var orient, pt;
	        orient = (CursorPosition<CursorSecondaryPosition);
	        pt = string_find_position_x(Text, x+OffsetX, mouse_x+Scroll, 0);
	        if (CursorHandleDrag[0])
	        {
	            if (orient = 1) 
	            {
	                CursorPosition = min(pt, CursorSecondaryPosition-1);
	            }
	            else
	            {
	                CursorSecondaryPosition = min(pt, CursorPosition-1);
	            }
	        }
	        if (CursorHandleDrag[1])
	        {
	            if (orient = 1) 
	            {
	                CursorSecondaryPosition = max(pt, CursorPosition+1);
	            }
	            else
	            {
	                CursorPosition = min(pt, CursorSecondaryPosition+1);
	            }
	        }
        
	        //release
	        if (!mouse_check_button(mb_left)) 
	        {
	            CursorHandleDrag[0] = 0;
	            CursorHandleDrag[1] = 0;
	        }
	    }
    
	    //update double click timer
	    if (DoubleClickTimer > -1) DoubleClickTimer -= 1;
	    if (DoubleClickX != mouse_x) DoubleClickTimer = -1;
    
	    //update hold down timer
	    if (HoldDownTimer > -1) HoldDownTimer -= 1;
    
	    //deactivate correctly if unfocused
	    if (!Active)
	    {
	        CursorPosition = 0;
	        CursorSecondaryPosition = 0;
	    }



}
