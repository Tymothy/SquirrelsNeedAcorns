



	dispX = global.GUIww * .5;
	dispY = global.GUIhh * .95;
	margin = global.GUIhh *.01; //Margin between sprite and words


	var _spriteX = stringW / 2 + margin;
	var _spriteY = dispY;

	var _textX = dispX;
	var _textY = dispY;

	draw_set_font(fTextNormal);
	draw_set_valign(fa_center);
	draw_set_halign(fa_middle);

	draw_sprite_ext(sprite, 0, dispX - _spriteX, _spriteY, xScale, yScale, image_angle, image_blend, image_alpha);
	draw_text_outline(_textX, _textY, text, c_black, c_ltgray);
	draw_sprite_ext(sprite, 0, dispX + _spriteX, _spriteY, xScale, yScale, image_angle, image_blend, image_alpha);
