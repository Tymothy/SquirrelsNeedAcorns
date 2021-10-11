/// @description draw example texts

    var txt;
    switch (room)
    {
        case romTest1:
            txt = "Welcome to Input Box.##Edit the text below, it should feel exactly like an inputbox on Windows or Mac.#"
            txt += "You can type, select, delete, and manipulate the text in all usual ways."
            break;
        case romTest2:
            txt = "This is a mobile styled Input Box!##Selection handles & cursor dragging."
            break;
        case romTest3:
            txt = "There's also a built in onscreen menu for many input box functions,#try it below in this mobile styled Input Box."
            break;
        case romTest4:
            txt = "Also supports undo/redo!"
            break;
    }
    
    draw_set_font(fntHUD);
    draw_set_colour(global.ColourWhite);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text(64, 64, string_hash_to_newline(txt));
    draw_set_halign(fa_left);

