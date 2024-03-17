ResetTexts();
draw_set_font(fProsto24);

for(var _i = 0; _i < array_length(options); _i++) {
	var _print = "";
	
	var _option = options[_i];

	if(_i == optionSelected) {
		_print += "> " + _option[0] + " <";
	} else {
		_print += _option[0];	
		// draw_set_alpha(0.7);
	}
	
	if(_option[1] == undefined) {
		draw_set_alpha(0.7);
	}
	
	draw_text(RES_W * 0.5, RES_H * 0.5 + (_i * 48), _print);
	draw_set_alpha(1.0)
}