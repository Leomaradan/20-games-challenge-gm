resetTexts();
// draw_set_font(fProsto24);
// draw_set_color(c_black);

var _startX = RES_W * 0.5;
var _startY = RES_H * 0.5
var _size = 48;

// draw_set_halign(fa_right);
menu.render(_startX/* - 20*/, _startY, _size, false, true, false, c_black);
draw_set_halign(fa_left);

for (var _i = 0; _i < array_length(displayOptions); _i++) {

			var _current = displayOptions[_i];
			var _opacity = 1.0;
			
			var _optionValue = _current[0]();
			
			 if(is_bool(_optionValue)) {
				 _optionValue = _optionValue ? 1 : 0;
			 }
			
			var _print = "";
			
			if(is_string(_optionValue)) {
				_print = translate(struct_get(_current[1], _optionValue));
			} else {
				_print = translate(_current[1][_optionValue]);
			}

			if (_i == menu.optionSelected) {
				_opacity = 1;
			} else {
				_opacity = 0.7;
			}
			
			var _offsetY = _startY + (_i * _size);
			
			draw_set_alpha(_opacity);
			draw_set_color(c_black);

			draw_text(_startX + 20, _offsetY, _print);
			draw_set_alpha(1.0);
		}