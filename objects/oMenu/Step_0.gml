
var _up = input_check_pressed("up");
var _down = input_check_pressed("down");	
var _left = input_check_pressed("left");	
var _right = input_check_pressed("right");	

var _accept = input_check_pressed("accept");	
	
//var _mouseX = mouse_x

//menu.step(_up, _down);

// if(input_check_pressed("start")) {
// menu.execute();
// }

var _rowChange = _down - _up;
var _colChange = _right - _left;

buttonSelectedRow += _rowChange;
buttonSelectedCol += _colChange;

if(buttonSelectedRow < 1) {
	buttonSelectedRow = 5;	
}

if(buttonSelectedRow > 5) {
	buttonSelectedRow = 1;	
}

if(buttonSelectedCol < 1) {
	buttonSelectedCol = 2;	
}

if(buttonSelectedCol > 2) {
	buttonSelectedCol = 1;	
}

if(previousSelectedCol != buttonSelectedCol || previousSelectedRow != buttonSelectedRow) {
	playSound(sndHomeMenuClick, 0.3);
	previousSelectedCol = buttonSelectedCol;
	previousSelectedRow = buttonSelectedRow;
}

