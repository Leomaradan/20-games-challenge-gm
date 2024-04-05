var _menuOptions = new MenuItemOptions();
_menuOptions.offsetX = -20;
_menuOptions.halign = fa_right;

var _menu = [
	new MenuItem("optionMusic", toggleOptionMusic, _menuOptions),
	new MenuItem("optionSound", toggleOptionSound, _menuOptions),	
	new MenuItem("optionLanguage", toggleOptionLanguage, _menuOptions),

];

var _getMusic = function() { return global.gameOptions.music };
var _getSound = function() { return global.gameOptions.sound };
var _getLanguage = function() { return global.gameOptions.language };

var _getFullscreen = function() { return global.gameOptions.fullscreen };



displayOptions = [
	[_getMusic, ["optionVolumeLow", "optionVolumeMedium", "optionVolumeHigh"]],
	[_getSound, ["optionVolumeLow", "optionVolumeMedium", "optionVolumeHigh"]],
	[_getLanguage, {"en": "optionLanguageEnglish", "fr": "optionLanguageFrench"}],

	//,
]

if(!STEAM) {
	array_push(_menu, new MenuItem("optionDisplay", toggleOptionFullScreen, _menuOptions));
	array_push(displayOptions, [_getFullscreen, ["optionNoFullScreen", "optionFullScreen"]]);
}

array_push(_menu, new MenuItem("credits", function() { room_goto(rCredits); }));
array_push(_menu, standardMenuOptions().returnToGameSelection);

menu = new Menu(_menu);

/* getRenderOption = function(_i) {
	
	var _current = displayOptions[_i];
	
	var _optionValue = _current[0]();
			
	if(is_bool(_optionValue)) {
		_optionValue = _optionValue ? 1 : 0;
	}
	
	if(!is_string(_optionValue)) {
		return translate(_current[1][_optionValue]);	
	}
			
	//return translate(_current[1])
}*/