if(global.pause) {
	
	var _up = input_check_pressed("up");
	var _down = input_check_pressed("down");	
	
	 global.pauseMenu.step(_up, _down);
	
	
	if(input_check_pressed("start")) {

		global.pauseMenu.execute();

		global.pause = false;

	}
}