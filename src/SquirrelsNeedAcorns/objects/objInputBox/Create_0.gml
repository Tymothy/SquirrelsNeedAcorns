/// @description initialise visuals

    //0 = idle | 1 = mouse hover | 2 = click | 3 = disabled
    InteractState = 0;
    
    //fill
    FillColour[0] = global.ColourWhite;
    FillAlpha[0] = 1;
        FillColour[1] = c_white;
        FillAlpha[1] = 1;
        FillColour[2] = c_white;
        FillAlpha[2] = 1;
        FillColour[3] = c_gray;
        FillAlpha[3] = 1;
    
    //font
    Font = global.InputBoxFont;
    
    FontColour[0] = global.ColourBlack;
    FontAlpha[0] = 1;
        FontColour[1] = global.ColourBlack;
        FontAlpha[1] = 1;
        FontColour[2] = global.ColourBlack;
        FontAlpha[2] = 1;
        FontColour[3] = c_dkgray;
        FontAlpha[3] = 1;
    
    //textbox margins
    OffsetX = 16;
    OffsetY = 5;
    
    //flashing cursor
    CursorColour[0] = global.ColourBlue;
    CursorAlpha[0] = 1;
        CursorColour[1] = CursorColour[0];
        CursorAlpha[1] = 1;
        CursorColour[2] = CursorColour[0];
        CursorAlpha[2] = 1;
        CursorColour[3] = CursorColour[0];
        CursorAlpha[3] = 1;
        
    CursorWidth = 3;
    CursorFlashSpeed = 24;
    CursorAlarm = CursorFlashSpeed;
    CursorFlash = 0;
    
    //selection and selected text
    CursorSelectColour[0] = CursorColour[0];
    CursorSelectAlpha[0] = 0.6;
        CursorSelectColour[1] = CursorColour[0];
        CursorSelectAlpha[1] = 0.6;
        CursorSelectColour[2] = CursorColour[0];
        CursorSelectAlpha[2] = 0.6;
        CursorSelectColour[3] = CursorColour[0];
        CursorSelectAlpha[3] = 0.6;
        
    CursorSelectTextColour[0] = FontColour[0];
    CursorSelectTextAlpha[0] = 1;
        CursorSelectTextColour[1] = FontColour[0];
        CursorSelectTextAlpha[1] = 1;
        CursorSelectTextColour[2] = FontColour[0];
        CursorSelectTextAlpha[2] = 1;
        CursorSelectTextColour[3] = FontColour[0];
        CursorSelectTextAlpha[3] = 1;
        
    //handles
    CursorHandleSprite = sprInputBoxMobileHandle;
    CursorHandleRadius = 10;
    CursorHandleOffset = 10;
    
    //menu
    SelectMenuArrowSprite = sprInputBoxMobileMenuArrow;
    

///initialise physical attributes

    //width and height
    Width = sprite_get_width(sprite_index)*image_xscale;
    Height = sprite_get_height(sprite_index)*image_yscale;

///initialise functional variables

    //active?
    Active = 0;
    Disabled = 0;
    
    //text
    Text = "";
    
    //2 cursor positions for selecting
    CursorPosition = string_length(Text);
    CursorSecondaryPosition = string_length(Text);
    CursorDrag = 0;
    CursorHandles = 0;
    
    //select when dragging?
    CursorDragSelect = 1;
    
    //cursor handle interaction
    CursorHandleGrab = 0;
    CursorSecondaryHandleGrab = 0;
    CursorHandleHover[0] = 0;
    CursorHandleHover[1] = 0;
    CursorHandleDrag[0] = 0;
    CursorHandleDrag[1] = 0;
    
    //double click
    DoubleClickTimer = -1;
    DoubleClickDelay = 20;
    DoubleClickX = mouse_x;
    
    //scrolling
    Scroll = 0;
    ScrollMaximum = 0;
    
    //surface
    Surface = surface_create(Width-(OffsetX*2), Height-(OffsetY*2));
    
    //hold down
    HoldDownTimer = -1;
    HoldDownDelay = 40;
    HoldDownX = mouse_x;
    HoldDown = 0;

///initialise select menu
    
    SelectMenuEnabled = 0;
    SelectMenu = 0;
    
    SelectMenuItems[0, 0] = "Select";
    SelectMenuItems[1, 0] = "Select All";
    SelectMenuItems[2, 0] = "Copy";
    SelectMenuItems[3, 0] = "Paste";
    SelectMenuItems[4, 0] = "Cut";
    
    SelectMenuLength = array_height_2d(SelectMenuItems);
    
    SelectMenuBackgroundColour = global.ColourWhite;
    SelectMenuBackgroundAlpha = 1;
    SelectMenuFont = fntMenu;
    SelectMenuFontColour = global.ColourBlack;
    SelectMenuFontAlpha = 1;
        
    SelectMenuPadding = 11;
    SelectMenuOffsetY = 18;
    
    SelectMenuSeperatorColour = global.ColourBlack;
    SelectMenuSeperatorAlpha = 0.5;
    SelectMenuSeperatorWidth = 2;
    
    //functional
    SelectMenuSelected = -1;
    
    //update
    inputbox_select_menu_update();
    
    //physical
    inputbox_select_menu_update_dimensions();

///initialise history

    //undo/redo stacks
    History0 = ds_stack_create();
    History1 = ds_stack_create();
    ds_stack_push(History0, Text);

