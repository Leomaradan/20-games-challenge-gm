/// @func Draw a Debug GUI element in order.
/// @param {Array<Array<string>>} element tuple of element to display. First position is the name, second position the value
function showDebugGUI(element, index)
{
	// Get the current camera position
	var _cam = view_camera[0];
	var _x = camera_get_view_x(_cam);
	var _y = camera_get_view_y(_cam);
	
	var _name = element[0];
	var _value = element[1];
	
	// Prepare the text
	var _text = _name + ": " + string(_value);
	
	// Calculate the vertical position, to not overlapping other texts
	var _position = _y + (index * 10) + 12;
	
	// Ensuring the color and font here
	draw_set_color(c_white);
	draw_set_font(fDebug);	
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	
	// Draw the message
	draw_text(_x + 2,_position, _text);
}

/// @func addDebugVariable(name, value) Add a variable to the debug output for the current step
/// @param {string} name Name of the variable
/// @param {any} value Value to display
function addDebugVariable(name, value) {
	array_push(global.debugVariables, [name, value]);
}