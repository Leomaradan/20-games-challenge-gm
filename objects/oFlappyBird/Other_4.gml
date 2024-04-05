if(!effectSet) {
	oPostProcess.ppfx.ProfileLoad(oPostProcess.flappyBird);
	
	oPostProcess.ppfx.SetEffectParameter(FX_EFFECT.CHANNEL_MIXER, PP_CHANNEL_MIXER_BLUE, make_color_rgb_hdr_ppfx(0, 0, 255, 1.2));

	global.blurmode = true;
	effectSet = true;
}

background1 = layer_get_id("BackgroundNear");
background2 = layer_get_id("BackgroundMiddle");
background3 = layer_get_id("BackgroundFar");

switch(room) {
	case rFlappyBirdPlay:	
		global.pauseMenu = new Menu([
			standardMenuOptions().continueGame,
			optionRestartGame,
			standardMenuOptions().returnToGameSelection,
			standardMenuOptions().returnToDesktopMenuItem
		])
		global.allowPause = true;
		menu = emptyMenu;
		
		levelLayout = generateLevel();
		global.cpt = 0;
		
		var _design = array_pop(levelLayout);
		
		createInstances(1344, _design);
		
		break;
	case rFlappyBirdStart: 
		global.pauseMenu = emptyMenu;
		global.allowPause = false;
		optionsLayoutSmall = false;
		menu = new Menu([
			optionStartGame,
			standardMenuOptions().returnToGameSelection,
			standardMenuOptions().returnToDesktopMenuItem
		]);

		break;
	case rFlappyBirdGameOver: 
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