
var _up = input_check_pressed("up");
var _down = input_check_pressed("down");	
	
optionSelected += (_down - _up);
	
if(_down || _up) {
	PlaySound(bass_descend1, 0.3);
}	
	
if(optionSelected >= array_length(options)) {
	optionSelected = 0;
}
	
if(optionSelected < 0) {
	optionSelected = array_length(options) - 1;
}
	
if(input_check_pressed("start")) {
	var option = options[optionSelected];
	if(option[1] != undefined) {
		PlaySound(bass_descend1, 1);
		room_goto(option[1]);
	} else {
		PlaySound(bass_descend4_exit);
	}

}