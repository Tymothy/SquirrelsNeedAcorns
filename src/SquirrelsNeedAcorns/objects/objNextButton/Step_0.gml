/// @description go to the next room

    if (mouse_check_button_pressed(mb_left) && in_bounds(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) room_goto_next();

