/// @description inputbox_randomise()
function inputbox_randomise() {

	    with (objInputBox)
	    {
	        //fill
	        FillColour[0] = make_colour_hsv(random(255), random_range(128, 255), random_range(128, 255));
	        FillAlpha[0] = 1;
	            FillColour[1] = merge_colour(FillColour[0], c_white, 0.1);
	            FillAlpha[1] = 1;
	            FillColour[2] = merge_colour(FillColour[0], c_black, 0.1);
	            FillAlpha[2] = 1;
	            FillColour[3] = c_gray;
	            FillAlpha[3] = 1;
        
	        //font
	        Font = choose(fntInputBox, fntInput2, fntInput3, fntInput4);
            
	        FontColour[0] = make_colour_hsv(random(255), random(128), random(128));
	        FontAlpha[0] = 1;
	            FontColour[1] = merge_colour(FontColour[0], c_white, 0.1);
	            FontAlpha[1] = 1;
	            FontColour[2] = merge_colour(FontColour[0], c_black, 0.1);
	            FontAlpha[2] = 1;
	            FontColour[3] = c_dkgray;
	            FontAlpha[3] = 1;
        
            
	        //textbox margins
	        OffsetX = random_range(5, 16);
	        OffsetY = random_range(5, 16);
        
	        //flashing cursor
	        CursorColour[0] = make_colour_hsv(random(255), random(255), random(255));
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
	    }



}
