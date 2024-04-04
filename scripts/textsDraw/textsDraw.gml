function resetTexts() {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_set_alpha(1.0);	
	draw_set_color(c_white);
}


function textsDraw(_posX, _posY, _text, _size, _opacity = 1, _color = c_white, _halign = fa_center, _valign = fa_top){

	resetTexts();
	switch(_size) {
		case 24:
		
			draw_set_font(fProsto24);

			break;
		case 72:
			draw_set_font(fProsto72);

			break;
		case 48:
			draw_set_font(fProsto48);

			break;
		default:
			show_debug_message("Invalid size {0}", _size);
	}
		
	draw_set_halign(_halign);
	draw_set_valign(_valign);
	
	draw_set_alpha(_opacity);	
	draw_set_color(_color);
	draw_text(_posX, _posY - _size, _text);
	
	resetTexts();
}



function textsDrawShadow(_posX, _posY, _text, _size, _opacity = 1, _color = c_white, _halign = fa_center, _valign = fa_top){

	resetTexts();

	switch(_size) {
		case 24:
		
			draw_set_font(fProsto24);

			break;
		case 72:
			draw_set_font(fProsto72);

			break;
		case 48:
			draw_set_font(fProsto48);

			break;
		default:
			show_debug_message("Invalid size {0}", _size);
	}
		
	draw_set_halign(_halign);
	draw_set_valign(_valign);
	draw_set_alpha(_opacity - 0.3);	
	
	draw_set_color(c_black);
	draw_text(_posX,  _posY - _size + 8, _text);
	
	draw_set_alpha(_opacity);	
	draw_set_color(_color);
	draw_text(_posX, _posY - _size, _text);
	
	resetTexts();
}