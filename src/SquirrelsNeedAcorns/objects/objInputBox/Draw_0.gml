/// @description draw inputbox

    var sel;
    sel = (CursorPosition != CursorSecondaryPosition);

    //rectangle
    draw_rectangle_sprite(x, y, Width, Height, sprInputBox, FillColour[InteractState], FillAlpha[InteractState]);
    
    //set font
    draw_set_font(Font);
    
    //get inputbox field ends
    var x1, y1, x2;
    x1 = x+OffsetX;
    y1 = y+OffsetY;
    x2 = (x+Width)-OffsetX;
    
    //surface for text
    surface_set_target(Surface);
    draw_clear_alpha(c_black, 0);
    
    //draw text relative to surface
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_colour(FontColour[InteractState]);
    draw_set_alpha(FontAlpha[InteractState]);
    
    var txthgt, txty;
    txthgt = string_height(string_hash_to_newline("Wp"));
    txty = ((Height-(OffsetY*2))/2)-(txthgt/2);
    
    draw_text(-Scroll, txty, string_hash_to_newline(Text))
    
    //cursors and selection
    if (Active)
    {
        //selection rectangle relative to surface
        if (sel)
        {
            //visuals
            draw_set_colour(CursorSelectColour[InteractState]);
            draw_set_alpha(CursorSelectAlpha[InteractState]);
            
            //workout cursor positions
            var curx1, curx2, minpos, maxpos;
            minpos = min(CursorPosition, CursorSecondaryPosition);
            maxpos = max(CursorPosition, CursorSecondaryPosition);
            curx1 = string_width(string_hash_to_newline(string_copy(Text, 0, minpos)))-Scroll;
            curx2 = string_width(string_hash_to_newline(string_copy(Text, 0, maxpos)))-Scroll;
            
            //draw selection rectangle
            draw_rectangle(curx1, txty, curx2, txty+txthgt, 0);
            
            //selected text relative to surface
            draw_set_colour(CursorSelectTextColour[InteractState]);
            draw_set_alpha(CursorSelectTextAlpha[InteractState]);
            var seltxt, seltxtx;
            seltxt = string_copy(Text, minpos+1, (maxpos-minpos));
            seltxtx = curx1;
            draw_text(seltxtx, txty, string_hash_to_newline(seltxt));
        }
    }    
       
    //reset
    surface_reset_target();
    
    //draw surface
    draw_surface(Surface, x1, y1);
    
    //cursor?
    var fls;
    if (sel)
    {
        if (CursorHandles) fls = 1; else fls = 0;
    }
    else fls = CursorFlash;
    
    if (!Active) fls = 0;
    
    //positions
    var cx1, cx2, curx1, curx2;
    cx1 = clamp(x1+string_width(string_hash_to_newline(string_copy(Text, 0, CursorPosition)))-Scroll, x1, x2);
    cx2 = clamp(x1+string_width(string_hash_to_newline(string_copy(Text, 0, CursorSecondaryPosition)))-Scroll, x1, x2);
    curx1 = min(cx1, cx2);
    curx2 = max(cx1, cx2);
    
    //draw cursor lines & handles
    if (fls)
    {
        //visuals
        draw_set_colour(CursorColour[InteractState]);
        draw_set_alpha(CursorAlpha[InteractState]);
        
        //first cursor
        var cy1, cy2;
        cy1 = round((y1+txty)-(CursorHandleOffset*CursorHandles));
        cy2 = round(y1+txty+txthgt);
        
        draw_line_width(curx1, cy1, curx1, cy2, CursorWidth);
        if (sel && CursorHandles) draw_sprite_ext(CursorHandleSprite, 0, round(curx1), cy1, 1, 1, 0, CursorColour[InteractState], CursorAlpha[InteractState]);
        
        //second cursor
        if (sel)
        {
            cy1 = round(y1+txty);
            cy2 = round((y1+txty+txthgt)+(CursorHandleOffset*CursorHandles));
            draw_line_width(curx2, cy1, curx2, cy2, CursorWidth);
            if (CursorHandles) draw_sprite_ext(CursorHandleSprite, 0, round(curx2), cy2, 1, 1, 0, CursorColour[InteractState], CursorAlpha[InteractState]);
        }
    }
    
    //menu
    if (SelectMenu && (!CursorHandleDrag[0] && !CursorHandleDrag[1]))
    {
        draw_set_font(SelectMenuFont);
        var mnucntx, mnux, mnuy;
        mnucntx = round(curx1+((curx2-curx1)/2));
        mnux = mnucntx+SelectMenuX;
        mnuy = y1+SelectMenuY;
        
        draw_set_colour(SelectMenuBackgroundColour);
        draw_set_alpha(SelectMenuBackgroundAlpha);
        draw_rectangle(mnux, mnuy, mnux+SelectMenuWidth, mnuy+SelectMenuHeight, 0);
        draw_sprite_ext(SelectMenuArrowSprite, 0, mnucntx, mnuy+SelectMenuHeight, 1, 1, 0, SelectMenuBackgroundColour, SelectMenuBackgroundAlpha);
        
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        
        var lx, ly1, ly2;
        for (i = 0; i < SelectMenuLength; i += 1)
        {
            if (SelectMenuItems[i, 4])
            {
                //text
                draw_set_colour(SelectMenuFontColour);
                draw_set_alpha(SelectMenuFontAlpha);
                draw_text(round(mnux+SelectMenuItems[i, 1]), round(mnuy+SelectMenuPadding), string_hash_to_newline(SelectMenuItems[i, 0]));
                
                if (SelectMenuSelected = i)
                {
                    draw_set_alpha(0.1);
                    draw_rectangle((mnux+SelectMenuItems[i, 1])-SelectMenuPadding, mnuy, mnux+SelectMenuItems[i, 2]+SelectMenuPadding, mnuy+SelectMenuHeight, 0);
                }
                
                //seperator
                if (i > SelectMenuItemFirst)
                {
                    draw_set_colour(SelectMenuSeperatorColour);
                    draw_set_alpha(SelectMenuSeperatorAlpha);
                    
                    lx = mnux+SelectMenuItems[i, 3];
                    ly1 = mnuy;
                    ly2 = mnuy+SelectMenuHeight;
                    draw_line_width(lx, ly1, lx, ly2, SelectMenuSeperatorWidth);
                }
            }
        }
    }
    
    //reset
    draw_set_alpha(1);

