steam_update();

if(global.mouseCursor != cursorDisplayed) {
	cursor_sprite = global.mouseCursor ? sCursor : cr_none;
	cursorDisplayed = global.mouseCursor;
	show_debug_message("Switching cursor : {0}", global.mouseCursor);
}
