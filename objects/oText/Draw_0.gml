var _writer = textsDraw;

if(vDirectText) {
	if(vShadow) {
		_writer = 	textsDrawShadowRaw;
	} else {
		_writer = 	textsDrawRaw;
	}
} else if(vShadow) {
	_writer = 	textsDrawShadow;
}


_writer(x, y, vText, vSize, vOpacity, vColor, vHorizontalAlign, vVerticalAlign);
