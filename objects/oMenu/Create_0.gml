/*optionSelected = 0;

options = [
	["PONG", rm_pong_start],
	["Flappy Bird (soon)", undefined],
	["Breakout (soon)", undefined],
	["Jetpack (soon)", undefined],
];*/

var _emptyOptions = new MenuItemOptions([], bass_descend4_exit, 0.7, 0.5);

menu = new Menu([
	new MenuItem("PONG", function() { room_goto(rm_pong_start) }),
	new MenuItem("Flappy Bird (soon)", undefined, _emptyOptions),
	new MenuItem("Breakout (soon)", undefined, _emptyOptions),
	new MenuItem("Jetpack (soon)", undefined ,_emptyOptions ),
	new MenuItem("Options", undefined),
	new MenuItem("Exit", exitToDesktop, new MenuItemOptions([Platforms.Desktop])),
])

