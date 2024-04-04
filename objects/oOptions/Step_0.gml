
var _up = input_check_pressed("up");
var _down = input_check_pressed("down");	
var _left = input_check_pressed("left");	
var _right = input_check_pressed("right");	


menu.step(_up, _down);

if(input_check_pressed("start")) {
 menu.execute();
}