


var _startBinding = input_binding_get("start");
var _restartBinding = input_binding_get("restart");

var _startString = _startBinding.toString();// "start";
var _restartString = _restartBinding.toString(); // "R";

/*if (input_binding_is_valid(_startBinding))
{
    //If the binding is valid, use its name
    _startString = input_binding_get_name(_startBinding);
}

if (input_binding_is_valid(_restartBinding))
{
    //If the binding is valid, use its name
    _restartString = input_binding_get_name(_restartBinding);
}*/

// show_debug_message("start: {0}, restart: {1}", _startString, _restartString);


glow_progress += (pi * glow_speed);
// Ensure we don't go further pi, because it's a negative slope
if(glow_progress > pi) {
	glow_progress -= pi;	
}
var _opacity = sin(glow_progress) * glow_intensity;




if(room == rmPongPlay) {

	textsDraw(544, 64, score_player, 48, 0.8);
	textsDraw(736, 64, score_enemy, 48, 0.8);
}

if(room == rmPongGameover) {



	if(score_enemy > score_player) {
		oYouWonLose.sprite_index = sPongYouLose;	
	} else {
		oYouWonLose.sprite_index = sPongYouWon;
	}

	textsDrawShadow(30, scoreVertical, "Your Score", 24, 1, c_yellow, fa_left);	
	textsDrawShadow(scoreHorizontal, scoreVertical, score_player, 24, 1, c_yellow, fa_right);
	
	textsDrawShadow(30, scoreVertical + scoreVerticalOffset, "Enemy Score", 24, 1, c_yellow, fa_left);	
	textsDrawShadow(scoreHorizontal, scoreVertical + scoreVerticalOffset, score_enemy, 24, 1, c_yellow, fa_right);
	
	textsDrawShadow(30, scoreVertical + (scoreVerticalOffset * 2), "Pass", 24, 1, c_yellow, fa_left);	
	textsDrawShadow(scoreHorizontal, scoreVertical + (scoreVerticalOffset * 2), score_pass, 24, 1, c_yellow, fa_right);
	
	//textsDraw(_horizontal_center, room_height - 48, "Press " + _restartString + " to reset", 48, _opacity);

}

var _menuVerticalRender = room_height - verticalTier;
var _menuSizeRender =  48 * 1.5;

if(optionsLayoutSmall) {
	draw_set_font(fProsto24);
	_menuVerticalRender = (scoreVerticalOffset * 4) + scoreVertical;
	_menuSizeRender = scoreVerticalOffset;
} else {
	draw_set_font(fProsto48);
}

menu.render(horizontalCenter, _menuVerticalRender,_menuSizeRender, true);

