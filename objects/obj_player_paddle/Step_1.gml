/// @description Insert description here
// You can write your code in this editor
var _key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var _key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));

var _input_direction = point_direction(0, 0, 0, _key_down - _key_up);
var _input_magnitude = (_key_down - _key_up != 0);

v_speed = lengthdir_y(_input_magnitude * speed_walk, _input_direction);
