var _text = vText != 0 ? vText : "menuSoon";
var _icon = sIconUnknown;
var _layoutIcon = true;
var _activated = image_index % 2 != 0;

if(vIcon == -1) {
	_layoutIcon = false;	
} else if (vIcon != 0) {
	_icon = vIcon;
}




//draw_sprite(sprite_index, 0,x, y);
draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	0.8
);

var _textOffsetY = _activated ? 8 : 5;

if(_layoutIcon) {

	var _textOffsetX = 64 - spriteWidthHalf;
	

	draw_sprite(_icon, 0, x - spriteWidthHalf + 16, y - 21 + _textOffsetY);

	textsDraw(x + _textOffsetX, y + _textOffsetY, _text, 24, 1, c_black, fa_left);

} else {
	textsDraw(x, y + _textOffsetY, _text, 24, 1, c_black, fa_center);	
}