/// @description initialise visuals

    //0 = idle | 1 = mouse hover | 2 = click | 3 = disabled
    
    //fill
    FillColour[0] = global.ColourBlue;
    FillAlpha[0] = 1;
        FillColour[1] = merge_colour(FillColour[0], c_white, 0.1);
        FillAlpha[1] = 1;
        FillColour[2] = merge_colour(FillColour[0], c_black, 0.1);
        FillAlpha[2] = 1;
        FillColour[3] = c_gray;
        FillAlpha[3] = 1;
    
    //font
    Font = global.ButtonFont;
    
    FontColour[0] = global.ColourWhite;
    FontAlpha[0] = 1;
        FontColour[1] = global.ColourWhite;
        FontAlpha[1] = 1;
        FontColour[2] = global.ColourWhite;
        FontAlpha[2] = 1;
        FontColour[3] = c_dkgray;
        FontAlpha[3] = 1;
    

///initialise physical attributes

    //width and height
    Width = sprite_get_width(sprite_index)*image_xscale;
    Height = sprite_get_height(sprite_index)*image_yscale;

///initialise functional variables
    
    //text
    Text = "";
    
    //disabled
    Disabled = 0;
    
    //action script
    ActionScript = -1;

