var _menu = [
	new MenuItem("Music", toggleOptionMusic),
	new MenuItem("Sound", toggleOptionSound),
];

var _getMusic = function() { return global.gameOptions.music };
var _getSound = function() { return global.gameOptions.sound };
var _getFullscreen = function() { return global.gameOptions.fullscreen };



displayOptions = [
	[_getMusic, ["Low", "Medium", "High"]],
	[_getSound, ["Low", "Medium", "High"]],
	//,
]

if(!STEAM) {
	array_push(_menu, new MenuItem("Fullscreen", toggleOptionFullScreen));
	array_push(displayOptions, [_getFullscreen, ["No Fullscren", "Fullscreen"]]);
}

array_push(_menu, standardMenuOptions().returnToGameSelection);

menu = new Menu(_menu);
