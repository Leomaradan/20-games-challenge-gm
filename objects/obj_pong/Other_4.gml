global.allowPause = false;

if(!effect_set) {
	oPostProcess.ppfx.ProfileLoad(oPostProcess.pong);
	global.blurmode = true;
	effect_set = true;
}

switch(room) {
	case rm_pong:	
		global.pauseMenu = new Menu([
			standardOptions().continueGame,
			optionRestartGame,
			standardOptions().returnToGameSelection,
			standardOptions().returnToDesktopMenuItem
		])
		global.allowPause = true;
		menu = emptyMenu;
		break;
	case rm_pong_start: 
		global.pauseMenu = emptyMenu;
		global.allowPause = false;
		optionsLayoutSmall = false;
		menu = new Menu([
			optionStartGame,
			standardOptions().returnToGameSelection,
			standardOptions().returnToDesktopMenuItem
		]);

		break;
	case rm_pong_gameover: 
		global.pauseMenu = emptyMenu;
		global.allowPause = false;
		optionsLayoutSmall = true;

		menu = new Menu([
			optionRestartGame,
			standardOptions().returnToGameSelection,
			standardOptions().returnToDesktopMenuItem
		]);		
		break;		
}
