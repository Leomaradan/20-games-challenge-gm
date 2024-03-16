/// @description Insert description here
// You can write your code in this editor
var _keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
var _keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));

var inputDirection = point_direction(0, 0, 0, _keyDown - _keyUp);
var inputMagnitude = (_keyDown - _keyUp != 0);

vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);
