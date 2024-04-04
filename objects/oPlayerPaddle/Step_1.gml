/// @description Insert description here
// You can write your code in this editor
var _key_up = input_check("up");
var _key_down = input_check("down");

var _click = input_check("click");

if(_click && instance_exists(oBall)) {
	if(mouse_y < oBall.y) {
		_key_up = 1;	
	} else {
		_key_down = 1;	
	}
}

show_debug_message({_key_down, _key_up, _click})

//var _input_direction = point_direction(0, 0, 0, _key_down - _key_up);
//var _input_magnitude = (_key_down - _key_up != 0);

//v_speed = lengthdir_y(_input_magnitude * speed_walk, _input_direction);

//v_speed = input_y("left", "right", "up", "down") * speed_walk;
v_speed = (_key_down - _key_up) * speed_walk;

