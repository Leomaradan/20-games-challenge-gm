global.music = {
	playing: undefined,
	intensity: 1,
	id: -1
};

global.platform = Platforms.BROWSER;
global.exiting = false;
global.mouseCursor = false;
cursorDisplayed = false;

ini_open(SAVE);
var _musicOption = ini_read_real("options", "music", 1);
var _soundOption = ini_read_real("options", "sound", 1);
var _fullscreenOption = ini_read_real("options", "fullscreen", window_get_fullscreen());
var _systemLanguagenOption = ini_read_string("options", "language", getLanguageIdentifier(os_get_language()));

ini_close();

global.language = {};

// selectedLang = _systemLanguagenOption;

//var _languageFile = file_text_open_read(working_directory + "language.json");
var _bufferLanguage    = buffer_load( working_directory + "language.json")
var _jsonLanguage      = buffer_read(_bufferLanguage, buffer_string);
//var _jsonLanguage      = ""; //file_text_read_string(_languageFile);


/*while (!file_text_eof(_languageFile))
{
    _jsonLanguage += file_text_readln(_languageFile);
}
file_text_close(_languageFile);*/

languageTable = json_parse(_jsonLanguage);



global.gameOptions = {
	music: _musicOption,
	sound: _soundOption,
	fullscreen: _fullscreenOption,
	language: _systemLanguagenOption
}

setLanguage(global.gameOptions.language);

window_set_fullscreen(global.gameOptions.fullscreen);

global.debugVariables = [];

switch (os_type) {
    case os_windows:
        global.platform = Platforms.WINDOWS;
        break;
    case os_gxgames:
        global.platform = Platforms.GX;
        break;
    case os_linux:
        global.platform = Platforms.LINUX;
        break;
    case os_macosx:
        global.platform = Platforms.OSX;
        break;
    case os_ios:
        global.platform = Platforms.IOS;
        break;
    case os_tvos:
        global.platform = Platforms.APPLE_TV;
        break;
    case os_android:
        global.platform = Platforms.ANDROID;
        break;
    case os_ps4:
        global.platform = Platforms.PS4;
        break;
    case os_ps5:
        global.platform = Platforms.PS5;
        break;
    case os_gdk:
        global.platform = Platforms.XBOX;
        break;	
    case os_switch:
        global.platform = Platforms.SWITCH;
        break;
}

show_debug_message("Platform: {0}", global.platform);



if(STEAM) {
	show_debug_message("Will load steam");
	if (steam_initialised()) {
		show_debug_message("Game is ready");
		room_goto(rHome);
	}
} else {
	room_goto(rHome);
}

