


function texts_gui(_pos_x, _pos_y, _text, _size, _opacity = 1, _color = c_white, _halign = fa_center, _valign = fa_top){

	switch(_size) {
		case 117:
		
			draw_set_font(fnt_prosto_117);
			show_debug_message("Set font 117 for text {0}", _text);
			break;
		case 72:
			draw_set_font(fnt_prosto_72);
			show_debug_message("Set font 72 for text {0}", _text);
			break;
		case 48:
			draw_set_font(fnt_prosto_48);
			show_debug_message("Set font 48 for text {0}", _text);
			break;
		default:
			show_debug_message("Invalid size {0}", _size);
	}
		
	draw_set_halign(_halign);
	draw_set_valign(_valign);
	
	draw_set_alpha(_opacity);	
	draw_set_color(_color);
	draw_text(_pos_x, _pos_y - _size, _text);
	
	// Reset alpha
	draw_set_alpha(1);
}



function texts_gui_shadow(_pos_x, _pos_y, _text, _size, _opacity = 1, _color = c_white, _halign = fa_center, _valign = fa_top){

	switch(_size) {
		case 117:
		
			draw_set_font(fnt_prosto_117);
			show_debug_message("Set font 117 for text {0}", _text);
			break;
		case 72:
			draw_set_font(fnt_prosto_72);
			show_debug_message("Set font 72 for text {0}", _text);
			break;
		case 48:
			draw_set_font(fnt_prosto_48);
			show_debug_message("Set font 48 for text {0}", _text);
			break;
		default:
			show_debug_message("Invalid size {0}", _size);
	}
		
	draw_set_halign(_halign);
	draw_set_valign(_valign);
	draw_set_alpha(_opacity - 0.3);	
	
	draw_set_color(c_black);
	draw_text(_pos_x,  _pos_y - _size + 8, _text);
	
	draw_set_alpha(_opacity);	
	draw_set_color(_color);
	draw_text(_pos_x, _pos_y - _size, _text);
	
	// Reset alpha
	draw_set_alpha(1);
}