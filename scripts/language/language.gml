function resetTexts() {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_set_alpha(1.0);	
	draw_set_color(c_white);
}

function textsDrawSetup(_size,_halign, _valign ) {
	resetTexts();

	switch(_size) {
		case 24:
		
			draw_set_font(fProsto24);

			break;
		case 72:
			draw_set_font(fProsto72);

			break;
		case 86:
			draw_set_font(fProsto86);

			break;			
		case 48:
			draw_set_font(fProsto48);

			break;
		default:
			show_debug_message("Invalid size {0}", _size);
	}
		
	draw_set_halign(_halign);
	draw_set_valign(_valign);
}

function textsDraw(_posX, _posY, _text, _size, _opacity = 1, _color = c_white, _halign = fa_center, _valign = fa_top){
	var _translated = translate(_text);
	textsDrawRaw(_posX, _posY, _translated, _size, _opacity, _color, _halign, _valign);
}
function textsDrawRaw(_posX, _posY, _text, _size, _opacity = 1, _color = c_white, _halign = fa_center, _valign = fa_top){

	textsDrawSetup(_size, _halign, _valign);
	
	draw_set_alpha(_opacity);	
	draw_set_color(_color);
	draw_text(_posX, _posY - _size, _text);
	
	resetTexts();
}


function textsDrawShadow(_posX, _posY, _text, _size, _opacity = 1, _color = c_white, _halign = fa_center, _valign = fa_top) {
	var _translated = translate(_text);
	textsDrawShadowRaw(_posX, _posY, _translated, _size, _opacity, _color, _halign, _valign);
}


function textsDrawShadowRaw(_posX, _posY, _text, _size, _opacity = 1, _color = c_white, _halign = fa_center, _valign = fa_top){

	
	textsDrawSetup(_size, _halign, _valign);
	
	draw_set_alpha(_opacity - 0.3);	
	
	draw_set_color(c_black);
	draw_text(_posX,  _posY - _size + 8, _text);
	
	draw_set_alpha(_opacity);	
	draw_set_color(_color);
	draw_text(_posX, _posY - _size, _text);
	
	resetTexts();
}
	
/// @func setLanguage(lang) Return the language identifier
/// @param {string} lang
function getLanguageIdentifier(lang) {
	switch(lang) {
		case "fr":
		case "en":		
			return lang
			break;
		
		default:
			return "en"
	}
}		
	
/// @func setLanguage(lang) Set the current game language. Default to "en" if not found
/// @param {string} lang
function setLanguage(lang) {
	switch(lang) {
		case "fr":
			global.language = oManager.languageTable.french;
			break;
		case "en":
		default:
			// Invalid language, fallback to EN
			global.language = oManager.languageTable.english;
			break;
	}
}	

/// @func translate(identifier) Get the translation for a text identifier
/// @param {string} _identifier string identifier
/// @return {string}
function translate(_identifier) {
	// Get the text from store. the variable_struct_get is needed here
	var _textFragment =  variable_struct_get(global.language, _identifier);
	
	if(_textFragment == undefined) {
		// Unknown text. Reporting the error, including the current language
		show_debug_message(
			"Error 1: unknown text identifier in language.json {0} (lang: {1})",
			_identifier,
			global.gameOptions.language
		);

		return _identifier;
	}
	
	return _textFragment;
}