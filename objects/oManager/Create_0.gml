global.musicPlaying = undefined;

global.plateform = -1;

switch (os_type) {
    case os_windows:
        global.plateform = Platforms.Windows;
        break;
    case os_gxgames:
        global.plateform = Platforms.GXGames;
        break;
    case os_linux:
        global.plateform = Platforms.Linux;
        break;
    case os_macosx:
        global.plateform = Platforms.MacOSX;
        break;
    case os_ios:
        global.plateform = Platforms.IOS;
        break;
    case os_tvos:
        global.plateform = Platforms.AppleTV;
        break;
    case os_android:
        global.plateform = Platforms.Android;
        break;
    case os_ps4:
        global.plateform = Platforms.PS4;
        break;
    case os_ps5:
        global.plateform = Platforms.PS5;
        break;
    case os_gdk:
    case os_xboxseriesxs:
        global.plateform = Platforms.Xbox;
        break;
    case os_switch:
        global.plateform = Platforms.Switch;
        break;
}

if (global.plateform == -1) {
    global.plateform = Platforms.Browser;
}