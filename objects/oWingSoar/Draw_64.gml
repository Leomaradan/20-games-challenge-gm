
//var _text = "X: " + string(GUI_MOUSE_X_NORMALIZED) + ", Y: " + string(GUI_MOUSE_Y_NORMALIZED)
//textsDraw(544, 64, _text, 48, 0.8);


if(room == rWingSoarPlay) {

	textsDrawShadow(1152, 64, playerScore, 48, 0.8);
}

if(room == rFlappyBirdGameOver) {


	ini_open(SAVE);
	var _highscore = ini_read_real("flappy", "highscore", 0);
	
	if(playerScore > _highscore) {
		_highscore = playerScore;
		ini_write_real("flappy", "highscore", _highscore);
	}
	
	ini_close();


	textsDrawShadow(30, scoreVertical, "gameoverYourScore", 24, 1, c_yellow, fa_left);	
	textsDrawShadow(scoreHorizontal, scoreVertical, playerScore, 24, 1, c_yellow, fa_right);
	
	textsDrawShadow(30, scoreVertical + scoreVerticalOffset, "gameoverHighScore", 24, 1, c_yellow, fa_left);	
	textsDrawShadow(scoreHorizontal, scoreVertical + scoreVerticalOffset, _highscore, 24, 1, c_yellow, fa_right);
	
}

// var _menuVerticalRender = room_height * 0.5;
// var _menuSizeRender =  48 * 1.5;


// draw_set_font(fProsto48);


// menu.render(horizontalCenter, _menuVerticalRender,_menuSizeRender, true);

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

