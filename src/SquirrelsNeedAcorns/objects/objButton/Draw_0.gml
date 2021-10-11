/// @description draw button

    //fill
    col = FillColour[InteractState];
    alp = FillAlpha[InteractState];
    
    //corners
    var partw, parth;
    partw = sprite_get_width(sprButton);
    parth = sprite_get_height(sprButton);
    var xx, yy, wdt, hgt;
    xx = round(x);
    yy = round(y);
    wdt = round(Width);
    hgt = round(Height);
    draw_sprite_ext(sprButton, 0, xx, yy, 1, 1, 0, col, alp);
    draw_sprite_ext(sprButton, 1, xx+(wdt-partw), yy, 1, 1, 0, col, alp);
    draw_sprite_ext(sprButton, 2, xx, yy+(hgt-parth), 1, 1, 0, col, alp);
    draw_sprite_ext(sprButton, 3, xx+(wdt-partw), yy+(hgt-parth), 1, 1, 0, col, alp);
    
    //body
    var part1xsc, part1ysc, part2xsc, part2ysc;
    part1xsc = wdt/partw;
    part1ysc = (hgt-(parth*2))/parth;
    part2xsc = (wdt-(partw*2))/partw;
    part2ysc = hgt/parth;
    draw_sprite_ext(sprButton, 4, xx, yy+parth, part1xsc, part1ysc, 0, col, alp);
    draw_sprite_ext(sprButton, 4, xx+partw, yy, part2xsc, part2ysc, 0, col, alp);
    
    //set font
    draw_set_font(Font)
    draw_set_halign(fa_middle);
    draw_set_valign(fa_middle);
    
    draw_set_colour(FontColour[InteractState]);
    draw_set_alpha(FontAlpha[InteractState]);
    
    draw_text(xx+round(wdt/2), yy+round(hgt/2), string_hash_to_newline(Text));
    
    //reset
    draw_set_alpha(1);
    

