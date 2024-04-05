#macro DEBUG false
#macro STEAM false

#macro Debug:DEBUG true
#macro DesktopSteam:STEAM true

#macro TILESET_SIZE 32
#macro OBJECT_SIZE 16
#macro FLAPPY_TILES 64

#macro PADDING TILESET_SIZE - (OBJECT_SIZE / 2)

#macro WIN 9

#macro RES_W 1280
#macro RES_H 800

#macro HTML5_MODE (os_browser != browser_not_a_browser)

#macro GUI_MOUSE_X device_mouse_x_to_gui(0)
#macro GUI_MOUSE_Y device_mouse_y_to_gui(0)
#macro GUI_MOUSE_X_NORMALIZED (device_mouse_x_to_gui(0)/display_get_gui_width())
#macro GUI_MOUSE_Y_NORMALIZED (device_mouse_y_to_gui(0)/display_get_gui_height())
#macro GUI_WIDTH display_get_gui_width()
#macro GUI_HEIGHT display_get_gui_height()



#macro SAVE "Settings/savedata.ini"