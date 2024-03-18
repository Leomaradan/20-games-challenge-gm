
function blurmode_check(){
	//drawing
	if(!variable_global_exists("blurmode")) {
		global.blurmode = false;
	}

	if (global.blurmode==true) {
		//motionblur
		motion_blur()
	} else {	
		//no blur
		draw_self()
	}
}
