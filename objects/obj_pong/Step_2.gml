	
var _up = input_check_pressed("up");
var _down = input_check_pressed("down");
	

menu.step(_down, _up);



if(input_check_pressed("start")) {
	menu.execute();
}
