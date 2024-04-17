global.allowPause = false;

if(!effectSet) {
	oPostProcess.ppfx.ProfileLoad(oPostProcess.pong);
	global.blurmode = true;
	effectSet = true;
}

switch(room) {
	case rPaddleDashPlay:	
		global.pauseMenu = new Menu([
			standardMenuOptions().continueGame,
			optionRestartGame,
			standardMenuOptions().returnToGameSelection,
			standardMenuOptions().returnToDesktopMenuItem
		])
		global.allowPause = true;
		menu = emptyMenu;
		break;
	case rPaddleDashStart: 
		global.pauseMenu = emptyMenu;
		global.allowPause = false;
		optionsLayoutSmall = false;
		menu = new Menu([
			optionStartGame,
			standardMenuOptions().returnToGameSelection,
			standardMenuOptions().returnToDesktopMenuItem
		]);

		break;
	case rPaddleDashGameover: 
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
