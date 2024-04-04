global.allowPause = false;

if(!effect_set) {
	oPostProcess.ppfx.ProfileLoad(oPostProcess.pong);
	global.blurmode = true;
	effect_set = true;
}

switch(room) {
	case rmPongPlay:	
		global.pauseMenu = new Menu([
			standardMenuOptions().continueGame,
			optionRestartGame,
			standardMenuOptions().returnToGameSelection,
			standardMenuOptions().returnToDesktopMenuItem
		])
		global.allowPause = true;
		menu = emptyMenu;
		break;
	case rmPongStart: 
		global.pauseMenu = emptyMenu;
		global.allowPause = false;
		optionsLayoutSmall = false;
		menu = new Menu([
			optionStartGame,
			standardMenuOptions().returnToGameSelection,
			standardMenuOptions().returnToDesktopMenuItem
		]);

		break;
	case rmPongGameover: 
		global.pauseMenu = emptyMenu;
		global.allowPause = false;
		optionsLayoutSmall = true;

		menu = new Menu([
			optionRestartGame,
			standardMenuOptions().returnToGameSelection,
			standardMenuOptions().returnToDesktopMenuItem
		]);		
		break;		
}
