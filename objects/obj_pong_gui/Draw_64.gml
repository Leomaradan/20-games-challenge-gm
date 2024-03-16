var _horizontal_center = room_width / 2;

glow += (pi * glow_speed);
// Ensure we don't go further pi, because it's a negative slope
if(glow > pi) {
	glow -= pi;	
}
var _opacity = sin(glow) * glow_intensity;

show_debug_message("opacity {0}, glow {1}", _opacity, glow);
	
if(room == rm_pong_start) {

	var _vertical_tier = room_height / 3;

	texts_gui_shadow(_horizontal_center, _vertical_tier, "PONG", 117);	
	texts_gui(_horizontal_center, room_height - _vertical_tier, "Press any key to start", 48, _opacity);

}


if(room == rm_pong) {

	texts_gui(544, 64, obj_pong.score_player, 48, 0.8);
	texts_gui(736, 64, obj_pong.score_enemy, 48, 0.8);
}

if(room == rm_pong_gameover) {

	var _vertical_tier = room_height / 3;
	var _score_vertical =  (_vertical_tier * 2) - 48;
	var _score_vertical_offset = 48 * 1.5;

	texts_gui_shadow(_horizontal_center, 150, "Game Over", 117);	
	texts_gui_shadow(_horizontal_center, _vertical_tier, "You Won", 72);
	
	texts_gui_shadow(50, _score_vertical, "Your Score", 48, 1, c_yellow, fa_left);	
	texts_gui_shadow(room_width - 50, _score_vertical, obj_pong.score_player, 48, 1, c_yellow, fa_right);
	
	texts_gui_shadow(50, _score_vertical + _score_vertical_offset, "Enemy Score", 48, 1, c_yellow, fa_left);	
	texts_gui_shadow(room_width - 50, _score_vertical + _score_vertical_offset, obj_pong.score_enemy, 48, 1, c_yellow, fa_right);
	
	texts_gui_shadow(50, _score_vertical + (_score_vertical_offset * 2), "Pass", 48, 1, c_yellow, fa_left);	
	texts_gui_shadow(room_width - 50, _score_vertical + (_score_vertical_offset * 2), obj_pong.score_pass, 48, 1, c_yellow, fa_right);
	texts_gui_shadow(room_width - 50, _score_vertical + (_score_vertical_offset * 2), obj_pong.score_pass, 48, 1, c_yellow, fa_right);
	
	texts_gui(_horizontal_center, room_height - 48, "Press R to reset", 48, _opacity);

}
