if(global.pause) {
	
	var _up = input_check_pressed("up");
	var _down = input_check_pressed("down");	
	
	 global.pauseMenu.step(_up, _down);
	
	//pauseOptionSelected += (_down - _up);
	
	/*if(_down || _up) {
		playSound(bass_descend1, 0.3);
	}*/
	
	/*if(pauseOptionSelected >= array_length(global.pauseOptions)) {
		pauseOptionSelected = 0;
	}
	
	if(pauseOptionSelected < 0) {
		pauseOptionSelected = array_length(global.pauseOptions) - 1;
	}*/
	
	if(input_check_pressed("start")) {
		// var action = global.pauseOptions[pauseOptionSelected][1];
		global.pauseMenu.execute();
		//pauseOptionSelected = 0;
		//action();
		global.pause = false;

	}
}