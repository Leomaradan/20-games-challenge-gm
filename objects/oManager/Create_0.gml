global.music = {
	playing: undefined,
	intensity: 1,
	id: -1
};

global.platform = Platforms.BROWSER;
global.exiting = false;


ini_open(SAVE);
var _musicOption = ini_read_real("options", "music", 1);
var _soundOption = ini_read_real("options", "sound", 1);
var _fullscreenOption = ini_read_real("options", "fullscreen", window_get_fullscreen());
ini_close();

global.gameOptions = {
	music: _musicOption,
	sound: _soundOption,
	fullscreen: _fullscreenOption
}

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

show_debug_message("Will load steam");
if(STEAM) {
	if (steam_initialised()) {
		show_debug_message("Game is ready");
		room_goto(rHome);
	}
} else {
	room_goto(rHome);
}
