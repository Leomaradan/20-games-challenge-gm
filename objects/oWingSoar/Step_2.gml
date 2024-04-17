var _up = input_check_pressed("up");
var _down = input_check_pressed("down");

menu.step(_up, _down);

if(input_check_pressed("start")) {
	menu.execute();
}

if(global.pauseToggle) {
	if(global.pause) {
	
		initialBackgroundSpeed1 = layer_get_hspeed(background1);
		initialBackgroundSpeed2 = layer_get_hspeed(background2);
		initialBackgroundSpeed3 = layer_get_hspeed(background3);	
	
		layer_hspeed(background1, 0);
		layer_hspeed(background2, 0);
		layer_hspeed(background3, 0);
	} else {
		layer_hspeed(background1, initialBackgroundSpeed1);
		layer_hspeed(background2, initialBackgroundSpeed2);
		layer_hspeed(background3, initialBackgroundSpeed3);	
	}
}
