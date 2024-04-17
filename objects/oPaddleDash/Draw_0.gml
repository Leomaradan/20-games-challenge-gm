shockwaves_renderer_id.Render(oPostProcess.ppfx, view_camera[0]);

if(room == rPaddleDashPlay) {

	textsDrawRaw(544, 64, string(scorePlayer), 48, 0.8);
	textsDrawRaw(736, 64, string(scoreEnemy), 48, 0.8);
}

if(room == rPaddleDashGameover) {



	/* if(score_enemy > score_player) {
		oYouWonLose.sprite_index = sPongYouLose;	
	} else {
		oYouWonLose.sprite_index = sPongYouWon;
	} */
	
	var _textWinLose = scoreEnemy > scorePlayer ? "gameoverYouLose" : "gameoverYouWon";
	
	textsDraw(horizontalCenter,224,_textWinLose,48,1,c_white,fa_center);

	textsDrawShadow(30, scoreVertical, "gameoverYourScore", 24, 1, c_yellow, fa_left);	
	textsDrawShadowRaw(scoreHorizontal, scoreVertical, string(scorePlayer), 24, 1, c_yellow, fa_right);
	
	textsDrawShadow(30, scoreVertical + scoreVerticalOffset, "gameoverEnemyScore", 24, 1, c_yellow, fa_left);	
	textsDrawShadowRaw(scoreHorizontal, scoreVertical + scoreVerticalOffset, string(scoreEnemy), 24, 1, c_yellow, fa_right);
	
	textsDrawShadow(30, scoreVertical + (scoreVerticalOffset * 2), "gameoverPass", 24, 1, c_yellow, fa_left);	
	textsDrawShadowRaw(scoreHorizontal, scoreVertical + (scoreVerticalOffset * 2), string(scorePass), 24, 1, c_yellow, fa_right);
	
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