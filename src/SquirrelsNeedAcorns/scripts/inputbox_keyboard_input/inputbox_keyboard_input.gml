/// @description inputbox_keyboard_interaction()
function inputbox_keyboard_input() {

	    //detect selection
	    var sel;
	    sel = (CursorPosition != CursorSecondaryPosition);
    
	    //is the inputbox awake?
	    if (Active)
	    {       
	        //perform key actions
	        if ((keyboard_lastkey != -1) && (keyboard_lastkey != ord("#")))
	        {            
	            //detect control or shift
	            var keycheck;
	            keycheck = keyboard_check(vk_shift)-keyboard_check(vk_control);
	            if ((!keyboard_check(vk_shift)) && (!keyboard_check(vk_control))) keycheck = -2;
            
	            //find which key is pressed
	            switch (keyboard_lastkey)
	            {
	                //home --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	                case vk_home:
	                    CursorPosition = 0;
	                    CursorSecondaryPosition = CursorPosition;
                   
	                    //reset flashing
	                    CursorAlarm = CursorFlashSpeed;
	                    CursorFlash = 1;
	                    break;
                    
	                //end --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	                case vk_end:
	                    CursorPosition = string_length(Text);
	                    CursorSecondaryPosition = CursorPosition;
                   
	                    //reset flashing
	                    CursorAlarm = CursorFlashSpeed;
	                    CursorFlash = 1;
	                    break;
                    
	                //left --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	                case vk_left:
	                    if (sel && (keycheck = -2))
	                    {
	                        //jump to left of selection
	                        var minpos;
	                        minpos = min(CursorPosition, CursorSecondaryPosition);
	                        CursorPosition = minpos;
	                        CursorSecondaryPosition = minpos;
	                    }
	                    else
	                    {
	                        //going just left one space or to end of word?
	                        var newpos;
	                        if (keycheck = -1)
	                        {
	                            var pos;
	                            pos = string_find_word_endpoints(Text, CursorPosition);
	                            newpos = pos[0];
	                        }
	                        else newpos = clamp(CursorSecondaryPosition-1, 0, string_length(Text));
                        
	                        //move cursor
	                        CursorSecondaryPosition = newpos;
	                        if (keycheck != 1) CursorPosition = CursorSecondaryPosition;
	                    }
                   
	                    //reset flashing
	                    CursorAlarm = CursorFlashSpeed;
	                    CursorFlash = 1;
	                    break;
                
	                //right --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	                case vk_right:
	                    if (sel && (keycheck = -2))
	                    {
	                        //jump to right of selection
	                        var maxpos;
	                        maxpos = max(CursorPosition, CursorSecondaryPosition);
	                        CursorPosition = maxpos;
	                        CursorSecondaryPosition = maxpos;
	                    }
	                    else
	                    {
	                        //going just right one space or to end of word?
	                        var newpos;
	                        if (keycheck = -1)
	                        {
	                            var pos;
	                            pos = string_find_word_endpoints(Text, CursorPosition+1); 
	                            newpos = pos[1];
	                        }
	                        else newpos = clamp(CursorSecondaryPosition+1, 0, string_length(Text));
                        
	                        //move cursor
	                        CursorSecondaryPosition = newpos;
	                        if (keycheck != 1) CursorPosition = CursorSecondaryPosition;
	                    }
                    
	                    //reset flashing
	                    CursorAlarm = CursorFlashSpeed;
	                    CursorFlash = 1;
	                    break;
                    
	                //backspace --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	                case vk_backspace:
	                    if (sel)
	                    {
	                        //find selected text and delete it
	                        inputbox_delete_selection(id);
	                    }
	                    else
	                    {
	                        if (keycheck = -1)
	                        {
	                            //find the left of the word
	                            var pos;
	                            pos = string_find_word_endpoints(Text, CursorSecondaryPosition)
                                            
	                            //delete word to left
	                            Text = string_delete(Text, pos[0], CursorSecondaryPosition-pos[0]);
	                            CursorPosition = pos[0];
	                            CursorSecondaryPosition = CursorPosition;
	                        }
	                        else
	                        {
	                            //delete character to left
	                            Text = string_delete(Text, CursorPosition, 1);
	                            CursorPosition -= 1;
	                            CursorSecondaryPosition = CursorPosition;
	                        }
	                    }
                    
	                    //reset flashing
	                    CursorAlarm = CursorFlashSpeed;
	                    CursorFlash = 1;
                    
	                    //push to history stack
	                    ds_stack_push(History0, Text);
	                    ds_stack_clear(History1);
	                    break;
                
	                //delete  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	                case vk_delete:
	                    if (sel)
	                    {
	                        //find selected text and delete it
	                        inputbox_delete_selection(id);
	                    }
	                    else
	                    {
	                        if (keycheck = -1)
	                        {
	                            //find the right of the word
	                            var pos;
	                            pos = string_find_word_endpoints(Text, CursorSecondaryPosition)
                                            
	                            //delete word to right
	                            Text = string_delete(Text, CursorSecondaryPosition, pos[1]-CursorSecondaryPosition);
	                            CursorPosition = pos[1];
	                            CursorSecondaryPosition = CursorPosition;
	                        }
	                        else
	                        {
	                            //delete character to right
	                            Text = string_delete(Text, CursorPosition+1, 1);
	                        }
	                    }
                
	                    //push to history stack
	                    ds_stack_push(History0, Text);
	                    ds_stack_clear(History1);
                    
	                    //reset flashing
	                    CursorAlarm = CursorFlashSpeed;
	                    CursorFlash = 1;
                    
	                    //update check
	                    chk = 1;
	                    break;
                    
	                //enter  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	                case vk_enter:
	                    if (sel)
	                    {
	                        //find selected text and delete it
	                        inputbox_delete_selection(id);
	                    }
	                    break;
                    
	                //others (letters numbers symbols etc, need special treatment cause they are either actions or typing) --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	                default:
	                    //check
	                    var chk;
	                    chk = 0;
                    
	                    //select all -------------------------------------------------------------------------------------------------------------------------------------------------------
	                    if (keyboard_lastkey = ord("A"))
	                    {
	                        if (keycheck = -1)
	                        {
	                            //select all
	                            CursorPosition = 0;
	                            CursorSecondaryPosition = string_length(Text);
	                            sel = 1;
                            
	                            //push to history stack
	                            ds_stack_push(History0, Text);
	                            ds_stack_clear(History1);
                            
	                            //update check
	                            chk = 1;
	                        }
	                    } 
                    
	                    //copy -------------------------------------------------------------------------------------------------------------------------------------------------------  
	                    if (keyboard_lastkey = ord("C"))
	                    {
	                        if (keycheck = -1)
	                        {
	                            //copy
	                            if (sel)
	                            {
	                                //find selected text and add it to clipboard
	                                var seltxt, minpos, maxpos;
	                                minpos = min(CursorPosition, CursorSecondaryPosition);
	                                maxpos = max(CursorPosition, CursorSecondaryPosition);
	                                seltxt = string_copy(Text, minpos+1, maxpos-minpos);
	                                clipboard_set_text(seltxt);
                                
	                                //reset flashing
	                                CursorAlarm = CursorFlashSpeed;
	                                CursorFlash = 1;
                                
	                                //update check
	                                chk = 1;
	                            }
	                        }
	                    }
                    
	                    //paste -------------------------------------------------------------------------------------------------------------------------------------------------------
	                    if (keyboard_lastkey = ord("V"))
	                    {
	                        if (keycheck = -1)
	                        {
	                            //paste
	                            if (clipboard_has_text())
	                            {
	                                if (sel)
	                                {
	                                    //find selected text and delete it
	                                    inputbox_delete_selection(id);
	                                }
                                
	                                //add text from clipboard
	                                var clptxt;
	                                clptxt = clipboard_get_text()
	                                Text = string_insert(clptxt, Text, CursorPosition+1);
	                                CursorPosition += string_length(clptxt);
	                                CursorSecondaryPosition = CursorPosition;
                                
	                                //push to history stack
	                                ds_stack_push(History0, Text);
	                                ds_stack_clear(History1);
                                
	                                //reset flashing
	                                CursorAlarm = CursorFlashSpeed;
	                                CursorFlash = 1;
                                
	                                //update check
	                                chk = 1;
	                            }
	                        }
	                    }
                    
	                    //cut -------------------------------------------------------------------------------------------------------------------------------------------------------
	                    if (keyboard_lastkey = ord("X"))
	                    {
	                        if (keycheck = -1)
	                        {
	                            if (sel)
	                            {
	                                //find selected text and add it to clipboard
	                                var seltxt, minpos, maxpos;
	                                minpos = min(CursorPosition, CursorSecondaryPosition);
	                                maxpos = max(CursorPosition, CursorSecondaryPosition);
	                                seltxt = string_copy(Text, minpos+1, maxpos-minpos);
	                                clipboard_set_text(seltxt);
                                
	                                //find selected text and delete it
	                                inputbox_delete_selection(id);
                                
	                                //push to history stack
	                                ds_stack_push(History0, Text);
	                                ds_stack_clear(History1);
                                
	                                //reset flashing
	                                CursorAlarm = CursorFlashSpeed;
	                                CursorFlash = 1;
                                
	                                //update check
	                                chk = 1;
	                            }
	                        }
	                    }
                    
	                    //undo -------------------------------------------------------------------------------------------------------------------------------------------------------
	                    if (keyboard_lastkey = ord("Z"))
	                    {
	                        if (keycheck = -1)
	                        {
	                            //if there is enough history
	                            if (ds_stack_size(History0) > 1)
	                            {
	                                //update history
	                                var t1, t2;
	                                t1 = ds_stack_top(History0);
	                                ds_stack_push(History1, t1)
                                
	                                ds_stack_pop(History0);
	                                t2 = ds_stack_top(History0);
                                
	                                //use text from history
	                                Text = t2;
                                
	                                //reset flashing
	                                CursorAlarm = CursorFlashSpeed;
	                                CursorFlash = 1;
                        
	                                //update check
	                                chk = 1;
	                            }
	                        }
	                    }
                    
	                    //redo -------------------------------------------------------------------------------------------------------------------------------------------------------
	                    if (keyboard_lastkey = ord("Y"))
	                    {
	                        if (keycheck = -1)
	                        {
	                            //if there is enough history
	                            if (ds_stack_size(History1) > 1)
	                            {
	                                //update history
	                                var t;
	                                t = ds_stack_pop(History1);
	                                ds_stack_push(History0, t)
                                
	                                //use text from future
	                                Text = t;
                                
	                                //update check
	                                chk = 1;
	                            }
	                        }
	                    }
                    
	                    //if keypress is not an action, type! -------------------------------------------------------------------------------------------------------------------------------------------------------
	                    if (chk != 1)
	                    {
	                        //if there's text to place
	                        if (string_length(keyboard_lastchar) != 0)
	                        {
	                            if (sel)
	                            {
	                                //find selected text and delete it
	                                inputbox_delete_selection(id);
	                            }
                            
	                            //add last pressed character
	                            Text = string_insert(keyboard_lastchar, Text, CursorPosition+1);
	                            CursorPosition += 1;
	                            CursorSecondaryPosition = CursorPosition;
                            
	                            //push to history stack
	                            ds_stack_push(History0, Text);
	                            ds_stack_clear(History1);
                            
	                            //reset flashing
	                            CursorAlarm = CursorFlashSpeed;
	                            CursorFlash = 1;
	                        }
	                    }
	                    break;
	            }
            
	            //reset key variables for use in next step
	            keyboard_lastkey = -1;
	            keyboard_lastchar = "";
	        }
	    }



}
