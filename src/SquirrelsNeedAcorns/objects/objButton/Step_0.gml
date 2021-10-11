/// @description step setup

    draw_set_font(Font);

///mouse interaction

    //clicking
    if (in_bounds(mouse_x, mouse_y, x, y, x+Width, y+Height))
    {
        //click
        if (mouse_check_button_released(mb_left))
        {
            //perform action
            if (script_exists(ActionScript))
            {
                script_execute(ActionScript)
            }
        }
    }
    
    //update the interacted state
    InteractState = 0;
    if (in_bounds(mouse_x, mouse_y, x, y, x+Width, y+Height))
    {
        InteractState = 1;
        if (mouse_check_button(mb_left)) InteractState = 2;
    }
    if (Disabled) InteractState = 3;

