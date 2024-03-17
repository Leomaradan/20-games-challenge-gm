
function blurmode_check(){
	//drawing

	if (global.blurmode==true) {
		//motionblur
		motion_blur()
	} else {	
		//no blur
		draw_self()
	}
}
